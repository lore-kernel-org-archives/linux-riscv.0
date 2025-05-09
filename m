Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DB8C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dN6XCeEpzkmjA9iU56Z1MMCgKcqT2gh9zVUsXyGzyR0=; b=F4kNXyAhE1L3xG
	Kt7VLCbxmxBbdaequNWGWexThTLhqpoOevTjC7mPsOnW/qwVTYLD1wxRsUjk5BoNNuHch0KBx3Qzq
	uaRDczreI155padO7iffRKXbKQz1M/+9zLotro3bNBGSOaSzFwuUrSPnLpzkO0nYZq0UCzFszsNj0
	c/YEM82Vmi+b/6SJElB5ba9TSkweKxg8Zfqf1PMizKbMhwq6yDIi7EXUDJo09dgj2Km5PfNJPhRtT
	gK/CTI0DqjXx3Pu1tyHRU/1Hx3isRx32TfXE8Pn6xD0egul8mA2P8vuh5tZOXWzMAt227jHaI7rol
	F2o75i+nx33bShXoqHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRnO-00000004Tjn-47MJ;
	Fri, 09 May 2025 17:46:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPoQ-000000047V1-2CZy
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 15:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 015684A4F1;
	Fri,  9 May 2025 15:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2B1C4CEE4;
	Fri,  9 May 2025 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805137;
	bh=Ey0N8Z8WV5ad3C3x2v/kBHdAy3SvzAdEV7ZQGrD+8OE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NvZYkXrFNWb6IqCX1Qd+VfPGkRiIRPXfEgsn+iCWIM3hf665Y7+0UYpAYVWtHKBzB
	 JcvguNmuM6E7082wJquFAhjGTNuF3iBYAlOqyHgB+KlqmilDTQeh9yVF13z1HK+53u
	 D6Pk8ZZzFGN+8OjrvfapKt4koYRXBuHM2DKUQhCUBgJx9Dohou6VXGxyDfqXgYUW2z
	 V4JB/EZkL9nUERvpsuIKHnNPT8X87Z3NDrv/hQNSZ2gprp4CdOzCMg1ZK3TRsOHiPV
	 Orf4Fqea+6B9TFsv44mFmBLeRK/CNNCRNFMQ/zQCSrViG3Am/hX7YFlBqfO7fWOFmT
	 IOnO4mJjYAmxQ==
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
Subject: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five compatible to ax45mp
Date: Fri,  9 May 2025 16:37:57 +0100
Message-ID: <20250509-dwindle-remold-98b3d03d0631@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509-sapling-exhale-72815a023ac1@spud>
References: <20250509-sapling-exhale-72815a023ac1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Rk7A7eX4TNNlV+Xu3RQLEr/u+InzTSKghNzmZBA2UQs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlyiiGS0+TcuiVcdQ9dy3Ltmbms6efl6XrmyobW6WHHt SYu3r2uo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPhkWP4n80T+nvfH+HDT1aG /nl4UbY5U0iu7toCJ75VjVKnb1uIvmD4zeL7t7ta0kxPn+/vhf1WdpURc0XX6uTwLZn2k+Xr28f 8XAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083858_582788_1C657B7A 
X-CRM114-Status: GOOD (  11.17  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index d2cbe49f4e15f..f533bd178a9f6 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -28,6 +28,7 @@ select:
 properties:
   compatible:
     items:
+      - const: renesas,r9a07g043f-cache
       - const: andestech,ax45mp-cache
       - const: cache
 
@@ -70,7 +71,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     cache-controller@13400000 {
-        compatible = "andestech,ax45mp-cache", "cache";
+        compatible = "renesas,r9a07g043f-cache", "andestech,ax45mp-cache", "cache";
         reg = <0x13400000 0x100000>;
         interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
         cache-line-size = <64>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
