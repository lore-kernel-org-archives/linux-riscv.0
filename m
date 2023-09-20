Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE180CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrN/YLrh+t8tCnmnr6HLWF2hNln/Qo792O60dc9zeGs=; b=l9mgw6RlzPyznv
	b/nz9asv0dOE7aG1V0KUA3iwAGC0jpMrZr8vMk+ijTFaB4jAXCvP4b+vvXBe23G2uZDxOV6Cy9K19
	JTergjRWyeQtzkdkY2ng4GqCtMfKFwS8SxzoYI7CJelbLabBHeeh1scBXxfysFSYc1OQsCazwbaNi
	ORfiBnc8Cw3ehLDx9p9DmNJEBWCKXx0AoWKOdcxVXzRr/n659nKXDpq+Z8kuchXTVleU+njU3pP7L
	oo7eaS+nRXuRBfEfALL3ma2KpAr5HkwhVCcc41QKIeLtosBS2da2is6DBuro589SIMHS7BKDjuzKk
	1r6oX+SwEIy3wdXqSjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirt0-002AUt-1Q;
	Wed, 20 Sep 2023 07:44:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirsx-002ASl-0x
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:44:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32008b5e2d2so380299f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695195871; x=1695800671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx5iccFvgcy7SfhkU5VK+FkZItyjUgRW2eoOl85UWN0=;
        b=laXIHwHGsa+FGp02a5NYpd0yR7jxtyGUCjlUwr0jBO7OnQWNCK4XYdPbl72XYtENtp
         UsvLqM0aBzzuL//tftzhWtrOW4Wfy2tbseNs27837JfrqeBbFh/pQSjDy6iurwjEHt5k
         +82JaRLkqcZYd2BAXsuq1cJ+dmQ2N5EhYE7ZFujS/OI//cOCNBLSuyRUsw4uHKGdHIfZ
         pjFkgcgl0WfSSs5v3oSho75lkW5/E4Et6xvHQvWzB7SQ5jmYj4zL71DmCcnvHrs1mnLV
         ERluIwoD9Haa+yck1kvGtgZL8yOPjuEXDjBwLM7oa6TlcXWpdqsv2iEGi6k+h3+EEQkl
         1t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695195871; x=1695800671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx5iccFvgcy7SfhkU5VK+FkZItyjUgRW2eoOl85UWN0=;
        b=R/Ba2EkKZUl6nZYJLAzRL1VS3b56YbaFSD4qlOJu4n/zx4KkC5f8XaqYZuPMeF88Z+
         PPOMFWBobMvUmWkBQDoh+lyE0VuTtkc1qLAQsVjnZPJ/flRYQlnOjgIYLmKrP6oYneV5
         pez7H5udN+PVyE+S2pCBjlrJU/i0QHSN6QD9ys0+zVb5cfRsC8R5LidF3wb5cAdnjA5K
         wqBCR6n+Z4scGZFTbi54A4yoE6bvTMTrg3TC8VCnYNKQrJWq/qerROQtXwv/cheA0SOE
         jlFaW55yidqu+oVBHuGhqKEoWZQamH/fiihiiG0k2bmkQzq4xNspnudNULa1oBlddHoB
         DYoQ==
X-Gm-Message-State: AOJu0YypV0JuCXaXQMv4c1AwJ0jPJbOIf9EtU4Zlbyb/oqvGb/BGgog6
	PmbpL4+MSU425e40JX3WmiDhzw==
X-Google-Smtp-Source: AGHT+IE9o5cHV0urm0ODENi3O9Ijn9lkPrkLZDxOpwqO/HAz0TCM7U3u4Zev5n0hHdafHw71Ec1kOw==
X-Received: by 2002:a5d:4286:0:b0:31f:e5cb:88e3 with SMTP id k6-20020a5d4286000000b0031fe5cb88e3mr3453401wrq.21.1695195871548;
        Wed, 20 Sep 2023 00:44:31 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d4d91000000b0031c855d52efsm17509312wru.87.2023.09.20.00.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:44:31 -0700 (PDT)
Date: Wed, 20 Sep 2023 09:44:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/7] RISC-V: Detect Zicond from ISA string
Message-ID: <20230920-36a5645f766ed9cce75a9e8c@orel>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919035343.1399389-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_004435_332834_B847372F 
X-CRM114-Status: GOOD (  17.95  )
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

On Tue, Sep 19, 2023 at 09:23:38AM +0530, Anup Patel wrote:
> The RISC-V integer conditional (Zicond) operation extension defines
> standard conditional arithmetic and conditional-select/move operations
> which are inspired from the XVentanaCondOps extension. In fact, QEMU
> RISC-V also has support for emulating Zicond extension.
> 
> Let us detect Zicond extension from ISA string available through
> DT or ACPI.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  arch/riscv/include/asm/hwcap.h                          | 1 +
>  arch/riscv/kernel/cpufeature.c                          | 1 +
>  3 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cad8ef68eca7..7ea90e2dbc5b 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -225,6 +225,12 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
>  
> +        - const: zicond
> +          description:
> +            The standard Zicond extension for conditional arithmetic and
> +            conditional-select/move operations as ratified in commit 8fb6694
> +            ("Update Gemfile") of riscv-zicond.

As of yesterday, v1.0 of the spec points at commit 95cf1f9 ("Add changes
requested by Ved during signoff")

> +
>          - const: zicsr
>            description: |
>              The standard Zicsr extension for control and status register
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b7efe9e2fa89..15bafc02ffd4 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -60,6 +60,7 @@
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
>  #define RISCV_ISA_EXT_XVENTANACONDOPS	44
> +#define RISCV_ISA_EXT_ZICOND		45
>  
>  #define RISCV_ISA_EXT_MAX		64
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3a31d34fe709..49b6551f3347 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -174,6 +174,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> +	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),

Zi extensions come before Zb extensions.

>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
