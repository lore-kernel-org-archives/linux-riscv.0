Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2FAE77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 00:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjWv7G9qDRMkLqE4+4FJNNJBtkpQW6LB6R7ahkjiPzQ=; b=EcuOWWHCIbU9Kw
	f6fPVF2YkyWI2A7cWTV5USZOECNR00leWq3UsTdJfYlGzc1EWqBmWHjo7MoL4K2pH/5TalKjF0Qeq
	2yz4kvBa8Uszym5DGB4ezoop2EHNyijbEVr90zXxrb2hCmySu2p7QSJfqzzbo+bGJVi/hoo3xeDtU
	4bCGgUMNc0+AdA5O5iCLaQD3RjShjN/N5RPHwe3gUwr9ZVRUPRcOhDNN+z0wloXPiqUSMv772Y/S9
	7XSczwwxxFQgvdODcsaVkvWbCzkGXksfJ0Xaod2/5MfISH1IwNwZdjjue8N3YG/TmIj7pLz+9CaK0
	4IbcnXRveBJKfBgUXBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVcA-0000000BlNa-2Fnu;
	Fri, 03 Jan 2025 00:32:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVc8-0000000BlN2-0DuL
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 00:32:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2166360285dso163351665ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2025 16:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735864351; x=1736469151; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7g+wLSi8c6UqspOT12/qWIHbcBq4WpxJE8ZGVDZG+qo=;
        b=aJMwovVrhse3Fdc7iGemMVIxhS1gjee18B/u4GXWJ14aT/fe89I73jqQ62mI7RFrx/
         f2xdpol1LCG/31d5YUp+MIFnlj5hBGeLahT01nMKp0q0f5J5C7YSO+NcenYSzA42LTg7
         jCIhTimTPprblrNWSz6ZjV4N1wYbinycGTBiBe8B4j6J7qMKnW3BwpxZgOJc2L1ypEsy
         YtwfZwCxfA1WK5U0Qi/jRBr+c6B2uDoEWxZlIvAOGK34uMx2XLDR6XRbrRZGKDBV/O59
         6pUN876P9uIdBREVdtgXB7aIWdUkFZJYz0HxZAucoQKt1AbYlGDTnxMMt/O7VzKUEkjO
         Gtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735864351; x=1736469151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7g+wLSi8c6UqspOT12/qWIHbcBq4WpxJE8ZGVDZG+qo=;
        b=CSkSWzTNfMKJgI17xtY2De8+c1RvwHKJsIHAMEPigZ9QzNR8Fx6h7W34ZGiR6Paup8
         c02WpDLpoPGwkdzZXMVLU2QFAUATZqu+uxAV9O2oWls2BZSz/l5ld/+Rhg6GPtYE9Eak
         gHP1yKMiy5xu97hZIwt4ojM3b32hPa4oGdkEdE5LL47Y3YZ6/WPL6hh8LHedUW7HhUao
         0R/Ex8os+qtiNKgIJeTiH4xlAl73wlntFfBC+LxvUX7YW/1hCH3BLu3GYdbQQd9XkeS2
         22fAHBxwqDgONo1x0+L8TpshjWskXAIg/Uxlu7hOv/6coXb/OqeD8RRL4BefY2LYgbpk
         nVwA==
X-Gm-Message-State: AOJu0YxVxgeV+9cf1UBkGxzN/CVXPbo7yZ2DYaJHjZHqLNUPyjA4SDp4
	6zjLMPPVmm4U4SNROxctUsNBfoiIn85YD9IKpul/uNTPd6ejiCpac3D3lqw8XrM=
X-Gm-Gg: ASbGncsTjbAkCy8HB8BmAlxE0jGZZY288yi2uVkiUWZg1y/B+/+P1Ftu1E7Z+SESE3t
	VaBGdaTnwtdjtP9tkdfHPrFMm7Su7FY2MI0fW+WyHLN1Tp4xexjf6xoOh17u+M7knbk7rkQ1FR0
	iF4qo+AOvEd5Hw8yynIBmOAC1jNqRTP0/kHlbYCbgAxvUD2vUyjA9LQo1uOZ+WpdxrL3Tj7ZWXn
	HXATnQUp7XsNRcRFxfk5Tv8MXTDosDh6knEVAI7YTXsR/uyll64
X-Google-Smtp-Source: AGHT+IG3sPQtyi5nkFmQ3CmrthpTZfdWuyQXeZ4UGYJicox25LifDSU88z0mlPQiLhfTtFUIuF2xOA==
X-Received: by 2002:a17:902:f54e:b0:216:6c88:efd9 with SMTP id d9443c01a7336-219e6e9a3a1mr589504795ad.15.1735864350978;
        Thu, 02 Jan 2025 16:32:30 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:e7aa:b727:e049:3265])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6156sm226459435ad.209.2025.01.02.16.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 16:32:30 -0800 (PST)
Date: Thu, 2 Jan 2025 16:32:28 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com,
	Andrew Jones <ajones@ventanamicro.com>, pulehui@huawei.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v4 2/2] RISC-V: separate Zbb optimisations requiring and
 not requiring toolchain support
Message-ID: <Z3cwHCbbXqlRVXYc@ghost>
References: <20241024-aspire-rectify-9982da6943e5@spud>
 <20241024-chump-freebase-d26b6d81af33@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241024-chump-freebase-d26b6d81af33@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_163232_099024_C2B3B2CC 
X-CRM114-Status: GOOD (  28.92  )
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

On Thu, Oct 24, 2024 at 11:19:41AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It seems a bit ridiculous to require toolchain support for BPF to
> assemble Zbb instructions, so move the dependency on toolchain support
> for Zbb optimisations out of the Kconfig option and to the callsites.
> 
> Zbb support has always depended on alternatives, so while adjusting the
> config options guarding optimisations, remove any checks for
> whether or not alternatives are enabled.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig                    |  4 ++--
>  arch/riscv/include/asm/arch_hweight.h |  6 +++---
>  arch/riscv/include/asm/bitops.h       |  4 ++--
>  arch/riscv/include/asm/checksum.h     |  3 +--
>  arch/riscv/lib/csum.c                 | 21 +++------------------
>  arch/riscv/lib/strcmp.S               |  5 +++--
>  arch/riscv/lib/strlen.S               |  5 +++--
>  arch/riscv/lib/strncmp.S              |  5 +++--
>  8 files changed, 20 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 278a38c94c5a6..6ec7a500a25ff 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -664,12 +664,12 @@ config RISCV_ISA_ZBA
>  
>  config RISCV_ISA_ZBB
>  	bool "Zbb extension support for bit manipulation instructions"
> -	depends on TOOLCHAIN_HAS_ZBB
>  	depends on RISCV_ALTERNATIVE
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
> index 613769b9cdc90..0e7cdbbec8efd 100644
> --- a/arch/riscv/include/asm/arch_hweight.h
> +++ b/arch/riscv/include/asm/arch_hweight.h
> @@ -19,7 +19,7 @@
>  
>  static __always_inline unsigned int __arch_hweight32(unsigned int w)
>  {
> -#ifdef CONFIG_RISCV_ISA_ZBB
> +#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
>  	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>  				      RISCV_ISA_EXT_ZBB, 1)
>  			  : : : : legacy);
> @@ -50,7 +50,7 @@ static inline unsigned int __arch_hweight8(unsigned int w)
>  #if BITS_PER_LONG == 64
>  static __always_inline unsigned long __arch_hweight64(__u64 w)
>  {
> -# ifdef CONFIG_RISCV_ISA_ZBB
> +#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
>  	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>  				      RISCV_ISA_EXT_ZBB, 1)
>  			  : : : : legacy);
> @@ -64,7 +64,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
>  	return w;
>  
>  legacy:
> -# endif
> +#endif
>  	return __sw_hweight64(w);
>  }
>  #else /* BITS_PER_LONG == 64 */
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index fae152ea0508d..410e2235d6589 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -15,7 +15,7 @@
>  #include <asm/barrier.h>
>  #include <asm/bitsperlong.h>
>  
> -#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
> +#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) || defined(NO_ALTERNATIVE)
>  #include <asm-generic/bitops/__ffs.h>
>  #include <asm-generic/bitops/__fls.h>
>  #include <asm-generic/bitops/ffs.h>
> @@ -175,7 +175,7 @@ static __always_inline int variable_fls(unsigned int x)
>  	 variable_fls(x_);					\
>  })
>  
> -#endif /* !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE) */
> +#endif /* !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) || defined(NO_ALTERNATIVE) */
>  
>  #include <asm-generic/bitops/ffz.h>
>  #include <asm-generic/bitops/fls64.h>
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> index 88e6f1499e889..da378856f1d59 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -49,8 +49,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
>  	 * worth checking if supported without Alternatives.
>  	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
>  		unsigned long fold_temp;
>  
>  		asm goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> index 7fb12c59e5719..9408f50ca59a8 100644
> --- a/arch/riscv/lib/csum.c
> +++ b/arch/riscv/lib/csum.c
> @@ -40,12 +40,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
>  	uproto = (__force unsigned int)htonl(proto);
>  	sum += uproto;
>  
> -	/*
> -	 * Zbb support saves 4 instructions, so not worth checking without
> -	 * alternatives if supported
> -	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
>  		unsigned long fold_temp;
>  
>  		/*
> @@ -157,12 +152,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
>  	csum = do_csum_common(ptr, end, data);
>  
>  #ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
> -	/*
> -	 * Zbb support saves 6 instructions, so not worth checking without
> -	 * alternatives if supported
> -	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
>  		unsigned long fold_temp;
>  
>  		/*
> @@ -244,12 +234,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
>  	end = (const unsigned long *)(buff + len);
>  	csum = do_csum_common(ptr, end, data);
>  
> -	/*
> -	 * Zbb support saves 6 instructions, so not worth checking without
> -	 * alternatives if supported
> -	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
>  		unsigned long fold_temp;
>  
>  		/*
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> index 57a5c00662315..65027e742af15 100644
> --- a/arch/riscv/lib/strcmp.S
> +++ b/arch/riscv/lib/strcmp.S
> @@ -8,7 +8,8 @@
>  /* int strcmp(const char *cs, const char *ct) */
>  SYM_FUNC_START(strcmp)
>  
> -	ALTERNATIVE("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
> +	__ALTERNATIVE_CFG("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB,
> +		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
>  
>  	/*
>  	 * Returns
> @@ -43,7 +44,7 @@ SYM_FUNC_START(strcmp)
>   * The code was published as part of the bitmanip manual
>   * in Appendix A.
>   */
> -#ifdef CONFIG_RISCV_ISA_ZBB
> +#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
>  strcmp_zbb:
>  
>  .option push
> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> index 962983b73251e..eb4d2b7ed22b6 100644
> --- a/arch/riscv/lib/strlen.S
> +++ b/arch/riscv/lib/strlen.S
> @@ -8,7 +8,8 @@
>  /* int strlen(const char *s) */
>  SYM_FUNC_START(strlen)
>  
> -	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
> +	__ALTERNATIVE_CFG("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB,
> +		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
>  
>  	/*
>  	 * Returns
> @@ -33,7 +34,7 @@ SYM_FUNC_START(strlen)
>  /*
>   * Variant of strlen using the ZBB extension if available
>   */
> -#ifdef CONFIG_RISCV_ISA_ZBB
> +#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
>  strlen_zbb:
>  
>  #ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> index 7b2d0ff9ed6c7..062000c468c83 100644
> --- a/arch/riscv/lib/strncmp.S
> +++ b/arch/riscv/lib/strncmp.S
> @@ -8,7 +8,8 @@
>  /* int strncmp(const char *cs, const char *ct, size_t count) */
>  SYM_FUNC_START(strncmp)
>  
> -	ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
> +	__ALTERNATIVE_CFG("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB,
> +		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
>  
>  	/*
>  	 * Returns
> @@ -46,7 +47,7 @@ SYM_FUNC_START(strncmp)
>  /*
>   * Variant of strncmp using the ZBB extension if available
>   */
> -#ifdef CONFIG_RISCV_ISA_ZBB
> +#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
>  strncmp_zbb:
>  
>  .option push
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
