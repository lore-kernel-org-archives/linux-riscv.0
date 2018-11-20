From: quentin.schulz@bootlin.com (Quentin Schulz)
Date: Tue, 20 Nov 2018 15:17:05 +0100
Subject: [PATCH] net: phy: mscc: fix locking in vsc85xx_default_config
In-Reply-To: <mvm5zwrn8zu.fsf@suse.de>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <mvma7m3n9l6.fsf_-_@suse.de>
 <20181120135508.paxzs63cqy2llc7d@qschulz> <mvm5zwrn8zu.fsf@suse.de>
Message-ID: <20181120141705.44odry44hhdy3cge@qschulz>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Andreas,

On Tue, Nov 20, 2018 at 03:01:25PM +0100, Andreas Schwab wrote:
> On Nov 20 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:
> 
> > You also need to prefix your patch with [PATCH net-next] instead of only
> > [PATCH]. This is specific to the net subsystem.
> 
> Why next?  This is a bug fix that needs to go in now, not next.
> 

Indeed. Use [PATCH net] then.
Please refer to https://www.kernel.org/doc/Documentation/networking/netdev-FAQ.txt

> > Use scripts/get_maintainer.pl on your patch to get the people to put in
> > Cc and in To.
> 
> The same people as the original patch the added the bug.  Why would it
> be different now?
> 

First, people may have changed mail addresses (especially maintainers)
and that is picked by get_maintainer.

Second, other people may have worked on this driver since the patch was
introduced and they might want to know about this change too and have
their word on it. This is what happened with this driver. Gustavo and
Heiner sent patches since then and they have already been merged.

This is also part of the contribution process which is defined here:
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html

You have not answered my question yet. Does this fix your issue, yes or
no?

Quentin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181120/8b0ae393/attachment.sig>
