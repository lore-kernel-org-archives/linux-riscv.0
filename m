Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31B7C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 04:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWcKiqJoWkjpXBcWjkNdOppzep7oEPfxUuQTCh81mmY=; b=3NVPZRi5FRi5MT
	2kUBmjLFf7ss9Vt5g0lqyqeNI4kLR9/s8aEQ6TyzOcxkhGggf6wLqfk2eM2m0jAilEK97cvMGtFkA
	Tyk+z1O5RqpzDNDCvco39wx5gvx5N5Cv98jXTx+j2MYxwlmZGdL0HwZasx+EArK11ejFtwNl0rQ+Z
	j1emONmTjRvNn+0IkKqJVn7MC8f5RloOD8zFIND033JHiLF1W61fio3D925fM3wHfuPCxWazLlc6F
	BOOYWlxp8X6km7C/z47pqUMa1mHVZGopvqJ14s8LCxPgNuvNuepM3Fm/YDJnoJ72vi2gkjQfLfwNC
	D0/LniedYfFrutAgAIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7TCl-00000003jOB-1C4Y;
	Thu, 16 May 2024 04:58:59 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7TCh-00000003jNe-2HiF
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 04:58:57 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5dca1efad59so5650142a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 21:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715835533; x=1716440333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RTSdj0J0ohQfIN2Zi+05yVLixxog7dNtfShb6uY41gE=;
        b=o6kxLH4SmaR4o7lpirfh02lMyi9DFhzeYzifUKGmKzO8GwlGbCBdK6KZb6gvx/AUay
         Q0kYuCm1TbTH9T4q3NBimq3eo5Hg1Zd177Nh4HLEtocuh1DSlTtqBd/liqCWqR1NyJww
         u7MKY3WEdIl3m0jrNxiUOqpvkHn85nSeOXHbja1r1LGoKmq5pYsklGy4yamjPJMYP8uU
         maDInYM0Lqytsd+uATT+FT0hQtN8XNtQTTcoKYS2Lz7RY3XHW1XL6tAhoUh3LuUmt11K
         oczQoWwmmruk8j2u5J0Wu6H5F1APf8cxBu4pcElwtPuVTTKie+ipcyOJ+PKVeu3WP8LK
         Ny1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715835533; x=1716440333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTSdj0J0ohQfIN2Zi+05yVLixxog7dNtfShb6uY41gE=;
        b=EoJlBwuTRqUdkop5NLSbPfpto/qpLhZvBV1hB5wyTh6a0fqew1hEWmQX3uzu61YrOH
         wed3/ni19vRD7feCw48w3Jc990+VOnl2Z2ptQjby5+607zUCaasc79rdqFraSR0vAuao
         T4THen8ZxNWssg2YrOvoUfmfeDWRXabC9z2ZSkcPiJh7lPZOl+9tY3nYG0Hz0/YFpUGU
         7vG/YTNrWCsiQAVktfCU/XZuGYfIOt4Ltcdkf+SrIa9EmSOCQOX8tynXPw7GYX2R0WLE
         HNLlgTHYG7gh+Ey+g9kFtuOt744dkJh8u1M3aWtN33Y00AOXpmWkjo2bmqANju3sLavw
         LdDQ==
X-Gm-Message-State: AOJu0YzH4XOUd9pz8k1zLg9t8MaAPGbd49YzC+iGqXdYwTc5UhBjmeRH
	DlFcI5QWQufXmjlC/2GOlZWbs7ZXZ6kHWECt6xh8pJZF/DZeBpY/aKJtcEHBsZw=
X-Google-Smtp-Source: AGHT+IHWktKOQnC3021sITYZulmoyXKxZd77raBVrIuG1Z0WF/w1GeVm313YjA+3EucPc9xtmVHfrg==
X-Received: by 2002:a05:6a20:9747:b0:1af:cf63:3742 with SMTP id adf61e73a8af0-1afde1b0193mr16224620637.42.1715835533364;
        Wed, 15 May 2024 21:58:53 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:144c:7973:ee0f:85cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad63bcsm128800265ad.75.2024.05.15.21.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 21:58:52 -0700 (PDT)
Date: Wed, 15 May 2024 21:58:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com,
	Andrew Jones <ajones@ventanamicro.com>, pulehui@huawei.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: separate Zbb optimisations requiring and not
 requiring toolchain support
Message-ID: <ZkWSioeSHh8p3pxM@ghost>
References: <20240515-hedging-passage-44fd394ab1be@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515-hedging-passage-44fd394ab1be@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_215855_800684_AF093822 
X-CRM114-Status: GOOD (  39.87  )
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

On Wed, May 15, 2024 at 04:27:40PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It seems a bit ridiculous to require toolchain support for BPF to
> assemble Zbb instructions, so introduce hidden a Kconfig option that
> controls the use of any toolchain-requiring optimisations while support
> is available.
> 
> Zbb support has always depended on alternatives, so while adjusting the
> config options guarding optimisations, remove any checks for
> whether or not alternatives are enabled.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> This patch stems out of a conversation about Zba optimisations in BPF.
> I'm not super sold on the approach in all honesty, even though we
> recently had a conversation about respecting the Kconfig options - but
> at this point I'd be convinced to just add some wording to the Kconfig
> options mentioning that BPF optimisations are excluded.
> Having hidden options that mean someone can turn what on what they
> think are Zbb optimisations but not actually get any cos their toolchain
> doesn't support it seems crap to me. I don't wanna add another
> user-visible option for that situation cos I wanna try to minimise the
> extent of our extension-related Kconfig options, not blow them up like
> Augustus Gloop!
> 
> Cheers,
> Conor.
> 
> CC: xiao.w.wang@intel.com
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: pulehui@huawei.com
> CC: Charlie Jenkins <charlie@rivosinc.com>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/Kconfig                    | 15 ++++++++++++---
>  arch/riscv/include/asm/arch_hweight.h |  4 ++--
>  arch/riscv/include/asm/bitops.h       |  4 ++--
>  arch/riscv/include/asm/checksum.h     |  3 +--
>  arch/riscv/lib/csum.c                 |  9 +++------
>  arch/riscv/lib/strcmp.S               |  4 ++--
>  arch/riscv/lib/strlen.S               |  4 ++--
>  arch/riscv/lib/strncmp.S              |  4 ++--
>  8 files changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e927b52b420c..f216a52ed181 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -605,14 +605,23 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>  	depends on AS_HAS_OPTION_ARCH
>  
> -config RISCV_ISA_ZBB
> -	bool "Zbb extension support for bit manipulation instructions"
> +config RISCV_ISA_ZBB_ALT
> +	def_bool RISCV_ISA_ZBB
>  	depends on TOOLCHAIN_HAS_ZBB
>  	depends on RISCV_ALTERNATIVE
> +	help
> +	  This option controls whether or not we build optimisations that
> +	  depend on toolchain support. It's automatically enabled whenever the
> +	  toolchain in use supports assembling Zbb instructions and
> +	  RISCV_ISA_ZBB is set.
> +
> +config RISCV_ISA_ZBB
> +	bool "Zbb extension support for bit manipulation instructions"
>  	default y
>  	help
>  	   Add support for enabling optimisations in the kernel when the
> -	   Zbb extension is detected at boot.
> +	   Zbb extension is detected at boot. Some optimisations may
> +	   additionally depend on toolchain support for Zbb.
>  
>  	   The Zbb extension provides instructions to accelerate a number
>  	   of bit-specific operations (count bit population, sign extending,
> diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
> index 85b2c443823e..a677f6b82228 100644
> --- a/arch/riscv/include/asm/arch_hweight.h
> +++ b/arch/riscv/include/asm/arch_hweight.h
> @@ -19,7 +19,7 @@
>  
>  static __always_inline unsigned int __arch_hweight32(unsigned int w)
>  {
> -#ifdef CONFIG_RISCV_ISA_ZBB
> +#ifdef CONFIG_RISCV_ISA_ZBB_ALT
>  	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>  				      RISCV_ISA_EXT_ZBB, 1)
>  			  : : : : legacy);
> @@ -50,7 +50,7 @@ static inline unsigned int __arch_hweight8(unsigned int w)
>  #if BITS_PER_LONG == 64
>  static __always_inline unsigned long __arch_hweight64(__u64 w)
>  {
> -# ifdef CONFIG_RISCV_ISA_ZBB
> +# ifdef CONFIG_RISCV_ISA_ZBB_ALT
>  	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>  				      RISCV_ISA_EXT_ZBB, 1)
>  			  : : : : legacy);
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index 880606b0469a..3ed810a6123d 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -15,7 +15,7 @@
>  #include <asm/barrier.h>
>  #include <asm/bitsperlong.h>
>  
> -#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
> +#if !defined(CONFIG_RISCV_ISA_ZBB_ALT) || defined(NO_ALTERNATIVE)
>  #include <asm-generic/bitops/__ffs.h>
>  #include <asm-generic/bitops/__fls.h>
>  #include <asm-generic/bitops/ffs.h>
> @@ -175,7 +175,7 @@ static __always_inline int variable_fls(unsigned int x)
>  	 variable_fls(x_);					\
>  })
>  
> -#endif /* !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE) */
> +#endif /* !defined(CONFIG_RISCV_ISA_ZBB_ALT) || defined(NO_ALTERNATIVE) */
>  
>  #include <asm-generic/bitops/ffz.h>
>  #include <asm-generic/bitops/fls64.h>
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> index 88e6f1499e88..956224ea8199 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -49,8 +49,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
>  	 * worth checking if supported without Alternatives.
>  	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT)) {
>  		unsigned long fold_temp;
>  
>  		asm goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> index 7fb12c59e571..7a97394c252b 100644
> --- a/arch/riscv/lib/csum.c
> +++ b/arch/riscv/lib/csum.c
> @@ -44,8 +44,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
>  	 * Zbb support saves 4 instructions, so not worth checking without
>  	 * alternatives if supported
>  	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT)) {
>  		unsigned long fold_temp;
>  
>  		/*
> @@ -161,8 +160,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
>  	 * Zbb support saves 6 instructions, so not worth checking without
>  	 * alternatives if supported
>  	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT)) {
>  		unsigned long fold_temp;
>  
>  		/*
> @@ -248,8 +246,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
>  	 * Zbb support saves 6 instructions, so not worth checking without
>  	 * alternatives if supported
>  	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT)) {
>  		unsigned long fold_temp;
>  
>  		/*
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> index 687b2bea5c43..a4dd2ac306f1 100644
> --- a/arch/riscv/lib/strcmp.S
> +++ b/arch/riscv/lib/strcmp.S
> @@ -8,7 +8,7 @@
>  /* int strcmp(const char *cs, const char *ct) */
>  SYM_FUNC_START(strcmp)
>  
> -	ALTERNATIVE("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
> +	ALTERNATIVE("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB_ALT)
>  
>  	/*
>  	 * Returns
> @@ -43,7 +43,7 @@ SYM_FUNC_START(strcmp)
>   * The code was published as part of the bitmanip manual
>   * in Appendix A.
>   */
> -#ifdef CONFIG_RISCV_ISA_ZBB
> +#ifdef CONFIG_RISCV_ISA_ZBB_ALT
>  strcmp_zbb:
>  
>  .option push
> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> index 8ae3064e45ff..3ab1310a7b83 100644
> --- a/arch/riscv/lib/strlen.S
> +++ b/arch/riscv/lib/strlen.S
> @@ -8,7 +8,7 @@
>  /* int strlen(const char *s) */
>  SYM_FUNC_START(strlen)
>  
> -	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
> +	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB_ALT)

I appreciate the direction this is going in, getting rid of the
CONFIG_RISCV_ALTERNATIVE checks in the code that checks
CONFIG_RISCV_ISA_ZBB is a great change.

I am missing why these str functions are changed to use
CONFIG_RISCV_ISA_ZBB_ALT when the __arch_hweight* functions were left as
using CONFIG_RISCV_ISA_ZBB in their alternatives.

- Charlie

>  
>  	/*
>  	 * Returns
> @@ -33,7 +33,7 @@ SYM_FUNC_START(strlen)
>  /*
>   * Variant of strlen using the ZBB extension if available
>   */
> -#ifdef CONFIG_RISCV_ISA_ZBB
> +#ifdef CONFIG_RISCV_ISA_ZBB_ALT
>  strlen_zbb:
>  
>  #ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> index aba5b3148621..aeed830804d7 100644
> --- a/arch/riscv/lib/strncmp.S
> +++ b/arch/riscv/lib/strncmp.S
> @@ -8,7 +8,7 @@
>  /* int strncmp(const char *cs, const char *ct, size_t count) */
>  SYM_FUNC_START(strncmp)
>  
> -	ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
> +	ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB_ALT)
>  
>  	/*
>  	 * Returns
> @@ -46,7 +46,7 @@ SYM_FUNC_START(strncmp)
>  /*
>   * Variant of strncmp using the ZBB extension if available
>   */
> -#ifdef CONFIG_RISCV_ISA_ZBB
> +#ifdef CONFIG_RISCV_ISA_ZBB_ALT
>  strncmp_zbb:
>  
>  .option push
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
