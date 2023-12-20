Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9A7C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bhK9l6VPTbQsk8U9/qjqD5TYqijgaEruSWSS9hW84o0=; b=D7UaVswfa6pvewSsOkQZ0OiGbx
	Uza8dtb/HIViYY2ethEQXNONSGzPJAnC7bkoVmjrY5SGA2hZFHcZQrDzfp3Mc/iAjSKcCGdXCvOuN
	QlvpIw+H9dN6jDtz0CIuPElrfE1r42kAqdIfURkqWEP5an4OXhEGzrFXQVRhpoFidJ0+kPxI9TYqf
	Aua+6JXYOToiiBybJReok++FzGLm/t/apH2W8UGl+ohKHaU/E66zn8X5pCO7LmTth2ZIxBPhCvL78
	zRzWTtIyyJdiaNcQ9zG0+8sUPw8Ju9MoBMxZSHKlpgf8mNZjZbVaI6WGlG0+d3bWSV1Comw5/964M
	5Wr0jU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwrf-00HYEZ-1n;
	Wed, 20 Dec 2023 13:43:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwrc-00HYE6-15
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 13:43:58 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1B0DB3F56B
	for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703079834;
	bh=Y1f83Xk1FXiEYRkgnz968I1hevI4AFt+heHnZvXG1Zs=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=lamu+NcT/MItfkn7YcRjV3WJoE6lmlcPZ8S7f9/hTVBwx5pazcKhQElTxgDYmy7Gr
	 eI0yxNKTIV/TnwpDkIsHkopayCz3fWvygQ/xtPTtS6a2PpRmeLuh3xYjm5acJ+Rj81
	 a6YnNQOUk6sKQkminUo+iXW/lOS2m87JcpfMPiwOl7I7XF+O3L19nfsrP/P+yJ2IXL
	 BCl7HXSWJpDpRgiGOqLgob+0EMIQnFUdzDoZNUbknRRb/AYap98I1zZWmpdjSXgACL
	 4S++A+rF4L+WA1Ma+afv6uPasrJy1jWOB6qAKR1cNy+TNoEPyzcE9Af3q5TS33oUHY
	 080k/08PMIDhQ==
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67f45ee9f49so52167826d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 05:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703079833; x=1703684633;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1f83Xk1FXiEYRkgnz968I1hevI4AFt+heHnZvXG1Zs=;
        b=qyB9aFyRZgE39eM/j9LbwsSYg8QHzrgjpIeGjdFgmbzYyngycids+YUvMkhapBH4Jh
         ApVBhNdzxH1oQgASxpbe9VOCNduYkoPW9DiMi1LZgBjoJ3LCcNe1LCH8fdbF/6gVFc3H
         XQuP/+eS1Xx67nTjBnYPHuB4/JxAo4ImP94JSb7cxDGUyrAga7KNnYNeBzDT9nGCrsOy
         F+fLImEJYEo/VnqKNrESOiO5Er8kfjLC/eXoGP164AYe/NXBhDGQmXSGLpQLt+I3kObD
         uek4XE8PeZv0NoBx9M/7KfooXRECrzH/hOxUFpNiQwcYTkjoq2V+7TUKesPJjevIkmmn
         U4rg==
X-Gm-Message-State: AOJu0Yxy8FRfFFMqxFW/+iR2BpJSFEHSlMKCPo3eyPj25OfuLLFCxO0Z
	75/C82QaVU826RdpmhDUtCBIBEcu/gtN8TwtB6/ogIDB/BMB5PLFVBt+8M/hXG2ybV7m6BGTcni
	/B3AIp+mGdWZUaOAq9z4X5fRHZh00lgIGYAyDFlxuqbzcL987M0y2+9gdm5c15273cbw9cQ==
X-Received: by 2002:a05:622a:1309:b0:423:98ba:1f74 with SMTP id v9-20020a05622a130900b0042398ba1f74mr24124822qtk.58.1703079832880;
        Wed, 20 Dec 2023 05:43:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErFMRLbKaj/fBOTAz8xHWWCImycUAmeJWguwHtKgu7CB99Ci5H8wT1jkWzCEL4aBoSuGhJ//HhYBVROra6w1I=
X-Received: by 2002:a05:622a:1309:b0:423:98ba:1f74 with SMTP id
 v9-20020a05622a130900b0042398ba1f74mr24124813qtk.58.1703079832635; Wed, 20
 Dec 2023 05:43:52 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Dec 2023 05:43:52 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231220004638.2463643-2-cristian.ciocaltea@collabora.com>
References: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com> <20231220004638.2463643-2-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Wed, 20 Dec 2023 05:43:52 -0800
Message-ID: <CAJM55Z9DhojDTDPEqx3NO5g61=ezRg-U9odixbZugcXRRVmS7w@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: dts: starfive: jh7100: Add sysmain and gmac
 DT nodes
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@collabora.com, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_054357_024380_64AB0500 
X-CRM114-Status: GOOD (  11.76  )
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

Cristian Ciocaltea wrote:
> Provide the sysmain and gmac DT nodes supporting the DWMAC found on the
> StarFive JH7100 SoC.
>
> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 36 ++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index c216aaecac53..2ebdebe6a81c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -204,6 +204,37 @@ sdio1: mmc@10010000 {
>  			status = "disabled";
>  		};
>
> +		gmac: ethernet@10020000 {
> +			compatible = "starfive,jh7100-dwmac", "snps,dwmac";
> +			reg = <0x0 0x10020000 0x0 0x10000>;
> +			clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
> +				 <&clkgen JH7100_CLK_GMAC_AHB>,
> +				 <&clkgen JH7100_CLK_GMAC_PTP_REF>,
> +				 <&clkgen JH7100_CLK_GMAC_TX_INV>,
> +				 <&clkgen JH7100_CLK_GMAC_GTX>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "gtx";
> +			resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
> +			reset-names = "ahb";
> +			interrupts = <6>, <7>;
> +			interrupt-names = "macirq", "eth_wake_irq";
> +			max-frame-size = <9000>;
> +			snps,multicast-filter-bins = <32>;
> +			snps,perfect-filter-entries = <128>;
> +			starfive,syscon = <&sysmain 0x70 0>;
> +			rx-fifo-depth = <32768>;
> +			tx-fifo-depth = <16384>;
> +			snps,axi-config = <&stmmac_axi_setup>;
> +			snps,fixed-burst;
> +			snps,force_thresh_dma_mode;

Compared to v4 you're missing a

  snps,no-pbl-x8;

here. It might be the right thing to do, but then I would have expected
it to me mentioned in the cover letter version history.

> +			status = "disabled";
> +
> +			stmmac_axi_setup: stmmac-axi-config {
> +				snps,wr_osr_lmt = <16>;
> +				snps,rd_osr_lmt = <16>;
> +				snps,blen = <256 128 64 32 0 0 0>;
> +			};
> +		};
> +
>  		clkgen: clock-controller@11800000 {
>  			compatible = "starfive,jh7100-clkgen";
>  			reg = <0x0 0x11800000 0x0 0x10000>;
> @@ -218,6 +249,11 @@ rstgen: reset-controller@11840000 {
>  			#reset-cells = <1>;
>  		};
>
> +		sysmain: syscon@11850000 {
> +			compatible = "starfive,jh7100-sysmain", "syscon";
> +			reg = <0x0 0x11850000 0x0 0x10000>;
> +		};
> +
>  		i2c0: i2c@118b0000 {
>  			compatible = "snps,designware-i2c";
>  			reg = <0x0 0x118b0000 0x0 0x10000>;
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
