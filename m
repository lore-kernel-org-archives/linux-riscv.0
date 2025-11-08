Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259F7CCFA1E
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 01:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OYL51QqEsOm7fkjQpY8j+ygSokM9z8sceCpAUpLhcE=; b=h/b7sT0R3ixwYy
	H0RcQ8EX9/RdVcIzh2jwj0kvzSQG+pACnRbxPuONl5Ebp4W1uYxR3nKG/dfVnbEYt2p3n+6eLne9q
	/uhQPBCUDKFfxGnPPmaumuUW6oEiRLMxMjyysD9lMWYdeW+xrdTV4PL94WfOKZR3QE7VdlfiipV74
	1ALgjgDLoFXuxgIinUe9sIR0KCYxzIX3MLIyzjn2yA4X9L76rOL+qHYGl+8Uui4wS1OZrjXNEwMMT
	YNC9UVvTHzPgyxfwcLhMCSP2SkSv4TafjCS6vvomE2WS1aM67/E78QbF+CdKC1G7VKLTaVUlUdXQM
	/RYBtUIZc8pUrPEiPFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXO6-00000001qvH-1zpP;
	Sat, 08 Nov 2025 01:05:06 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXNz-00000001qqx-3tPD;
	Sat, 08 Nov 2025 01:05:04 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251108010455euoutp02b3ad76a4dc00463b81a9c4a02d5c628a~14oY0Iyr91808118081euoutp02S;
	Sat,  8 Nov 2025 01:04:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251108010455euoutp02b3ad76a4dc00463b81a9c4a02d5c628a~14oY0Iyr91808118081euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762563895;
	bh=EZpgDuIWQDe3piA1lflo9cUpL7SQdX3ks9uifRxSrkU=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=qZXk8S6hBPrs2lVMoD49eKaLLxd45mFG9fmOvAFaYicCHiG/CjLxe9p11lL8n8g4T
	 6bVuT2Ogpsot3QoPAnFXkbiueITHfH+lNUywcem9WLjqegqqhIGyYajb4Oy5tmUYGt
	 yv7sT1HFCyEC6nCvyQA14wV3xw7GfwppSCWBUwSQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251108010454eucas1p103697b195125d853bd9f4d40662b681e~14oYeOVC50742807428eucas1p1b;
	Sat,  8 Nov 2025 01:04:54 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251108010453eusmtip2f17ee4f4ef809e0111d98d420ce81c1d~14oXEeKei0912409124eusmtip2R;
	Sat,  8 Nov 2025 01:04:53 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:36 +0100
Subject: [PATCH RFC 02/13] dt-bindings: clock: jh7110: Make power-domain
 optional
MIME-Version: 1.0
Message-Id: <20251108-jh7110-clean-send-v1-2-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
	Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
	Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
	<andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
	<maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
	<heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010454eucas1p103697b195125d853bd9f4d40662b681e
X-Msg-Generator: CA
X-RootMTR: 20251108010454eucas1p103697b195125d853bd9f4d40662b681e
X-EPHeader: CA
X-CMS-RootMailID: 20251108010454eucas1p103697b195125d853bd9f4d40662b681e
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	<CGME20251108010454eucas1p103697b195125d853bd9f4d40662b681e@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_170501_401892_1E6866E1 
X-CRM114-Status: GOOD (  12.22  )
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

The voutcrg (Video Output Clock Generator) hardware resides within
the PD_VOUT power domain. In the new display subsystem model,
this power domain is managed by the top-level 'vout-subsystem'
parent driver.

Because the parent driver now handles power management, the voutcrg
node in the device tree no longer needs a 'power-domains' property.
This patch updates the voutcrg binding to reflect this by removing
'power-domains' from the list of required properties.

This fixes a dtbs_check warning that would be triggered by the
updated device tree.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
index af77bd8c86b12e667b79ffbaeae5f8a82e6d3f37..deff69037e5072002e06aa5a899f4488b7264f47 100644
--- a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
@@ -61,7 +61,6 @@ required:
   - resets
   - '#clock-cells'
   - '#reset-cells'
-  - power-domains
 
 additionalProperties: false
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
