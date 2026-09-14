Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1BC88E77
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJUYj7QqnoPjRsvNQovFGoQ4d0G9JJ2xLnvL86Qnse0=; b=zhcmhoPXYBtNKs
	D9/vUhdPSdbP4BATIRrs/HEw40zvWC9mzwPhxw0/8x+0h89uokT3cjKHFMj7EJGWo9qO3A82Noqlz
	lKwePeyMbTpf9+1fmH1tMqBAgmFGGVbfSM3a7g64a/WRFU2vi/ebw/gTNVSpCurVSElA1t+kilRht
	+yDRjByA/hntMmK4WiZX/sRRkJpsJmWdpni3CuOguM9hNLiK+pL/o+iH8bX6Piy37XXf3qDLUv+DP
	RiKkujIghlr0f/f5EYcVHri9nrMnwYn5rzKUDU1j6/nsAgFtajBfaS8flosXTgTAOwB0x0jW+Awzl
	i0TIIioa3mLV1LHhyIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AG-00000003sgJ-38u8;
	Mon, 14 Sep 2026 13:56:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AF-00000003sf7-05DR
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 13:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A9E343D7E;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E638C2BCFD;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=rbaaGGhMrAyh1jjBRyB+/BhoJ6jMu3hnKZff+HdRTbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J8izxaG93y+ha1k5i3DeGVpjLSd9P4Fhj7k7touXj2kOvj5Z7ZQ0qYPVB58fUSb/j
	 thDR+ZE2y8D+gN7Xod552E8H34Vw4RbM7Ck1KqI2PRy8UVBJYVcqNL4TaOhVerZym1
	 DInh/f56kj7nIjF5MNZKkHqhejTkXMBbxl/zR/8mWGEH4GlyLfgwruQ2Gf0sVgNGx6
	 gKvp8/RHI9Njvib29eCzw9JSkD9T2zcL9vwQq0jhSlCiZWlrdYkOAEHQdTlljRsCbU
	 5XanB82m3Gzz9zg64spMiVYHhKauYSABfgWI34ZCo1egJGj8lGs5OmZcxLxMtb2qgB
	 cQLOtl+JT6b6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360BBC88E64;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:49 +0200
Subject: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
MIME-Version: 1.0
Message-Id: <20260914-p8700-dts-v1-1-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
In-Reply-To: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=1295;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=kuKqE2k4y4LDyGnqtj3oO0/ZCuqCwkmJo6BCsnZGNKc=;
 b=hjpmDgpH5H6bTV89dWm4yNI88HSAplU0zTEId7wlyzbd/VMhq6uaQ2u8yUUYzc40tf7c4Kz0y
 xXEvOYrF6nDBw1qeZSmCkjFYHQl3ej6nBvKpLPIsSUETgROHWybFrtr
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

GlobalFoundries acquired MIPS. All MIPS RISC-V
compatibles should be labeled with the 'gf' prefix in the future.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373433b1f48118872c46cf7bcfff276..b699935f60b96b3cfbb9c6e8ce802fcbedc52c1b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -668,6 +668,8 @@ patternProperties:
     description: Genexis BV/AB
   "^geniatech,.*":
     description: Geniatech, Inc.
+  "^gf,.*":
+    description: GlobalFoundries, Inc.
   "^giantec,.*":
     description: Giantec Semiconductor, Inc.
   "^giantplus,.*":
@@ -1104,7 +1106,7 @@ patternProperties:
   "^minix,.*":
     description: MINIX Technology Ltd.
   "^mips,.*":
-    description: MIPS Technology (deprecated, use 'mti' or 'img')
+    description: MIPS Technology (deprecated, use 'mti', 'img', or 'gf')
     deprecated: true
   "^miramems,.*":
     description: MiraMEMS Sensing Technology Co., Ltd.

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
