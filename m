From: schwab@suse.de (Andreas Schwab)
Date: Wed, 19 Sep 2018 12:15:30 +0200
Subject: Driver for HiFive-U MMC interface
In-Reply-To: <3f299fc2-e38b-ccc9-2e29-c4a456f1fee6@wdc.com> (Atish Patra's
 message of "Wed, 19 Sep 2018 00:35:10 -0700")
References: <mhng-4e7e9fe4-3a36-415e-a1a5-b41493b806b1@palmer-si-x1c4>
 <mvmd0tavtmp.fsf@suse.de>
 <3f299fc2-e38b-ccc9-2e29-c4a456f1fee6@wdc.com>
Message-ID: <mvmworhvlml.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sep 19 2018, Atish Patra <atish.patra@wdc.com> wrote:

> There were some network and DMA32 issues in 4.18. Here is my tree on top
> of 4.19-rc2. I use this for booting Fedora Gnome Desktop as well.
>
> https://github.com/atishp04/riscv-linux/tree/4.19_fedora_success_sep11

Thanks, after cherry-picking the missing commits I have now a 4.19-rc4
kernel that looks stable.

git://github.com/andreas-schwab/linux#riscv-4.19-rc4

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
