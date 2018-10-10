From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 10 Oct 2018 06:12:55 -0700
Subject: [RFC 4/4] gpio: sifive: Add GPIO driver for SiFive SoCs
In-Reply-To: <mvmo9c22bx2.fsf@suse.de>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-5-git-send-email-atish.patra@wdc.com>
 <mvmo9c22bx2.fsf@suse.de>
Message-ID: <20181010131255.GB29142@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 10, 2018 at 03:01:29PM +0200, Andreas Schwab wrote:
> On Okt 09 2018, Atish Patra <atish.patra@wdc.com> wrote:
> 
> > +static void sifive_set_ie(struct sifive_gpio *chip, unsigned int offset)
> > +{
> > +	unsigned long flags;
> > +	unsigned int trigger;
> > +
> > +	raw_spin_lock_irqsave(&chip->lock, flags);
> > +	trigger = (chip->enabled & BIT(offset)) ? chip->trigger[offset] : 0;
> 
> This should use test_bit instead.

Given that this apparently needs the spinlock for atomciy with more than
just the bitmap test_bit would be rather pointless.
