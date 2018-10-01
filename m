From: schwab@suse.de (Andreas Schwab)
Date: Mon, 01 Oct 2018 09:07:22 +0200
Subject: futex_atomic_cmpxchg_inatomic is missing
In-Reply-To: <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Fri, 28 Sep 2018 19:17:17 -0700 (PDT)")
References: <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
Message-ID: <mvmzhvy6t79.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sep 28 2018, Palmer Dabbelt <palmer@sifive.com> wrote:

> Christoph published a simple Kconfig workaround a while ago to turn on the
> generic support for non-SMP systems, which might help you work around your
> issue.

What kind of workaround?  If you disable SMP this should be
automatically enabled.  But of course, being non-SMP, this is also
useless.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
