Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD74CD6E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3mKwiNfKo31vj/t9infrtA3VRaHVcnGREiZBg9tf98=; b=uZM5L8Xx/AyPry
	R1r1FSPo5plNZy3dJerMHT0Omt2RxLIALtegKaQQ+YnUWXEfhafWFWGCdQz63ZwW+t2PFccz2JTTA
	Pv4VwycoPQm4SDwsng2t41pyEkevLnV0oX7WYGIvJ2PdCMQtK3+RPwJUgEg+MOoHgHo9AXQkwOW5E
	ek+HHEGe9NvpyKtXlsOZbzLWsa+I0XThaP2LCs0xzBzhbyViEDeyANdY9BuVSjntAhD8/pHSSdGkO
	emTwzwcpEVcJTxQMUqDVFojZiC2rEKPF6SfArKUA9Ite6a4lOtk3fK/wNQJSJ3yj+kwElPhfktC1E
	/jdMil2G6NOJ490TamIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6dh-0000000Gfh5-115o;
	Thu, 04 Jun 2026 11:53:33 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6dd-0000000GffK-2BXg;
	Thu, 04 Jun 2026 11:53:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=TwoEO3Tf+vvUUTkmGVG435GOHfh4xwRHfhvZMdsM34s=;
	b=OLX4n7LtUTcS+QS2wughlOG84IJUNREBi1crLrkr+a+ff3aGWZMO1bP2Lt90fmRm5e+V4dnkPgyS1Hhnle3N8cpc81qVHAhokvH7eAbnuu5tlHXPYRUXtRrR1eFgAVS5l6wir8i+Yyxbm6w387+UYprJE3MudiNjhHpUbbRCUQ4=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Thu, 4 Jun 2026 13:53:08 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
Date: Thu,  4 Jun 2026 13:52:32 +0200
Message-ID: <20260604115241.1358528-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604115241.1358528-1-lukas.schmid@netcube.li>
References: <20260604115241.1358528-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_045329_867161_035FC9AE 
X-CRM114-Status: UNSURE (   8.14  )
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

The OpenNMC is an open replacement for APC SmartSlot management cards
based on the Nagami System-on-Module.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..8e2c9b8fe121 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -600,6 +600,7 @@ properties:
           - enum:
               - netcube,nagami-basic-carrier
               - netcube,nagami-keypad-carrier
+              - netcube,dobermann
           - const: netcube,nagami
           - const: allwinner,sun8i-t113s
 
-- 
2.47.3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
