Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4390AC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/f53B7konnI7T+MMRkW8xM7L+9LiWssonUOQD/1MoDQ=; b=gfBNSmpfdQXfFP
	VQ8TOpuRwHFUgrf9qa9gSkDOELIW/y6+ixqnoszP2Ro25ffVjF1GaU8PoCtoo9//OuXIsq8DCMlFf
	6wyZluq7qO2gc5uLsCy95SKnSpMH23nzBHoJvlOIftyHANj0D+PgcL2q6IARHYo9ZmQnBF9oqpfrW
	BojntPxaE5oflmN12Ssecoa0tx8rit6Dz9JTSXaGXDIC3EMFZ+U+1kLpUPExmGjNsdXOnS3Y+HtZY
	j6xDbVqB+zU6qwtkIdsGFj65I7GG50SuLBn24c3e/DOOFfYverZZU2WVHQW9OqF//4WNP30XxzDWS
	QYWjEwGVKoeRGb3AJ/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7W1n-000000043qm-41qB;
	Thu, 16 May 2024 07:59:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7W1l-000000043px-1gIj
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 07:59:50 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso2927089a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715846386; x=1716451186; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FcRMGwI+b8IL9K4DDkb3a9IQEiuiXGl55GQt9DwMBWo=;
        b=Qdg46F+8UwivJ6iW19qt6dsBo1d9BjO3696fqfFM4xEnVfwtowFy55Vx3i2QnmSOYn
         rNgHfW1nEPEQu0R3k5zAP3aa+JSdlyJwKvolOD48VTKf7oW27wyE2nazpHlOEbgI3mjZ
         xQmgjuDQP9fIaQN3XhLPLSc8SwS2jlwyi7il/xtnCVRSe45hkRUWsRFc5vbsm2OXPXWR
         xNxzVf5SREAXltJ1o8fRQmr+CteZ5eSWqjd+jnSBzi4+oO1Pem/skHeDR+202y8fB3O2
         pUE8da5FeUQfeCrX0qcLcQiO4donJxwCCKZQ9hv8lMR++Alz2Whj3HYKV7mNG3Iqprmq
         ki/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715846386; x=1716451186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcRMGwI+b8IL9K4DDkb3a9IQEiuiXGl55GQt9DwMBWo=;
        b=EPQNIrOrhUhkTszAuOV0AlEqB0M4P4DcO0gmLzTLnpD674gT3BXkEXOZ+nSoDO2ReG
         nIe8iKbmKLMGrfQvrs0Coo7doLH5tgLT1QQHONAqkKxfM5qEzp7Ju+IeAXH1zuLi1s77
         ksEkSg0wSBjIGGA5D2kou9y0tVj/HKIgXAoRRpP0ueor3WoxsPglKC03lGE1KyKgBYN+
         YiY66/TOXE1+idMl07rFo7A/JOo3cOnJV8RwegMgcbhaYdh+S9EFkHaXLnWXW9H5HKNB
         V3nerZ6+SDQ8L7EB99lhxNKc+ObIvIDlPSHXxdb202bD2Oms8z+nefin5GONcYVdyLpx
         WhEw==
X-Gm-Message-State: AOJu0YxyWqXD/ComQy9vviUoYcpQPVrHXY6JjY4XymlyKRa9z1L2sFcC
	fCgRH8TLakcxlvveI4YrkxzJVz2F/GfNZHmpDsF/CVtjhTC/utplAeyvhMj/+fU=
X-Google-Smtp-Source: AGHT+IFQK+8Ma3ZIOp1cAwIQ5jLlHOHW3hCKd4coLCUbHUd2zghdo+wqHYCiA11zjuZMOo9IVDwBoQ==
X-Received: by 2002:a50:ab10:0:b0:56e:2452:f867 with SMTP id 4fb4d7f45d1cf-5734d6deb5fmr12396801a12.37.1715846386433;
        Thu, 16 May 2024 00:59:46 -0700 (PDT)
Received: from localhost (cst2-173-78.cust.vodafone.cz. [31.30.173.78])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574ebdf46cesm2973005a12.37.2024.05.16.00.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 00:59:46 -0700 (PDT)
Date: Thu, 16 May 2024 09:59:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com, pulehui@huawei.com, 
	Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: separate Zbb optimisations requiring and not
 requiring toolchain support
Message-ID: <20240516-7ff4001c9f2edd2a61775244@orel>
References: <20240515-hedging-passage-44fd394ab1be@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515-hedging-passage-44fd394ab1be@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_005949_473710_D515C5C3 
X-CRM114-Status: GOOD (  44.79  )
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

On Wed, May 15, 2024 at 04:27:40PM GMT, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It seems a bit ridiculous to require toolchain support for BPF to
> assemble Zbb instructions, so introduce hidden a Kconfig option that

s/hidden a/a hidden/

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

So the new hidden config is a shorthand for

#if defined(CONFIG_RISCV_ISA_ZBB) && \
    defined(CONFIG_TOOLCHAIN_HAS_ZBB) && \
    defined(CONFIG_RISCV_ALTERNATIVE)

which is reasonable to add, since that's a mouthful, but I'm not sure the
name, RISCV_ISA_ZBB_ALT, does a good job conveying all that.

If we instead just dropped the 'depends on TOOLCHAIN_HAS_ZBB' from
config RISCV_ISA_ZBB (keeping the 'depends on RISCV_ALTERNATIVE',
since nobody is really complaining about that), then we could change
this to

#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)

which is verbose, but easy to understand.

>  	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>  				      RISCV_ISA_EXT_ZBB, 1)
>  			  : : : : legacy);
> @@ -50,7 +50,7 @@ static inline unsigned int __arch_hweight8(unsigned int w)
>  #if BITS_PER_LONG == 64
>  static __always_inline unsigned long __arch_hweight64(__u64 w)
>  {
> -# ifdef CONFIG_RISCV_ISA_ZBB
> +# ifdef CONFIG_RISCV_ISA_ZBB_ALT

nit: While we're here we could remove that space after the # (and the
corresponding one on the # endif)

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

nit: It's sufficient to check !defined(CONFIG_RISCV_ISA_ZBB), so no need
for this change or its #endif comment change below.

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

When we can use C like this, rather than #if, we can create a helper to
reduce the verbosity of what I proposed above, e.g.

static inline bool csum_zbb(void)
{
   return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
          IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB);
}


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

Here we have a problem with the compound config expression, but we could
rework these functions to be like this

#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
  ALTERNATIVE("j strcmp_nozbb", "nop", 0, RISCV_ISA_EXT_ZBB, 1)

  ...zbb impl...
  ret
#endif
strcmp_nozbb:
  ...no zbb impl...

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

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
