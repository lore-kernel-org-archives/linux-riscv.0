Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACCC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taxnSJ7HIi6S/FDWUH+p70J0ScnM5zZ5onzV0dK5toE=; b=l4UuDfxxx2hf5D
	XMX7iVlfCK6qtbvVbssiNjAWqg9xC253aTeJs9llmZcdBKm3WniUIkQykSNQMlK/n2yDcdzo/pdmQ
	YQAowVOAZgI7x2N2dw+4NhP7FS96ZGfowL6AIQYxHL3sgZ7AzOc+fqpnFHmjV543Ns3YpPQtoqqv0
	sKoOJEEH7kj4BiwPHZWoddTXMEjzMa75XbsKE8VPZblcIk7xKbyRX6EUtbeDCSXaSiY0+CFUTgLfw
	cvWK3kJGhg8f6Iz0qhVIpJ2S5tkBL+xVCq0Z8dv9Al5EAeeIFL8piyfww0DTue5dcyCjAejDRob4M
	bDpE0qjQ0NJOsMNA+jPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioD-00DsvN-13;
	Thu, 18 May 2023 18:57:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioA-00DsuL-2z
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:57:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A0C165146;
	Thu, 18 May 2023 18:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9743AC4339E;
	Thu, 18 May 2023 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684436221;
	bh=ayCUu7VWTParlzqlhysZ/3yMoFf8bKiG9G6ke1+jMJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bk41F/OJXLE+OA+bkypJqEMkcA4OcdwSmKYtN4q6m6SVlGG9YWXwH7FfaQClnLhwB
	 SFOmC8XoQ9wUmaOsHiPreGL8eUEYVNmUDPijwPOJDy9Lczx3zXZ+KohWgdUDBZ4zZk
	 8FkVWqpsiaSsT9jHknJmsTvhZa3tg0RaZpNyohe4c+4Rnf1e6SSL0lec9vcPauXmmX
	 YKEOmhM0edn3+YfkOFjNOoWeoov0Qa1ibfk0ks3ghjYgozf9W2xzpFuRYlHov6Jz0Y
	 Bx9zzwPWh+SjoaMPSedIZNonW1Q1tT7ZxdszhpyWbxR5RjtUSYbTlGEeKoC/21I0Ku
	 JvW03+ywiDL1A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 3/9] dt-bindings: riscv: Add T-HEAD TH1520 board compatibles
Date: Fri, 19 May 2023 02:45:35 +0800
Message-Id: <20230518184541.2627-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518184541.2627-1-jszhang@kernel.org>
References: <20230518184541.2627-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_115703_003775_2BE0E91F 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Several SoMs and boards are available that feature the T-HEAD TH1520
SoC. Document the compatible strings.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/riscv/thead.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/thead.yaml

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
new file mode 100644
index 000000000000..e62f6821372e
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/thead.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD SoC-based boards
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description:
+  T-HEAD SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Sipeed Lichee Pi 4A board for the Sipeed Lichee Module 4A
+        items:
+          - enum:
+              - sipeed,lichee-pi-4a
+          - const: sipeed,lichee-module-4a
+          - const: thead,th1520
+
+additionalProperties: true
+
+...
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
