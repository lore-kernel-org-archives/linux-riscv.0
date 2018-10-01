From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 01 Oct 2018 15:19:35 -0700 (PDT)
Subject: futex_atomic_cmpxchg_inatomic is missing
In-Reply-To: <mvmzhvy6t79.fsf@suse.de>
Message-ID: <mhng-177982ae-3ff1-4e5a-a553-51c5cf1f2710@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 01 Oct 2018 00:07:22 PDT (-0700), schwab at suse.de wrote:
> On Sep 28 2018, Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> Christoph published a simple Kconfig workaround a while ago to turn on the
>> generic support for non-SMP systems, which might help you work around your
>> issue.
>
> What kind of workaround?  If you disable SMP this should be
> automatically enabled.  But of course, being non-SMP, this is also
> useless.

I think we just need some sort of 
CONFIG_WE_HAVE_GENERIC_FUTEX_CMPXCHG_FOR_NONSMP selected by default in 
arch/riscv/Kconfig.  I punted on it because having this support only for 
non-SMP systems didn't seem so useful.
