Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6A3CA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agSDgXH21stiqWI/Ld4+/7PMBF1AqUvQovOgRPtLVgc=; b=OfQiWUvQNWOlHr
	0Q7Ewurc6+WN4JroceaO67g2OGz3XxfSadYanl/RsSVDDDDEZ91Ihn5HzaNDu6rrRouXfuJXvvep0
	IjvAUTft8hle02PJicMmTbg9FPObUk40NcSeGuzzkAydHT3fFU7lKYPN5g9yBs1FV2ELXC2A7Qh0P
	935wK8IwR7nUuvsB1h8WU717d7qfuNoV9F4bi4xqBjouXfi2IUKTDydeDtiUtsG4DocSAm7B2w2rY
	AW6zXyONOatdL4NixMMos/lu5V2jFpF176hu3LywJkjcHukSFTSzY/GbkaggoSrtkTGHrM17Wt87W
	LX46JUsE3v4UOEGshGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV8s-00000003CN2-1fhv;
	Tue, 29 Sep 2026 10:32:58 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV8C-00000003BbR-1AEb;
	Tue, 29 Sep 2026 10:32:19 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260929103214euoutp0239cd0709a7b693b64125e504c0b05c5f~ZxBgD2WVB2627126271euoutp02W;
	Tue, 29 Sep 2026 10:32:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260929103214euoutp0239cd0709a7b693b64125e504c0b05c5f~ZxBgD2WVB2627126271euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790677934;
	bh=ZWj7QASkmSIyTParfRCzIhJpisMTNMwYHjF17hKyQWY=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=sAv06qXaNMslv8Ra+Hauon8xh3s/yVc0Lv0EacP3TwhgsuI5v7+EXfzMQt81cydUO
	 oI539uc36Wgjr+ZmwpJug4EEM+lrVGO0KgDkNn/LuI5WHeMVKBYeWvqyn5I9A9CS7q
	 4L8gQjyP1MvKUS5o6jVa22qoxWsbnNRBEbeRfipo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260929103212eucas1p26bca549b6b306e920b033ba7b43ae085~ZxBe1UG5G0313003130eucas1p2v;
	Tue, 29 Sep 2026 10:32:12 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260929103210eusmtip15d0f617e692fbb652a613464a49bf809~ZxBcTrhhf0258902589eusmtip1F;
	Tue, 29 Sep 2026 10:32:10 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 29 Sep 2026 12:31:02 +0200
Subject: [PATCH v5 05/21] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
MIME-Version: 1.0
Message-Id: <20260929-jh7110-clean-send-v5-5-82b4d8e3c6c7@samsung.com>
In-Reply-To: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Andy Yan
	<andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,  Emil
	Renner Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260929103212eucas1p26bca549b6b306e920b033ba7b43ae085
X-Msg-Generator: CA
X-RootMTR: 20260929103212eucas1p26bca549b6b306e920b033ba7b43ae085
X-EPHeader: CA
X-CMS-RootMailID: 20260929103212eucas1p26bca549b6b306e920b033ba7b43ae085
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103212eucas1p26bca549b6b306e920b033ba7b43ae085@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_033217_995291_CD616831 
X-CRM114-Status: UNSURE (   9.78  )
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

The video output subsystem has its own system controller, documented as
dom_vout_syscon. Among other things it holds the mux that selects which
DC8200 output drives the HDMI transmitter, so the HDMI controller needs
to reach it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index 0039319e91fe6e6aadc4300114626348e4dfb7ce..cf9b657d0e8a3ed5c5688336fee4123e14a2ac58 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - starfive,jh7110-aon-syscon
               - starfive,jh7110-stg-syscon
+              - starfive,jh7110-vout-syscon
           - const: syscon
 
   reg:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
