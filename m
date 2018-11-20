From: schwab@suse.de (Andreas Schwab)
Date: Tue, 20 Nov 2018 15:01:25 +0100
Subject: [PATCH] net: phy: mscc: fix locking in vsc85xx_default_config
In-Reply-To: <20181120135508.paxzs63cqy2llc7d@qschulz> (Quentin Schulz's
 message of "Tue, 20 Nov 2018 14:55:08 +0100")
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <mvma7m3n9l6.fsf_-_@suse.de>
 <20181120135508.paxzs63cqy2llc7d@qschulz>
Message-ID: <mvm5zwrn8zu.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Nov 20 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:

> You also need to prefix your patch with [PATCH net-next] instead of only
> [PATCH]. This is specific to the net subsystem.

Why next?  This is a bug fix that needs to go in now, not next.

> Use scripts/get_maintainer.pl on your patch to get the people to put in
> Cc and in To.

The same people as the original patch the added the bug.  Why would it
be different now?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
