Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FB6CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tB1Euc8QGOSuHJozZ9XPGEhrae1SGWRb1IdHJaMccLQ=; b=ChWJuhJ3ct2dF3
	/eh+y38ot12Kh3lR+IFWncWktvGWaBY2kZDVIiFPP5UMq+mjlflyI0Jr0rBeIyUtBPnTmxYAMgD1f
	tMz7hezspzmTdTRXIpwhRYsWn/ovzXbWo9DemXWtraxI33+3ClaNA+0PBJOqovroGl9Y/Gpw8Evjo
	/jgmy5041BZpvKGoQV0poN9QFyN7Qsfgy/JaiMa3MeUjTu0ESh9AOb23VI3Ae3dTZckWS/Yb0xlFW
	AHEv7t+yzV79kCVm9Thk76zP4PD+4Noo6tuaIxSzJzPJebsmiMSpm4FBBwqV2z7KBhKZcdHLxCbRK
	UDDWtrIqe/sVTdeD7+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL06u-0000000GFZN-11tD;
	Mon, 17 Nov 2025 14:21:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL06t-0000000GFYn-0tI8
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 14:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A64F6020F;
	Mon, 17 Nov 2025 14:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065FAC4AF09;
	Mon, 17 Nov 2025 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763389298;
	bh=4Mi+LgMXubEexFptn3rownVulQBg1tOQnyFmAt9y8i0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkAaribyinSaMIZyProghQx0volGag6ODmeAGY6kwEI/CZgMGuhZ7IntFfu/9tXYY
	 TifCFkka+wMw3MQ+Cpk7s5yLPQGStdJkkqrdEXpM+p6sQ5z6nE6yguYLl2dKt7C0o8
	 4SzDJd97uM2dfyNZVDQf+dzpVlAkE2iR+ZMiXLLhMEQUWbEM9V8ZJq7IOecPtSjHdd
	 FMu8erZXIMZF/I6BeOg3EM3QOTMzbQWG0kZwz/4FUUGGAd3Vm8Dz1UTBDTblveb1j4
	 5vQtxWDc6S6umkbHxKMhiE6Qahxy/iaIAR7ehNZCmF5gUBD4581Mz9OgoYNA0RgqmJ
	 Ux6UIyTSjbg9g==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v1 2/3] dt-bindings: soc: microchip: mpfs-sys-controller: Add pic64gx compatibility
Date: Mon, 17 Nov 2025 14:21:21 +0000
Message-ID: <20251117-enrich-tricycle-aad89e430b0c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-mashing-cursor-6e965a77ce6a@spud>
References: <20251117-mashing-cursor-6e965a77ce6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VsLhTgDg3A12xD5nur7r374Z89j1K8foRtnpWti1HhM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnS+nEdOofm1erYW9u2XT6oczPzNf+x3qZbMRy8BRZRa XcuzH3RUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIks82VkWB5mpBA8iWtf5f1H MQJPdjXcirvbsm3NuXsnei41btyUeZbhf9qLWeYn5vyd3XjtI+PLzlen9yxYeVFinu+TljWLvsz z8+EHAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx is not compatible with mpfs because due to the lack of FPGA
functionality some features are disabled. Notably, anything to do with
FPGA fabric contents is not supported.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/soc/microchip/microchip,mpfs-sys-controller.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index a3fa04f3a1bd..6cebc19db4f5 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -24,7 +24,9 @@ properties:
     maxItems: 1
 
   compatible:
-    const: microchip,mpfs-sys-controller
+    enum:
+      - microchip,mpfs-sys-controller
+      - microchip,pic64gx-sys-controller
 
   microchip,bitstream-flash:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
