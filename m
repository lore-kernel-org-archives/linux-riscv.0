Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8078ECAC593
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 21:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gm6QT2FCoBGRp6uMo9s9gpgz+7cipa937ikiCLGuOdI=; b=yh5vbF73KQBdN5
	Q5II3tMNAWyt9pR4AJeTp3zXHx+oV6vam5iIeZS+clAIZBotxhOW63aERTJRQ753CM4cac81QF92Y
	9La8eHMyxi41RG6GQ+s8dcWtpRyEDGCM1BiUU3raIlV3Uz/GFho5nh5xuB78zio5F3vlg+u/xIbR3
	pD6EuDc9Fo0eBzBfIu7Z5oFYtbhnuv1NAo8kVje+QCj0TWpbCe2a/pXBibHvQBuqX3+GXtJjp69qF
	MZMoVSWqYkB1ZbiIQ+/yognfYYPL/3Pxmd6I2OZ4WwdZ8bifkiIP2czQgS/Zw+fEiMMKd5ILqUEGM
	oJKUgQODjwQVssrB4B9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpr-0000000GM7H-2s85;
	Sat, 13 Sep 2025 21:31:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpp-0000000GM5q-0h3R
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 21:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 979E343F25;
	Sat, 13 Sep 2025 21:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8608C4AF09;
	Sat, 13 Sep 2025 21:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799064;
	bh=5XRfwkc2GmSFjCFXpIdslo6TCdgE2D3C6IHaqnU33bM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sRaZeCCKoOnPGl+VM8wJ4aIU4egb2YSGfTnPm7Tucq1/AyYB8pqx472cbMArm5mZm
	 ANvqqyVoriE/0DUeSut2ljhb3CJQv1eW+UleKiug+Se97kTT8eRAf0jyyapWXLQW2R
	 ALeBAJk/b+eJbQojalVFsX3g2uORARivAznpIedTelNurOci8zgD6ARF5FDWTQVyIO
	 vVISWPwBu99MIdAfvQ6Lk21VPVBW1rVvwjmFls3H35FKYCV2ymFKL4kLO1M2wwLvTF
	 e56i0udU5JQOuY9mw6D2BkIqu8lpnzXHgDvm881nbkEb2nk5o+5k1MjCdhwBpYAXYR
	 p445bXTE88ZSg==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 13 Sep 2025 14:31:01 -0700
Subject: [PATCH 2/7] dt-bindings: riscv: Add Tenstorrent Blackhole
 compatible
MIME-Version: 1.0
Message-Id: <20250913-tt-bh-dts-v1-2-ddb0d6860fe5@tenstorrent.com>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
In-Reply-To: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_143105_249871_1096D3A2 
X-CRM114-Status: GOOD (  10.00  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Add compatibles for the Tenstorrent Blackhole A0 SoC PCIe card.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../devicetree/bindings/riscv/tenstorrent.yaml     | 28 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++++++
 2 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..877da1b0214f6730713369f82a1fdcc44c4ea562
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/tenstorrent.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tenstorrent SoC-based boards
+
+maintainers:
+  - Drew Fustini <dfustini@tenstorrent.com>
+  - Joel Stanley <jms@tenstorrent.com>
+
+description:
+  Tenstorrent SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Tenstorrent Blackhole A0 PCIe card
+        items:
+          - const: tenstorrent,blackhole-a0-card
+          - const: tenstorrent,blackhole-a0
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d321752ac44c91d2d7e74de28e08960..f2cb2aae8d66d21bf5c13b16b3b1d8fdc98b9462 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21741,6 +21741,14 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V TENSTORRENT SoC SUPPORT
+M:	Drew Fustini <dfustini@tenstorrent.com>
+M:	Joel Stanley <jms@tenstorrent.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git https://github.com/tenstorrent/linux.git
+F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
 M:	Guo Ren <guoren@kernel.org>

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
