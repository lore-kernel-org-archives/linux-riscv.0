Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEF9C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRb6nDfgIWogyP36UT81mMnSxtPFsUtkTmCSHlYWQN4=; b=iIrg+wGDvd4Wuq
	PUQ0ylq37P5Pc3z+y8SrA7ys8ZK7RO8DADjjFOPgyOn2oI+9GRDF96kM7J5bgP4OdpvygjJesAYsS
	91LHNXgMjWqehwu8hS53ptqm9hrKZGppJ632n0Km9h4TUE2bz3PUXFwhZ+Gj/8k5U+CkQjQiYU3yR
	WwqNb807igxLnCtLI9bF1soch08fJBbpIDXiU8lGox+UCGB2+++jok+UAhpI4psGoemjT5eQRFlbB
	p/JSAlksqrn2GKRBs2onf8xPP4tsfqi+DH2TPV0FSgy4qj1X3yPw0L4HAlBoXpAnhUjy2D1ruSAmc
	vy4V0fOFQuHh9r5mKPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuU2-00000009iB0-2WY0;
	Tue, 13 Feb 2024 15:14:06 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuTz-00000009iAa-3LEB
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 15:14:05 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5620b10727bso607142a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707837242; x=1708442042; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CoiiSvGy6jiUuFwJBqdSxNcNmdgRyL2T6XJRnFEUz24=;
        b=dnDO9NiwQ6lep5+DrcfEH1BO1ZCCZgX7hfNQzgu5KRdNBsOKuDmHpFbQxZm8qieMAY
         eX8MLncUYyCcIPugoEXw2816m6V5CuoiMQtvrUbRE97Xdfjdwd/e3xWg3Sne0hWX/+j1
         YhYtwae3cvb3B90iT6zqkWboCDvhKixJXeEreRAlQvt5RGqtELHv9WN4GqRv75XRvCAL
         3hr4CJgfGleKrES2TAbUF4jKnYlbZtMfpPTUEAMWp5p7acs0ybW89AgIZ3+d8WYUVWg7
         ljOV2nOJ4j5kY1jMIaO5o7CSwkSm4ZoGWnj1H3JZvWdmJr7+KMtb8SI39LPG9OTPlQoT
         jMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707837242; x=1708442042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoiiSvGy6jiUuFwJBqdSxNcNmdgRyL2T6XJRnFEUz24=;
        b=KtvfBQK4cp81e8REMPfYOnE8ugYE+J2Q/txI6cBdR1LkfY2qe5KMSd5slt1tCveKoJ
         gwo9tBYv+iV41sQ2UAQdJH/aW1g+lBIOU5uYJunk/sl7Bje5ndr7voohnrzOWV1TXmfk
         kbW0biiW9gRa2MNxEjtSTpYVWVKKEOrjCadVHwoR4QksAuRgzPX3/Vo3eR8lyqI4xG2x
         56B4oPwpGvP/VxC1njMR2L/ytiqXDuZpnpO67JddqkNsnPv9uZi58cmbWW8N2sQfZ5a5
         s7ktcXZYQ/4Itf/j6LNX+6SMS+MdXzgVPgnACkRcCtNi3Js3/Vm7mE7p2p1M+xpCYjb4
         A5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWhLoJ7V1Ez7Ej2rvbOEl6LhMD6EPb4XCwCfJzf3tPzzxaEwc2KleSESfMaDm08D6a5Yq6B5Y3PoxQ7FpLIinoZ6L5uxHNhIlkb/4fCVQUa
X-Gm-Message-State: AOJu0YwKob/BkZvREP8vvyBORhFXaJbbPZGet+ITkL5CC/ahNocp/RXp
	/JUMsef2gOTOtz+wDkmwUPvkxc8NdR5oxAOJp7Bfhh0ocRhNaeyUAN/bKIuAt2k8NH0/RBnfrss
	+
X-Google-Smtp-Source: AGHT+IGW25hoSoA/NwkywR6wd9Iqom6ZAIk18TYnjehStbOy+ZYgOtYJpske3imE79UA7AiGldPh4A==
X-Received: by 2002:a17:906:6899:b0:a39:34bc:493b with SMTP id n25-20020a170906689900b00a3934bc493bmr6525164ejr.45.1707837242260;
        Tue, 13 Feb 2024 07:14:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyck7LH1u3HfVqtIyPpKV2jWP2kKE+mXMMqnX1lTQZUoYt0ccP5waKUiF7kKoX6Lmhk+MOBj54Rb6NqX+QQ6AwY2Y5bajPm6NPO7QxZhqGoLcmZ2WGE6iN+ruKuyrH9RWnTPBuQqzg1wW/EMs+4cZU9nJVCNH3xU/OzVGVMJrTariiIU/btx7S9kFDo1itb/CfVsuVs2acayX3
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709063da900b00a3bfe3de44csm1369437ejh.133.2024.02.13.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 07:14:01 -0800 (PST)
Date: Tue, 13 Feb 2024 16:14:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v2 3/4] riscv: Add ISA extension parsing for Sm
 and Ss
Message-ID: <20240213-1835b458d8cad71a76fa7322@orel>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213033744.4069020-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_071403_868674_72802997 
X-CRM114-Status: GOOD (  30.47  )
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

On Mon, Feb 12, 2024 at 07:37:34PM -0800, Samuel Holland wrote:
> Previously, all extension version numbers were ignored. However, the
> version number is important for these two extensions. The simplest way
> to implement this is to use a separate bitmap bit for each supported
> version, with each successive version implying all of the previous ones.
> This allows alternatives and riscv_has_extension_[un]likely() to work
> naturally.
> 
> To avoid duplicate extensions in /proc/cpuinfo, the new successor_id
> field allows hiding all but the newest implemented version of an
> extension.
> 
> Cc: <stable@vger.kernel.org> # v6.7+
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v2:
>  - New patch for v2
> 
>  arch/riscv/include/asm/cpufeature.h |  1 +
>  arch/riscv/include/asm/hwcap.h      |  8 ++++++
>  arch/riscv/kernel/cpu.c             |  5 ++++
>  arch/riscv/kernel/cpufeature.c      | 42 +++++++++++++++++++++++++----
>  4 files changed, 51 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 0bd11862b760..ac71384e7bc4 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -61,6 +61,7 @@ struct riscv_isa_ext_data {
>  	const char *property;
>  	const unsigned int *subset_ext_ids;
>  	const unsigned int subset_ext_size;
> +	const unsigned int successor_id;
>  };
>  
>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5340f818746b..5b51aa1db15b 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -80,13 +80,21 @@
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
> +#define RISCV_ISA_EXT_SM1p11		74
> +#define RISCV_ISA_EXT_SM1p12		75
> +#define RISCV_ISA_EXT_SS1p11		76
> +#define RISCV_ISA_EXT_SS1p12		77
>  
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
>  
>  #ifdef CONFIG_RISCV_M_MODE
> +#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SM1p11
> +#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SM1p12
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
>  #else
> +#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SS1p11
> +#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SS1p12
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
>  #endif
>  
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index d11d6320fb0d..2e6b90ed0d51 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -215,6 +215,11 @@ static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
>  		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
>  			continue;
>  
> +		/* Only show the newest implemented version of an extension */
> +		if (riscv_isa_ext[i].successor_id != RISCV_ISA_EXT_INVALID &&
> +		    __riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].successor_id))
> +			continue;

I'm not sure we need this. Expanding Ss1p12 to 'Ss1p11 Ss1p12' and then
outputting both in the ISA string doesn't seem harmful to me. Also, using
a successor field instead of supersedes field may make this logic easy,
but it'll require updating old code (changing RISCV_ISA_EXT_INVALID to the
new version extension ID) when new versions are added. A supersedes field
wouldn't require old code updates and would match the profiles spec which
have explicit 'Ss1p12 supersedes Ss1p11.' type sentences.

> +
>  		/* Only multi-letter extensions are split by underscores */
>  		if (strnlen(riscv_isa_ext[i].name, 2) != 1)
>  			seq_puts(f, "_");
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c5b13f7dd482..8e10b50120e9 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -113,23 +113,29 @@ static bool riscv_isa_extension_check(int id)
>  	return true;
>  }
>  
> -#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) {	\
> +#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _successor) {	\
>  	.name = #_name,								\
>  	.property = #_name,							\
>  	.id = _id,								\
>  	.subset_ext_ids = _subset_exts,						\
> -	.subset_ext_size = _subset_exts_size					\
> +	.subset_ext_size = _subset_exts_size,					\
> +	.successor_id = _successor,						\
>  }
>  
> -#define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id, NULL, 0)
> +#define __RISCV_ISA_EXT_DATA(_name, _id) \
> +	_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, RISCV_ISA_EXT_INVALID)
>  
>  /* Used to declare pure "lasso" extension (Zk for instance) */
>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
> -	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, ARRAY_SIZE(_bundled_exts))
> +	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, \
> +			    _bundled_exts, ARRAY_SIZE(_bundled_exts), RISCV_ISA_EXT_INVALID)
>  
>  /* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
>  #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
> -	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts))
> +	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), RISCV_ISA_EXT_INVALID)
> +
> +#define __RISCV_ISA_EXT_VERSION(_name, _id, _preds, _preds_size, _successor) \
> +	_RISCV_ISA_EXT_DATA(_name, _id, _preds, _preds_size, _successor)
>  
>  static const unsigned int riscv_zk_bundled_exts[] = {
>  	RISCV_ISA_EXT_ZBKB,
> @@ -201,6 +207,16 @@ static const unsigned int riscv_zvbb_exts[] = {
>  	RISCV_ISA_EXT_ZVKB
>  };
>  
> +static const unsigned int riscv_sm_ext_versions[] = {
> +	RISCV_ISA_EXT_SM1p11,
> +	RISCV_ISA_EXT_SM1p12,
> +};
> +
> +static const unsigned int riscv_ss_ext_versions[] = {
> +	RISCV_ISA_EXT_SS1p11,
> +	RISCV_ISA_EXT_SS1p12,
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defined in
>   * chapter 27 of the unprivileged specification.
> @@ -299,8 +315,16 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
>  	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
>  	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
> +	__RISCV_ISA_EXT_VERSION(sm1p11, RISCV_ISA_EXT_SM1p11, riscv_sm_ext_versions, 0,
> +				RISCV_ISA_EXT_SM1p12),
> +	__RISCV_ISA_EXT_VERSION(sm1p12, RISCV_ISA_EXT_SM1p12, riscv_sm_ext_versions, 1,
> +				RISCV_ISA_EXT_INVALID),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> +	__RISCV_ISA_EXT_VERSION(ss1p11, RISCV_ISA_EXT_SS1p11, riscv_ss_ext_versions, 0,
> +				RISCV_ISA_EXT_SS1p12),
> +	__RISCV_ISA_EXT_VERSION(ss1p12, RISCV_ISA_EXT_SS1p12, riscv_ss_ext_versions, 1,
> +				RISCV_ISA_EXT_INVALID),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> @@ -414,6 +438,14 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
>  				;
>  
>  			++ext_end;
> +
> +			/*
> +			 * As a special case for the Sm and Ss extensions, where the version
> +			 * number is important, include it in the extension name.
> +			 */
> +			if (ext_end - ext == 2 && tolower(ext[0]) == 's' &&
> +			    (tolower(ext[1]) == 'm' || tolower(ext[1]) == 's'))
> +				ext_end = isa;
>  			break;
>  		default:
>  			/*
> -- 
> 2.43.0
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
