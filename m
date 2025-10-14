Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB894CCD183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2n2hYlUsT2GeS1+JA3sF7zph+ITi7rA+3a1eY03UcGk=; b=1wT56ep2yA4flA
	Zr2RyGf+W7ULC4Dvoqb5vLra3JfByW+otLCNcKlrPZeV40dimHL5wHxeju6h7HHNnilJnzbk8o25b
	abZW4WPfX555IvToBWqmsHT8WyF3djIfK8p5h5iwxYpyNLEHz6tmR/uYUzASNutQR5S9L2d19PUcZ
	+C8+i4OdqflVXcPw9Cx00nb7+FGPbiWQynWSpRrUdQU0skUf9VYvX21rztkTeNaoFPvS0BuOk6lTy
	Soqvg5hoSDuebpQtbmGhFf4L43tOMNk+lC9h9Ktyn4EcQ6fyHC/NX1xxxEe2rXxzIE9u8HERWM9yi
	HJiiVrtz7n2dzBsl9KqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSa-0000000F1G6-3PFM;
	Tue, 14 Oct 2025 03:12:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSX-0000000F1EU-2d8V
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12B0F62150;
	Tue, 14 Oct 2025 03:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1139C116D0;
	Tue, 14 Oct 2025 03:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760411540;
	bh=uj0E2jTaczy5H/DyUV24AyFpvMVsr+233ShE7T89wmo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ALBNeGkLJTFY1jgSp4K6oAFfbkHpD9tdZxGFMiR3IPkX+sgB9NtDJhJLoO4P132vN
	 U2zU+qRz9Zft0fNd65qoy0AxFpKn5Ndz5sl7PGXfF3h+J7XR6VemWHdzxus3616zc0
	 jFABcwh2Mcqk5N76lGSN1LUOHc9RyLCgVyX81Sxc5gm3I4Zmv571YePxwnDxgjLvnW
	 Q7PdRWRJE4LRw2cjZMsKyhdHS+fDiO0bgnNmtxXi2R+ivK6kEt7R4EYwttn3vtfaVX
	 asMMHF/rND0zyghKjte/EMshH4SP9hr1iTPmxzDAqLdczM/Xe/NxZHpFkkIn8BfwSR
	 jvOwARhLtxN0g==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 13 Oct 2025 20:11:54 -0700
Subject: [PATCH v3 2/8] dt-bindings: riscv: Add Tenstorrent Blackhole
 compatible
MIME-Version: 1.0
Message-Id: <20251013-tt-bh-dts-v3-2-9f058d4bbbda@oss.tenstorrent.com>
References: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
In-Reply-To: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Nicholas Piggin <npiggin@oss.tenstorrent.com>, 
 Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Drew Fustini <dfustini@oss.tenstorrent.com>, Paul Walmsley <pjw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Add compatibles for the Tenstorrent Blackhole SoC PCIe card.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 .../devicetree/bindings/riscv/tenstorrent.yaml     | 28 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++++++
 2 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e15359b2aab63a57765139fb5d11dc848f5e21d8
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
+  - Drew Fustini <dfustini@oss.tenstorrent.com>
+  - Joel Stanley <jms@oss.tenstorrent.com>
+
+description:
+  Tenstorrent SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Tenstorrent Blackhole PCIe card
+        items:
+          - const: tenstorrent,blackhole-card
+          - const: tenstorrent,blackhole
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..5a29636b2df010296cabead26a6f9e557747928a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22158,6 +22158,14 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V TENSTORRENT SoC SUPPORT
+M:	Drew Fustini <dfustini@oss.tenstorrent.com>
+M:	Joel Stanley <jms@oss.tenstorrent.com>
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
