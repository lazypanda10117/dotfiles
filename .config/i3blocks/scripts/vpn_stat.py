from subprocess import check_output


class VPNStatistics:
	def __init__(self):
		self.IMPORTANT_STATUS = dict(
			vpn_status='OpenVPN Status',
			ip='Public IP Address',
			internet_status='Internet Status',
			# TODO: Figure out why these status are not available when run in subshell.
			proton_status='ProtonVPN Status',
			name='Server Name',
			country='Exit Country',
			load='Server Load',
		)	
		self.raw_status = check_output(['sudo', 'protonvpn-cli', '--status'])
		self.status_dict = self.buildStatusDict(self.raw_status.splitlines())
		self.lock_status = self.status_dict.get('vpn_status') == 'Running'
		self.online_status = self.status_dict.get('internet_status') == 'Online'

	# def reconnectIfRequired(self):
	# 	# If internet disconnected, disconnect VPN
	# 	if not self.online_status:
	# 	if not

	def buildStatusDict(self, status_lines):
		status_dict = dict()
		for line in status_lines:
			for abbv, status in self.IMPORTANT_STATUS.items():
				l = str(line)	
				if not l.find(status) == -1:
					# Line details is of the form: [Identifier] [Description]: details
					line_details = l.split(': ')
					status_dict[abbv] = line_details[1][:-1]
		return status_dict


	def generateLockIcon(self):
		lock_icon = '\uf13e'
		if self.online_status and self.lock_status:
			lock_icon = '\uf023'
		return lock_icon

	def generateStatusText(self):
		if self.online_status:
			if self.lock_status:
				ip_address = self.status_dict.get('ip') # Truncate the last apostrophe
				country = self.status_dict.get('country')
				load = self.status_dict.get('load')
				status_text = 'Connected to {} | {} ({}%)'.format(country, ip_address, load)
			else:
				status_text = 'Disconnected'		
		else:
			status_text = 'Offline'
		return status_text

	def generateStatusComponent(self):
		return "<span font='12'>{}</span> {}".format(
			self.generateLockIcon(),
			self.generateStatusText()
		)

VPN_STAT = VPNStatistics()
# VPN_STAT.reconnectIfRequired()
status_text = VPN_STAT.generateStatusComponent()
print(status_text)
