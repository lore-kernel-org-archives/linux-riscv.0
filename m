Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2E5C61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 22:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRrjEXTytNaVD8UTUZ6Tsn56lATk+b7mL+o985TZlA8=; b=Zx2j9p/+2aDTnJ
	ucOuWErdcdu8Nn9BGlBnYDBNe3udbTLq4nB7BB7GTmeKOu/8C9ew8MD/XXFd1TKbx6P8e4nmzCXvl
	sf8NYoQ4JeU80i2eBOsddShdDLr7CirEU7PIQ3bFIJJkIpOI+g/2nE7fD9e3RTLXYLI3Jzc5uOSp6
	ZeQzJFo+nqtFpVLu8KLoHgvGMEsAffxBYUzldrmzpaciuGEQ7uAMlHDOfBtvlOY56WKzfxLEN8LZ6
	ogNcFJf8y7KRkAtLWWOxDT3CJyCN55vPXM1yy6ngLhG7zdA5109o3B9oD/RInoyZvQD4n4rev7NTR
	V7v+Wv3oTQxa87C9i9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5i5-00HKwW-Rw; Thu, 12 Jan 2023 22:06:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5hz-00HKtu-48
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 22:06:07 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pG5ht-0002jO-5W; Thu, 12 Jan 2023 23:05:57 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, jszhang@kernel.org
Subject: Re: [PATCH v4 5/5] RISC-V: add zbb support to string functions
Date: Thu, 12 Jan 2023 23:05:56 +0100
Message-ID: <9588197.2WqB4rESCP@diego>
In-Reply-To: <20230111122452.ubgebzhkzova3hte@orel>
References: <20230109181755.2383085-1-heiko@sntech.de> <20230109181755.2383085-6-heiko@sntech.de> <20230111122452.ubgebzhkzova3hte@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_140603_502637_91CC0F87 
X-CRM114-Status: GOOD (  58.70  )
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

Hi Andrew,

Am Mittwoch, 11. Januar 2023, 13:24:52 CET schrieb Andrew Jones:
> On Mon, Jan 09, 2023 at 07:17:55PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Add handling for ZBB extension and add support for using it as a
> > variant for optimized string functions.
> > 
> > Support for the Zbb-str-variants is limited to the GNU-assembler
> > for now, as LLVM has not yet acquired the functionality to
> > selectively change the arch option in assembler code.
> > This is still under review at
> >     https://reviews.llvm.org/D123515
> > 
> > Co-developed-by: Christoph Muellner <christoph.muellner@vrull.eu>
> > Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/Kconfig                   |  24 ++++++
> >  arch/riscv/include/asm/errata_list.h |   3 +-
> >  arch/riscv/include/asm/hwcap.h       |   1 +
> >  arch/riscv/include/asm/string.h      |   2 +
> >  arch/riscv/kernel/cpu.c              |   1 +
> >  arch/riscv/kernel/cpufeature.c       |  18 +++++
> >  arch/riscv/lib/strcmp.S              |  94 ++++++++++++++++++++++
> >  arch/riscv/lib/strlen.S              | 114 +++++++++++++++++++++++++++
> >  arch/riscv/lib/strncmp.S             | 111 ++++++++++++++++++++++++++
> >  9 files changed, 367 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e2b656043abf..7c814fbf9527 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -416,6 +416,30 @@ config RISCV_ISA_SVPBMT
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config TOOLCHAIN_HAS_ZBB
> > +	bool
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
> > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > +	depends on AS_IS_GNU
> > +
> > +config RISCV_ISA_ZBB
> > +	bool "Zbb extension support for bit manipulation instructions"
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
> > index 86328e3acb02..b727491fb100 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
> >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> >  	RISCV_ISA_EXT_SSTC,
> >  	RISCV_ISA_EXT_SVINVAL,
> > +	RISCV_ISA_EXT_ZBB,
> >  	RISCV_ISA_EXT_ID_MAX
> >  };
> >  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> > diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> > index a96b1fea24fe..17dfc4ab4c80 100644
> > --- a/arch/riscv/include/asm/string.h
> > +++ b/arch/riscv/include/asm/string.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _ASM_RISCV_STRING_H
> >  #define _ASM_RISCV_STRING_H
> >  
> > +#include <asm/alternative-macros.h>
> > +#include <asm/errata_list.h>
> >  #include <linux/types.h>
> >  #include <linux/linkage.h>
> >  
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1b9a5a66e55a..c4d1aa166f8b 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -162,6 +162,7 @@ arch_initcall(riscv_cpuinfo_init);
> >   *    extensions by an underscore.
> >   */
> >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> >  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 205bbd6b1fce..bf3a791d7110 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -222,6 +222,7 @@ void __init riscv_fill_hwcap(void)
> >  					set_bit(nr, this_isa);
> >  				}
> >  			} else {
> > +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> >  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> >  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> >  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> > @@ -301,6 +302,20 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> >  	return true;
> >  }
> >  
> > +static bool __init_or_module cpufeature_probe_zbb(unsigned int stage)
> > +{
> > +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB))
> > +		return false;
> > +
> > +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > +		return false;
> > +
> > +	if (!riscv_isa_extension_available(NULL, ZBB))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> >  /*
> >   * Probe presence of individual extensions.
> >   *
> > @@ -318,6 +333,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
> >  	if (cpufeature_probe_zicbom(stage))
> >  		cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
> >  
> > +	if (cpufeature_probe_zbb(stage))
> > +		cpu_req_feature |= BIT(CPUFEATURE_ZBB);
> > +
> >  	return cpu_req_feature;
> >  }
> >  
> > diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> > index 94440fb8390c..5428a8f2eb84 100644
> > --- a/arch/riscv/lib/strcmp.S
> > +++ b/arch/riscv/lib/strcmp.S
> > @@ -3,9 +3,14 @@
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> >  #include <asm-generic/export.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/errata_list.h>
> >  
> >  /* int strcmp(const char *cs, const char *ct) */
> >  SYM_FUNC_START(strcmp)
> > +
> > +	ALTERNATIVE("nop", "j variant_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
> 
> How about strcmp_zbb and similar for the other functions for the labels?

agreed, that is a way more sensible naming

> > +
> >  	/*
> >  	 * Returns
> >  	 *   a0 - comparison result, value like strcmp
> > @@ -34,4 +39,93 @@ SYM_FUNC_START(strcmp)
> >  	bnez	t1, 1b
> >  	li	a0, 0
> >  	j	2b
> > +
> > +/*
> > + * Variant of strcmp using the ZBB extension if available
> > + */
> > +#ifdef CONFIG_RISCV_ISA_ZBB
> > +variant_zbb:
> > +#define src1		a0
> > +#define result		a0
> > +#define src2		t5
> > +#define data1		t0
> > +#define data2		t1
> > +#define align		t2
> > +#define data1_orcb	t3
> > +#define m1		t4
> 
> nit: It's probably just me, but I'm not a big fan of creating defines
> for registers, particularly when the meaning of the registers' contents
> gets changed, because then the name, at least temporarily, no longer
> accurately describes the content.

I just had to scroll up and down a lot between these defines and the
parts using it, cause I couldn't really remember which register that was :-)

Also these somewhat generic names the produce conflicts in my
zbb+fast-unaligned variant, so would need more prefixes.

And I actually find it harder to read the assembly when the names are
these different lengths instead of the usual 2 characters and things are
neatly aligned in the assembly.


So in sum, I decided to follow that suggestion and dropped the defines.


> And, in this case, it looks like the code matches Appendix A, except the
> register and label naming. I'd prefer to have those match too so I could
> "review" with the diff tool.
> 
> > +
> > +.option push
> > +.option arch,+zbb
> > +
> > +	/*
> > +	 * Returns
> > +	 *   a0 - comparison result, value like strcmp
> > +	 *
> > +	 * Parameters
> > +	 *   a0 - string1
> > +	 *   a1 - string2
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
> > +
> > +	/* Main loop for aligned string.  */
> > +	.p2align 3
> 
> Why are the starts of the loops aligned to 8 byte boundaries?
> 
> > +1:
> > +	REG_L	data1, 0(src1)
> > +	REG_L	data2, 0(src2)
> > +	orc.b	data1_orcb, data1
> > +	bne	data1_orcb, m1, 2f
> > +	addi	src1, src1, SZREG
> > +	addi	src2, src2, SZREG
> > +	beq	data1, data2, 1b
> > +
> > +	/*
> > +	 * Words don't match, and no null byte in the first
> > +	 * word. Get bytes in big-endian order and compare.
> > +	 */
> > +#ifndef CONFIG_CPU_BIG_ENDIAN
> > +	rev8	data1, data1
> > +	rev8	data2, data2
> > +#endif
> > +
> > +	/* Synthesize (data1 >= data2) ? 1 : -1 in a branchless sequence. */
> > +	sltu	result, data1, data2
> > +	neg	result, result
> > +	ori	result, result, 1
> > +	ret
> > +
> > +2:
> > +	/*
> > +	 * Found a null byte.
> > +	 * If words don't match, fall back to simple loop.
> > +	 */
> > +	bne	data1, data2, 3f
> > +
> > +	/* Otherwise, strings are equal. */
> > +	li	result, 0
> > +	ret
> > +
> > +	/* Simple loop for misaligned strings. */
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
> 
> The non-optimized version returns explicitly -1, 0, 1, whereas this
> returns < 0, 0, > 0. Assuming we don't need the explicit -1 / 1 then we
> can change the non-optimized version to do this subtraction for its
> return value too, saving several instructions.
> 
> > +	ret
> > +
> > +.option pop
> > +#endif
> >  SYM_FUNC_END(strcmp)
> > diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> > index 09a7aaff26c8..738efb04307d 100644
> > --- a/arch/riscv/lib/strlen.S
> > +++ b/arch/riscv/lib/strlen.S
> > @@ -3,9 +3,14 @@
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> >  #include <asm-generic/export.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/errata_list.h>
> >  
> >  /* int strlen(const char *s) */
> >  SYM_FUNC_START(strlen)
> > +
> > +	ALTERNATIVE("nop", "j variant_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
> > +
> >  	/*
> >  	 * Returns
> >  	 *   a0 - string length
> > @@ -25,4 +30,113 @@ SYM_FUNC_START(strlen)
> >  2:
> >  	addi	t1, t1, 1
> >  	j	1b
> > +
> > +/*
> > + * Variant of strlen using the ZBB extension if available
> > + */
> > +#ifdef CONFIG_RISCV_ISA_ZBB
> > +variant_zbb:
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
> > +	/* Number of irrelevant bytes in the first word. */
> 
> I see that this comment doesn't just apply to the next instruction,
> but to several instructions. It threw me off at first. Again, I
> think I'd prefer we just copy+paste the Appendix, comments an all.

Hmm, somehow for me as non-native-speaker in assembly [ ;-) ],
using temporary registers for temporary variables feels somehow
more intuitive. 


> > +	andi	offset, src, SZREG-1
> > +
> > +	/* Align pointer. */
> > +	andi	addr, src, -SZREG
> > +
> > +	li	valid_bytes, SZREG
> > +	sub	valid_bytes, valid_bytes, offset
> > +	slli	offset_bits, offset, RISCV_LGPTR
> 
> The shift immediate should be 3, even for rv32, since we want
> bits-per-byte, not bytes-per-word. The spec example uses PTRLOG, which
> does imply bytes-per-word to me as well, so that seems like a spec bug.

fixed this according to your's and Christoph's comment


> > +
> > +	/* Get the first word.  */
> > +	REG_L	data, 0(addr)
> > +
> > +	/*
> > +	 * Shift away the partial data we loaded to remove the irrelevant bytes
> > +	 * preceding the string with the effect of adding NUL bytes at the
> > +	 * end of the string.
> 
> the end of the string's first word.

ok


> > +	 */
> > +	SHIFT	data, data, offset_bits
> > +
> > +	/* Convert non-NUL into 0xff and NUL into 0x00. */
> > +	orc.b	data, data
> > +
> > +	/* Convert non-NUL into 0x00 and NUL into 0xff. */
> > +	not	data, data
> > +
> > +	/*
> > +	 * Search for the first set bit (corresponding to a NUL byte in the
> > +	 * original chunk).
> > +	 */
> > +	CZ	data, data
> > +
> > +	/*
> > +	 * The first chunk is special: commpare against the number
> 
> compare

ok


> > +	 * of valid bytes in this chunk.
> > +	 */
> > +	srli	result, data, 3
> > +	bgtu	valid_bytes, result, 3f
> > +
> > +	/* Prepare for the word comparison loop. */
> > +	addi	offset, addr, SZREG
> > +	li	m1, -1
> > +
> > +	/*
> > +	 * Our critical loop is 4 instructions and processes data in
> > +	 * 4 byte or 8 byte chunks.
> > +	 */
> > +	.p2align 3
> > +1:
> > +	REG_L	data, SZREG(addr)
> > +	addi	addr, addr, SZREG
> > +	orc.b	data, data
> > +	beq	data, m1, 1b
> > +2:
> > +	not	data, data
> > +	CZ	data, data
> > +
> > +	/* Get number of processed words.  */
> > +	sub	offset, addr, offset
> > +
> > +	/* Add number of characters in the first word.  */
> > +	add	result, result, offset
> > +	srli	data, data, 3
> > +
> > +	/* Add number of characters in the last word.  */
> > +	add	result, result, data
> > +3:
> > +	ret
> > +
> > +.option pop
> > +#endif
> >  SYM_FUNC_END(strlen)
> > diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> > index 493ab6febcb2..851428b439dc 100644
> > --- a/arch/riscv/lib/strncmp.S
> > +++ b/arch/riscv/lib/strncmp.S
> > @@ -3,9 +3,14 @@
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> >  #include <asm-generic/export.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/errata_list.h>
> >  
> >  /* int strncmp(const char *cs, const char *ct, size_t count) */
> >  SYM_FUNC_START(strncmp)
> > +
> > +	ALTERNATIVE("nop", "j variant_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
> > +
> >  	/*
> >  	 * Returns
> >  	 *   a0 - comparison result, value like strncmp
> > @@ -37,4 +42,110 @@ SYM_FUNC_START(strncmp)
> >  4:
> >  	li	a0, 0
> >  	j	2b
> > +
> > +/*
> > + * Variant of strncmp using the ZBB extension if available
> > + */
> > +#ifdef CONFIG_RISCV_ISA_ZBB
> > +variant_zbb:
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
> 
> To avoid unnecessarily writing the last SZREG bytes one at a time when
> 'len' is SZREG aligned, we should be using the explicitly aligned limit
> here (limit & ~(SZREG - 1)) rather than just subtracting SZREG. Then, down
> in the slow-path we use the original limit to finish off if len wasn't
> aligned. When it was aligned, we'll just immediately branch to the ret.
> (I suspect many times 'len' will be SZREG aligned, since string buffers
> are typically allocated with power-of-two sizes).

I followed Christoph's suggestion from his follow-up to your mail to
address this.


> > +
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
> > +	/*
> > +	 * Words don't match, and no null byte in the first
> > +	 * word. Get bytes in big-endian order and compare.
> > +	 */
> > +#ifndef CONFIG_CPU_BIG_ENDIAN
> > +	rev8	data1, data1
> > +	rev8	data2, data2
> > +#endif
> > +
> > +	/* Synthesize (data1 >= data2) ? 1 : -1 in a branchless sequence.  */
> > +	sltu	result, data1, data2
> > +	neg	result, result
> > +	ori	result, result, 1
> > +	ret
> > +
> > +2:
> > +	/*
> > +	 * Found a null byte.
> > +	 * If words don't match, fall back to simple loop.
> > +	 */
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
> 
> As strcmp and strncmp have so much in common it's tempting to try and
> merge them somehow. Maybe with a handful of macros shared between them?

I guess the question is does this make things easier to read or harder.

As mentioned above, going between register defines and code was hard
already. With at least a strcmp-zbb-unaligned variant in my follow-up and
possible more future variants, my feeling is to leave strcmp, strncmp in
their own .S files for readability (and how everyone else is doing it)
and thus sharing macros between them would require a shared header then.

Without comments strncmp_zbb is like 46 lines long, so right now it feels
like splitting things up would make it harder to follow, but I could be wrong :-) .


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
