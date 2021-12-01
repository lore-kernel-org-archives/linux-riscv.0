Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52EEC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWODWyoxJazyzyYSZ5Rm63xEwUnRkcb/3xJHNQLr3J4=; b=p4v+MPKlTimoc9
	073ZeD31KgVJoNV+rNTCq0j6g7RXJ23OoUoEO3dZpGv4TdGjXV4pe+0IZuy8jcLORzJMaUDJKofWM
	bBW89ZNZOS2yDBlk8ViOW7yiU10RW6xp2mapGToUCOnaU8pE5pl798N/dFo6m3bxSG585q3vZaKUF
	D7MnyyODjBWi6AEF6yEJYpBfSgSm9vhSQT41rgANzXDRRanOc4LTzri7KQo5p+z6wilE00s4UVGHC
	e3lfvSHaB48c39yLdpw8hnpc+PmLgqt35VhjavzrHm0OOi2cjEw8TZ7/xsNiUN3qRwbWexSW9PkUt
	Gy3PbbpRMlgralu9TOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msPoK-008rik-Q9; Wed, 01 Dec 2021 13:38:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msPoH-008rhf-Ar
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 13:38:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B820BCE1E78;
 Wed,  1 Dec 2021 13:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5771EC53FCC;
 Wed,  1 Dec 2021 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638365884;
 bh=PY69J6tB4l1n3LFfXYyEOR+sYFdjfsBi3JUKOGZB1IE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LHl3lt9hG14qcnk51kyNok97wgF9c5G755vsoN8VmIsE2dVOepZqsAFqSZWE0AHrF
 dt7WzVYRiMkqU+OOgsQphrdoWN7/1wmUKKhtH8U4tymbOTcdwhMLvG2772rx90LXYn
 KIqIlcqbkCLGlD6xmGzWxSMylJe7N9SNkprGvcASqfFGV2cBOSjdwCwfXNhGkruZH7
 tkQRonUwa9gyoTsuH3i2VzRxw+eXqkXOOZ5O+saN98aEk12F4lyQXAA0o6dmcv3VL7
 kiXK8qY+N/9DSUCFzX30EK94OOR+/kbjev9/rU7pSUgubIZFOPZGKnbhPpZMrt6cP5
 hjrs4ZgRKO/Gg==
Date: Wed, 1 Dec 2021 21:29:48 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Wei Fu <wefu@redhat.com>, Anup Patel <anup.patel@wdc.com>, atish patra
 <atishp04@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
 <guoren@kernel.org>, Christoph =?UTF-8?B?TcO8bGxuZXI=?=
 <christoph.muellner@vrull.eu>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christoph Hellwig <hch@lst.de>, Liu Shaohua <liush@allwinnertech.com>, "Wei
 Wu (=?UTF-8?B?5ZC05Lyf?=)" <lazyparser@gmail.com>, Drew Fustini
 <drew@beagleboard.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Gordan Markus
 <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>, Arnd
 Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard
 <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, Greg Favor
 <gfavor@ventanamicro.com>, Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, Bill
 Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>, Allen
 Baum <allen.baum@esperantotech.com>, Josh Scheid
 <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
Subject: Re: [PATCH V4 2/2] riscv: add RISC-V Svpbmt extension supports
In-Reply-To: <CAAhSdy1LF4Km8ax00NdT3sUYqJRaW-nwXFCpviahpcDj2LLUAw@mail.gmail.com>
References: <20211129014007.286478-1-wefu@redhat.com>
 <20211129014007.286478-3-wefu@redhat.com>
 <20211129213634.1fe31b10@xhacker>
 <CA+YCwKkSuvbZtCzuZvA_FaFrA9qDFTLJAdQO7K_gbP_Xs7QY3A@mail.gmail.com>
 <CAAhSdy1LF4Km8ax00NdT3sUYqJRaW-nwXFCpviahpcDj2LLUAw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <20211201133758.5771EC53FCC@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_053809_784672_061B4407 
X-CRM114-Status: GOOD (  25.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 1 Dec 2021 11:48:44 +0530
Anup Patel <anup@brainfault.org> wrote:


> > > >   */
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > index d959d207a40d..fa7480cb8b87 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -8,6 +8,7 @@
> > > >
> > > >  #include <linux/bitmap.h>
> > > >  #include <linux/of.h>
> > > > +#include <linux/pgtable.h>
> > > >  #include <asm/processor.h>
> > > >  #include <asm/hwcap.h>
> > > >  #include <asm/smp.h>
> > > > @@ -59,6 +60,38 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> > > >
> > > > +static void __init mmu_supports_svpbmt(void)
> > > > +{
> > > > +#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)  
> > >
> > > IIRC, Christoph suggested a CONFIG_RISCV_SVPBMT when reviewing v3. What
> > > about that idea?  
> >
> > Yes, sorry for missing it, yes, I think we can have something like this
> >
> > config ARCH_HAS_RISCV_SVPBMT
> > bool
> > default n
> >
> > any platform which needs this support, can just
> >
> > select ARCH_HAS_RISCV_SVPBMT
> >
> > and which is the best name? ARCH_HAS_RISCV_SVPBMT or just ARCH_HAS_SVPBMT ?
> >  
> > >  
> > > > +     struct device_node *node;
> > > > +     const char *str;
> > > > +
> > > > +     for_each_of_cpu_node(node) {
> > > > +             if (of_property_read_string(node, "mmu-type", &str))
> > > > +                     continue;
> > > > +
> > > > +             if (!strncmp(str + 6, "none", 4))
> > > > +                     continue;
> > > > +
> > > > +             if (of_property_read_string(node, "mmu", &str))
> > > > +                     continue;
> > > > +
> > > > +             if (strncmp(str + 6, "svpmbt", 6))
> > > > +                     continue;
> > > > +     }
> > > > +
> > > > +     __svpbmt.pma            = _SVPBMT_PMA;
> > > > +     __svpbmt.nocache        = _SVPBMT_NC;
> > > > +     __svpbmt.io             = _SVPBMT_IO;
> > > > +     __svpbmt.mask           = _SVPBMT_MASK;
> > > > +#endif
> > > > +}
> > > > +
> > > > +static void __init mmu_supports(void)  
> > >
> > > can we remove this function currently? Instead, directly call
> > > mmu_supports_svpbmt()?
> > >  
> > > > +{
> > > > +     mmu_supports_svpbmt();
> > > > +}
> > > > +
> > > >  void __init riscv_fill_hwcap(void)
> > > >  {
> > > >       struct device_node *node;
> > > > @@ -67,6 +100,8 @@ void __init riscv_fill_hwcap(void)
> > > >       size_t i, j, isa_len;
> > > >       static unsigned long isa2hwcap[256] = {0};
> > > >
> > > > +     mmu_supports();
> > > > +
> > > >       isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
> > > >       isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
> > > >       isa2hwcap['a'] = isa2hwcap['A'] = COMPAT_HWCAP_ISA_A;
> > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > index 24b2b8044602..e4e658165ee1 100644
> > > > --- a/arch/riscv/mm/init.c
> > > > +++ b/arch/riscv/mm/init.c
> > > > @@ -854,3 +854,8 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
> > > >       return vmemmap_populate_basepages(start, end, node, NULL);
> > > >  }
> > > >  #endif
> > > > +
> > > > +#if defined(CONFIG_64BIT)
> > > > +struct __svpbmt_struct __svpbmt __ro_after_init;  
> > >
> > > Added the structure for all RV64 including NOMMU case and those platforms
> > > which doen't want SVPBMT at all, I believe Christoph's CONFIG_RISCV_SVPBMT
> > > suggestion can solve this problem.  
> >
> > see ARCH_HAS_RISCV_SVPBMT above . :-)  
> 
> This config option will not align with the goal of having a unified
> kernel image which works on HW with/without Svpmbt.

Just my thoughts: 

If disable this option, HW without Svpbmt can work as before; Hw with
Svpbmt will only have a basic working, those DMA etc can't work.

If enable this option, HW without Svpbmt can work as well, but with
a bit overhead and waste. HW with Svpbmt can work. So this option gives
those platforms which doesn't need Svpbmt a chance to totally disable it.

But linux distributions which want a uniified Image usually enable features as
much as possible, so IMHO, this config option can still meet unified kernel
image requirement.

> 
> Better to explore code patching approaches which have zero
> overhead.

It would be nice if the Svpbmt can be supported via. coding patching tech.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
