Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D277CD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHfg+J2CYVmwS/lAYli5wWwn7f4nP0HI+z18pDGTmrQ=; b=pv+V22cXMUty0/
	WAMZMYgl7fkYP6ZMWQKm0DWAVGttpgV3Z9F7PBGXAb34yUJQv1s6ypV5sGCImqaZh/McBf/5zmlVn
	ANo0+jxQ2O0UBWRgfhV6aq0QAhESy7K3bYR2HdiWhUNH+ePOpQ3rGz5e7XO8CZOwpIwwqNlDk4O9y
	fPg6zYiMwvVQnMsM4cr8XbgF2M+OMqT3bUcuw8E7XKUlZRTgCXVssIRkYPPoi6tiHva4xWMbkC3LW
	E21mac2MTxyJV/vfHPade8lnglngVkCarU2MvKguTleRXhnSX+tT1Dd9NQDiTmbOtW5Ee2xn2AWqU
	2+3BvIwwnTuqASxEMnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYYD-00000005zFP-1y3k;
	Thu, 14 May 2026 16:04:41 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYY8-00000005zBJ-07T1
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 16:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=qYt71o3PtWGLZ9GuEhxacyBLBwWKBmBbuhWalc9UlZ4=; b=yZhIZytsB1xa3pNk94EnYHoiXl
	BMHabjc6SKLtP8yT4m87SwMe5IY+R57HSh1hnJDfhYyg6mSZ3Gs+kpnx3ZeyIpQQP0J0YEK7uRZOI
	lEZXdzw0pEk7Xt5eP0vAp4DlQGPQgPlAhMzG3DQB9aRLhtJlE4VvgvihOCIO2xPTzS1BG8KH3B47k
	0MmjM1vJ3emDDr2yEHfowgSKClWTg2Gmk/7zX3Bec4FHZAgULWMCx9GGhQ8iXMHgFEjB/YBACtBCJ
	O7X54FdP97POO84EwtHQXV1f9/iuoXnJYwuTnGxElfJsljGTWCJOnnpzAfO7DVRDnvhUmavP2JYhy
	z4CkQRBg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNYXy-00000007W2E-3auH;
	Thu, 14 May 2026 18:04:26 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 2/4] riscv: dts: spacemit: sort aliases on Milk-V Jupiter
Date: Thu, 14 May 2026 17:56:22 +0200
Message-ID: <20260514160356.1642075-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514160356.1642075-1-aurelien@aurel32.net>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_090436_078058_B49F5EFF 
X-CRM114-Status: UNSURE (   9.33  )
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

Before adding more aliases, just sort them.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 9b1dfddf2bac5..450d28e438293 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -15,9 +15,9 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
-		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		serial0 = &uart0;
 	};
 
 	chosen {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
