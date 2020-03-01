file { '/usr/share/applications/Random Quotes Dev.desktop':
  content => @("EOL"/L)
    [Desktop Entry]
    Version=1.0
    Name=Random Quotes Dev
    Exec=firefox http://127.0.0.1:30000
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=/usr/share/icons/webapp.svg
    Categories=Internet
    | EOL
}

file { '/usr/share/applications/Random Quotes Test.desktop':
  content => @("EOL"/L)
    [Desktop Entry]
    Version=1.0
    Name=Random Quotes Test
    Exec=firefox http://127.0.0.1:30001
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=/usr/share/icons/webapp.svg
    Categories=Internet
    | EOL
}

file {'/usr/share/icons/webapp.svg':
  content => @("EOL"/L)
    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
viewBox="0 0 420.049 420.049" style="enable-background:new 0 0 420.049 420.049;" xml:space="preserve">
<path style="fill:#1185E0;" d="M412.212,210.547l-15.673-27.167c-22.988,13.061-48.588,23.51-74.71,31.347c0-1.567,0-2.612,0-4.18
	v-0.522c-1.567-75.755-30.824-148.376-82.024-204.8l-22.988,20.898c45.976,50.678,72.098,115.984,73.665,183.902
	c0,4.18-0.522,8.359-0.522,12.539c-29.257,6.269-56.947,9.927-79.935,10.449c-22.988-0.522-50.678-3.657-79.935-10.449
	c-0.522-4.18-0.522-8.359-0.522-12.539c1.567-67.918,27.69-133.224,73.665-183.902L180.245,5.225
	c-51.2,55.902-80.457,129.045-82.024,204.8v0.522c0,1.567,0,2.612,0,4.18c-26.122-7.837-52.245-18.286-74.71-31.347L7.837,210.547
	c28.212,16.196,61.127,28.735,93.518,37.094c8.882,62.171,36.049,120.163,78.89,167.184l22.988-20.898
	c-35.527-39.184-59.037-86.727-68.963-138.449c27.69,5.225,53.812,8.359,75.233,8.882c0,0,0,0,0.522,0c0,0,0,0,0.522,0
	c21.943-0.522,48.065-3.135,75.233-8.882c-9.404,51.2-33.437,99.265-68.963,138.449l22.988,20.898
	c42.841-47.02,70.008-105.012,78.89-167.184C351.086,239.282,384,226.743,412.212,210.547z"/>
<path style="fill:#4DCFE0;" d="M210.025,420.049C94.041,420.049,0,326.008,0,210.024S94.041,0,210.025,0
	s210.024,94.041,210.024,210.024S326.008,420.049,210.025,420.049z M210.025,31.347c-98.743,0-178.678,79.935-178.678,178.678
	s79.935,178.678,178.678,178.678s178.678-79.935,178.678-178.678S308.767,31.347,210.025,31.347z"/>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
  <g>
  </g>
  </svg>
  | EOL
}