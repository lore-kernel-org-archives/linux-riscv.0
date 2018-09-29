From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 28 Sep 2018 19:17:17 -0700 (PDT)
Subject: futex_atomic_cmpxchg_inatomic is missing
In-Reply-To: <mvmh8icabwx.fsf@suse.de>
Message-ID: <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 26 Sep 2018 01:41:18 PDT (-0700), schwab at suse.de wrote:
> The riscv port does not define futex_atomic_cmpxchg_inatomic, but glibc
> is assuming that set_robust_list always works.

Yes.  Someone has pointed this out before, but we haven't had time to figure 
out the correct kernel implementation yet.  Properly implementing the whole API is 
probably only a hundred lines of code, but any of this lock stuff is always 
very slow going.

Christoph published a simple Kconfig workaround a while ago to turn on the 
generic support for non-SMP systems, which might help you work around your 
issue.  My plan was to construct a for-next branch over the weekend, but I 
managed to do so today so I might have time to take a look -- no promises, 
though :)
