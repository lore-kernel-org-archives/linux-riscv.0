Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29358C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9lz7M8AcXEblZvoTHVPfxGwurrTKkN1aIQ7C8U0Esg=; b=I0A0lRlDglUHTt
	vcPeg10uSp6wetWUiX4bbMDTgTeXwTVqbk9kFXVrKEN9I69oisVSeeJ2xw5ojFbHiprzcqAiB4Hjx
	+jRzwfB38uUrJry5ZlinPec73GtqOY3zEMT4gkqAEr8Y6rTLb5bJcKWRDGFONhrDtMMXSxmmtrj8e
	JooLWmAvBGx8d+GFVkHnY2BNiqJxnVN+2tefW1Cyr0wr7ht+dcMmr+3eboNKcHlSiTvicnZ9O3vGJ
	HG0s1pW6Y7rVw2GkscKLgJ+LKWOgBQ2+entpTuaQ2bX/NwrEfme3x2Sl9id6+nZjpzm4mVsoWDQxu
	M4TQ37rcfmgha2cGqBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohwi-0000000GsC0-35r5;
	Mon, 25 Mar 2024 10:52:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohwf-0000000GsAv-0YJg
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 10:52:51 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-515a81928a1so1744250e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711363967; x=1711968767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/45gkU1OW/Fa6jqiOKHWiKJTgLo8h9uP7u3dIPIa2Y=;
        b=cHe0ujGSGEDPrjGczTBAgNk1zIdzCWuLLNTcdbxfcj3KXrLHHtXbesufUZ+fszIgIK
         i+AQk2r70v/2cE2Mu9fYSAn1Ptz1k04/QtawAKa+QcbMwTRc6YV41zBkFIfyRrsY6HA6
         nvntLgmFrjIt2UgQISnbGpNdSNEeiM5SVDJjHWPkaiz5mztV5IoGLkVuzOngIlwWLD6E
         Pz0CmqmeiUtJ1B8Hl1WLGYKqrjbbQrCyhsapwXHHZrG5YF3n6YCJ311EF52+iXwSWe+D
         u/uwxD9uzQ+vodXJbh3r5DhLDZN18hZUQRCYov5WgtIw0IENo1V5EfnCljcglg6Itdcn
         AzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711363967; x=1711968767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/45gkU1OW/Fa6jqiOKHWiKJTgLo8h9uP7u3dIPIa2Y=;
        b=u6bI9TMs6xZ8ykWURJAbW43VCqszKuN6owOR1VCoyJs74dF/p228Fyr7LwWF8UydfQ
         P1IqP4SjGw3hBEKwzDiv2Dw2YHw/9qo9seaB4edMJlyBwnKVwQ9gKeZW2p+hOa3az7RT
         oJpIrcPFUtHZ3xPberIT42UJhBnXeKKPq2fc5llUja7EKSfAJwOSob0grBMdfXu3n5wC
         CDQIDKiW+MQVI4wDv7u7iUiKvWN79Zplx/WUF/D1LdLceNi0EAkN0qh9yDct7zBlhe6e
         AyTp7/mJPqe+9DIAt7ymaXvx5JT9Dcsw6AEN2d+nDs6DMU6WBWaCQEIClMguF/2P9BVD
         Chxw==
X-Gm-Message-State: AOJu0Yz89ptFcMKWGcuPHsTWXXXHxmGMnfhgTudGeFxRTTywwUKMuXV2
	+jM/A81MU9SRXpXj49v2Xj+ukxn3Tgk886WmIH/3Chl0ZwIYoEOFMQAzgJkguvQ=
X-Google-Smtp-Source: AGHT+IEclAfbiEIquW9pL3ASZRMHbyWd/lIOzT5bu64XepiQ3fVd79XZUHfg0x/tT73njuoHcmQwYA==
X-Received: by 2002:a05:6512:1590:b0:515:a9d5:aab6 with SMTP id bp16-20020a056512159000b00515a9d5aab6mr3848775lfb.18.1711363966528;
        Mon, 25 Mar 2024 03:52:46 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kj9-20020a170907764900b00a4636d9d28dsm2903246ejc.69.2024.03.25.03.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:52:45 -0700 (PDT)
Date: Mon, 25 Mar 2024 13:52:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/11] riscv: Kconfig.socs: Split ARCH_CANAAN and
 SOC_CANAAN_K210
Message-ID: <e255a964-27bf-4eb9-8e9a-4f60d1ccd12b@moroto.mountain>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_F208A26B5338C6E14AC6648730368AF0FD0A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_F208A26B5338C6E14AC6648730368AF0FD0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_035249_202822_5CDC3E68 
X-CRM114-Status: GOOD (  21.90  )
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

On Sat, Mar 23, 2024 at 08:12:17PM +0800, Yangyu Chen wrote:
> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already on the mailing list [2,3,4], we remove the use of
> SOC_CANAAN and use ARCH_CANAAN for SoCs vendored by Canaan instead from
> now on. And allows ARCH_CANAAN to be selected for other Canaan SoCs.
> 
> Then, since we have Canaan Kendryte K230 with MMU now, the use of
> SOC_CANAAN is no longer only referred to K210. Thus, we introduce a new
> symbol SOC_CANAAN_K210 for any conditional code or driver selection
> specific to the K210, so users will not try to build some K210-specific
> things when MMU is enabled and see it fails to boot on K210.
> 
> [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
> [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
> [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
> [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/Kconfig.socs                        | 8 +++++---
>  arch/riscv/Makefile                            | 2 +-
>  arch/riscv/configs/nommu_k210_defconfig        | 3 ++-
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 3 ++-
>  4 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 623de5f8a208..5710aee456ac 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -72,11 +72,13 @@ config SOC_VIRT
>  	  This enables support for QEMU Virt Machine.
>  
>  config ARCH_CANAAN
> -	def_bool SOC_CANAAN
> +	bool "Canaan Kendryte SoC"
> +	help
> +	  This enables support for Canaan Kendryte SoC platform hardware.
>  
> -config SOC_CANAAN
> +config SOC_CANAAN_K210

This breaks git bisect, right?  There are references to SOC_CANAAN that
are get updated later in the patch series.  You can't delete SOC_CANAAN
and leave the other references dangling.

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
