Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD1AC77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPts/GraqS4UPByVK8+EuvxQrcCKng+N0RfSiDvrl5w=; b=GIiNgWeSoJA3/8
	Z4fe6IwtGu4aQXayO4aa2ahmZqzOvJmBN6uS5PSYMTlZeZr7gPE1pXgnvosZxgjCZgV4s0vch/oDC
	+4APCUMTviESU0A1cQ+W2zzd1Tr2YR/gRtuT1scAR3enH+OLiiZzM0iihASDAz29W+LXMPprmGILt
	a8G+66cQSxkXBCJ6hQf9rIK67PPKq+akqbEOyXpcoi9Cpxr+1jSkN8XkEaHcU14SE7nNHQQSoKQbu
	n1Ga0RzjvEP2tWHbasDnV89+sg7+LkppFwlsuNy9YjxR3+n1FMuSiXuMEcubXKEY868smNAtTEYbe
	asHiJHj3kv1sCGwzCs6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pshXn-00CWgM-1v;
	Sat, 29 Apr 2023 10:11:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pshXi-00CWfH-2c
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 10:11:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f1e2555b5aso3573735e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682763057; x=1685355057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xOoH+u4sWuKfNhD+pplTW3/yRTQkkBi07WX1BaYaefA=;
        b=I9apvM5irx4dIyh27muv1VNP0nCVp2lMMmlZijTBu18GfVN3N/BX1rNrzb9GSRzGgb
         ZKmuhtvVT+5jcJhlBAUZ4sRqftAvgXGWaRvNutYvqaeYxnTxPu338zyvbSUJRVFjEfuY
         vo8TkQ2eey8+aTV0Qw+Qe3mr2NRZHZGYpBGpNaRbPpVPm9f/8zuvJq1OhGVkpZ8LMlqr
         zhrgHD9mWzusdMw/TjDAqEPHZMJdNupfzMD0mtvmtaT0ZCxuEb6HaaGR+3IR5xSFE2KE
         gw9MbLbU5hcWzPjUOmvwl7IsQv0x/IzL5hGOPYoIgMkVWxc+KZojvo3xRPrnkexlNG8D
         hGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682763057; x=1685355057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOoH+u4sWuKfNhD+pplTW3/yRTQkkBi07WX1BaYaefA=;
        b=cNAcuDEnKKAPoTqDbFX1Vt1aJ+4LCqppaTkj6UHCQkfidEtNSM2s2X7RqDAC+q6h1H
         P8uJ5ZugzwlClQAgsSaC4muYhZFRjdEVHkYQrr3aLVHx7WDpFBH1YicA/2CfeiX0+XYz
         I1blScjeK1IvP6i790IvloL1pB5JualNqIkRwZvXccLHqtE/Al/YwCNYHhZVcRUT3aEP
         zrbYjmTtBmHTzP2BmemVZTriffVieyphvl3iCLjCbgq3K3smjjZ6T2hvwxGIl/OgDo6l
         zt1JdTw/ULOryjqm86Lv16tBhjpVflCFCMf5/Acv+xN6QTKWxJ5roVE0rGTjBGdVSWOf
         ushg==
X-Gm-Message-State: AC+VfDwvTdrU6bUMCJHC+3K3ztymtwWFEXmxvcFpQnU1Rp7wDvgYCF3g
	UDSWErSjQzqoQdmZcjG8QeyaTw==
X-Google-Smtp-Source: ACHHUZ57q1rR25Sq064Wnj4QKZbd7qnq+78FeEgQ8yPFE/Yl0dGyzJruj4yhR0U4Do2kNzDAwn+Kbg==
X-Received: by 2002:a7b:c391:0:b0:3f1:9391:46c with SMTP id s17-20020a7bc391000000b003f19391046cmr6047537wmj.30.1682763057046;
        Sat, 29 Apr 2023 03:10:57 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bc8d9000000b003f0b1b8cd9bsm26856002wml.4.2023.04.29.03.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 03:10:56 -0700 (PDT)
Date: Sat, 29 Apr 2023 12:10:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, Hongren Zheng <i@zenithal.me>
Subject: Re: [PATCH v2 1/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <yz4emsezvf47vpyrevelope5d5jcul2dsibza3jb6yeqr3r6jg@rmrt5wv2mnbn>
References: <20230428141601.678489-1-cyy@cyyself.name>
 <tencent_BC90DDC6093E3E41246D3EC73F5CAB189007@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_BC90DDC6093E3E41246D3EC73F5CAB189007@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_031102_854131_1AFE98F6 
X-CRM114-Status: GOOD (  25.28  )
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

On Fri, Apr 28, 2023 at 10:16:00PM +0800, Yangyu Chen wrote:
> According to RISC-V Hart Capabilities Table (RHCT) description in UEFI
> Forum ECR, the format of the ISA string is defined in the RISC-V
> unprivileged specification which is case-insensitive. However, the
> current ISA string parser in the kernel does not support ISA strings
> with uppercase letters.
> 
> This patch modifies the ISA string parser in the kernel to support
> case-insensitive ISA string parsing.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/kernel/cpu.c        |  3 ++-
>  arch/riscv/kernel/cpufeature.c | 25 ++++++++++++-------------
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 8400f0cc9704..52b92a267121 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/cpu.h>
> +#include <linux/ctype.h>
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
> @@ -41,7 +42,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
>  		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
>  		return -ENODEV;
>  	}
> -	if (isa[0] != 'r' || isa[1] != 'v') {
> +	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
>  		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
>  		return -ENODEV;
>  	}
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 59d58ee0f68d..d1991c12e546 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -119,13 +119,10 @@ void __init riscv_fill_hwcap(void)
>  		}
>  
>  		temp = isa;
> -#if IS_ENABLED(CONFIG_32BIT)
> -		if (!strncmp(isa, "rv32", 4))
> +		if (IS_ENABLED(CONFIG_32BIT) && !strncasecmp(isa, "rv32", 4))
>  			isa += 4;
> -#elif IS_ENABLED(CONFIG_64BIT)
> -		if (!strncmp(isa, "rv64", 4))
> +		else if (IS_ENABLED(CONFIG_64BIT) && !strncasecmp(isa, "rv64", 4))
>  			isa += 4;
> -#endif
>  		/* The riscv,isa DT property must start with rv64 or rv32 */
>  		if (temp == isa)
>  			continue;
> @@ -136,6 +133,7 @@ void __init riscv_fill_hwcap(void)
>  			bool ext_long = false, ext_err = false;
>  
>  			switch (*ext) {
> +			case 'S':
>  			case 's':
>  				/**
>  				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
> @@ -143,19 +141,20 @@ void __init riscv_fill_hwcap(void)
>  				 * not valid ISA extensions. It works until multi-letter
>  				 * extension starting with "Su" appears.
>  				 */
> -				if (ext[-1] != '_' && ext[1] == 'u') {
> +				if (ext[-1] != '_' && tolower(ext[1]) == 'u') {
>  					++isa;
>  					ext_err = true;
>  					break;
>  				}
>  				fallthrough;
> +			case 'X':
>  			case 'x':
> +			case 'Z':
>  			case 'z':
>  				ext_long = true;
>  				/* Multi-letter extension must be delimited */
>  				for (; *isa && *isa != '_'; ++isa)
> -					if (unlikely(!islower(*isa)
> -						     && !isdigit(*isa)))
> +					if (unlikely(!isalnum(*isa)))
>  						ext_err = true;
>  				/* Parse backwards */
>  				ext_end = isa;
> @@ -166,7 +165,7 @@ void __init riscv_fill_hwcap(void)
>  				/* Skip the minor version */
>  				while (isdigit(*--ext_end))
>  					;
> -				if (ext_end[0] != 'p'
> +				if (tolower(ext_end[0]) != 'p'
>  				    || !isdigit(ext_end[-1])) {
>  					/* Advance it to offset the pre-decrement */
>  					++ext_end;
> @@ -178,7 +177,7 @@ void __init riscv_fill_hwcap(void)
>  				++ext_end;
>  				break;
>  			default:
> -				if (unlikely(!islower(*ext))) {
> +				if (unlikely(!isalpha(*ext))) {
>  					ext_err = true;
>  					break;
>  				}
> @@ -188,7 +187,7 @@ void __init riscv_fill_hwcap(void)
>  				/* Skip the minor version */
>  				while (isdigit(*++isa))
>  					;
> -				if (*isa != 'p')
> +				if (tolower(*isa) != 'p')
>  					break;
>  				if (!isdigit(*++isa)) {
>  					--isa;
> @@ -205,7 +204,7 @@ void __init riscv_fill_hwcap(void)
>  #define SET_ISA_EXT_MAP(name, bit)						\
>  			do {							\
>  				if ((ext_end - ext == sizeof(name) - 1) &&	\
> -				     !memcmp(ext, name, sizeof(name) - 1) &&	\
> +				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
>  				     riscv_isa_extension_check(bit))		\
>  					set_bit(bit, this_isa);			\
>  			} while (false)						\
> @@ -213,7 +212,7 @@ void __init riscv_fill_hwcap(void)
>  			if (unlikely(ext_err))
>  				continue;
>  			if (!ext_long) {
> -				int nr = *ext - 'a';
> +				int nr = tolower(*ext) - 'a';
>  
>  				if (riscv_isa_extension_check(nr)) {
>  					this_hwcap |= isa2hwcap[nr];
> -- 
> 2.40.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
