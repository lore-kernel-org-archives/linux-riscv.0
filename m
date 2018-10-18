From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 18 Oct 2018 10:41:44 -0700 (PDT)
Subject: Hifive-U vs 1000baseT
In-Reply-To: <mvmftx3twxq.fsf@suse.de>
Message-ID: <mhng-6c9f954e-9436-4d59-b1a2-66bb690db733@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 18 Oct 2018 02:40:17 PDT (-0700), schwab at suse.de wrote:
> Are there any known issues with ethernet on the Hifive-U connecting to a
> 1Gb port?  I see that the port gets a link, but no traffic at all.  When
> connecting to a 100Mb port it works fine.

That's weird.  If anything I'd expect it to be the other way around, with 100Mb 
ports not working and 1Gb ports working -- it was that way for a while because 
the link type detection is a bit flaky so we just defaulted to 1Gb.

I just checked all the boards we have out on the lab bench, and assuming I 
managed to follow through the big tangles of wires correctly everything is at 
1Gb.  Some early revisions of the boards had a screwed up trace on some of the 
1Gb lines that mandated a special cable to un-reverse the pairs, but I don't 
think any of those made it out of the lab -- if you send me your serial number 
then I'll double-check.

Have you tried more than one ethernet cable?
