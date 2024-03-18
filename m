Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF96C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wPoLXvtAO8GqtYogZdFtZy2PAWQ3XRryi4SHb/GEWsI=; b=0f3iQTFXiaW+y5FwFAHXRmoJl2
	mh6clHAZxcGsekUgaICcmBBcSduesuzowLgiCB3tBxgpAbhAGYCtgbPhwTpUM4tXgxqS/VqMS2zqG
	jsvLtKYvGjiZdlB2Uv9c4CALr7wqBJhY/oYrBjKYYfStWiJ6lOMdOB/UypkJfnEFTf5vPFhCeW1Bb
	NmppSA/fuu1DdjXw3bR4Od1KY5gPEYfINjJYctOc8amcs11Gq3L5gaOjNu6NwtkFmMf4g3lp4KzSz
	bo4EWnLbj8pW9TZL8JJdMo39C9qcK5HZ5XLtrnW0vJR68RVw3mDiqShVkXiCMWk0Fbxfu0acQdRYL
	CcLjUBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmGXH-00000009Oax-42RR;
	Mon, 18 Mar 2024 17:12:31 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmGXE-00000009OZ3-0tPe
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 17:12:30 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B91B3F68A
	for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1710781939;
	bh=RHlFPdlhlD864SJZUhjfxgbABspep+IYfDLVWgg2pJg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=AaUbH/lUr5TuNuXGV8Kboiq3jnqe7sSPayG42+aXWW7fmgiRRqGlc9RfCNTcqEjXQ
	 oZylYg9uU2YVPFUxpVnFXEUUFbzZk6xKQuy1KX0hJ+ozmmXawvLhKmfnXeS4ZI8mgp
	 vhULNGuhz9+NJ1AuzvwjnGkMj5qYGQy5mhWYmD/vlCfxkQF+bqNdcP8X354uENoQWL
	 cA7Q3qSILZh0qvIQs+49XAZuZR2239kXwh7AZSUfSrUFDAA3nM8c0dgTrPKJwGNKGe
	 PDRfGwIoGtb7MyxW4MgoK6DsYBAr8h07Otgkrv/EekBUaNDp76VnZPIHDl4hN/Q9Q2
	 kYNqa8XSGGzbg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-430d0943db4so15353381cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 10:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710781938; x=1711386738;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHlFPdlhlD864SJZUhjfxgbABspep+IYfDLVWgg2pJg=;
        b=xHvcbdL1w57W6QPM1nZwZaLuU8Dj8DMCR6js72JnG2LTWKZEdh5+t0fjnckt1/DT5X
         B3y6F0CGtsIrM7MyucimwHUXTD86KvG4tTBasGkPIgnsS+Rh0U+YudRzG3fpIkvNZ3YE
         xnChGOD47yD4zom85GgbEsyjNUSS6UeM3A6LFMwAAUVV9+lurhRoVVbAj4PSty4KX0UI
         yd8Cxy4ewNYEzdgM+w7c++ShCmlj+OStBLzlESIEIQpncN8WBaCD2VQECvlF22s09Ken
         KgcghHZvu1MBCjhlHw9wj34c33DbGK4gxIafoyMVOCZOmddgwp4WthOKdMouWFMMPJpn
         1tIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVPAGuhySLghuB2RxNtgQOtu/hI9XHb0TEgNdTvVKl9Nd0yMKpQ6GOjXpYHPadpxFo0mNoT9SIaSkG1qp1cdj8Cefbx5bqCuLG7BLRpKUf
X-Gm-Message-State: AOJu0YwjpUtUpRQ/kVZMEYoR5Echp8PRnvfEayo9iSkcPbj4PWwg+huF
	RNbwcf2n1NfTXvmqO4K8iHqS3xgUIbhRIXtlPm9tdnjXM5MiIdueSNHVMCDICP5tb5gG0/40fH3
	2ZPWTvcwAsbEjklyQZeIu3S5iqwFgy0Ymro6D7/7RefQ3v8u6zWTxay+s0oKlg/LWkf3xDIsIpy
	qfwnXuWq6AfhloKTQYr5bDGspSCAWiVK/RQNFFPh4/tXI6NqiUrwpQv2Gd
X-Received: by 2002:a05:622a:49:b0:42e:f7cf:ff98 with SMTP id y9-20020a05622a004900b0042ef7cfff98mr13273224qtw.16.1710781938487;
        Mon, 18 Mar 2024 10:12:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIdRe+ShfPpkWIqNza89+B1bp5+Xj+Ait5mURceCooCGFBZ2x0UImLi2Iek0huAH9NY6RsAslH53iOtRgxPsw=
X-Received: by 2002:a05:622a:49:b0:42e:f7cf:ff98 with SMTP id
 y9-20020a05622a004900b0042ef7cfff98mr13273206qtw.16.1710781938216; Mon, 18
 Mar 2024 10:12:18 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Mar 2024 10:12:17 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240318-emphatic-rally-f177a4fe1bdc@spud>
References: <20240318-emphatic-rally-f177a4fe1bdc@spud>
Mime-Version: 1.0
Date: Mon, 18 Mar 2024 10:12:17 -0700
Message-ID: <CAJM55Z9vR0+KwQX6BQZak4NeAfLdiJuZJuZJMj8kfF9EHBCF5A@mail.gmail.com>
Subject: Re: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST condition
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_101228_659798_2A5353BF 
X-CRM114-Status: GOOD (  16.20  )
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

Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> ARCH_STARFIVE is not restricted to 64-bit platforms, so while Will's
> addition of a 64-bit only condition satisfied the build robots doing
> COMPILE_TEST builds, Palmer ran into the same problems with writeq()
> being undefined during regular rv32 builds.
>
> Promote the dependency on 64-bit to its own `depends on` so that the
> driver can never be included in 32-bit builds.
>
> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> Fixes: c2b24812f7bc ("perf: starfive: Add StarLink PMU support")
> Fixes: f0dbc6d0de38 ("perf: starfive: Only allow COMPILE_TEST for 64-bit architectures")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> CC: Will Deacon <will@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/perf/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 5060e1f1ea10..7526a9e714fa 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -87,7 +87,8 @@ config RISCV_PMU_SBI
>  	  filtering, counter configuration.
>
>  config STARFIVE_STARLINK_PMU
> -	depends on ARCH_STARFIVE || (COMPILE_TEST && 64BIT)
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	depends on 64BIT
>  	bool "StarFive StarLink PMU"
>  	help
>  	   Provide support for StarLink Performance Monitor Unit.
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
