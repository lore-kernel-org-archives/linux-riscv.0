Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47839C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gVltR4N0yhk6bMVLLKR5j6mDFc6Ro3v6HgigPgiTE0=; b=lJTfiDIpb8G16c
	XiYsQvRGMKXffemc9IpRtAEXUilufrnvR39Hisw+mCeKmTcd2TwRrW2SuL1GhBE3xBXQC9JJsfqI6
	M6o0iYWgC5K30/ZUNpCAKwBuT7n6AsWV7R0PykqTJ3+9Ry49m2P/UbcYW6V/t5dPI3+nRAFS2BEXx
	ca/d5L/MVeDeKYvIraQv9mh97keGXSdCHghPEspBmAQT4/Qk4u8sEzQkja0zrwhVBjcSb3lyrsp6h
	s6P1BSQ2BW2XKTXXHU5pKLlSgmvqW0kAAjuP48/4dI6MW0xgO6hkCjyum8i4dc4Ig7F7MdIrQ/IYM
	qbOMKEpPYq7aIxm+4SlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6pL-00000008V7U-1Ijn;
	Wed, 29 Jul 2026 16:08:15 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6pH-00000008V4K-2yKq
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=17BWj7c/raIegYlq+CdzM9Q9pnzgudwKCzwNuvjl2S8=; b=ov6BZzt9KqNE+X933+2hNN1E4O
	cB30qBoFcQHRGCaW8//oSU05jKZFI7BalnFrocXMuxPSaz4BiwxYFihQq57JwbbpRh46ejJA5DAua
	Oa8kqRMegQ5PYf6QPGbLy8+lse7vHlOEOfuLi5DYU55Nl07iu/1tSLgqQGk0Rrptob7YmH/hEKHFi
	ly+C1EPjrZQvtq6NjAR0aXm7OWKM7RWz/pqRQ7LHKyyVd+q0TBF5G7iM6/gf2euAC18nBuHQHOh7u
	HWyAmhS39wFaJbtbDxhRT0HX9GHyF6V4UoF+EuospidmkGIgxv1RBENdSiCnGzk4I3a6WrooBPOot
	rsY1XJ3g==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp6pB-00000002hus-2tF2;
	Wed, 29 Jul 2026 18:08:05 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 3/4] dt-bindings: riscv: spacemit: add Milk-V Jupiter M1 compatible
Date: Wed, 29 Jul 2026 18:00:30 +0200
Message-ID: <20260729160749.1621415-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729160749.1621415-1-aurelien@aurel32.net>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_090811_749165_927F6E7D 
X-CRM114-Status: UNSURE (   9.90  )
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

Add a compatible for the M1 version of the Milk-V Jupiter board, which
use a CPU with a different packaging with improved cooling performance.
It enables the CPU to run at up to 1.8 GHz instead of 1.6 GHz.

Note that the K1 vendor kernel doesn't provide any compatible entry for
the boards, so use "milkv,jupiter-m1".

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4c..aba189b91ae35 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - milkv,jupiter-m1
               - spacemit,musepi-pro
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
