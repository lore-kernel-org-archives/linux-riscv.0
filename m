Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C40C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 21:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CetHyPl4P7r9Q18acu1LxA6Q31Iqicf/ge3nT6fQwSI=; b=fT9NUJdWQx/1n9hrfL9+d6zgt+
	TBsvCa73eKbqxpvhAvDYkcAkHJQqEgHOmMPN4UnoUosWSN21/Sn6uyLv7nzqjfyk29b32kJyWVEeE
	lz67lLrPNWWBmrIGfc+SViCJxkCPsCiT4Xq09t3BeUIa0DxzWyIV70NZS9r99DsQ4h5yCnbMPkzU2
	0tWvm0xQnkyh3sb+c6RC+EuTLFFzR7GzY1Zo8XLdN2Pk0goqBjCIN5OgLvw3zKkURj6Wz170eXtsK
	S8QfvAJLRl/mpDB3YKiluD6tAkqKpcJEW/ZsgYnKcNWfRv0hMZpm5hMRxjXXfPirHvlwbtJngn3ug
	m0qoFV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7MT8-00FQeN-0m;
	Sun, 26 Nov 2023 21:15:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7MT3-00FQai-2u
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 21:15:07 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7A3A740C52
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 21:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701033304;
	bh=X6K8bPWubM7CP2uBLEzKZ5K58KMm2j9nc1xapYlq3qo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Aub6WyT+CVJfY/3Sv4kYBukHCXcMrgFijXO6xugHkPg83xCnMczVi3lzkKu7xrFsX
	 C6J3d/+8M6hntaqF9PnszipiFzrloIOYOuh2Yf+uqMYyk+3G/99xax+FAFidM0NGYE
	 QlNIJ/EYsL8/Oicb8jKmo4F+bIZOtaVuZxdmFhEEcKRTJY8Q4klTxDDsHSqLwVdxsx
	 Gg+a3b6f6Izdz32VUunLiqMMHjXUwD8qzEOdyFW0/ItOIDEJ9RLG6aa7uj3yxD2Dsm
	 9yB5+XNMt1u/b9cH47tGNOEj5XVHPCpqL9fYaVD+tA8i+Vf65Ec2L4E+wWoF8CHbzb
	 b82LKwYu86KcQ==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41cca916954so48542701cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 13:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701033303; x=1701638103;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6K8bPWubM7CP2uBLEzKZ5K58KMm2j9nc1xapYlq3qo=;
        b=vb9kooxYjgt9WIo++HY17lLaPFdUdgThSzezohQCUQB4PF0TFjLojpOWYgECfPuIw+
         AdRWEqeNdIqZOA6M10RnK5dgrXpYNSFQAHacovK8F0nA/LBWLLDLnLj4+aMscNu2wyMW
         ItZq9LLRpYZMJ76dzx2wHvyuvLVbnceZzbagRcuApXt4TYfTm5P+Osy8Vc7kwjBZJrW3
         ZTQBS9A81lF9a2yEXz3bk6Ja8O8BLKDKuIu054kARCZeFWldLQtk5B/bprbdTIweu0yw
         c8hOVRDaazVZaq/aiuiLxWiC5vCeh4PJS4E1GMmWkufUFgv2CFXzzYIO8YWS92TcXr5T
         p1EA==
X-Gm-Message-State: AOJu0YyX4ti8js2xcHEV73sUWtgBkN8ehakAwfUqh2ANSNeakqNQTDkw
	jxvsUhjuZ8WVgKZF2wEWf/CQe/b1EHha7OhPCiiW9lpEFm1ylJKREPjmKQ4nkLh3DprXYwjGRux
	EWz9yZdRCt9RVBffzuHNwRHX4iowTBP41TvFjTNCBvvjJdA3ia9g998nCqtnROg==
X-Received: by 2002:a05:622a:4d1:b0:423:93ce:56a8 with SMTP id q17-20020a05622a04d100b0042393ce56a8mr9480161qtx.37.1701033303339;
        Sun, 26 Nov 2023 13:15:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvOe1/VcODkUu33j/9j5dbJoi16WUGuqQQy1j3aYZEMCOFUmi43jYGiMI7L4+bD3DEsgAlRyl8uU3g9zCAnrU=
X-Received: by 2002:a05:622a:4d1:b0:423:93ce:56a8 with SMTP id
 q17-20020a05622a04d100b0042393ce56a8mr9480140qtx.37.1701033303037; Sun, 26
 Nov 2023 13:15:03 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 Nov 2023 22:15:02 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-10-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com> <20231029042712.520010-10-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Sun, 26 Nov 2023 22:15:02 +0100
Message-ID: <CAJM55Z-1ibownJG-pEuUx5VvPfnuV0+kT-6Fo3VnVs2YycNEEg@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] riscv: dts: starfive: jh7100: Add sysmain and
 gmac DT nodes
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_131506_122828_DFA5D8B8 
X-CRM114-Status: GOOD (  12.59  )
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
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 36 ++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index a8a5bb00b0d8..e8228e96d350 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -179,6 +179,37 @@ plic: interrupt-controller@c000000 {
>  			riscv,ndev = <133>;
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
> +			status = "disabled";
> +
> +			stmmac_axi_setup: stmmac-axi-config {
> +				snps,wr_osr_lmt = <0xf>;
> +				snps,rd_osr_lmt = <0xf>;

As I also noted on the JH7110 patches these are not addresses or offsets but
limits eg. counting things, which makes a lot more sense in decimal for most
humans. But here you've changed them back to 0xf, why?

> +				snps,blen = <256 128 64 32 0 0 0>;
> +			};
> +		};
> +
>  		clkgen: clock-controller@11800000 {
>  			compatible = "starfive,jh7100-clkgen";
>  			reg = <0x0 0x11800000 0x0 0x10000>;
> @@ -193,6 +224,11 @@ rstgen: reset-controller@11840000 {
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
> 2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
