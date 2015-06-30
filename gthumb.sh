#!/bin/bash
#Copyright © 2015 Maxime Devos.
#
#Permission is granted to copy, distribute and/or modify
#this document under the terms of the GNU Free
#Documentation License, Version 1.3 or any later version
#published by the Free Software Foundation; with no
#Invariant Sections, no Front-Cover Texts, and no
#Back-Cover Texts. A copy of the license is included in
#the section entitled “GNU Free Documentation License”.
for page in `seq 1 60`; do
  echo `printf "%04d" $page`;
  make png-preview/page-`printf "%04d" $page`.png;
  gthumb png-preview/page-`printf "%04d" $page`.png;
done

