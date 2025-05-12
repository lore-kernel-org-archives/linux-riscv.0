Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E153C3ABCB
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZZjS/iS2gE6cQlS306vav0gais27U0D8nHl7p1pSU0=; b=U7ANlyMN4fhMKU
	c+s26L3MiM2lhr7UrYATy23zADxUdHGsgnPi6zuX20YGWdDKjBpLz7isIJ3E8rG60ykmyjMgmwjIs
	CyOegWwPFm2LgTOkHt1nIUfaXtxshAba2+/jvFSHs264x/at+z3dWZj5XocBLKgnHVIkEYn2KtIdG
	MpFOxHBBNx88djW8jzBSPYMLgLAu9ih1hHncDWOb+ZsT8/sIzwb9PfuAkm/e2qeShq2eVkGziVUps
	zUNpaMcaF3CwZWdPv5IC+XnXumKgBLttqQJ94vinDH6cKifKQclmMRM3OvyN7MKxzDzsor75T96My
	DVr1hafrbKZbKIiTK9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU4m-00000009i12-3AN1;
	Mon, 12 May 2025 14:24:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETW9-00000009c0J-0o92
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 13:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A8B3A4D4B0;
	Mon, 12 May 2025 13:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E428DC4CEEE;
	Mon, 12 May 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747057708;
	bh=2eyQSXPPXqrOE9DTVZr2ptWdA53fkPCZ6kBRgliB/0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tVXfo23Z4KQVo8PSPZGABI8ItdK6NoPcZqmnretJ8YaxmOpzIUkC51mIZFSG6Qyol
	 j4qTj2qjATwiOveKyUsVqsXpkVnbCQ8EM6H7G5I0H47r+HEVdLgYT5v4E/JEPMBQEC
	 +gMF/IPOo+qvJ3lXkX8RpqSnoykk5u3ATGopac5U23vAuYOPgHZjNz6pWs2UHFzbNG
	 aROjXfOkz+4L5BUif9Ot+HEDCtEQ7qJps84eZg0zI++YxI6HR2hyjIeW3P+3bU0YX7
	 s2J8yRaP4AtAQpQzrCpkW9VNCQOnxf6EZG5jGRG0VhnSPJmdNG1Z/RMrINvORxcej7
	 ADhCJFpi9syvQ==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: cache: add specific RZ/Five compatible to ax45mp
Date: Mon, 12 May 2025 14:48:14 +0100
Message-ID: <20250512-sevenfold-yeah-d40078a9249e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512-daily-saga-36a3a017dd42@spud>
References: <20250512-daily-saga-36a3a017dd42@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=sAzgf7QxM5pm09G0aavl/SdXDXsl+gJHEI1v9VqIti0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmKf2Q7hCKrzzsZZgrs/jlntf5Jzra9E36WtH2d67zg8 amr6/aXdpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi1eUM/6zCA2cp/oxkK4ha vf33pf9Xk3+dW7pi9/sNrVejP1VkuJgzMny5p7x3xcHUmt+Nh6cemOFoaRWo9Ex4U4/NhKaK24t WXOcFAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_064829_297384_6336C44E 
X-CRM114-Status: GOOD (  10.92  )
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

When the binding was originally written, it was assumed that all
ax45mp-caches had the same properties etc. This has turned out to be
incorrect, as the QiLai SoC has a different number of cache-sets.

Add a specific compatible for the RZ/Five for property enforcement and
in case there turns out to be additional differences between these
implementations of the cache controller.

Acked-by: Ben Zong-You Xie <ben717@andestech.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index d2cbe49f4e15f..82668d327344e 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -28,6 +28,7 @@ select:
 properties:
   compatible:
     items:
+      - const: renesas,r9a07g043f-ax45mp-cache
       - const: andestech,ax45mp-cache
       - const: cache
 
@@ -70,7 +71,8 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     cache-controller@13400000 {
-        compatible = "andestech,ax45mp-cache", "cache";
+        compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
+                     "cache";
         reg = <0x13400000 0x100000>;
         interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
         cache-line-size = <64>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
