Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFCAC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JY0xNwxqbEX5BYmY7oT7SG8J1BU7QJMaP72UGkfTFTg=; b=x9nFKns628WPSm
	buPn5hLQocKx+vJ3kBc/3dQRdRke7BCgdoQyCiJkcTW8itkWTdAg/W+Lp0zRXrGaVv5icg+hppghL
	IONVvJi2lAM9LldcJLLcAyOUYQYuD8jpiwhhItPchzmVYCIQ70ivQvYH4lurVRyP3gaC3mCMpDMoF
	+7hwx7zk4UwvikNpjde02IdNKHMyoerf3WGm7JRkgxq14aiU0X7EuUnPmUliAuIHWgqG6Tzz2K4gq
	a4WA2vDXKaRRymq7ls2dSmkmbEok6swPvZdeaZ2P4w+Wx1vf7V2DO/d+Xd+22Sot6L/WcwVLo0eE3
	4nDUXQi8BgymQEFvH+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouMhT-00Eudj-Na; Sun, 13 Nov 2022 23:47:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouMhP-00Eucr-Ky
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 23:47:42 +0000
Received: from [91.65.34.88] (helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ouMhL-000519-8x; Mon, 14 Nov 2022 00:47:35 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Date: Mon, 14 Nov 2022 00:47:34 +0100
Message-ID: <3834388.R56niFO833@diego>
In-Reply-To: <Y3F936DrR6SMcJvR@spud>
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-8-heiko@sntech.de> <Y3F936DrR6SMcJvR@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_154740_030561_18C5F292 
X-CRM114-Status: GOOD (  61.09  )
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

Hi Conor,

Am Montag, 14. November 2022, 00:29:35 CET schrieb Conor Dooley:
> I always seem to forget to open my mails.. I swear I'm not being rude!

no worries :-) .

I also seem to miss one or another channel of communication way more often
than I'd like.


> In the back of my head while looking at this series, I've been wondering
> about Palmer's hwcap stuff. Wonder what the craic is there - I assume
> he's just been too busy with the profile stuff. Ditto Ztso, but iirc
> that's related. Anyway, that's just an aside as I was reading through
> the patch & typed it somewhere lest I forget to bring it up elsewhere.

That is essentially the next step for me.

The far away goal is doing the stuff we talked about at LPC - i.e. allowing
multiple variants for this and then selecting the hopefully fastest one
to patch in :-) .

Though the whole thing has way to many moving pieces for my taste,
so I'm trying to solve this step by step.

This series "simply" provides an optimization for cores supporting the
zbb extension. It works standalone and "solves" my sub-problems of
how to patch these core functions and also allowing function calls
from alternatives :-) .
[and by that may also help the people working on those more
 involved dma-operation variants, that aren't zicbom :-) ]


Next up is the mem* were I essentially have variants for "fast unaligned"
access systems - which then will use Palmer's hwcap work.
His series describes the necessary dt-property to declare if a core
can support said fast unaligned access.


Heiko

> On Thu, Nov 10, 2022 at 05:49:24PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Add handling for ZBB extension and add support for using it as a
> > variant for optimized string functions.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/Kconfig                   |  23 ++++++
> >  arch/riscv/include/asm/errata_list.h |   3 +-
> >  arch/riscv/include/asm/hwcap.h       |   1 +
> >  arch/riscv/include/asm/string.h      |  29 ++++++--
> >  arch/riscv/kernel/cpu.c              |   1 +
> >  arch/riscv/kernel/cpufeature.c       |  18 +++++
> >  arch/riscv/lib/Makefile              |   3 +
> >  arch/riscv/lib/strcmp_zbb.S          |  91 +++++++++++++++++++++++
> >  arch/riscv/lib/strlen_zbb.S          |  98 +++++++++++++++++++++++++
> >  arch/riscv/lib/strncmp_zbb.S         | 106 +++++++++++++++++++++++++++
> >  10 files changed, 366 insertions(+), 7 deletions(-)
> >  create mode 100644 arch/riscv/lib/strcmp_zbb.S
> >  create mode 100644 arch/riscv/lib/strlen_zbb.S
> >  create mode 100644 arch/riscv/lib/strncmp_zbb.S
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index acfc4d298aab..56633931e808 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -411,6 +411,29 @@ config RISCV_ISA_SVPBMT
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config TOOLCHAIN_HAS_ZBB
> > +	bool
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
> > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> 
> Drew wants to switch away from this method and use insn defs instead -
> and I must admit it does look cleaner! Check out his Zicboz series and
> see what you think of it.
> 
> > +config RISCV_ISA_ZBB
> > +	bool "Zbb extension support for "
> 
> Missing some words in this line?
> 
> > +	depends on TOOLCHAIN_HAS_ZBB
> > +	depends on !XIP_KERNEL && MMU
> > +	select RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Adds support to dynamically detect the presence of the ZBB
> > +	   extension (basic bit manipulation) and enable its usage.
> > +
> > +	   The Zbb extension provides instructions to accelerate a number
> > +	   of bit-specific operations (count bit population, sign extending,
> > +	   bitrotation, etc).
> > +
> > +	   If you don't know what to do here, say Y.
> > +
> >  config TOOLCHAIN_HAS_ZICBOM
> >  	bool
> >  	default y
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > index 4180312d2a70..95e626b7281e 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -24,7 +24,8 @@
> >  
> >  #define	CPUFEATURE_SVPBMT 0
> >  #define	CPUFEATURE_ZICBOM 1
> > -#define	CPUFEATURE_NUMBER 2
> > +#define	CPUFEATURE_ZBB 2
> > +#define	CPUFEATURE_NUMBER 3
> >  
> >  #ifdef __ASSEMBLY__
> >  
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index b22525290073..ac5555fd9788 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
> >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> >  	RISCV_ISA_EXT_SSTC,
> >  	RISCV_ISA_EXT_SVINVAL,
> > +	RISCV_ISA_EXT_ZBB,
> 
> With ZIHINTPAUSE before SSTC and SVINIVAL I assume this is not something
> we are canonically ordering but I never, ever know which ones we are
> allowed to re-order at will.
> 
> >  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> >  };
> 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index bf9dd6764bad..66ff36a57e20 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -166,6 +166,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
> >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> 
> This one I do know that Palmer wants canonically ordered.
> 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 026512ca9c4c..f19b9d4e2dca 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -201,6 +201,7 @@ void __init riscv_fill_hwcap(void)
> >  			} else {
> >  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> >  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> > +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> >  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> >  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> >  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> 
> This one looks like it is, sstc aside. Same question as above, can I
> reorder this one? I'll send a patch for it if I can...
> 
> > diff --git a/arch/riscv/lib/strcmp_zbb.S b/arch/riscv/lib/strcmp_zbb.S
> > new file mode 100644
> > index 000000000000..aff9b941d3ee
> > --- /dev/null
> > +++ b/arch/riscv/lib/strcmp_zbb.S
> > @@ -0,0 +1,91 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 VRULL GmbH
> > + * Author: Christoph Muellner <christoph.muellner@vrull.eu>
> 
> Is a Co-developed-by: appropriate then?
> 
> > + */
> > +
> > +#include <linux/linkage.h>
> > +#include <asm/asm.h>
> > +#include <asm-generic/export.h>
> > +
> > +#define src1		a0
> > +#define result		a0
> > +#define src2		t5
> > +#define data1		t0
> > +#define data2		t1
> > +#define align		t2
> > +#define data1_orcb	t3
> > +#define m1		t4
> > +
> > +.option push
> > +.option arch,+zbb
> > +
> > +/* int __strcmp_zbb(const char *cs, const char *ct) */
> > +ENTRY(__strcmp_zbb)
> > +	/*
> > +	 * Returns
> > +	 *   a0 - comparison result, like strncmp
> > +	 *
> > +	 * Parameters
> > +	 *   a0 - string1
> > +	 *   a1 - string2
> > +	 *   a2 - number of characters to compare
> 
> Same copy paste mistake here with a2?
> 
> > +	 *
> > +	 * Clobbers
> > +	 *   t0, t1, t2, t3, t4, t5
> > +	 */
> > +	mv	src2, a1
> > +
> > +	or	align, src1, src2
> > +	li	m1, -1
> > +	and	align, align, SZREG-1
> > +	bnez	align, 3f
> 
> Line of whitespace here would be nice.
> 
> > +	/* Main loop for aligned string.  */
> > +	.p2align 3
> > +1:
> > +	REG_L	data1, 0(src1)
> > +	REG_L	data2, 0(src2)
> > +	orc.b	data1_orcb, data1
> > +	bne	data1_orcb, m1, 2f
> > +	addi	src1, src1, SZREG
> > +	addi	src2, src2, SZREG
> > +	beq	data1, data2, 1b
> > +
> > +	/* Words don't match, and no null byte in the first
> > +	 * word. Get bytes in big-endian order and compare.  */
> > +#ifndef CONFIG_CPU_BIG_ENDIAN
> 
> I know this is a lift from the reference implementation in the spec, but
> do we actually need this ifndef section?
> 
> > +	rev8	data1, data1
> > +	rev8	data2, data2
> > +#endif
> > +	/* Synthesize (data1 >= data2) ? 1 : -1 in a branchless sequence.  */
> > +	sltu	result, data1, data2
> > +	neg	result, result
> > +	ori	result, result, 1
> > +	ret
> > +
> > +2:
> > +	/* Found a null byte.
> > +	 * If words don't match, fall back to simple loop.  */
> 
> Can the multiline comments match the usual multiline comment style that
> you used as the start of the function?
> 
> > +	bne	data1, data2, 3f
> > +
> > +	/* Otherwise, strings are equal.  */
> > +	li	result, 0
> > +	ret
> > +
> > +	/* Simple loop for misaligned strings.  */
> > +	.p2align 3
> > +3:
> > +	lbu	data1, 0(src1)
> > +	lbu	data2, 0(src2)
> > +	addi	src1, src1, 1
> > +	addi	src2, src2, 1
> > +	bne	data1, data2, 4f
> > +	bnez	data1, 3b
> > +
> > +4:
> > +	sub	result, data1, data2
> > +	ret
> > +END(__strcmp_zbb)
> > +EXPORT_SYMBOL(__strcmp_zbb)
> > +
> > +.option pop
> > diff --git a/arch/riscv/lib/strlen_zbb.S b/arch/riscv/lib/strlen_zbb.S
> > new file mode 100644
> > index 000000000000..bc8d3607a32f
> > --- /dev/null
> > +++ b/arch/riscv/lib/strlen_zbb.S
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 VRULL GmbH
> > + * Author: Christoph Muellner <christoph.muellner@vrull.eu>
> > + */
> > +
> > +#include <linux/linkage.h>
> > +#include <asm/asm.h>
> > +#include <asm-generic/export.h>
> > +
> > +#define src		a0
> > +#define result		a0
> > +#define addr		t0
> > +#define data		t1
> > +#define offset		t2
> > +#define offset_bits	t2
> > +#define valid_bytes	t3
> > +#define m1		t3
> > +
> > +#ifdef CONFIG_CPU_BIG_ENDIAN
> > +# define CZ	clz
> > +# define SHIFT	sll
> > +#else
> > +# define CZ	ctz
> > +# define SHIFT	srl
> > +#endif
> > +
> > +.option push
> > +.option arch,+zbb
> > +
> > +/* int __strlen_zbb(const char *s) */
> > +ENTRY(__strlen_zbb)
> > +	/*
> > +	 * Returns
> > +	 *   a0 - string length
> > +	 *
> > +	 * Parameters
> > +	 *   a0 - String to measure
> > +	 *
> > +	 * Clobbers
> > +	 *   t0, t1, t2, t3
> > +	 */
> > +
> > +	/* Number of irrelevant bytes in the first word.  */
> > +	andi	offset, src, SZREG-1
> > +	/* Align pointer.  */
> > +	andi	addr, src, -SZREG
> > +
> > +	li	valid_bytes, SZREG
> > +	sub	valid_bytes, valid_bytes, offset
> > +	slli	offset_bits, offset, RISCV_LGPTR
> > +
> > +	/* Get the first word.  */
> > +	REG_L	data, 0(addr)
> 
> A line of whitespace prior to the comments would go a long way here with
> making this a little more readable - especially as a diff in a
> mailclient.
> 
> I am oh-so-far from an expert on this kind of stuff, but these three
> functions seem to match up with the reference implementations in the
> spec. With the couple different nit pick bits fixed, feel free to tack
> on:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Anyways, hopefully I've not missed a bunch of should-be-obvious things
> while trying to review the series..
> 
> Thanks,
> Conor.
> 
> > +	/* Shift away the partial data we loaded to remove the irrelevant bytes
> > +	 * preceding the string with the effect of adding NUL bytes at the
> > +	 * end of the string.  */
> > +	SHIFT	data, data, offset_bits
> > +	/* Convert non-NUL into 0xff and NUL into 0x00.  */
> > +	orc.b	data, data
> > +	/* Convert non-NUL into 0x00 and NUL into 0xff.  */
> > +	not	data, data
> > +	/* Search for the first set bit (corresponding to a NUL byte in the
> > +	 * original chunk).  */
> > +	CZ	data, data
> > +	/* The first chunk is special: commpare against the number
> > +	 * of valid bytes in this chunk.  */
> > +	srli	result, data, 3
> > +	bgtu	valid_bytes, result, 3f
> > +
> > +	/* Prepare for the word comparison loop.  */
> > +	addi	offset, addr, SZREG
> > +	li	m1, -1
> > +
> > +	/* Our critical loop is 4 instructions and processes data in
> > +	 * 4 byte or 8 byte chunks.  */
> > +	.p2align 3
> > +1:
> > +	REG_L	data, SZREG(addr)
> > +	addi	addr, addr, SZREG
> > +	orc.b	data, data
> > +	beq	data, m1, 1b
> > +2:
> > +	not	data, data
> > +	CZ	data, data
> > +	/* Get number of processed words.  */
> > +	sub	offset, addr, offset
> > +	/* Add number of characters in the first word.  */
> > +	add	result, result, offset
> > +	srli	data, data, 3
> > +	/* Add number of characters in the last word.  */
> > +	add	result, result, data
> > +3:
> > +	ret
> > +END(__strlen_zbb)
> > +EXPORT_SYMBOL(__strlen_zbb)
> > +
> > +.option pop
> > diff --git a/arch/riscv/lib/strncmp_zbb.S b/arch/riscv/lib/strncmp_zbb.S
> > new file mode 100644
> > index 000000000000..852c8425d238
> > --- /dev/null
> > +++ b/arch/riscv/lib/strncmp_zbb.S
> > @@ -0,0 +1,106 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 VRULL GmbH
> > + * Author: Christoph Muellner <christoph.muellner@vrull.eu>
> > + */
> > +
> > +#include <linux/linkage.h>
> > +#include <asm/asm.h>
> > +#include <asm-generic/export.h>
> > +
> > +#define src1		a0
> > +#define result		a0
> > +#define src2		t6
> > +#define len		a2
> > +#define data1		t0
> > +#define data2		t1
> > +#define align		t2
> > +#define data1_orcb	t3
> > +#define limit		t4
> > +#define m1		t5
> > +
> > +.option push
> > +.option arch,+zbb
> > +
> > +/* int __strncmp_zbb(const char *cs, const char *ct, size_t count) */
> > +ENTRY(__strncmp_zbb)
> > +	/*
> > +	 * Returns
> > +	 *   a0 - comparison result, like strncmp
> > +	 *
> > +	 * Parameters
> > +	 *   a0 - string1
> > +	 *   a1 - string2
> > +	 *   a2 - number of characters to compare
> > +	 *
> > +	 * Clobbers
> > +	 *   t0, t1, t2, t3, t4, t5, t6
> > +	 */
> > +	mv	src2, a1
> > +
> > +	or	align, src1, src2
> > +	li	m1, -1
> > +	and	align, align, SZREG-1
> > +	add	limit, src1, len
> > +	bnez	align, 4f
> > +
> > +	/* Adjust limit for fast-path.  */
> > +	addi	limit, limit, -SZREG
> > +	/* Main loop for aligned string.  */
> > +	.p2align 3
> > +1:
> > +	bgt	src1, limit, 3f
> > +	REG_L	data1, 0(src1)
> > +	REG_L	data2, 0(src2)
> > +	orc.b	data1_orcb, data1
> > +	bne	data1_orcb, m1, 2f
> > +	addi	src1, src1, SZREG
> > +	addi	src2, src2, SZREG
> > +	beq	data1, data2, 1b
> > +
> > +	/* Words don't match, and no null byte in the first
> > +	 * word. Get bytes in big-endian order and compare.  */
> > +#ifndef CONFIG_CPU_BIG_ENDIAN
> > +	rev8	data1, data1
> > +	rev8	data2, data2
> > +#endif
> > +	/* Synthesize (data1 >= data2) ? 1 : -1 in a branchless sequence.  */
> > +	sltu	result, data1, data2
> > +	neg	result, result
> > +	ori	result, result, 1
> > +	ret
> > +
> > +2:
> > +	/* Found a null byte.
> > +	 * If words don't match, fall back to simple loop.  */
> > +	bne	data1, data2, 3f
> > +
> > +	/* Otherwise, strings are equal.  */
> > +	li	result, 0
> > +	ret
> > +
> > +	/* Simple loop for misaligned strings.  */
> > +3:
> > +	/* Restore limit for slow-path.  */
> > +	addi	limit, limit, SZREG
> > +	.p2align 3
> > +4:
> > +	bge	src1, limit, 6f
> > +	lbu	data1, 0(src1)
> > +	lbu	data2, 0(src2)
> > +	addi	src1, src1, 1
> > +	addi	src2, src2, 1
> > +	bne	data1, data2, 5f
> > +	bnez	data1, 4b
> > +
> > +5:
> > +	sub	result, data1, data2
> > +	ret
> > +
> > +6:
> > +	li	result, 0
> > +	ret
> > +END(__strncmp_zbb)
> > +EXPORT_SYMBOL(__strncmp_zbb)
> > +
> > +.option pop
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
