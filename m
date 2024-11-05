Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E6DD1CA3A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e/mFDC4+MP+MRF8eXXzHwdK7XJHTkSZJvKLQrZYbws=; b=jGkxgfWH68KAa2
	iF+IMtU/ZiPrBW2LUF2R1y2/gXXOScdtHOOaiXfnEbl+FhP4l61h9Cy3XxFoRTQBZzf9GXeGuSPVl
	YjIrtJ0DCpaT2QjC7l9pjrQoFNK6bM3SpnqfjHX9e3xss6VSVRjMjqh7LV2ZpaVYl0Flu5H2k+47R
	mxUKPc5thl6hs28rlwobo9aHGmrIiH2CX8J0bVYMjEQmO2fK5MhOSvqqVjOJdoLBd8V4jKLCnW9eX
	wFLweTQ2B9NigZvrh2C3RpB/dDvEFVXk/5KiTzJW8JEuO36mcEbvkxOLVtSQ24fq/MGgsdak6RDUX
	jjO6NjHhxYhbQ7YWk/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DOu-0000000G6XH-1euy;
	Tue, 05 Nov 2024 06:50:52 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DOr-0000000G6Wq-3hPt
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 06:50:51 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-20c805a0753so47258045ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 22:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730789449; x=1731394249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNkZaCw/31YBcClBozl3MeNiHCGcM8jgBNaEsZtPWE8=;
        b=mk6iWli5bsoAPMvh4k8hqOLMAtal2Txoi953nh9SW+aAIuaOzQegRZjb+DmAYT0dVN
         r7KQl126QGCpDQrd3gkde1vpIUnz3ppL56tz1P8rAawof/QrnhvVSSaahLH2OOO6SuAQ
         cJDxoOlFpZ4cDVvrDiH4JJSIMy8VwTO2V3gmw5ZzW6X6W8VqRz2m0qS9jQpeMZKPbOg5
         YpXE3sBaZPs/mNxCe54BUtDOOB45E0SWuK10RyXXL9d/cyJ0ak4jjH0QwsEF/VV5GOlZ
         haWd2OpOy4wu7WxQy3hViQkD3laQlGIItCk/3+yAefRsbFcrc4ct9g05LLTISuHp0Z8w
         9WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730789449; x=1731394249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNkZaCw/31YBcClBozl3MeNiHCGcM8jgBNaEsZtPWE8=;
        b=EukmnuVVTdsI8CjGTPtE7Q7jPJnA+IGua3BEG/Q+8wC8iJM6eEg9lLl8sJKnEpRg+b
         WjVGGO9F+XWMopxL09twAyV+j5T0mIrXG2QL8Iy9+ln30Kjh8rxlICOj/ktJFVwfeV3G
         mmSY/gOeUbIVH4v2el28ErH0uLLlVxRrbPl307T3muYrTQkSx3Bsy7ybsARXW/zZooZ2
         edf+oLY1XZqjm3bAfPj0+syFHEmMTe+bpv1OElUoluY0SSy/ES7UYURjVT8NP/abkgZ9
         YmW7Gjc+Ujv+8mB52hG4AYKfuaGKHUmXc62h4jJRbsLrCbEHWWPtBvtyp8EmN724aaBH
         COxg==
X-Forwarded-Encrypted: i=1; AJvYcCXI+07UEERlutDi4hY8kmo8zNpekDnLt/JIIjAAyloLJUuAMoaD6NqYGlKdDH6hbPGd6d/OjNpxl8De1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCbWoc/F0S9FjgftovtHG1q4g/tQp441xrt4jseSZjINORQ4mD
	GqaHRcoKOcyNy7MR5Y0VP92BMJdi3BH42lMjyM6m8v/o3zZdtwlj
X-Google-Smtp-Source: AGHT+IGTBwrP1TkZSWIk2X4RRAt1w4GHZKgD+eXUX0HaC7TrWd54lpAGhJvId49iQUorzmnQX3zI5A==
X-Received: by 2002:a17:903:32c8:b0:20c:e2ff:4a50 with SMTP id d9443c01a7336-210c68786dfmr456157215ad.9.1730789448763;
        Mon, 04 Nov 2024 22:50:48 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c51e8sm71623745ad.210.2024.11.04.22.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 22:50:48 -0800 (PST)
Message-ID: <84d07d21-54bc-45eb-b231-8f800a2afed3@gmail.com>
Date: Tue, 5 Nov 2024 14:50:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-3-TroyMitchell988@gmail.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241028053220.346283-3-TroyMitchell988@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_225049_963617_38F18A0B 
X-CRM114-Status: GOOD (  22.98  )
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

On 2024/10/28 13:32, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig  |  18 +
>  drivers/i2c/busses/Makefile |   1 +
>  drivers/i2c/busses/i2c-k1.c | 658 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 677 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-k1.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6b3ba7e5723a..38ebfd38dc41 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -779,6 +779,24 @@ config I2C_JZ4780
>  
>  	 If you don't know what to do here, say N.
>  
> +config I2C_K1
> +	tristate "Spacemit K1 I2C adapter"
> +	depends on HAS_IOMEM
I think I should retain the depends on from v1, like this:
depends on ARCH_SPACEMIT || COMPILE_TEST

Krzysztof mentioned that there is no such thing as ARCH_SPACEMIT, that's because
this patch depends on the basic DT from dlan:
https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org/
> +	help
> +	  This option enables support for the I2C interface on the Spacemit K1
> +	  platform.
> +
> +	  If you enable this configuration, the kernel will include support for
> +	  the I2C adapter specific to the Spacemit K1 platform. This driver ca
> +	  be used to manage I2C bus transactions, which are necessary for
> +	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
> +	  devices.
> +
> +	  This driver can also be compiled as a module. If you choose to build
> +	  it as a module, the resulting kernel module will be named `i2c-k1`.
> +	  Loading this module will enable the I2C functionality for the K1
> +	  platform dynamically, without requiring a rebuild of the kernel.
> +
>  config I2C_KEBA
>  	tristate "KEBA I2C controller support"
>  	depends on HAS_IOMEM

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
