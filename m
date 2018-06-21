From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 21 Jun 2018 07:53:56 -0700
Subject: [PATCH 5/5] RISC-V: Use fixed width integer types for 32-bit
 compatible
In-Reply-To: <mvmwousjv8g.fsf@suse.de>
References: <cover.1529506497.git.zong@andestech.com>
 <37a6523947397cd72320676030b96926e373d05a.1529506497.git.zong@andestech.com>
 <20180621064322.GE19319@infradead.org> <mvmwousjv8g.fsf@suse.de>
Message-ID: <20180621145356.GB12445@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jun 21, 2018 at 12:21:19PM +0200, Andreas Schwab wrote:
> On Jun 20 2018, Christoph Hellwig <hch@infradead.org> wrote:
> 
> >>  static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
> >>  {
> >>  	if (v != (u32)v) {
> >> -		pr_err("%s: value %016llx out of range for 32-bit field\n",
> >> +		pr_err("%s: value %016" PRIxX "out of range for 32-bit field\n",
> >>  		       me->name, v);
> >>  		return -EINVAL;
> >
> > But in general Linux uXX and sXX values are always the same underlying
> > fundamental C type.  What is the mismatch here?
> 
> The mismatch is that v is Elf_Addr, not u32.

Then we'll have to cast to unsigned long before printing, like we
do elsewhere in kernel.
