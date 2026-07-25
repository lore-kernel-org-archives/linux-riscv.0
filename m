Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95785C53209
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qItd88BDPno2+dhPVRyZnQ45DpoFB69aAlvA4eoqJVg=; b=klIbOjuaUeny8f
	2D6itnvXpdlBrbZxpub292ABKCGPdmJNqv36pJ5Non1P1aZGyMzhOAHY8CccRZfJnnvWwDlOSYAUx
	IoBhrLi0eFylLkoSx7CpPFpIncbjglU1izdNpX52763OZ38uV+yX5nuQK5RECeZxikDJcILMxCBVC
	kH4FpWMHr+Mqqj4xreQUgoYHggwcDIC/VQZHVLfFw5+PEcFUiP7VRRFQar/O2JBXS/FcEcElncUJz
	Hb8z44NF96G1VcD1fTt4K4UN2ojIgKzaKOTzLj2J2Jeiies3J73GIBX5oN4kdMOnyKynm5Hm6ZHyC
	7R0terD+Sc/4lX1HjIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQid-0000000HQUW-42e6;
	Sat, 25 Jul 2026 00:58:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQiY-0000000HQTL-44mo
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:58:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so13399035ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941098; x=1785545898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gUr4fQRyHAoHpwP1gqFm6NIZTzHOUhteVVgfXrJmeE=;
        b=jnPUSU9KpUCI6QLQG65hlPS9mvhCEp+KdWfZAopAnMD9Lx8kYp9ZZUgC67qPfc77lv
         2+4UOyTV07Mn/a3UNSHTsF5QUFr0DuykRSCvOF+2yLDc7RB7qYu1y8DOwkSNUnhPP1QJ
         vlo8w1taRd9FQRpz6AboLMmj8RKZI2/kEiMcl413Gi7eaPdqC42R/maLiC819yQdviVx
         udrO/zyTIPG13Neq7zty7f1OSHizwZEX8PFYO5mrW2YC+SF46geixGj6rEMNGGYtz4dZ
         YPD13NfWkA1skHd/p/syosUcYa8/sC2kjXUhlDywS5HsO8K+JQsw4oDQzS6lhKFAGFna
         8WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941098; x=1785545898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gUr4fQRyHAoHpwP1gqFm6NIZTzHOUhteVVgfXrJmeE=;
        b=LF0pLsx3dMz15U0Pf4Lrn0kTmGHkx6IBEe0jKHX1W1P+cV5XUdZkvxhCqL7G7qQsWu
         ht8QQVaBiGDxubmF1JxO/Vn6LbHPInjHc/kLmQwjqfEuapVkXTjqlmfmOwY9+ZS04/CT
         kPE7oX/6RUKt70p7w1Bh9pC+orVqI8lnpt24VMJH/jjgEg3Srx4WcH10edi/Tfml1vZe
         M7WiCcw55chGmgf/EvgYZi3wxPvIPFwyfOdvhMB49EhqGhz1+BAUbFJjz847f7cmrjXc
         wYodTV+I5YtNIu/yANpXIkSU+w0VdHala3TrukB+Ab2FlPYccN4U68pPQv7pX3Vdqvr5
         4qoA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4hqDYI6OKjlP9Z7Lu12Ruw1Ln+INUMtYBOsYhxJ/2hor0GUJnXrwtaFvcf3X9/GIgTaGyr6BTScZjsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbqKIdWIsT81BoaoBuDVroc0Em+nkOyKUZj8YY6odZ4IpfT4K0
	xh4MV7uWod9YqznQvI2G4l57WNlBu/zFcXLAUQpXsv2VOyNrlHvSg3Zo
X-Gm-Gg: AR+sD13iVsu0uQYIIo5pIIcKfp2gRgAYDGOwIQabuJmqRf8mTxdYlrNZ2POEXVs2r44
	pZYStwF3+KUPhVdAiFozNOC6RPBvmj3gf+1WPzASdS9veYwMjDOB66HWdvhy2K9yUtEZkoNhdOL
	hxZFX+0HlQoRkTWAGcYdbAByK7t+L2QWcR0FxH7YY/1cMXifmOhYz0qY4uvQIb4qP0+6GYBAtSU
	I8k/aw+CDmjXJ10kgFnP0sCZKDI7DkrldobI6vLLB3pUTYeZFTBu99Icvy2IVKDldMUoevirLqn
	3MMY1u7w+j7cbMMr54ttsWoj+090YLAdihG/vReNTMWlB4Rra8dgIBOnY2LDAAkXcXEt5b4ipEN
	b+FzBTyGfqknXAx6SG/gV3uBuuFqjmEiNGtZXEx1VEisd31gi3tNIoG9AjqQgZ6JK3J2H7i2D
X-Received: by 2002:a17:902:c402:b0:2cf:a2d2:84c0 with SMTP id d9443c01a7336-2cfde55bb4amr6478145ad.0.1784941098056;
        Fri, 24 Jul 2026 17:58:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bc68sm2289265ad.2.2026.07.24.17.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:58:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Fix phy id check for the phy on com260 board
Date: Sat, 25 Jul 2026 08:58:03 +0800
Message-ID: <20260725005804.373698-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725005804.373698-1-inochiama@gmail.com>
References: <20260725005804.373698-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_175820_901263_CCCBB0D2 
X-CRM114-Status: GOOD (  10.22  )
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

Current phy framework can not reinit the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be readed. Setting
the phy id of board com260 manually so the phy id dectection can
be skipped.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index b704b537385c..a26b18aabec1 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -174,7 +174,8 @@ &eth1 {
 
 	mdio {
 		phy1: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
