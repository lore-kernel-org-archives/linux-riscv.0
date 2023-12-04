Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D530EC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f3wqHtArLclCOFZN7XSRGGc9elCHAgrp+nwMZYCI74o=; b=jQKV6uwWdpQ1mZiDAO8EtcXszB
	ho7hTyVx/UQlC7BCY1aXqOYPLiYoLfwkdf623RAhu+2XDdGdF8HWy2+7svF3JpHm/bRjG843FZUao
	KnlYxeBC0x0NHFeh1sSH7Wg6dw5mFkjCALIyGG5EUjJ6gVtqHKZQGGs3vetH5uMa960g4dUkVerNA
	o2UCDNOr4zZqMWbTSXtwpbKCVV3tnSWS1GpB5a69AJtUj06bWyTlwjyZ0hRpPNQJwwXrZKTMy5ceM
	YpYJPngsEdVHV95s+DXil/sXWB/EARhK1Nlkz3mvhKVRQY3gXXiv0aD2+PdWj9gtq/UQsBF5a4Hq1
	3U1bw1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA5Yb-003Rxt-1T;
	Mon, 04 Dec 2023 09:48:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA5YQ-003RvF-2A
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 09:48:03 +0000
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A0E6540331
	for <linux-riscv@lists.infradead.org>; Mon,  4 Dec 2023 09:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701683267;
	bh=ocWHzI4I/IJpjMhErnBIZA0ZO+r+qla4DpGX2b6C1P0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NmdrRMqz6Dn8pVCxdLH0b38V1DL0b54B2JMSS/NCd7mJDPKWRg4MPVWLNFlC2pQ4o
	 6TbXJTyt+RQuBq+MfuUnR9+2ddn/0yXKRlZNyDhMy167W16hTaExy7ufwdus3NZ1qS
	 qguGFa9MRVcJfQ6Upz0VoEyV9dlnJXGlNxCcVkxnXFVJ4WSVrUYVSYw58P1Huy30Sn
	 nqam6XoCwPjmcLlgczDJOpUG2BZaj3cgixf78zHxY3QlgLMzMjEUT3hWba5tfQ2cuQ
	 7ZWek5il3sTfdjzp2TBbtIrpXqzdj9IfdPUoxJkagc61qa2mhAFLQCJT7803/ONhqw
	 RTvhs9YALp1uA==
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6d9a5700c38so657941a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 01:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683266; x=1702288066;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocWHzI4I/IJpjMhErnBIZA0ZO+r+qla4DpGX2b6C1P0=;
        b=n9iBSj/2cgKsMJH+wrjgrCfT0SFSTSOrvQn/7tvT+lSxqO5lhlQ3X+r7CeVMEAZwRa
         8BCsA5vw5lCEmJI9MdhU6eVJ08k29NF7ter4qSnytT1pafCjIDzNsSHIuevbRFHE4gKx
         XIy+EALpG84y7MSrCQGQWy1yJORSAzEiJZsQ0kzfN7nZSe4EdyjbuP7wOPhijwXTk32T
         /XC63jTxqicRkigg7d9IyUO8mZj4lyUNTP38tLsPgvtCp3NuTDe4G90wL1ou1u/02gwo
         Vd3rIn0Y2czrT/Q9l1cdvKWnEnP8dqNqadsaNLg0f4oK1KDsHIlU9WWeonKcQLK+KXgH
         PWuA==
X-Gm-Message-State: AOJu0YxzCXEdFHujwIO8X1KCJgrChX+DPqjI/AfA+QxvNYUFe4g5XwlV
	hrucF3YuPOieFpERg55hjYaWh4DHjXYeqtrYcnYRVglIPtzUE8bGzKx4RlfxpPNR61JXFsI2ESO
	BtPD92GXxp0/dKMsCwpTc+n/qI0J6omTgTQoJJceNrG2s/TWKM0cCDxaoqGDKOw==
X-Received: by 2002:a9d:7f0e:0:b0:6d8:74e2:6372 with SMTP id j14-20020a9d7f0e000000b006d874e26372mr3825846otq.76.1701683266647;
        Mon, 04 Dec 2023 01:47:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgZV7GOcP10ElEBcdLXqU6APkmXlqtrKTI9+ZUsE1OOlySmmnZwzKu0ALesi4xbldlngNAXeDz6+sW1IKUSAA=
X-Received: by 2002:a9d:7f0e:0:b0:6d8:74e2:6372 with SMTP id
 j14-20020a9d7f0e000000b006d874e26372mr3825830otq.76.1701683266357; Mon, 04
 Dec 2023 01:47:46 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Dec 2023 01:47:45 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231129-th1520_mmc_dts-v7-2-c77fc19caa6f@baylibre.com>
References: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com> <20231129-th1520_mmc_dts-v7-2-c77fc19caa6f@baylibre.com>
Mime-Version: 1.0
Date: Mon, 4 Dec 2023 01:47:45 -0800
Message-ID: <CAJM55Z-qc7gc0fO-K8byqvpOBjDxFD4dP57mFHuijvpOzBWObQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] riscv: dts: thead: Add TH1520 mmc controllers and
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
X-CRM114-CacheID: sfid-20231204_014755_093410_4A9711FF 
X-CRM114-Status: GOOD (  12.66  )
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
> Add node for the SDHCI fixed clock. Add mmc0 node for the first mmc
> controller instance which is typically connected to the eMMC device.
> Add mmc1 node for the second mmc controller instance which is typically
> connected to microSD slot.
>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index ba4d2c673ac8..af4fdcd82e0b 100644
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
> @@ -304,6 +311,24 @@ dmac0: dma-controller@ffefc00000 {
>  			status = "disabled";
>  		};
>
> +		mmc0: mmc@ffe7080000 {
> +			compatible = "thead,th1520-dwcmshc";
> +			reg = <0xff 0xe7080000 0x0 0x10000>;
> +			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sdhci_clk>;
> +			clock-names = "core";
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@ffe7090000 {
> +			compatible = "thead,th1520-dwcmshc";
> +			reg = <0xff 0xe7090000 0x0 0x10000>;
> +			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sdhci_clk>;
> +			clock-names = "core";
> +			status = "disabled";
> +		};
> +

Hi Drew,

This doesn't seem to match the documentation shared here:
https://lore.kernel.org/linux-riscv/5f437109d2be2b8843f549a661054a2e3ec0d66e.camel@xry111.site/
From the TH1520 System User Manual.pdf in there, I'd expect something like

	emmc: mmc@ffe7080000 {
		compatible = "thead,th1520-dwcmshc";
		reg = <0xff 0xe7080000 0x0 0x10000>;
		...
	};

	sdio0: mmc@ffe7090000 {
		compatible = "thead,th1520-dwcmshc";
		reg = <0xff 0xe7090000 0x0 0x10000>;
		...
	};

	sdio1: mmc@ffe70a0000 {
		compatible = "thead,th1520-dwcmshc";
		reg = <0xff 0xe70a0000 0x0 0x10000>;
		...
	};

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
