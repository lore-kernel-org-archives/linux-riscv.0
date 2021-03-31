Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCE8C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 00:25:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE792619CA
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 00:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE792619CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6lS7k+wOhE/KfL5m0yX365g/Z+tS+rMUN6w6WlcioqE=; b=iKK5sURmyAs8etZJ3XiP1VqTc
	D0Z40Dck6F9QhvzEd4WujykYkCRg4VnUtaxgIOl/4t/a5qvkpU7IR0Fhf+Lstn7w6He8zcpKcfoYX
	lw+kffl+Ffb6JQWLpJ9ok4q6Cfs2tDi6+L96zSRQiRZhLM0SfXdCu4/EsqSWgRoKugjBRbyuUyXuv
	HTvMmviMjf8Pbrorx38D5SsXMRh+pz/zYplSZrRLVBDP252TDpcMT+Qjex9klQBJNmAJ5vmHudDuK
	kPxkgEjiQMtB+0PkSWHI2uIsy1rqWNgR10w7DnWMfAkgi2xhSNCPfOZJilT7CJkvEpWbRdb2C0VaO
	+Upen4LEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lROf2-005ATR-9s; Wed, 31 Mar 2021 00:24:40 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lROer-005ASl-HS
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 00:24:31 +0000
Received: by mail-pg1-x52a.google.com with SMTP id q10so1728176pgj.2
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 17:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ub28FHj/nP801IQO46xUZahOb4byvrwZQUANAPDaSEA=;
 b=SOcvf/tGl+Al4KoWwPZq+DDeyAcVz2fMNFsevwb00+4IxVKFLY+T5o5h3mSdiCgM7k
 yEp5mEg+0He6/AbTRXBrdnSBU4NV3EcOCdNyLAEZvBB8EPDiFZxQtUm+BkcumlwvtIP/
 sqDp6BioT6jIx6uD800hvxx44tUtOxEat2QFdqDjEkIRMajE74l1SvLgmtrObxlHts4I
 X77DrWlnbT5DziL+Kuc6jou+0BVCxNs3Q/+6rUG+LgsZl82QRMYcmKi9cVaH/gyVp7ea
 Rm+3z87LxjdEc2Onwmr8NVrkPCh07y3jLu3F05NpbZFz3X6urGoDTtoOKgvIlvnV7RO2
 BvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ub28FHj/nP801IQO46xUZahOb4byvrwZQUANAPDaSEA=;
 b=Tkwpwm/G6gQkaQhW06xkw+/FkpK5OFfif047GpUilqAkeDIHQPW8oFNrhwMxyjxQcU
 hEc1PM98ScElNHRGJ+a1mZwZtUx7g40ymFD3EOR1iMIye3KTkUoZX8YXSFBXEhvLVj6C
 LEJ2b1y2Q+Hp/ASWRfs2Hnpv4do2+AhLRQvDSnMVm4uwBf+LZIglcA/qvaEACoNflZeX
 40OuKOx1uD/6tQx4Lz4gKdSI+3RcA/uGXrCLW/ut7ade8MSHgGygRFYm98esjOdpiSWz
 fMKCw/1IKz20YwL7a1CSiun/Y5oxg/BXGgKF2080M5H8KD5+4oPBLHVTzpXyJjHtAU28
 MQ8g==
X-Gm-Message-State: AOAM530gOTc+fxJXA0lDMxQ8uZgs8D9LyQfu2aK+aYAOaC4Plg6sGakN
 1jPtuhJwYBGCBEvkge0h5txDkQ==
X-Google-Smtp-Source: ABdhPJybsZFi/2pN93X3ZjdAqDBFgjVrY3uiPHLxNABzi4IU4lfFKhHkaqZRMkHbJDl9onKr2z/Byg==
X-Received: by 2002:a62:8103:0:b029:1ef:26e4:494f with SMTP id
 t3-20020a6281030000b02901ef26e4494fmr461898pfd.41.1617150267976; 
 Tue, 30 Mar 2021 17:24:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f21sm238126pjj.52.2021.03.30.17.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 17:24:27 -0700 (PDT)
Date: Tue, 30 Mar 2021 17:24:27 -0700 (PDT)
X-Google-Original-Date: Tue, 30 Mar 2021 17:16:56 PDT (-0700)
Subject: Re: [PATCH v2 6/6] riscv: dts: Add PCIe support for the SiFive
 FU740-C000 SoC
In-Reply-To: <17994571deaf703e65ece7e44c742f82c988cf39.1615954046.git.greentime.hu@sifive.com>
CC: greentime.hu@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 hes@sifive.com, erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, 
 lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de, alex.dewar90@gmail.com,
 khilman@baylibre.com, 
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, helgaas@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-30f397a9-b7af-4247-baa0-d8e1d30c6b97@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_012429_858645_AA373924 
X-CRM114-Status: GOOD (  16.62  )
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

On Wed, 17 Mar 2021 23:08:13 PDT (-0700), greentime.hu@sifive.com wrote:
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> index d1bb22b11920..d0839739b425 100644
> --- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> @@ -158,6 +158,7 @@ prci: clock-controller@10000000 {
>  			reg = <0x0 0x10000000 0x0 0x1000>;
>  			clocks = <&hfclk>, <&rtcclk>;
>  			#clock-cells = <1>;
> +			#reset-cells = <1>;
>  		};
>  		uart0: serial@10010000 {
>  			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
> @@ -288,5 +289,38 @@ gpio: gpio@10060000 {
>  			clocks = <&prci PRCI_CLK_PCLK>;
>  			status = "disabled";
>  		};
> +		pcie@e00000000 {
> +			#address-cells = <3>;
> +			#interrupt-cells = <1>;
> +			#num-lanes = <8>;
> +			#size-cells = <2>;
> +			compatible = "sifive,fu740-pcie";
> +			reg = <0xe 0x00000000 0x1 0x0
> +			       0xd 0xf0000000 0x0 0x10000000
> +			       0x0 0x100d0000 0x0 0x1000>;
> +			reg-names = "dbi", "config", "mgmt";
> +			device_type = "pci";
> +			dma-coherent;
> +			bus-range = <0x0 0xff>;
> +			ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000        /* I/O */
> +				  0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000      /* mem */
> +				  0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000      /* mem */
> +				  0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
> +			num-lanes = <0x8>;
> +			interrupts = <56 57 58 59 60 61 62 63 64>;
> +			interrupt-names = "msi", "inta", "intb", "intc", "intd";
> +			interrupt-parent = <&plic0>;
> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
> +					<0x0 0x0 0x0 0x2 &plic0 58>,
> +					<0x0 0x0 0x0 0x3 &plic0 59>,
> +					<0x0 0x0 0x0 0x4 &plic0 60>;
> +			clock-names = "pcie_aux";
> +			clocks = <&prci PRCI_CLK_PCIE_AUX>;
> +			pwren-gpios = <&gpio 5 0>;
> +			perstn-gpios = <&gpio 8 0>;
> +			resets = <&prci 4>;
> +			status = "okay";
> +		};
>  	};
>  };

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

I'm happy to take these all through the RISC-V tree if that helps, but 
as usual I'd like reviews or acks from the subsystem maintainers.  It 
looks like there are some issues so I'm going to drop this from my 
inbox.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
