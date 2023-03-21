Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEABC6FD20
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 21:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aS7jrFIMwitY/TXqDhdo76NbDzohdsNnmSXN6wglpAo=; b=rRS8zEWusCUpix
	jgsn8zHs/7QmweD8gbtRbAKUfCPwIgXfFEt+P1q9Fp5B1yvwUl/h6uQJHlhbOKDTPQMMADPyNQvTX
	Y7MbqmKoBMFVpnPS/+Z/JKF2CURj5lUTAAaeJ4x+vXPyb0QlFzXE0dzbPGCfmBI9+2xVyaVcW6FWB
	e3L8KQ17YrHvhoNN6gm938iGRWFu6T0QyMbLbre8K2i7ksqpUqEr/XN17E+bI5Hf013yTVs3vsye7
	VpYjnuROgPDzsjtuEHkipUMoJCKUQD/JTzQVe4DLl1ZC0nQW+i31x/vC2kh9DHzHeYdnHLSJJWwp9
	sZby/PKR2HBffpqrXgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pejyJ-00Ds90-2G;
	Tue, 21 Mar 2023 21:56:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pejyD-00Ds3Z-2N;
	Tue, 21 Mar 2023 21:56:43 +0000
Received: from localhost (unknown [188.24.179.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C3DB66030D8;
	Tue, 21 Mar 2023 21:56:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679435789;
	bh=LuZwe7bTMqmCqjiHWWchmraD16aQHXj8HS9LSc1Ljfk=;
	h=From:To:Cc:Subject:Date:From;
	b=edLkylBsVvkmnZKiwqZHTkYbZEwGbNfmRImklUR10H7Mg6YnVIbOIFv1p0CQjjdAt
	 LE6eaUFJL6kBiMfjWE+78/760zRywE2C90+6P3iXPqHGB2swj7A+k4dJ89tNL4nMS4
	 N15IsfCJWCOGDYhuq+EwLL3qL7IlTH0PA3wxnVCl2uyQ8qYc0WpHDjbyTTuh819kPE
	 c8poUMEq22cd5kZVShRByIfYFj1xdIdARjZXUOpcCZ7HcZPoamnyOGcDQp+iFkm8gw
	 sKXu5EJ8Vv2hG77WmMblrybY9mDLxiMUyNAlE6eauIkFwJpF9Jvzsj0BOSFj9XBmmn
	 S86+p7khrGDRA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 00/10] Enable I2S support for RK3588/RK3588S SoCs
Date: Tue, 21 Mar 2023 23:56:14 +0200
Message-Id: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_145641_924541_69BED107 
X-CRM114-Status: GOOD (  13.36  )
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

There are five I2S/PCM/TDM controllers and two I2S/PCM controllers embedded in
the RK3588 and RK3588S SoCs. Furthermore, RK3588 provides four additional
I2S/PCM/TDM controllers.

This patch series adds the required device tree nodes to support all the above.

Additionally, it enables analog audio support for the Rock 5B SBC, which has
been used to test both audio playback and recording.

Note that some of the DT bindings fixes in this series are not particularly
related to I2S, but are required for a proper dtbs_check validation.

Changes in v2:
 - Rebased onto next-20230321 and drop patches 03-08/11 already applied by Mark
 - Replaced patch 01/11 with v2 07/10
 - Reworked patch 02/11 to v2 01-06/10
 - v1: https://lore.kernel.org/lkml/20230315114806.3819515-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (10):
  dt-bindings: serial: snps-dw-apb-uart: Switch dma-names order
  ARM: dts: sun6i: a31: Switch dma-names order for snps,dw-apb-uart
    nodes
  ARM: dts: sun8i: a23/a33: Switch dma-names order for snps,dw-apb-uart
    nodes
  ARM: dts: sun8i: v3s: Switch dma-names order for snps,dw-apb-uart
    nodes
  ARM: dts: sunxi: h3/h5: Switch dma-names order for snps,dw-apb-uart
    nodes
  riscv: dts: allwinner: d1: Switch dma-names order for snps,dw-apb-uart
    nodes
  arm64: dts: rockchip: rk3588s: Move
    assigned-clocks/assigned-clock-rates out of scmi
  arm64: dts: rockchip: rk3588s: Add I2S nodes
  arm64: dts: rockchip: rk3588: Add I2S nodes
  arm64: dts: rockchip: rk3588-rock-5b: Add analog audio

 .../bindings/serial/snps-dw-apb-uart.yaml     |   2 +-
 arch/arm/boot/dts/sun6i-a31.dtsi              |  12 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi          |  10 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi              |   6 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |   8 +-
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |  62 +++++++
 arch/arm64/boot/dts/rockchip/rk3588.dtsi      |  68 ++++++++
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 156 +++++++++++++++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +-
 9 files changed, 307 insertions(+), 29 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
