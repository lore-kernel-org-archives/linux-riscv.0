Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B53C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHO5jpS5heYZ6xgCLiTtc5RjXMbv1BRqqzeGRijSkbg=; b=hhZYuqBa53FIdL
	hZ4lVfn5G9meISWPy/f+bGFk8GZRXYXlaY/rhqPN0EbVZzpBHg8/x1yrvNLavOZ4YmYz16zp2vnmu
	OKWamwbLniS7SRVs0fwsUXI+sZRzSoCn1RNEtRZa9scDpp4ALmXBx0BLNKagfDJzKarZPlQvUIe56
	ksDbAwy0qISQu9s2DNxVW+VCFljh5MRxucIYxtZgIHdEGUkTgpHhZ75QUmDp7NxiNoMctZqWHFJHV
	Hr8W3JmXfhQg/72GLoEo29lHA+Zs6ytAmozUpYCWSj4qiCbQh2yV7f52tB3yGLAC+y7SsPkin6L7F
	SlA6WpUlWC0RkirK0KeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQsK9-009mjH-Vo; Sat, 11 Feb 2023 16:02:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQsK6-009miT-Qn; Sat, 11 Feb 2023 16:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uPWPHGh/DKXTjcXqPsRg9u1rp49sHTIC/on9dgjtZf4=; b=A3z/Psq82Hq8B+mBU4Az+Azq0R
	h7A/Pf5UL00qc5zv+BXxCKWoPjVpbWQZeR1jtTer+NA8Sws4ENsu6LkINl/1t4jvPkKezTvsKBxbX
	vTGWheU/mDQIjXC0Yva6xvpFr/hdidU9uf9QGy3qgCYXmDSUwNyRtks//Gkmtu3Xhccc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pQsJl-004i09-Tx; Sat, 11 Feb 2023 17:01:37 +0100
Date: Sat, 11 Feb 2023 17:01:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 07/12] dt-bindings: net: Add StarFive JH7100 SoC
Message-ID: <Y+e74UIV/Td91lKB@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_080158_912359_CF456DB0 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

> +  starfive,gtxclk-dlychain:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: GTX clock delay chain setting

Please could you add more details to this. Is this controlling the
RGMII delays? 0ns or 2ns?

> +    gmac: ethernet@10020000 {
> +      compatible = "starfive,jh7100-dwmac", "snps,dwmac";
> +      reg = <0x0 0x10020000 0x0 0x10000>;
> +      clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
> +               <&clkgen JH7100_CLK_GMAC_AHB>,
> +               <&clkgen JH7100_CLK_GMAC_PTP_REF>,
> +               <&clkgen JH7100_CLK_GMAC_GTX>,
> +               <&clkgen JH7100_CLK_GMAC_TX_INV>;
> +      clock-names = "stmmaceth", "pclk", "ptp_ref", "gtxc", "tx";
> +      resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
> +      reset-names = "ahb";
> +      interrupts = <6>, <7>;
> +      interrupt-names = "macirq", "eth_wake_irq";
> +      max-frame-size = <9000>;
> +      phy-mode = "rgmii-txid";

This is unusual. Does your board have a really long RX clock line to
insert the 2ns delay needed on the RX side?

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
