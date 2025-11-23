Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A80CFD2F6
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 22:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUplwiMBsqaSfW5RuN8zbppSIlrPggj2aL+Yt3PWFWU=; b=YZBQ4G8KNKQFuJ
	XfBVObcyzFN+BjxaL92fT5mB08deNBk0Brwg1nj8Vfpy8RLVNdUNQbrnAhoW+1ZbdlgBlziAK0wRx
	K88+6vFB8xFA/sw2wlD0OpVy5XkgJ+2kA5kicqiuvWrGQmYBkU9vwucJqE1Z/oa6OkyX9gK9wLaJ4
	El8yuCSh5x+iUC6PoQbVtfnD3TX0OWP2IWDv0+DgYw3ZfE+bxtLc3HdMlcBxymfkYlH1TASG5xxhM
	ePBqjNtD3V5LxjStbHoUoJCawSoQMzCJD1E3HS1nvaL0rHi6d7ia7IX3Hm+RTW9ziGizrfWNGtIC5
	7jM9aCzMz9c+VEk3NJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIwj-0000000AlXU-1xlJ;
	Sun, 23 Nov 2025 22:52:41 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIwe-0000000AlOc-0UAh
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 22:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1763938301;
	bh=BIRwaY1UKgeXSP6eRPPWJtjYyyGPHq4tBVHneu877kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rsr+d2xO+GQkh5o+VlcLGeJVd8ziY8sUJN1f6HRbWFK6u6sX4dRNK81NE0Wsu7VBp
	 GH6nTzoyD4kNEDILaE650lH7VXJGUqCurzYjU+b26ibaQ3ALVR2LvwK5P0eBmmPJKK
	 kPVcrYTNbbXfH5i5KJAOaAinAaPGBQoHoU6pChfvz3/6m8Uy9x+KdI8ksqx4/CKSHB
	 zivCeItbY9eEjx7fdm2Ky15Bz8sH4LloMlvXr7pMomnAW7keOzzQ9vQrapb8e2rtEL
	 rJ865LNVvi0PIjyZOycoV9M2gWjJe5p0droduJ2NH8oFrKzYCgv2/i3Vwui4ZtXs38
	 0SbCpoHG6xIhQ==
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 67E25B22016C;
	Sun, 23 Nov 2025 23:51:38 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3 1/2] dt-bindings: riscv: starfive: add xunlong,orangepi-rv
Date: Sun, 23 Nov 2025 14:50:44 -0800
Message-ID: <20251123225059.49665-2-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20251123225059.49665-1-e@freeshell.de>
References: <20251123225059.49665-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_145236_359516_1CD43386 
X-CRM114-Status: UNSURE (   6.15  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

Add "xunlong,orangepi-rv" as a StarFive JH7110 SoC-based board.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: E Shattow <e@freeshell.de>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 04510341a71e..3fdeab9d8f08 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -33,6 +33,7 @@ properties:
               - pine64,star64
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
+              - xunlong,orangepi-rv
           - const: starfive,jh7110
 
 additionalProperties: true
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
