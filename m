Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77495C61DBC
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PK1BSteZ3gRCJAdBBybWuIn9a0sH1eSvOfZPTXhiwTs=; b=DEh7t3Sp+2ZmBg
	6vt4XecKLsxQHBp1CwLy+jrfKkj4t9VKbXAZeUNbOebnNxoh6ydNTm89t/kIlamIXp/8AzceOYGPF
	xwcqgbf5OKr7x0KJBcYOXzPNn0ZtX0w5VjQbq3H4zGqC43ZEACmQ9AAqSxRD+q+KrYpNAmZ5WNtYG
	6YkAUa3sioO3BeFnL8jRReSZPZkI1bDM7CVF7cSrY1xQ9l7Vn6rLYE4K5Ae3gYZMhbAFn2tdGlzCV
	Sdmq9Z4drbZXfQcyIeg41vC29lH5lHZibA4C8XQ3cHG5POz8yFZdR4QwYJkPYrpu4f7uT/IG7UqNr
	KNdGjXjrBm+2wHpfy1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxk-0000000FxgY-2C88;
	Mon, 24 Aug 2026 06:15:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxg-0000000FxeV-0QDo
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 06:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21F3B44F71;
	Mon, 24 Aug 2026 06:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5291C4AF0C;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787552110;
	bh=6glAL5dZPzWwvgIDi8+jSp/LCyYm+4YRxj09bMO/+2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kktz2nYWbchpJ5dayseLdUAbLkYifh4aLmm4XVdcz4SQ/xyoXTCrqtq+bt244RHxi
	 LJ7+BIBZE3jFG63E6Zg1C1oCqHQGf4bMA5EZE3ZYnRQKvSOhtcfRWMFk8pXhKfCROJ
	 zJ1+mICrTkF4YOiCmNRakIyKs50/Ct/CFnHoJRHLF2zJ+eJIhdhWAmdA4ojJBkTukb
	 vCx4NcbvHtnmR/JfHqjpa9KqDwUpIrS+A+rJXfKF1o/2ToEtpqETeeCxOS/drm0lpv
	 pZu5xOS9cpbcRjf4+Vx4uu3gLml05klQyIvE/Np1GqVKr+zQA0vSuSP2Y8nA67lC6v
	 yXORrm+1QPwYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966AAC61CE2;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 24 Aug 2026 13:54:17 +0800
Subject: [PATCH 04/12] dt-bindings: riscv: Add UltraRISC DP1000 board
 compatibles
MIME-Version: 1.0
Message-Id: <20260824-ultrarisc-dts-v1-4-61ab7aebe9e5@ultrarisc.com>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
In-Reply-To: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 dmaengine@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787552108; l=1889;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=jWGrB8tM0PP2gL1fI25fr83ev1OyLQF1owAoac3KkAQ=;
 b=cdcJDw9lL1t8IDmHih5fCmmE70vfJtaDXXOK08WjpNEW9O87tb4HrKCtfydFxfkAexrQq/5cq
 4l7r4wP6FxGCzJUXXUQU8Ym5hHg4rskpSsKGf6JVBpIwDOAz6SPK0Lu
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Document the compatibles for the Shenzhen Rongda M0 and Milk-V Titan
boards, both based on the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 .../devicetree/bindings/riscv/ultrarisc.yaml       | 27 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
new file mode 100644
index 000000000000..a51e63dbeca3
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UltraRISC SoC-based boards
+
+maintainers:
+  - Jia Wang <wangjia@ultrarisc.com>
+
+description:
+  UltraRISC DP1000 SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - shenrongda,m0
+              - milkv,titan
+          - const: ultrarisc,dp1000
+
+additionalProperties: true
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d77dca044075..1148168e8f8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23517,6 +23517,13 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+RISC-V ULTRARISC SoC SUPPORT
+M:	Jia Wang <wangjia@ultrarisc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+T:	git https://github.com/ultrarisc/linux.git
+F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
