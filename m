Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B8EC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XON09P0BQMvVy3vwMuvS8DXuipN+5eP/OBs+A6/gBno=; b=nQbn6UlOtRO/b1UA/iKATgLR0B
	BLQsDRUibD7Y3WCCCwzrR5U8YeANpyQt4xDYYVM3mzXTuCNqa3PIcEF/eONjdQnktcJGLZwqNTjl/
	miesF4TPaN2QsfJ67SiVryILCZMTzkrnKVVlpg3bqz++9UjIjddsHVbzhZ/2ZOQ6GRB6bS560GoyY
	5qQ1qhigygcFRnDJUB650w/u6Ozz1tsBdhD9SqwfyBMXZiG7u/S3GlfmKfGKEn1eM7htImcUaYnuM
	Y1ySjKyLDxwjrUO7rPUd5aeH6S7Ry1oR5i6vgjxPoYlalpiDg8Uvelvs/NRxVnyFOWR/QH9WOYXLg
	ZmWrrNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAorY-009epf-08;
	Wed, 06 Dec 2023 10:10:40 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAorT-009emZ-2w
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 10:10:38 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A0F6E4444F
	for <linux-riscv@lists.infradead.org>; Wed,  6 Dec 2023 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701857430;
	bh=fcdtr+UWRkr2bcyvcYZo0x7Tv/0e4LlLY26MkaiwxuM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=UzJH0zV2olX7sgDWm8/u+fi8RgSkgJAOAkWVXBjOuN+wSlGjzf0E52NwNxNDRu12Q
	 3KRiTFTSMkZagwqU71zvpY1EZFSUGl5TsoY36dwk9SnfFaGoOQXZdnYx8c4Vl6Pz2l
	 80msDLUxyRa9j20TNyFE5OP53u9d+P39zQqWv8b93z34EUMIWD9wOjwO4qpeblkxca
	 AgcTuiq+psTMCpE9jwGBplIYTs7HMPvxqSsPewBRu8XZGCJwPLrgXZjA4UfmtU+lXD
	 5G9bBQUMYaFI1pkBX6Ez81VkNdUtJpSySVlKK23B05aQwBYO2U51cy7wSWetekRUfD
	 Lp1ZGZ+C8tFLA==
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2c9f545220cso34102721fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 02:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857430; x=1702462230;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcdtr+UWRkr2bcyvcYZo0x7Tv/0e4LlLY26MkaiwxuM=;
        b=ZChaiewMPaYCtZr8Oi8UJVIBf/G76TNOD5cGT62n3hY7uFlW4vUEAFZJ9PskLTuP11
         S9qSDWq+UP7uePhi1/F2yYwLt9lkg0m9uoG05SVfs5MXpXCbSoFAqooyu5Xqai3wp7hd
         bCF3eqj0ud3QMX+5Ta/kcw82UDL7Kp/7x0PWi/zwfKO40/+5g7UHre8YN50ppncI3kOs
         JJlxxvNKQZq9+cXRRT5yvH8SBsDi8np5KXEXT78ApkClR8xE86pQRRn0Wgrduxjt30WP
         g8+1nLky4UnlyFD65UiBuCc0TFtxbTi9jsJwPLR+NLyAr4YkDcGtvQjbiPppwnp5iocb
         CIWQ==
X-Gm-Message-State: AOJu0Ywbpto7qB741g0c/0TNBU8HXum3mOoX3G6pK3i5nzEcNhcnU14J
	4rIHdx0p/YTuryQKYE+0ef2bwuDA9oXV1VTjv8pLwzAtulRqLXnf9C+4W98YkMA3Kvemkmby5Xa
	RFmQP//b1xIVxhMG2/UEc3uWoNMG3DVgNI+MEC3Dn9oK0/WgAcwwpFHQn9U52QA==
X-Received: by 2002:a2e:a456:0:b0:2ca:252d:ea3d with SMTP id v22-20020a2ea456000000b002ca252dea3dmr330680ljn.98.1701857429647;
        Wed, 06 Dec 2023 02:10:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs92N5wzpZ2+RDYJq5RciPViDvSYByTuJP/RjgJ3NmIPzmJzSvS2xAGrVkoFNNDaX6YxvjLcMhL1PXJThRVN4=
X-Received: by 2002:a2e:a456:0:b0:2ca:252d:ea3d with SMTP id
 v22-20020a2ea456000000b002ca252dea3dmr330669ljn.98.1701857429336; Wed, 06 Dec
 2023 02:10:29 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Dec 2023 04:10:28 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-2-69220e373e8f@baylibre.com>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com> <20231206-th1520_mmc_dts-v8-2-69220e373e8f@baylibre.com>
Mime-Version: 1.0
Date: Wed, 6 Dec 2023 04:10:28 -0600
Message-ID: <CAJM55Z_jRhJLLQg9_OzJ_UeqaoqByu_BgxmwtVRUK2Z+qEKZxg@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
To: Drew Fustini <dfustini@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_021036_090116_132259FA 
X-CRM114-Status: GOOD (  14.12  )
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

Drew Fustini wrote:
> Add node for the fixed reference clock used for emmc and sdio nodes.
> Add emmc node for the 1st dwcmshc instance which is typically connected
> to an eMMC device. Add sdio0 node for the 2nd dwcmshc instance which is
> typically connected to microSD slot. Add sdio1 node for the 3rd dwcmshc
> instance which is typically connected to an SDIO WiFi module. The node
> names are based on Table 1-2 C910/C906 memory map in the TH1520 System
> User Manual.
>
> Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>

Thanks! The rest of the patches look good too, but I don't really have
a schematic
to do proper review.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index ba4d2c673ac8..8b915e206f3a 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -146,6 +146,13 @@ uart_sclk: uart-sclk-clock {
>  		#clock-cells = <0>;
>  	};
>
> +	sdhci_clk: sdhci-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <198000000>;
> +		clock-output-names = "sdhci_clk";
> +		#clock-cells = <0>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -304,6 +311,33 @@ dmac0: dma-controller@ffefc00000 {
>  			status = "disabled";
>  		};
>
> +		emmc: mmc@ffe7080000 {
> +			compatible = "thead,th1520-dwcmshc";
> +			reg = <0xff 0xe7080000 0x0 0x10000>;
> +			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sdhci_clk>;
> +			clock-names = "core";
> +			status = "disabled";
> +		};
> +
> +		sdio0: mmc@ffe7090000 {
> +			compatible = "thead,th1520-dwcmshc";
> +			reg = <0xff 0xe7090000 0x0 0x10000>;
> +			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sdhci_clk>;
> +			clock-names = "core";
> +			status = "disabled";
> +		};
> +
> +		sdio1: mmc@ffe70a0000 {
> +			compatible = "thead,th1520-dwcmshc";
> +			reg = <0xff 0xe70a0000 0x0 0x10000>;
> +			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sdhci_clk>;
> +			clock-names = "core";
> +			status = "disabled";
> +		};
> +
>  		timer0: timer@ffefc32000 {
>  			compatible = "snps,dw-apb-timer";
>  			reg = <0xff 0xefc32000 0x0 0x14>;
>
> --
> 2.34.1
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
