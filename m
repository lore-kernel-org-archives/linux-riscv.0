Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C871CF31AF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PI9B45LhkjKmsEyeYljBtKfItje6DPfLFLQAIgUrPRk=; b=zXv2OtrPFqcxnN
	tVHRwQMRnLlVyw/l2svh7fz/bZo6SxHjKguX7UOyq+ynvGz1UBeYZoUnQ9y5qoIVy9ew+qc2RhfLr
	QXI5uzFzEbWeAGkCNY6P6RJYVa6mynlwpP4aCjSskjb3YduQkr/bjkLkxzEP8MeMPXSrOTZZRucO/
	+yrKQ85mVk67HPwf0uMFoejTotZP7ob1dSkBtoR4PLgz/tqAdX/j6Csb3VycZ+nq22Ywv/lrSEn4I
	b+DviB7S2KSm8IGhn5OiIfoZ1VExkQkrj1eVelaS0EJfvLETmb3WtpEpDV0JsyBVkcJST8GqXQpOT
	BOBBvtTBUZ91pfoPIaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svx0W-00000005ZUG-3mdu;
	Wed, 02 Oct 2024 10:55:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svwuA-00000005Xow-3AEt;
	Wed, 02 Oct 2024 10:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D205B5C118E;
	Wed,  2 Oct 2024 10:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1B7C4CED3;
	Wed,  2 Oct 2024 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866105;
	bh=iu6oBhUAOuMmbpup1hHGDc3avXmUfIwkO7bEe63eIVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiPqEWpA5nCcwtH33o4XrUpfxikAz42cs9nDFndHzMGuHNTCjXb+ICf0oeNIliQf3
	 GwlERzS5SJiIUh6pZkI4IMUxPNvQtxFJUegF6Gj27hT5OtSvEi6lyPDcTFyZ5yPHNg
	 X6ouQE/epC1rKvWrNVwMSIfwsCyTGJ1t5XSIWSw6tgOdFIA5NQBWvzf8zmoXWkYNSs
	 Nkav9oHPhx8HR2DtervWg795PO7eInVxsDHf0U/k4ud6VXXsYoFz/9D9oP9cNnAjUR
	 L+qEpzHqYkEJ5Gvk7F6KwyT1eOgsLSQi9zyVkWG/ECMWYxRnsP+qG4u4mVIJtcnDlu
	 1vFUrfidcIr1Q==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 03/11] dt-bindings: mfd: syscon document the non simple-mfd syscon on PolarFire SoC
Date: Wed,  2 Oct 2024 11:48:01 +0100
Message-ID: <20241002-clambake-raider-a8cbb3a021a8@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-private-unequal-33cfa6101338@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tHRWpiyQ8iCGyCWP4whQFJhUVatxkKCTPz6PLOlptNk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/VR7YfD0Ty3S3cb+Hf9Cfmd9/Nc6qfPvSy3v2Tbbv0 z/+2mTT01HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICbfJnhF3NBYWLgZ7vXazy6 eOpnnTe7J+IzN6ZqRdKTWclH63ZfusbIcOAHi8fUy9PcLW9997Tut9AuXHDl9KKWCVo7JwZL3rE 4wgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_034826_949314_A310A7B1 
X-CRM114-Status: UNSURE (   9.96  )
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

The "mss_top_scb" register region on PolarFire SoC contains many
different functions, including controls for the AXI bus and other things
mainly of interest to the bootloader. The interrupt register for the
system controller's mailbox is also in here, which is needed by the
operating system.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index cc9b17ad69f23..b414de4fa779b 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -88,6 +88,7 @@ select:
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
@@ -185,6 +186,7 @@ properties:
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
