From: anup@brainfault.org (Anup Patel)
Date: Sun, 23 Sep 2018 18:34:38 +0530
Subject: [PATCH] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
In-Reply-To: <20180917141018.GB28689@infradead.org>
References: <20180912143822.21948-1-anup@brainfault.org>
 <72961c71-c4e4-7990-da64-a7f1613f2e1c@wdc.com>
 <20180917141018.GB28689@infradead.org>
Message-ID: <CAAhSdy05S_GRbrBcnzt_3TL=Su+QYz8+addqXVumvxmANujRJg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 17, 2018 at 7:40 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Sep 12, 2018 at 09:47:55AM -0700, Atish Patra wrote:
> > The extra hart information will not be parsed by lscpu which will make the
> > cpu information inconsistent between lscpu & /proc/cpuinfo.
> >
> > Should we patch lscpu as well to show correct hart id as well ?
>
> It would be good to follow whatever prescedent other architectures
> with different logical vs physical cpuids have set.

Most architectures (x86, ARM, ARM64), display logical CPU id as
"processor" attribute. I think we should use same name for logical
CPU id.

Other attributes in /proc/cpuinfo are very different accros architectures.
For e.g. x86 shows physical CPU id as "core id"

I will revise this patch to use "processor" attribute name for
logical CPU id.

Regards,
Anup
