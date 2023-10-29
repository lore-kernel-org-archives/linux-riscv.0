Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29157C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 04:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kO4dKWsZTvgaDPsOrsCc8KkQDykxNiHTi6y3KjgD9c=; b=Ip4FdKuK1Ov0Rp
	OQRSIluA6WVN/pF0uiZt4Q0iDWAmWMR4NdqlJs7wx3KDYHiRe3Op1dSoiUsf8s+Ow0XOjDqMOL4bQ
	IcGaOOcjbO6RxNeHIXHV/CEHrEq8ZGXpuLqqB1Hzl7tztHrh7gOfUq62ux3ZIHtOvEazB6+fsaYak
	Eju59wWN0rAhBfaexz4W166xZsjCylgczRe0UDVuVPlheeQ4oG6lDOxLbzNNNua5vSD7Dr5GF1cSX
	Ckx+cHad0sEgulMDHasypo8rv1ruyYUpqE4n/Yd6kBpFTKNUOZ1G7bK8shMIqaNgHu9jZrhoYzpd0
	vGk96iL3n+6ZeK03yeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxQH-001A8b-0d;
	Sun, 29 Oct 2023 04:29:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxP3-0019CE-2c;
	Sun, 29 Oct 2023 04:28:00 +0000
Received: from localhost (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FE22660738D;
	Sun, 29 Oct 2023 04:27:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698553676;
	bh=IawNSWO2nYKHHHriF9PdoR+WZ4Zc1Xf7Yl52QH6o0QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X8xz1amOAUhfC1grOMQOkX6TCY90OvTcGTlMMTuyLOxvgt+jCk+tlII2+qv6mUbzp
	 LjSmLIKhWkpXCnWBw1q08+h8l97XkKbjXckbJTOz8mgbVsRSnXlvxVRKhAhtS03Umc
	 4SLSJppYNagRnNboB8csnRcflTemiFfXMMRfLqPR8AdoUpL62eqp7y7o59elnkNZwc
	 dhnnjp2a+C26/ld9tNKWr//lm0ZvAemc2RXj4BYDUgRd6CjBxlOlvuj7pO7o+L9XnH
	 4diRZg6XeYYrXsy9Hp/LySve42JZFWWaFvtfevlo/im6ikISE8WvoSVm0KSbBRkiMw
	 j5f2rWmemIeiQ==
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
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive: beaglev-starlight: Enable gmac
Date: Sun, 29 Oct 2023 06:27:12 +0200
Message-ID: <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_212758_003215_E03236F3 
X-CRM114-Status: UNSURE (   8.62  )
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
RGMII-ID.

TODO: Verify if manual adjustment of the RX internal delay is needed. If
yes, add the mdio & phy sub-nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
index 7cda3a89020a..d3f4c99d98da 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
+++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
@@ -11,3 +11,8 @@ / {
 	model = "BeagleV Starlight Beta";
 	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
 };
+
+&gmac {
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
