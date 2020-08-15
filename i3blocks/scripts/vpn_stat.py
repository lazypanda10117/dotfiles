from subprocess import check_output


class VPNStatistics:
	def __init__(self):
		self.IMPORTANT_STATUS = dict(
			vpn_status='Status',
			ip='IP',
		)
		# self.raw_status = check_output(['sudo', 'protonvpn-cli', '--status'])
		self.raw_status = check_output(['protonvpn', 'status'])
		self.status_dict = self.buildStatusDict(self.raw_status.splitlines())
		self.lock_status = not (self.status_dict.get('vpn_status') == 'Disconnected')

	def buildStatusDict(self, status_lines):
		status_dict = dict()
		for line in status_lines:
			for abbv, status in self.IMPORTANT_STATUS.items():
				l = str(line)	
				if not l.find(status) == -1:
					# Line details is of the form: [Identifier] [Description]: details
					line_details = l.split(':')
					status_dict[abbv] = line_details[1][:-1].strip()
		return status_dict


	def generateLockIcon(self):
		lock_icon = '\uf13e'
		if self.lock_status:
			lock_icon = '\uf023'
		return lock_icon

	def generateStatusText(self):
		status_text = 'Disconnected'			
		if self.lock_status:
			# ip_address = self.status_dict.get('ip') # Truncate the last apostrophe
			status_text = 'Secure'
		return status_text

	def generateStatusComponent(self):
		return "<span font='12'>{}</span> {}".format(
			self.generateLockIcon(),
			self.generateStatusText()
		)

VPN_STAT = VPNStatistics()
status_text = VPN_STAT.generateStatusComponent()
print(status_text)
