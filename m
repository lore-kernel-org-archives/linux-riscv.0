Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99978D59D95
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 21:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfzGr15aMNgmO/SNidGfC40Vhbx7hL/dtt79SnfC8T8=; b=W/oWioPZTrq00R
	42PkTj5y72gIU1H8jA3MHOaiYE55+hA6sLFN7sYmo4T0GaUdlUyJUyoFUVfcmeBT52R0HFn4jYyHt
	Y4J8hCMHqtdR65T8F/gtv7xv2Pgy6rx4MJZvC0+IFHAUveWoft7Pn0kFcJzajr9HnR0F5Oe2fY5Nw
	Y5qGfbK8F8KeabX69MVTb4bGD6KkdyIpAxJBgo9AXUsFpVxCHqr/IARZlr1+yyfBYs+uoKFosgALh
	PMZQgMU9olbuYaui9W7jsTfBDijrbHhvEC8YuqkElbvth0eQRsgEs6VdzxH+x4OyuTlZOv3tXBZjj
	w23WMoMB4ntzbYsgikxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAZj-000000016o4-0D31;
	Fri, 12 Dec 2025 21:21:19 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAZg-000000016nT-2QrP
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 21:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1765574416;
	bh=3gGVTI0YI5QvXC2icpDxmS5lT2Dtp0IOC8hclERXIVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iivra8QoiwLbr+SZT3Twpi3gGTREMowRA7CH5IpFkUGmiabHpP/AtrwquNSkurAGo
	 3oKSKy3xpaUHA8WXJu8Y20QBCUky/CXZUwPTyzv1piGDmdiEMlXNzAgRxvXczivSHy
	 hleWfHMPopTW2iYSrkOkVcPnnsFJZGkkgRP+ae9UpRKuhGW+RUZKTCs/d19oi5Q5kH
	 WVDTZnQ/WDToatbQAYWIxi8LwaUgl/rDwItG9xj1W8g1bsrN5Mqy+dMJMDia9YVqpi
	 0lhOfD4C3uaPKxXCHUTufstIAlNi0b0mL35Gejvwe0LDteY9/Z0WCu2ndQtRlSKyqr
	 Aoo1GELZkC/yA==
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 33FBEB221413;
	Fri, 12 Dec 2025 22:20:13 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: riscv: starfive: Append JH-7110 SoC compatible to VisionFive 2 Lite board
Date: Fri, 12 Dec 2025 13:19:18 -0800
Message-ID: <20251212211934.135602-2-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20251212211934.135602-1-e@freeshell.de>
References: <20251212211934.135602-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_132116_774931_109E30EF 
X-CRM114-Status: UNSURE (   7.14  )
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

Append "starfive,jh7110" compatible to VisionFive 2 Lite and VisionFive 2
Lite eMMC boards in the least-compatible end of the list.

Appending "starfive,jh7110" reduces the number of compatible strings to
check in the OpenSBI platform driver. JH-7110S SoC on these boards is the
same as JH-7110 SoC however rated for thermal, voltage, and frequency
characteristics for a maximum of 1.25GHz operation.

Link to previous discussion suggesting this change:
https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com/

Fixes: 7a1e15b248d6 ("dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite board")
Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: E Shattow <e@freeshell.de>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 9253aab21518..8ba0e10b529a 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -41,6 +41,7 @@ properties:
               - starfive,visionfive-2-lite
               - starfive,visionfive-2-lite-emmc
           - const: starfive,jh7110s
+          - const: starfive,jh7110
 
 additionalProperties: true
 
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
