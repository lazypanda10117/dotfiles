from subprocess import check_output

class BTStatistics:
	def __init__(self):
		self.IMPORTANT_DEVICE_STATUS = dict(
			name='Name',
			type='Icon',
			connected='Connected',
		)
		self.IMPORTANT_CONTROLLER_STATUS = dict(
			name='Name',
			powered='Powered',
			pairable='Pairable',
			discoverable='Discoverable',
		)
		self.raw_device_list = check_output(['bluetoothctl', '--', 'paired-devices'])
		self.device_list = self.parseDeviceList(self.raw_device_list)
		self.devices_data = self.parseDevicesData()
		self.raw_controller_list = check_output(['bluetoothctl', '--', 'list'])
		self.controller_list = self.parseDeviceList(self.raw_controller_list)
		self.controller_data = self.parseControllerData()
		self.status_type = self.generateStatusType()

	def parseDeviceList(self, raw_device_list):
		device_MAC_list = list()
		for raw_device_data in str(raw_device_list).splitlines():
			if raw_device_data == '':
				continue
			raw_device_data = raw_device_data.split(' ')
			device_MAC = raw_device_data[1]
			device_MAC_list.append(device_MAC)
		return device_MAC_list

	def parseDevicesData(self):
		devices_data = dict()
		for device in self.device_list:
			devices_data[device] = self.parseDeviceData(
				(lambda: check_output(['bluetoothctl', '--', 'info', device])), 
				device,
				self.IMPORTANT_DEVICE_STATUS.values()
			)
		return devices_data

	def parseControllerData(self):
		controller = self.controller_list[0]
		controller_data = self.parseDeviceData(
			(lambda: check_output(['bluetoothctl', '--', 'show', controller])), 
			controller,
			self.IMPORTANT_CONTROLLER_STATUS.values()
		)
		return controller_data

	def parseDeviceData(self, func, device, status_list):
		device_data = dict()
		raw_device_data = func()
		for data_line in str(raw_device_data).split('\\n\\t')[1:]: # Ignore the first line with device mac
			data = data_line.split(': ', 1)
			identifier = data[0]
			details = data[1]
			if identifier in status_list:
				device_data[identifier] = details
		return device_data


	def generateStatusType(self):
		powered = self.controller_data.get(self.IMPORTANT_CONTROLLER_STATUS.get('powered')) == 'yes'
		if not powered:
			return (0, None)

		connected_devices = [
			device for device in self.devices_data.values() 
			if device.get(self.IMPORTANT_DEVICE_STATUS.get('connected')) == 'yes'
		]
		num_connected_devices = len(connected_devices)

		if num_connected_devices == 0:
			return (1, 0, None)
		if num_connected_devices == 1:
			# 0 = normal connected, 1 = audio
			device = connected_devices[0]
			audio = int(device.get(self.IMPORTANT_DEVICE_STATUS.get('type')) == 'audio-card')
			return (1, 1, audio)
		return (1, None, None)

	def generateStatusText(self):
		if self.status_type[0] == 0:
			return 'Off'
		if self.status_type[1] == 0:
			return 'On'	
		connected_devices = [
			device for device in self.devices_data.values() 
			if device.get(self.IMPORTANT_DEVICE_STATUS.get('connected')) == 'yes'
		]
		devices_connected_text = connected_devices[0].get(self.IMPORTANT_DEVICE_STATUS.get('name'))
		for device in connected_devices[1:]:
			devices_connected_text += ' and {}'.format(device.get(self.IMPORTANT_DEVICE_STATUS.get('name')))
		return 'Connected to {}'.format(devices_connected_text)
		
	def generateLockIcon(self):
		if self.status_type[0] == 0:
			return '\uf5b1'
		if self.status_type[1] == 0:
			return '\uf5ae'
		if self.status_type[1] == 1:
			if self.status_type[2] == 1:
				return '\uf5af'
		return '\uf5b0'
	
	def generateStatusComponent(self):
		return "<span font='12'>{}</span> {}".format(
			self.generateLockIcon(),
			self.generateStatusText()
		)

print(BTStatistics().generateStatusComponent())