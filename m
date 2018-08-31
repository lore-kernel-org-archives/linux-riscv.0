From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 22:54:47 -0700
Subject: [PATCH 5/8] RISC-V: Rename im_okay_therefore_i_am to
 found_boot_cpu
In-Reply-To: <30229ef5-ce4e-e78b-32f9-7c563f63827b@wdc.com>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-6-palmer@sifive.com>
 <20180830144118.GA27233@infradead.org>
 <30229ef5-ce4e-e78b-32f9-7c563f63827b@wdc.com>
Message-ID: <20180831055447.GA18478@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 30, 2018 at 09:11:11AM -0700, Atish Patra wrote:
> On 8/30/18 7:41 AM, Christoph Hellwig wrote:
> > >   	struct device_node *dn = NULL;
> > > -	int hart, im_okay_therefore_i_am = 0;
> > > +	int hart, found_boot_cpu = 0;
> > 
> > If you rename this anyway please switch to use a bool.
> > 
> 
> I can address the comment on this patch and fold it in my series to avoid
> unnecessary conflict.
> 
> @Palmer: You can drop this patch.

If Palmer is ok with it how about you include a respin of his whole
series?  There are some overlaps I think and having a single person
in charge might be helpful.

Btw, I've found your series in my linux-kernel folder, but it did
not make it to linux-riscv or my personal inbox despite the CC.
