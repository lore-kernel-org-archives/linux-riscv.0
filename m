Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E79C4706E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 21:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/6tFJRlS6Ulo1ZkXzmDJwzMNHaoQXbEmRHLHtRSfbU=; b=THnE45spBd8LV3
	LwQd6kpyw+RePRESRE2JlHNyHYweJJor3YT5ZLUYPmz4owfXYcNeZipLecU6uXuJDik+g0U+jdt44
	EL2git2CqAuAhCIe6AQ/NgdxuXNjyvduMvHExL7AoAuFbSzVs5AtLRJPJFSR9ycECXmN1wRsxSZY6
	1+os0N+0EuqZvVulb2EyiErZ4wo092JNhv6AkT3dM105fgy/yYKNH4wSm3wIvCCLfWWfC+KSfFt14
	bIqPfjTuPxXoaAehaYxVaL4IdONovM4QH3ON78uXhsYfSATU8r2RtlPHWgM1elN82AxS6OPVzekHp
	sAfF7U9U9W1GJ36IMtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3x4-000uJx-0E;
	Wed, 20 Dec 2023 21:18:02 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3wz-000uHi-31
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 21:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703107076;
	bh=37wq8EvaXAv6qpmVVQ0SX1h3lDNflSuVmabgoslzXDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/HcKx3KSSfIZx2jNlI9Jnvh+gK+4HmglWjlG2yRIfS5zpeXnoouGLXeAuHAMB/cZ
	 M1REcYuMl4N7EX6EB/s59zUw+jfUpeggxKXl2kSIMS+RwzcdPWq2Wjz8r4DxlR+SPe
	 vLJczZsC+5XNlEePfRW2MBp6i/NMHNhX9xILvywIKr87dg/BRIFqHfznMeeB6asjqq
	 ViBzoWjWLmvdNW6Hd3xEC8xu9T2+e1iuTjw2oTc94hgUK7qbBeYyBxcQloQHCpyUC1
	 3jvgNVv5ZqWK6UgRDHywtK1jhaHYElSnEc8VO2DfdiZrZR6OoS6bbR4wldB4daEBee
	 b/fHkSxP8Z+bQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A9093781FF6;
	Wed, 20 Dec 2023 21:17:56 +0000 (UTC)
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
Subject: [PATCH v6 4/4] riscv: dts: starfive: beaglev-starlight: Setup phy reset gpio
Date: Wed, 20 Dec 2023 23:17:42 +0200
Message-ID: <20231220211743.2490518-5-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
References: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_131758_100569_2EE62741 
X-CRM114-Status: UNSURE (   7.48  )
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

The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
RGMII-ID which doesn't require any particular setup, other than defining
a reset gpio, as opposed to VisionFive V1 for which the RX internal
delay had to be adjusted.

Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 .../boot/dts/starfive/jh7100-beaglev-starlight.dts    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
index 7cda3a89020a..168f5d9895a9 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
+++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
@@ -11,3 +11,14 @@ / {
 	model = "BeagleV Starlight Beta";
 	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
 };
+
+&gmac {
+	phy-handle = <&phy>;
+};
+
+&mdio {
+	phy: ethernet-phy@7 {
+		reg = <7>;
+		reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
