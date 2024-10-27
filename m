Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADA5D1356F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jH2+AKdRxE4TunL4Si7pdw5AYOsPPtUQPTcI9X9ev50=; b=Ipc+eAT2wtVw6ebsvgDIQLDkkk
	+3dKat7oYQ45FCX+88xSWc1NejDJ63yhH0WreBfEFHxkzh8z5NkV6tmzm+zBjkf/Q/YsKKk6LIENC
	0PnGbWRGDdxsojhVNm+j6oD971MIkC3+0/0mlcy5wR1Tm3JS/5yQH5xfXWtGtQtysPZ0Rbo+8E+7T
	v/3UAvJYjA70h1CFhxACw6dGrh2xx/pd6NUb7hRU93/ux+J9/c7ctJRnXT/5ttbvr2p/VEr//7Bw0
	eWH6LAFefj7/k6R93IHAeu+LquWGYmVNpbQyqV3vo3BZ2bvc/HyQPgDdCntzy1vMn+1S/0N4AiZ9e
	pA0cFgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t56Lv-00000008YLc-2LRN;
	Sun, 27 Oct 2024 16:42:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t56Ls-00000008YL5-1sJ6
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 16:42:54 +0000
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9E67340CE9
	for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1730047369;
	bh=rx+Iv26SQSVeec4MS8C230GVRkuF+slURlh6a1FZiJk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=n76DkLlkGkJo7fC2Oyqp+aGxq33LiRC6yaZX95vuG4M7RFDYRh73LplHjNkh1wMRT
	 0aA7+I34pKCTekYcEfNH7pb65jvsxwwPTLzhM9+CbocHYqKRP+AC4afdoT9tI9Qfou
	 /CSk3UaCnfKpmdaiDUHqueMXCXOVyyAZL1Fr6PejL+nC3oeS2pQHPVo2MHvYov2TEG
	 RbnNqKosBNQantbjgmQte7CyXrqWHi0ZkuFziPVCRXRxJ279JlgCRXzhDCZjBeicTy
	 Fa3PkCWfEYOKldV6zUDSEwkLTXJDokmjU+uC/7teb3+1LYt3mWQq3r4gDitBfhP5Yl
	 pEsqBl6yYEZbA==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-28c65d3a0e9so3853629fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 09:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730047368; x=1730652168;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rx+Iv26SQSVeec4MS8C230GVRkuF+slURlh6a1FZiJk=;
        b=racgV5iybBcxEKTw8R+jXbFRU4E2HwcLeq+eSBKU3OgB7qdGrlwStdgDFaJZLABA31
         QPRfWuCQyIvcG9kls/SC1Up7cj/aDncAyw+a7DI3fDXWjXr+wI3g3dKIEiYTJimLx8ln
         EUO1zEn2/DwOvUM/zqcrfodquOT+p1DYP3AY+RxZEsx3+/S6eLqmoIsPDBz2T47YPeCc
         t0Z19lwA7uixrc1rp1gHes5r04SEmpCkawTOda2JrY9b2xAYOsSkrtIXDfG/M9P44tqC
         rd14E2FzoLCHFqrii7zS4INCpBrOHM7d+ukrvPnNCDL64I86870ChbPVQ4R+jEcRVw+b
         ajuA==
X-Forwarded-Encrypted: i=1; AJvYcCW9hcux5gzslTYhkzlBCdol8AHcUTliucpxkVrOsrKSFCpWA6Bxrdk1l3TqbnTDEvrt/ok1atZC5RFV9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL1r8auDq9jOV/O6lYQgBS3NARcPoSfvRuyUxawHFTop47HTNc
	q6r/04hLHL6xVPoxBShV7WLXFMOn8qhOAlq94LJPDAbf/bC1B0IUAxcakhgQXJZ+hWb4XIJ5RdW
	aoCv9nFNluOMsP8h7Rq3OTJKHeI6FXKMgA6Gprl9CZuWPLI06d1YWQbfuJJXxcyt2428Qv45SKR
	BpiuQX3na2Ff/7OhDiZF4maXCYpVYg19eT/Tacsx6MhR+9iJdVR2R4WFBG
X-Received: by 2002:a05:6870:5594:b0:288:a38c:fe7d with SMTP id 586e51a60fabf-28cebca3e9cmr6011961fac.23.1730047368456;
        Sun, 27 Oct 2024 09:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8LODRPd0idGnzbKdllZFk/ttfTmPCD9buQd7jAmTx/s6fTmJFsFUDMR1akME6dNXxir/YbJmHArbZwwf8dHU=
X-Received: by 2002:a05:6870:5594:b0:288:a38c:fe7d with SMTP id
 586e51a60fabf-28cebca3e9cmr6011940fac.23.1730047368186; Sun, 27 Oct 2024
 09:42:48 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Oct 2024 09:42:47 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241027144448.1813611-6-guodong@riscstar.com>
References: <20241027144448.1813611-1-guodong@riscstar.com> <20241027144448.1813611-6-guodong@riscstar.com>
Mime-Version: 1.0
Date: Sun, 27 Oct 2024 09:42:47 -0700
Message-ID: <CAJM55Z8fgPLEn=XqfV-5mVBeqpbr-S+4N=vjivofXJY36AajuA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] riscv: dts: starfive: add DeepComputing FML13V01
 board device tree
To: Guodong Xu <guodong@riscstar.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko.stuebner@cherry.de>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Drew Fustini <drew@beagleboard.org>, Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, Alex Elder <elder@riscstar.com>, linux@frame.work, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_094252_641480_FDC147AE 
X-CRM114-Status: GOOD (  17.67  )
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

Guodong Xu wrote:
> From: Sandie Cao <sandie.cao@deepcomputing.io>
>
> The FML13V01 board from DeepComputing incorporates a StarFive JH7110 SoC.
> It is a mainboard designed for the Framework Laptop 13 Chassis, which has
> (Framework) SKU FRANHQ0001.
>
> The FML13V01 board features:
> - StarFive JH7110 SoC
> - LPDDR4 8GB
> - eMMC 32GB or 128GB
> - QSPI Flash
> - MicroSD Slot
> - PCIe-based Wi-Fi
> - 4 USB-C Ports
>  - Port 1: PD 3.0 (60W Max), USB 3.2 Gen 1, DP 1.4 (4K@30Hz/2.5K@60Hz)
>  - Port 2: PD 3.0 (60W Max), USB 3.2 Gen 1
>  - Port 3 & 4: USB 3.2 Gen 1
>
> Create the DTS file for the DeepComputing FML13V01 board. Based on
> 'jh7110-common.dtsi', usb0 is enabled and is set to operate as a "host".
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> [elder@riscstar.com: revised the description, updated some nodes]
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Thanks! Will you be adding more stuff later like fx. the I2S sound chip?

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> v6: Dropped all node status disabled code
>     Enabled usb0 and set its operation mode to "host"
> v5: No change
> v4: Changed model string to "DeepComputing FML13V01"
>     Changed dts filename and Makefile accordingly to reflect the change
>     Updated device nodes status, and verified functional
>     Revised the commit message
> v3: Updated the commit message
> v2: Changed the model and copmatible strings
>     Updated the commit message with board features
>
>  arch/riscv/boot/dts/starfive/Makefile           |  1 +
>  .../starfive/jh7110-deepcomputing-fml13v01.dts  | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
>
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 7a163a7d6ba3..b3bb12f78e7d 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -8,6 +8,7 @@ DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b := -@
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> new file mode 100644
> index 000000000000..30b0715196b6
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2024 DeepComputing (HK) Limited
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +
> +/ {
> +	model = "DeepComputing FML13V01";
> +	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
> +};
> +
> +&usb0 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
