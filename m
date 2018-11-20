From: quentin.schulz@bootlin.com (Quentin Schulz)
Date: Tue, 20 Nov 2018 14:55:08 +0100
Subject: [PATCH] net: phy: mscc: fix locking in vsc85xx_default_config
In-Reply-To: <mvma7m3n9l6.fsf_-_@suse.de>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <mvma7m3n9l6.fsf_-_@suse.de>
Message-ID: <20181120135508.paxzs63cqy2llc7d@qschulz>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Andreas,

On Tue, Nov 20, 2018 at 02:48:37PM +0100, Andreas Schwab wrote:
> Don't use locking phy_read/phy_write functions while inside
> phy_select_patch/phy_restore_page region.
> 
> Fixes: 6a0bfbbe20 ("net: phy: mscc: migrate to phy_select/restore_page functions")
> Signed-off-by: Andreas Schwab <schwab@suse.de>

Have you tested this patch? Does it solve your issue?

Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>
anyway since it's to be done.

You need to send your patch as a mail separate to this patch series.
You also need to prefix your patch with [PATCH net-next] instead of only
[PATCH]. This is specific to the net subsystem.

Use scripts/get_maintainer.pl on your patch to get the people to put in
Cc and in To.

Thanks,
Quentin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181120/eae2d892/attachment.sig>
