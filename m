From: schwab@suse.de (Andreas Schwab)
Date: Wed, 21 Nov 2018 09:55:14 +0100
Subject: Kernel panic - not syncing: corrupted stack end detected inside
 scheduler
In-Reply-To: <mhng-a200fe90-01a6-444d-9f76-0b00c22249e8@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Tue, 20 Nov 2018 09:29:48 -0800 (PST)")
References: <mhng-a200fe90-01a6-444d-9f76-0b00c22249e8@palmer-si-x1c4>
Message-ID: <mvmmuq2lsi5.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Nov 20 2018, Palmer Dabbelt <palmer@sifive.com> wrote:

> Do you have a better way to reproduce this than to just hammer the filesystem?

I don't hammer the filesystem.  Most of the data is on nfs and /tmp is
on tmpfs.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
