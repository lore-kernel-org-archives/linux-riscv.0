Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FCEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taxnSJ7HIi6S/FDWUH+p70J0ScnM5zZ5onzV0dK5toE=; b=4OoCArHMZYylzY
	SVr1aZAsQ5Eg/7dYkIHlmSnVaP100wvX98h6WBp8b4LLbvOPafP1HLDpNHTlqKiQwo3r7Xd0TbxHb
	Euwn+xHu0oZIMqq6k+CjKUTiNKyDvgFguAj/ADDwm4uUNPXzRtF7pxW5zjJIiuIpKvRn9d8DVopiw
	GaId0aMoZmWCALQ3eaNH1yWPt5Pp1O0Dxy/Uso2CQPUrt43YtITdeUZMxpvTwZ9s36HAJOQVceHgx
	2DNqWTCa6JUqFKgR3Ixop2XO2NTyeZK9fywiRNkqq26sP+edfv7EshR5j25aGsv3mGbEnG6QiSpN5
	xZezNm+UjAabzHpDt8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlY-003tVV-2d;
	Sat, 17 Jun 2023 16:27:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlW-003tUM-0V
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 16:27:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF6FD61044;
	Sat, 17 Jun 2023 16:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7D5C433C9;
	Sat, 17 Jun 2023 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019224;
	bh=ayCUu7VWTParlzqlhysZ/3yMoFf8bKiG9G6ke1+jMJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGjV6yD0kJyidE+gMTGYZ+mL4zZN4FDEsOMBIjd+0+g/uh9zpjuCuMDgRObtvZ/zA
	 /zW39lihE/LJ9ntaZXe4+AHtf9lT3ipqWNhRneZggwHAEbAzb/NVNh+G6nQxqh/nK5
	 daH2GtaeWlMFqEk39/a02/koOZXP9fsHME+23sNtiaqsahrroPkHTg5mEQHFAEeP/9
	 UvknHTBiGituPIzz9KA6rMSbI2ZmQi/wQb97k46URxMwOFyQubT7hkpzrstFtwsv8y
	 bf8hA1Ff6ZdVMlEk/Jpd3amham+2N/S5f84etKZdVYsgc588eQ/rCIIqtcq4iWszje
	 oqphKQy1i3tQg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/8] dt-bindings: riscv: Add T-HEAD TH1520 board compatibles
Date: Sun, 18 Jun 2023 00:15:24 +0800
Message-Id: <20230617161529.2092-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_092706_231192_F013A5D4 
X-CRM114-Status: UNSURE (   9.99  )
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
