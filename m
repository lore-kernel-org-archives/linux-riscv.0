Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3253ECCA470
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIhg9xVoqfZL7WTLKJlxBszdPEHIERqhtv19xQKgz7s=; b=Vj023OH3N81N9Q
	YLj/sXpq9CqiAR/2K47I3VOupYvRSf4CJb42taPClcHd53x8AkjUzmBkJKm6a0zuyorymhqIP05l5
	5PSUIodq8W5RSuvddHbhCyg4zvwSCXZgMZxmvzylw32hKFSSDqPMcOmxM5h9BtRkvBCVtdlcsiMvQ
	X03nZMrLKRACtpZuaOGQ1rg0Ys0S2cGI12BPTYntIHUzdvyE0y0bB9ITSTjFDt0Jd9i1e/TuOVmrl
	os3S3oT6oJ0ZNL+Z6jvuGIUvg9XHcfJg7Mob/Xg6I8r15+d8cDI7WuvbyxXTtq1WPkHr+JDQGSeyZ
	l9BQnFae4X5AZQWoG/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seZ-00000000pfF-0vi0;
	Mon, 06 Oct 2025 21:21:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seW-00000000pdL-3L4m
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:21:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7995845E93;
	Mon,  6 Oct 2025 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FADEC116B1;
	Mon,  6 Oct 2025 21:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785712;
	bh=Je3t2wNCDHjv0HsCYHuY3bGNQq0tRVc4Yh64Ve4NzdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tqAX8OHi5MCl72Ys82Lbd+zNX+oAEwktnstM7ffEfFfvf/BBVJMNeEfsdaHlc5UAY
	 PaNVLFHV/qzR9+bx8JzrUh54x1dWC641tMtJUF9yeWuojwEDj4hNXMml2eU5LZPsEB
	 BdDSB4I8y1Ypx9SomWXljYeehYLrMPdE1v81gkTfNm551YQmkI5OheG36tRm0rzQcK
	 d2VjtomioEjlu5S9PvU6wUdbN8+xx2Z4KcGoH0fYmd1xU/JzvgHoqB9B9jmk7UdYXr
	 ysTUuo56BsRNhrGlYpbnzr+zMkFxNJsWU7JAMN6CFxLn0FMbmyogBU57ueYW5Y+l6V
	 0OedtYUPGCo0g==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Oct 2025 14:21:42 -0700
Subject: [PATCH v2 2/8] dt-bindings: riscv: Add Tenstorrent Blackhole
 compatible
MIME-Version: 1.0
Message-Id: <20251006-tt-bh-dts-v2-2-ed90dc4b3e22@oss.tenstorrent.com>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
In-Reply-To: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@oss.tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_142152_882876_E4833982 
X-CRM114-Status: GOOD (  10.39  )
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
index 97d958c945e4ffa3031590823f7a2867f577ebf3..125b5498c3bf8e689adc665fc6e975b05a484abf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21741,6 +21741,14 @@ F:	arch/riscv/boot/dts/spacemit/
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
