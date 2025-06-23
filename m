Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF7DC7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZZ2FpixBqS4gUrdQZ6BkhbFpT48F9s9PLamdee2S68=; b=BB5kwWew6cARta
	21uqt5L5K4/QHQN1OOXEFTRH+o2y24B/4DnbKGSUx42wVvFnYGi6CvFYZvwvszz7j1ZUsKjQ8LJPq
	LCz91982FeB+swaurnMdan7XCr3r85HVzQU73t2IKDvZnExGdOxGvq9UNgEyEGzov1eZl1JQZHlZK
	Z9WiIGPWygOSvJf7+svKto8RGYFCmv3MjWb//AOca2EHVfAzfzrCize1PMeOMTEVbyX+6U60Mkrmi
	Dri/XkHfh6bWbpRvl10GESVwz19kX4ApADbvNzjyx4wT2hNw7XbsUxmsMroZaWE6/pbRPsP1Rr2xF
	979MSHketBuE0SAFvOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk3t-00000003QVS-3xco;
	Mon, 23 Jun 2025 16:30:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgjF-00000002n7k-3kAv
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 12:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F6714A326;
	Mon, 23 Jun 2025 12:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B87C4CEF6;
	Mon, 23 Jun 2025 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683413;
	bh=GVjFe4ObRxWxhFMM0FviQ7S/XQ0xsxyQJkNxl0XAxIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gs6OLwpUhQG/IueLFxoH/Cz8a3suIICLHaT/RJ6GVJZq48sZ0jI09lAxpuSC+O6xj
	 YAkGIOgZAZixF2qp3qfNmgl2hKWBRCOYn3s+m5sAwjMnYKmQoiWQKSSN/TtlxiiSYM
	 daSHXRloUA7mb36Au+C92Xp2zv6wMkBq5KwcY6tY/IQN28moru6oLC1KFnS3KxKmJG
	 5f6dSPCjBKOvhNfgRFLNQ43Pc9/BXHp3Yy2MoH80SePWBg1hl0NJGSxO8CVPDNLDi9
	 Q48qACq9obNQdIZqY96CC38N5BKp46hEJn7Wo6gaN1rnLAO6hHjwAwIhidZcvFJBA4
	 tgJJzWdbR2vpA==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/9] dt-bindings: mfd: syscon document the control-scb syscon on PolarFire SoC
Date: Mon, 23 Jun 2025 13:56:15 +0100
Message-ID: <20250623-playoff-napkin-5426a5e304cd@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=hxOaJHTVRbH1YgnYGVBXvMwqTyw6bMbbuBO5TUxUKWE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfu+FmR1j5lrcd7wdr3zopH7R7EiV+tknnZ6x25w2D K2xuNTXUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlIVjD8lf/+6PrEmg1pTf+W MYRqS60ocdCKPtCr9K7p0PejKbo+NxkZXpermORO5/fwqA8+Ely26M4hx10BP7kahSd3pMcFRFo zAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_055653_950179_07292465 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The "control-scb" region, contains the "tvs" temperature and voltage
sensors and the control/status registers for the system controller's
mailbox. The mailbox has a dedicated node, so there's no need for a
child node describing it, looking the syscon up by compatible is
sufficient.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
add the control-scb syscon here too, since it doesn't have any children.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 27672adeb1fed..d18be50dd7127 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -90,6 +90,7 @@ select:
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
@@ -197,6 +198,7 @@ properties:
           - mediatek,mt8365-infracfg-nao
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
