Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853FEC5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5yiIxMCMVTYJXv5uc67bO6PEYhcZBJhOGpMnJ2bPYY=; b=M+OHPLHMM+X9Fo
	68Tx/RYZot9KcLOuSB6BUfq+UgxZEqmgClBC6pqE2cUXzAaMMZt2jxcJr1MPrklLrR3bkHnhaWTwv
	UyTvAFVvmawTPBr/GrO6P21Cw9x1iRPpyb6deynQMsDQZTQgvmnLvSvnXYc6IGUN5LhCGR511h6GM
	o3re5xsoTUw5Vr5r0tGkasUty3otySeA0LfIhalVxqKE7s3o4XXjmHL/lh20o21hGqkCYQ+n1u8tI
	3yfZUQDp/hr/q/aH1fHQEh9ONJtGtVdnOthNb6MJpooagTMOlLn7bReh1Q2GUYpXmJnrttQa38FIr
	vupSNxLkPZ84/KBMsAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJuc-00000009S9Y-0uXM;
	Wed, 28 Feb 2024 13:23:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJuZ-00000009S8v-1Kic
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 13:23:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33d146737e6so4133724f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 05:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709126629; x=1709731429; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4AJ/fArH74SzdFgIIdNAKmcF3qjIEBPPZEADsp2Buk=;
        b=h+HhZvSZuMi5T5krStgyUiUrWXdDUHEhmAkCiw0Iks+8PP2kSCU4oZ8DMTqScEzovJ
         MV85RAyVShNH22SMwWXO0Nwqs/rK7RsQIj8VrxEvWXXfvlEifoOrW++rSfudWp9z0NJ2
         1S8EsjFEimU+ixpOjrSrtkB8lS2s8FyUYtCB+DFx2g24C1jJayM9ol3NgOEh2bDG1Kzl
         XIkHN2xZRKlj1hKEBpxWRJPSvjbvxKQJa8EFAKbdqjdKNGxMzlARMyJyT4J0v9owiR6j
         CYZgZTUNMXQKxgkhDbZQnn9p0crgGeRJcJ9h133xYMuQHy0zwEfXZDJdWdb/ouyAm7xZ
         UWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126629; x=1709731429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4AJ/fArH74SzdFgIIdNAKmcF3qjIEBPPZEADsp2Buk=;
        b=ubdZSHbnejUpjSRXYqqbSgl8jlNYjDnmB7hm8aXf0okHpmqiisEmGY1Nme3SARyboK
         UrPoMSeQSkrtrgJoCvli/8+9vWzdDdbk8613sp1gEvoERS14L+RG5mAS2sAypfvBdFJw
         Pwdh2rMsQpBnHj5BMCqWPAhjEstezA2xx6yVGem7y4isaKdtPGud4bMYkuYLY82Krx60
         RTeY0PVoHdE5bpxGmWpFk5YkuowJf8N0Q4ckms3/D45oKcExOCjzPNAZ/X3h7PUhRFR5
         lodpSHElz0/AiEWuPluYW77KqrFmF1/27NyNz+jFDEf1EjAh5KKhmecxgfVQB9oY2mfz
         RvAA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Evtm8ejCJppZzb+5eQdK8HZdsq5l7RRkQTb3QAMe911SwTa2UhhwJ0fPdXIn79v3ekfFuGdLls7ExMRFVnDod3jCOdpFeSxGIpb3IlEg
X-Gm-Message-State: AOJu0YzhKgu7KX5z4cMinhAZvw8AX+hwBMijb9fpLjZ8kT8hZMjzscoF
	6xF7fZg0+dGnOsSg9ARN+IJvgE29FXa4K1J5urA9qfD6KOGoaX6Xpr428e8TbIk=
X-Google-Smtp-Source: AGHT+IFBd1kKeTUg2s8YVizQ+9mRMh8SA/NeRYEZS37yHKGxfoOm8vE5+PviOWlb4gymksIThVwa2A==
X-Received: by 2002:a5d:6789:0:b0:33d:e908:3671 with SMTP id v9-20020a5d6789000000b0033de9083671mr3386900wru.4.1709126629485;
        Wed, 28 Feb 2024 05:23:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q16-20020adffed0000000b0033ce06c303csm14568306wrs.40.2024.02.28.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 05:23:49 -0800 (PST)
Date: Wed, 28 Feb 2024 14:23:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v4 2/3] riscv: Add a custom ISA extension for the
 [ms]envcfg CSR
Message-ID: <20240228-ca2521f494659596f079b843@orel>
References: <20240228065559.3434837-1-samuel.holland@sifive.com>
 <20240228065559.3434837-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240228065559.3434837-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_052351_385019_86B92063 
X-CRM114-Status: GOOD (  33.53  )
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

On Tue, Feb 27, 2024 at 10:55:34PM -0800, Samuel Holland wrote:
> The [ms]envcfg CSR was added in version 1.12 of the RISC-V privileged
> ISA (aka S[ms]1p12). However, bits in this CSR are defined by several
> other extensions which may be implemented separately from any particular
> version of the privileged ISA (for example, some unrelated errata may
> prevent an implementation from claiming conformance with Ss1p12). As a
> result, Linux cannot simply use the privileged ISA version to determine
> if the CSR is present. It must also check if any of these other
> extensions are implemented. It also cannot probe the existence of the
> CSR at runtime, because Linux does not require Sstrict, so (in the
> absence of additional information) it cannot know if a CSR at that
> address is [ms]envcfg or part of some non-conforming vendor extension.
> 
> Since there are several standard extensions that imply the existence of
> the [ms]envcfg CSR, it becomes unwieldy to check for all of them
> wherever the CSR is accessed. Instead, define a custom Xlinuxenvcfg ISA
> extension bit that is implied by the other extensions and denotes that
> the CSR exists as defined in the privileged ISA, containing at least one
> of the fields common between menvcfg and senvcfg.
> 
> This extension does not need to be parsed from the devicetree or ISA
> string because it can only be implemented as a subset of some other
> standard extension.
> 
> Cc: <stable@vger.kernel.org> # v6.7+
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v4:
>  - New patch for v4
> 
>  arch/riscv/include/asm/hwcap.h |  2 ++
>  arch/riscv/kernel/cpufeature.c | 14 ++++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5340f818746b..1f2d2599c655 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,8 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  
> +#define RISCV_ISA_EXT_XLINUXENVCFG	127

Since 128 is just the current max and will need to be bumped someday,
xlinuxenvcfg will end up in the middle of the list at some point anyway
(since bumping it too would be unnecessary churn). With that in mind,
I'd probably have just assigned it 74, but either way is fine by me.

> +
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c5b13f7dd482..dacffef68ce2 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -201,6 +201,16 @@ static const unsigned int riscv_zvbb_exts[] = {
>  	RISCV_ISA_EXT_ZVKB
>  };
>  
> +/*
> + * While the [ms]envcfg CSRs were not defined until version 1.12 of the RISC-V
> + * privileged ISA, the existence of the CSRs is implied by any extension which
> + * specifies [ms]envcfg bit(s). Hence, we define a custom ISA extension for the
> + * existence of the CSR, and treat it as a subset of those other extensions.
> + */
> +static const unsigned int riscv_xlinuxenvcfg_exts[] = {
> +	RISCV_ISA_EXT_XLINUXENVCFG
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defined in
>   * chapter 27 of the unprivileged specification.
> @@ -250,8 +260,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>  	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> -	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> -	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> +	__RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts),
> +	__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> -- 
> 2.43.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
