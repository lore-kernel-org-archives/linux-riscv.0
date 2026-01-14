Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D11D30CFD
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 01:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/rBljhqEi3X7vK3yJO6Zwv2TETNfk1txvU79EhpUKA=; b=vwMqfLD+jHblsc
	7pqAuqz3CxvOsYdkQx5h3TEjlycRYzioHMi2hNXPsDgzJm2YXE4sQG2dpstdUDFypMMrpg2Jz3zAP
	Yz0Rh5pQ2W8IdgAd6wexE93sEbUfx/Wff3Qh8wxtnO837q5SGHH8DgsqhOtxXD1c7RfZF21YAhwhJ
	4GeOS4nxeimnpTU0wTWY+BTe0Wtq2zopocIylAJwAuenpo+woyq3prxtpYWILXwEA3sZDChuX3j+s
	bFohvKRrcNfpN6vGgXAKxV0XyuzCAh+kvfmGuBuEBLEp+Z4aDEjBiHNJIClGv321MmNoWU9vNw3S2
	osBwTxEkDPrv1p6QQNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfptI-00000007xAp-3mhg;
	Wed, 14 Jan 2026 01:41:44 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfptF-00000007x9D-1PH5
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 01:41:43 +0000
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C6027340FEC;
	Wed, 14 Jan 2026 01:41:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yao Zi <me@ziyao.cc>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] Add clock support for SpacemiT K3 SoC
Date: Wed, 14 Jan 2026 09:41:12 +0800
Message-ID: <176935356287.13018.17884535923723366958.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-k3-clk-v5-0-42a11b74ad58@gentoo.org>
References: <20260108-k3-clk-v5-0-42a11b74ad58@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_174141_393951_25EDAB51 
X-CRM114-Status: UNSURE (   7.35  )
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


On 10:11 Thu 08 Jan     , Yixun Lan wrote:
> I've dropped the RFC tag as now the driver got tested on K3 SoC.
>
> The SpacemiT K3 SoC's CCU (clock control unit) is similar to old K1 generation,
> the clock and reset functionalities are distributed across several IP blocks,
> therefore, we model them as several clock tree accordingly.
>
> The PLL clocks has changed register setting layout, so introduce a PLLA type.
> Some gate clocks has inverted enable/disable logic which writing 1 to disable,
> while writing 0 to enable.
>
> [...]


Applied, thanks!

[1/5] dt-bindings: soc: spacemit: k3: add clock support
      https://github.com/spacemit-com/linux/commit/efe897b557e211a09f51d749eae5eca933e8bf56
[2/5] clk: spacemit: ccu_mix: add inverted enable gate clock
      https://github.com/spacemit-com/linux/commit/ace73b7e27633ec770cfb24cd4ff42c24815a9aa
[3/5] clk: spacemit: ccu_pll: add plla type clock
      https://github.com/spacemit-com/linux/commit/3a086236c600739d6653c0405d86aff7d6f03c06
[4/5] clk: spacemit: k3: extract common header
      https://github.com/spacemit-com/linux/commit/091d19cc24018f2bd783e932fb2403cb7a2bdb3c
[5/5] clk: spacemit: k3: add the clock tree
      https://github.com/spacemit-com/linux/commit/e371a77255b837f5d64c9d2520f87e41ea5350b9

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
