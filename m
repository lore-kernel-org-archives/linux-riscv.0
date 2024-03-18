Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081FCC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5zi4gO8U1kK3yYXvek8WeG1s98lzkLkGva1p7lwjS9s=; b=oXT7KhlkvvQiraf1QuYeJO8bpZ
	ZS21cw2KNVsWFEjw/o9C1kRkWKMez25t+cFiJjr/6gXRks6gW3CVOie675Y45N/C88NlA0Kq9+AZZ
	S2HXv9bESz6a6xICtjRTi/U/u7IQZC5Q81eVj779qPRDUcOzzHUl988BCIphaP2FP1eRIRvFfVImi
	ywz+N2Y9XhRQ66juno4DgSJ1Y6BIa5xhwVFtVQRbGjlK1QnV4eAD3FQdrt+G/3RNNRH8kzJn0egIo
	AKxIluBBUPI5SN9v692kOeOT5Vl5kjDPZY+i2a/eFXR6QVqD7B5903d4vs7Nr66Sv+U0YFUo6Yjz2
	Xp+u6cDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFdn-00000009BB8-3Bgl;
	Mon, 18 Mar 2024 16:15:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFdj-00000009B9n-2VX9
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 16:15:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1deefb08b9eso17695465ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710778504; x=1711383304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjx92w828ciIAkc1HsEl6Axd7/QMgJ7aIhxMeT09mMA=;
        b=D5ODmfSv9lx2anyRvPYn72ISEmOSn1/hvz7l9+lB0lB4gjM0HoJG7HDaSJ4FHLkSJH
         BbHF4fjC0LWxX1Tm6eFLMEseasyvt4clPOajAN9Vmr5RuZwBW/npRC9PnRcB2W8SKpXL
         0NABbjXvvZ+X+Ckz4WYHzaVZp0XnLhSATStkyJ+FZObNOmumshtDhDF/0XCuQ5jDVv4N
         46YYfcpHuA2DiUJhyOj9Y9QQ6whkTjyu/wvdpHWu3vBKmx3giO+NFiW1Vb7t8Z8oyrq0
         qo8OlNCX3GeWt5ne9JAFhyRuQXHQ9g0t3fg/DwvOs5THzVg4R0x20H2jjzNNMShm+onu
         Nfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710778504; x=1711383304;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjx92w828ciIAkc1HsEl6Axd7/QMgJ7aIhxMeT09mMA=;
        b=aoLd46YAReeEJ/XiStzHbSESCwjrixPHqqvmP/k8yIemzT1txWQksxqHfhkfsYxmW4
         sZ20pVr0qlvroIcg+bHGvfLUHeLeXvaDe91/yIc/EmVVNsELa0KtNmTzxx6Eyy8zVEdg
         b18XhFpCEYy0Y5XaZdXjLvmdkkEF3AOp2DDbCTXVzwDdLI8AJdbyA584B5oa0rqTc1oj
         IHRDSN+5iMQrOZNTc//symbIgL/bzdvYIsP+ATrmvNIpSMT6bYC3VCU4swqTjBAh5yzi
         0w4/eWA/cOyoo2NHgxEtlZ6/MzVGGMkqfxuspJeX+27SnZ97qEVqMGZLk9Ws9JVVeDrE
         tMcw==
X-Gm-Message-State: AOJu0YzsZDWlhYnAtxLkcGXFDrvbJbxmc0j8+NYB09LGqf1pliMCy4pw
	iteAt+wvcZtNagvDIUwUvKtaO2DXDw/05nsGvarEKcc13hoc3igpKVuvEQR0lexaqb8jm4+uzur
	X
X-Google-Smtp-Source: AGHT+IGJGAECTPixBKSWVeI9OcdeXsk7x3qyIB4yxWwMTXhJumLXo6PR85kzQz7cucHvKAj9TYWShg==
X-Received: by 2002:a17:902:c20c:b0:1de:fc12:ee5b with SMTP id 12-20020a170902c20c00b001defc12ee5bmr175875pll.33.1710778503434;
        Mon, 18 Mar 2024 09:15:03 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id li8-20020a170903294800b001dc944299acsm9528985plb.217.2024.03.18.09.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 09:15:03 -0700 (PDT)
Date: Mon, 18 Mar 2024 09:15:03 -0700 (PDT)
X-Google-Original-Date: Mon, 18 Mar 2024 09:13:28 PDT (-0700)
Subject: Re: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST condition
In-Reply-To: <20240318-emphatic-rally-f177a4fe1bdc@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
  jisheng.teoh@starfivetech.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-abf741db-9f86-4803-b143-2948e9a099af@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_091507_762712_420DA6E1 
X-CRM114-Status: GOOD (  17.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Mar 2024 08:35:04 PDT (-0700), Conor Dooley wrote:
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

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
