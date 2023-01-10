Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C1EC54EBE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hFuwMv2CAChlCho3OquzkFvxY2idCorQy9kB0BEFgY=; b=sF3PQRtDKnVE33
	JlJN6vbOiNdqnzesznFW/Xt5AALqo03lbf3LSHfnXhAL1/wuJbpJgqh+iKMnREowP//J4r/PdKRxH
	piffykzlzuEArPkuo4ZmfTDefQowX6kq7K/3OHt42ruWZEZH1nb917ByFwj1fv4BP+Q6djf1FlPIi
	CiF1jIAnfRH49MXkVkJCK4CnDiszcWLh3iLH01meq4q2tmc7v/sFZwFEdgSKF2yVcET3vx4CWcPEY
	fN00vw2927xdO9kHfVacEXLckp8aB5YVeAvwUVb1QHfHWLtp4ulfeQuy7T0ca3nh7YZPUGzfpRkvV
	c0gCRa8u/sibfEwEhdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBNu-006FKq-8J; Tue, 10 Jan 2023 09:57:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBNm-006FH4-6X
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 09:57:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id az7so11128585wrb.5
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 01:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFTmzxR+XcbCm3Y23xhCzAH8Pt2p3dFNGEr/RHAsP2E=;
        b=X5EvDu+dd8nD86OT2+2U2oAAPZ0wR/lJtcJr+xOUukzrrViKS/jMd9fFaK53A9mvDb
         ul0uqkwmiHxiECu/1mmvg5u/Pzl+Yu9sywizzPgas+CGt5kaP+xFKdWIopsJ5FRVCSsU
         AyGpsOF+45H0NsVYt0IViQYqAX2VjHIz3LFgHpv411lbafDbkKUXiqgT1grfe835PO4k
         gQ5qikFqqiStlVl8MsT9VtGTBNIKPNMjPkaHlaJ5IM4etWCpli4QJDmyEZrCVviJo/OI
         V/OE9NM1YEYOSZV+36O7/J5zKyM/KL+vOe0Z/UxdUzjAlCnQCkAs/KEBZxoTvktsVN9+
         FMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFTmzxR+XcbCm3Y23xhCzAH8Pt2p3dFNGEr/RHAsP2E=;
        b=GDFLVBy8qXM/Y1pM0Tt93d/xpCXGJ0N7ZkRg8vNhSfI+UXDBsY3ukKZ1J4ze3Pc6TM
         gQhhdiVEaaa2BmwTf4uKDmZ+YEMxMMFuh1E2KPm7ZmC7ZWrtU/uIOy1K6JirTw/yk9UF
         KS6Es3ISfyWgKmYWUWI/PwthlZoMClyxPKjntVPVaZMNP9hikt3SlWYFy8TcGjIms3GQ
         uMwXJHqvZqK2xWbgBXMtJfbfdnjTikdeNQr4h8GgvsMK5hgYVRF9EX8wSJWDqBf6V2Cl
         jfgYqCDBkVS2ZFHPd8UH0AgGkeCA5AFmGrC/LTjFk5rFly8iZzEx0pQ1zR2kACC+fI2l
         WidQ==
X-Gm-Message-State: AFqh2koS6f1OU3j1d6+cgfqn4Z95UgAcn/wZN1ZMRYg+VO+8akseG5HM
	Mh7brhGAibBSz/j79r94H0LhUg==
X-Google-Smtp-Source: AMrXdXspjjustOEfrrp+Io057mKgg5+DdSPjchRICux/ibtda46uMMYVixqiyIVxW5/kDDsGM5SDkg==
X-Received: by 2002:a05:6000:1e11:b0:2bb:366b:d5e1 with SMTP id bj17-20020a0560001e1100b002bb366bd5e1mr11075272wrb.30.1673344642101;
        Tue, 10 Jan 2023 01:57:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f6-20020adffcc6000000b002bbdcd15e44sm7070236wrs.37.2023.01.10.01.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:57:21 -0800 (PST)
Date: Tue, 10 Jan 2023 10:57:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 5/5] RISC-V: add zbb support to string functions
Message-ID: <20230110095720.j7ll3qwmwneodmpw@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109181755.2383085-6-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_015726_262854_5FAD2F0B 
X-CRM114-Status: GOOD (  35.29  )
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

On Mon, Jan 09, 2023 at 07:17:55PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Add handling for ZBB extension and add support for using it as a
> variant for optimized string functions.
> 
> Support for the Zbb-str-variants is limited to the GNU-assembler
> for now, as LLVM has not yet acquired the functionality to
> selectively change the arch option in assembler code.
> This is still under review at
>     https://reviews.llvm.org/D123515
> 
> Co-developed-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/Kconfig                   |  24 ++++++
>  arch/riscv/include/asm/errata_list.h |   3 +-
>  arch/riscv/include/asm/hwcap.h       |   1 +
>  arch/riscv/include/asm/string.h      |   2 +
>  arch/riscv/kernel/cpu.c              |   1 +
>  arch/riscv/kernel/cpufeature.c       |  18 +++++
>  arch/riscv/lib/strcmp.S              |  94 ++++++++++++++++++++++
>  arch/riscv/lib/strlen.S              | 114 +++++++++++++++++++++++++++
>  arch/riscv/lib/strncmp.S             | 111 ++++++++++++++++++++++++++
>  9 files changed, 367 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..7c814fbf9527 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -416,6 +416,30 @@ config RISCV_ISA_SVPBMT
>  
>  	   If you don't know what to do here, say Y.
>  
> +config TOOLCHAIN_HAS_ZBB
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on AS_IS_GNU
> +
> +config RISCV_ISA_ZBB
> +	bool "Zbb extension support for bit manipulation instructions"
> +	depends on TOOLCHAIN_HAS_ZBB
> +	depends on !XIP_KERNEL && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZBB
> +	   extension (basic bit manipulation) and enable its usage.
> +
> +	   The Zbb extension provides instructions to accelerate a number
> +	   of bit-specific operations (count bit population, sign extending,
> +	   bitrotation, etc).
> +
> +	   If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZICBOM
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 4180312d2a70..95e626b7281e 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -24,7 +24,8 @@
>  
>  #define	CPUFEATURE_SVPBMT 0
>  #define	CPUFEATURE_ZICBOM 1
> -#define	CPUFEATURE_NUMBER 2
> +#define	CPUFEATURE_ZBB 2
> +#define	CPUFEATURE_NUMBER 3
>  
>  #ifdef __ASSEMBLY__
>  
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 86328e3acb02..b727491fb100 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
>  	RISCV_ISA_EXT_SVINVAL,
> +	RISCV_ISA_EXT_ZBB,
>  	RISCV_ISA_EXT_ID_MAX
>  };
>  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index a96b1fea24fe..17dfc4ab4c80 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -6,6 +6,8 @@
>  #ifndef _ASM_RISCV_STRING_H
>  #define _ASM_RISCV_STRING_H
>  
> +#include <asm/alternative-macros.h>
> +#include <asm/errata_list.h>

Why are these includes getting added? Shouldn't they be getting directly
added to whatever is including asm/string.h instead?

>  #include <linux/types.h>
>  #include <linux/linkage.h>
>  
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 1b9a5a66e55a..c4d1aa166f8b 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -162,6 +162,7 @@ arch_initcall(riscv_cpuinfo_init);
>   *    extensions by an underscore.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),

Huh, this array still doesn't appear to be in order... Zbb should
be getting inserted between the Zi* extensions (which should be first)
and the S* extensions and each of those three categories should be
in alphabetical order.

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 205bbd6b1fce..bf3a791d7110 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -222,6 +222,7 @@ void __init riscv_fill_hwcap(void)
>  					set_bit(nr, this_isa);
>  				}
>  			} else {
> +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);

I think we wanted this one in alphabetical order...

> @@ -301,6 +302,20 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>  	return true;
>  }
>  
> +static bool __init_or_module cpufeature_probe_zbb(unsigned int stage)
> +{
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB))
> +		return false;
> +
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return false;
> +
> +	if (!riscv_isa_extension_available(NULL, ZBB))
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Probe presence of individual extensions.
>   *
> @@ -318,6 +333,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>  	if (cpufeature_probe_zicbom(stage))
>  		cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
>  
> +	if (cpufeature_probe_zbb(stage))
> +		cpu_req_feature |= BIT(CPUFEATURE_ZBB);
> +
>  	return cpu_req_feature;
>  }
>

I'm skipping the asm review for now since I'm still not clear on the plan
for non-optimized string functions vs. optimized vs. compiler builtins.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
