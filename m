Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C598C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tou9UkoYU86ka7IYf8zuy4se+dqp+AyfYKHDUcn0e98=; b=y3tNqztXARO+PF
	srWek55xok61D3Ftv5baJNzxnx+i1pKBjhlL2OK2u36JiP4aw/Yy/fbcEy7o4S0Uo8zYaJw+iBAgb
	8BzAbt5nRHbAKzrdFa4j1YqWdNWWdejmHviK9w4vNo5G5Y/lcTNSPf410KRmm08OpuEg2vt+sBDxT
	1Od74yzl1o3A5bhy4sVubvfjbAW7BKsbUednoBAY6nFN6TZD38JqTzDiYrfE/5VqJRqpM8VPpxf4g
	FsiXFnLKt+l1z3FYjaJNAN9ibVgLJQiQFN/uvXodumX3temREXbOsBUUO9prbIzAME4RzuXU6I0Ny
	O35QOqAlIPssUYS0rt2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLQi-00C9WY-2e;
	Mon, 18 Dec 2023 21:45:40 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLQ5-00C99G-18;
	Mon, 18 Dec 2023 21:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702935900;
	bh=HuOM7ECyvIemfEAWs07YUa5GDYXFtppCMkeuXbHE3H8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xMRMTnkWmjm5My4aEyYxW2P25j5XCxD36o4zB4JmSkNduJ7Fynp9bbcMP8KQ8iCXR
	 3YzK8ubA/jcfwOIXRBxgdLb2FjxEEVdpess4KdwQyFN/BymURC/BiFryKL/+z7IGsy
	 cRpq5UTqONLl8aXg37G0lyk9l8q5yvQUYt9N502yeLT8e17Tuw+LYu9z7FbP4tatJr
	 bdtCTd9VjsCMc7K/CMDNgIFALdbTsEQ47nx1Eg5bF+UmSMyYZQLTnNZ46tEowi6Efh
	 xpiW0LgL5v+HNgbkvbqqQ6HgmxAC7l9lG21r+HOMf7THqPEEwMUhTJywRpYBu6Pr9n
	 wouRy+uMbBwig==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D81DD37814AF;
	Mon, 18 Dec 2023 21:44:59 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v4 6/9] riscv: dts: starfive: visionfive-v1: Setup ethernet phy
Date: Mon, 18 Dec 2023 23:44:46 +0200
Message-ID: <20231218214451.2345691-7-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_134501_602431_D768CAE4 
X-CRM114-Status: GOOD (  13.79  )
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
