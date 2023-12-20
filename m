Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412D6C46CD8
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 00:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoYQ2r8NJyc7Ay1FOtP3WVZ1edb/uduVo8YgrGQ8/7s=; b=Axxu/3l2hws0LY
	sV4uDSh5UD5JysBO5ddFLyPLEHqNkC5z/uoA2KCd6PwU27oZ7cxQ1F+BeAL5DS3aw4rBiNIL9+5hv
	Qn9a/fd6S2SPz7AC/5wIDCRUU4nMpX4ih4Sh79j77NTOcsgfOiCmjAStrB/yRD6fTfgipwzJrcuZJ
	tZkISqg8lK+L/dxlCPqp/KROrsNrNq+5tcsePKO/sIIz+FIB1H7cixXTtujkRKA24qIJ0f3vKVn3c
	R8E5J0KUo0Vq3QD9sL+OJ+KO9+TjnMt3zjg0It6+UbexxetWgXCshdSW/ervBr2gbG8BIp1QwkphA
	lUXo7RCDJBC0ePrboTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFkja-00FpOz-2i;
	Wed, 20 Dec 2023 00:46:50 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFkjV-00FpNV-39
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 00:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703033204;
	bh=OdCa0bJJOOeITr5EtC9lvLzxDU9C8umk+Ilz1CYCX5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ov/nL7Fhe+QrtaboWTpCxEKk2voIsB4F2H9DSoSSdtIZ7RznROgHiNRVdTdypwbhm
	 6A9KwxnkXcS+mTP4kgvhQvoc1FpuhzMCRy5le1vxro0sSE5puJnA0+W//qp86vGiWe
	 CVk8Eu5Y8IUpzzteva65rrCxA6cS2a0WseyGTcAL5XrAekg38oqSNIS3In/CrkP7XR
	 PT5YDJmHuJ5RX60A+3xyOAHXB3YyDKoSn6PCh2+aaS0+DK4vwlsOOot5eMHr71QdjI
	 xmY7ratLpVOLF1CMWhpSin8dvlELeQuf/bPso0YimRqBcUymxaujNZenlMWL2N4d0J
	 yd9fqJAX5bm4w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 959723781FA4;
	Wed, 20 Dec 2023 00:46:44 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v5 3/4] riscv: dts: starfive: visionfive-v1: Setup ethernet phy
Date: Wed, 20 Dec 2023 02:46:36 +0200
Message-ID: <20231220004638.2463643-4-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com>
References: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_164646_142867_B2773559 
X-CRM114-Status: GOOD (  12.85  )
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

The StarFive VisionFive V1 SBC uses a Motorcomm YT8521 PHY supporting
RGMII-ID, but requires manual adjustment of the RX internal delay to
work properly.

The default RX delay provided by the driver is 1.95 ns, which proves to
be too high. Applying a 50% reduction seems to mitigate the issue.

Also note this adjustment is not necessary on BeagleV Starlight SBC,
which uses a Microchip PHY.  Hence, there is no indication of a
misbehaviour on the GMAC side, but most likely the issue stems from
the Motorcomm PHY.

While at it, drop the redundant gpio include, which is already provided
by jh7100-common.dtsi.

Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../jh7100-starfive-visionfive-v1.dts         | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
index e82af72f1aaf..4e396f820660 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
+++ b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
@@ -6,7 +6,6 @@
 
 /dts-v1/;
 #include "jh7100-common.dtsi"
-#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "StarFive VisionFive V1";
@@ -18,3 +17,24 @@ gpio-restart {
 		priority = <224>;
 	};
 };
+
+/*
+ * The board uses a Motorcomm YT8521 PHY supporting RGMII-ID, but requires
+ * manual adjustment of the RX internal delay to work properly.  The default
+ * RX delay provided by the driver (1.95ns) is too high, but applying a 50%
+ * reduction seems to mitigate the issue.
+ *
+ * It is worth noting the adjustment is not necessary on BeagleV Starlight SBC,
+ * which uses a Microchip PHY.  Hence, most likely the Motorcomm PHY is the one
+ * responsible for the misbehaviour, not the GMAC.
+ */
+&mdio {
+	phy: ethernet-phy@0 {
+		reg = <0>;
+		rx-internal-delay-ps = <900>;
+	};
+};
+
+&gmac {
+	phy-handle = <&phy>;
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
