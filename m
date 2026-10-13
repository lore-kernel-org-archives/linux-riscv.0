Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F19CC6B08
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QE9HK68rxauZp1MrlkVHet2rSy49lJrOrg97fO43+mI=; b=eF5BrBHSbLj5gq
	iSw5Zg4WcBchnscBDpIt9gDSm6Q0kUmhZ7URyPxBJ1/WHB5REhy0EMo6ThX3zOytZBmt7v35sZuGU
	deWbzQii5UC0LIiAyFLYAiuLKGZtgWE9pRo2yga1WseJZwkhvs9O1qfdPsXBt9BKXGYs/8QfAkaUU
	5TMqqi/2Zas8+1eNPDWLvheS327UoGmusVuSoe0mQ/M5kYAIKoibid1nS3C1ZYHswK2vCkRocmo4E
	gJpSqLxLFR72hCDwrLdmLSJ8ACB6ORIiCowGy1CrGlcU7EKpYLFCVxKulHwnzrRnQW6FnmF4KDhwc
	qeLKlo60k0lofq44fPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZdX-0000000CXp6-0ZN5;
	Tue, 13 Oct 2026 10:21:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZdS-0000000CXo8-0XEF
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 10:21:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF66543EA3;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C54DC32781;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791886889;
	bh=DUyXyu4G2jsiKLQyoNsvOPwF5oH4LHm6RUKTLUmURZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BpqzE4wWBfnl7WDnbL3rbrD8tHH5haWM0NsGJXnrbr9M85mNqWKMFKrY7OBGaXeE5
	 uL2huxvwH2SWckigRFlM0oaztqaUpCOEhaanFq1HL5Xhvr2LTPDWrABbqMXFvWeXoY
	 SFKVzCbm/1FsGpQ4cBcFkRPImwazLtTEnhg1qGFXD1o0Ve/nc8lAgieXgIqHwfphxz
	 1brkcQ0Jo22TAXlpAbqRYekUXZJuH4Yge573yQHVWisArPu+dlWjOdZLjc1GxgC5tR
	 TcWVaXgTCn7/1o1m58pruWI7wlwIhO4wqxY3VCakQNWxnkaa+jqCuUkz6p0Y7WwLb8
	 /Oj1EgozUHbUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B9CCA9ED2;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Tue, 13 Oct 2026 18:21:27 +0800
Subject: [PATCH v3 3/7] dt-bindings: riscv: Add UltraRISC DP1000 board
 compatibles
MIME-Version: 1.0
Message-Id: <20261013-ultrarisc-dts-v3-3-5ff3ebb2a90d@ultrarisc.com>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
In-Reply-To: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886887; l=1942;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=F931PJB7CYQDP8Qv71XY2lbmZu4qGdN+Fjh5HxV88EU=;
 b=gvfLUBKUnsHa4kOaazLGWVpCMiDxQBYbO+XvOt+Eak1zTHUgePjIl0+UVQWhEVT6wshWfjEDT
 Sl4SqK7jn2LAXX3PnLGQ0dhFPlPOsKNby80kt/neNpQMF2SgJBtvWvp
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
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
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Document the compatibles for the Shenzhen Rongda M0 and Milk-V Titan
boards, both based on the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
index ff1c1aea9a98..7eb1b2971bea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23639,6 +23639,13 @@ F:	include/dt-bindings/power/thead,th1520-power.h
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
