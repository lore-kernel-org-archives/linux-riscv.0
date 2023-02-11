Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE43C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhUslUDUq+1gaF7zEYvCZcoz/MBd0tqacysgreZXdag=; b=QF8z4rHKCzquTD
	U3YNsWpDu24ZOKy9ZxlNSP+3QOkAtXuzlBctO+8noCI/ElxSMfnrj9Dyv4ViDqNUEDrVzd7xqV6Ga
	1dJNRpvDCLMoUiMFx0hvWE/u62C1oRsnRlUKx3u4c5wXDqqNCGk+QcMzP6U2N+OB8XhEDjw4N+XH9
	gmDth2rG2RtEjR029RIh2H+hafhEeVF7L92h8rIH1F+mk4FdEpqNwAKE91aZ0iDC6vKmFeW+jnjA0
	tzCxVnle/y20cn/Vrzic91pb8hjTjRmGlfjg8e835kBPMPKfklEPou04lubY3uNp/AaYDNIJ2jhy/
	R+eXs1fhLEzXUVgbuBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgg5-008ZSU-AB; Sat, 11 Feb 2023 03:35:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPt-008S1J-2t; Sat, 11 Feb 2023 03:19:10 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADB21660211A;
	Sat, 11 Feb 2023 03:19:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085547;
	bh=FVwCMHp81rng2JtkEJwcV2RSVh1OgfTEUNvp1icmEos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dexWFXzTRq4fY6EDM50+F7V73z2VMXWhD7QBI80JWZJcfL9WLO95pS5knaTIet4Bn
	 LHRer0o/Sa4OYjCRDAaJxSohSsPgyPOIQ7IrQd7CRqilfOlmiSyiLDLznR97+Lvvze
	 RdFxvm8ZhJlP6GtGQ4BuqXjan1XgBR03B9Ab0HfLNWH1MMAEC7aacNMc639Jd69SU7
	 cgseOHhJHk8yzf9GuiMTytsJdiK265EvK5oNkiJW3iYeiIei/h+OAD7jIZU8PWwkFh
	 UXNcMN+O4qHGI6Xmxf7Dn1rhHru20cxjOBkWQLJ7kSF2LNPGz4VXwuaOoLipGJI79J
	 6oPlNU5ku7JTw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 12/12] riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
Date: Sat, 11 Feb 2023 05:18:21 +0200
Message-Id: <20230211031821.976408-13-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191909_334027_ACD2008A 
X-CRM114-Status: UNSURE (   9.24  )
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

Add pinmux configuration for the DWMAC found on the JH7100 based boards
and enable the gmac DT node.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index b93ce351a90f..9927e7462e9f 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -41,7 +41,85 @@ led-ack {
 	};
 };
 
+&gmac {
+	starfive,gtxclk-dlychain = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_pins>;
+	status = "okay";
+};
+
 &gpio {
+	gmac_pins: gmac-0 {
+		gtxclk-pins {
+			pins = <PAD_FUNC_SHARE(115)>;
+			bias-pull-up;
+			drive-strength = <35>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+		miitxclk-pins {
+			pins = <PAD_FUNC_SHARE(116)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		tx-pins {
+			pins = <PAD_FUNC_SHARE(117)>,
+			       <PAD_FUNC_SHARE(119)>,
+			       <PAD_FUNC_SHARE(120)>,
+			       <PAD_FUNC_SHARE(121)>,
+			       <PAD_FUNC_SHARE(122)>,
+			       <PAD_FUNC_SHARE(123)>,
+			       <PAD_FUNC_SHARE(124)>,
+			       <PAD_FUNC_SHARE(125)>,
+			       <PAD_FUNC_SHARE(126)>;
+			bias-pull-up;
+			drive-strength = <35>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		rxclk-pins {
+			pins = <PAD_FUNC_SHARE(127)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <6>;
+		};
+		rxer-pins {
+			pins = <PAD_FUNC_SHARE(129)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		rx-pins {
+			pins = <PAD_FUNC_SHARE(128)>,
+			       <PAD_FUNC_SHARE(130)>,
+			       <PAD_FUNC_SHARE(131)>,
+			       <PAD_FUNC_SHARE(132)>,
+			       <PAD_FUNC_SHARE(133)>,
+			       <PAD_FUNC_SHARE(134)>,
+			       <PAD_FUNC_SHARE(135)>,
+			       <PAD_FUNC_SHARE(136)>,
+			       <PAD_FUNC_SHARE(137)>,
+			       <PAD_FUNC_SHARE(138)>,
+			       <PAD_FUNC_SHARE(139)>,
+			       <PAD_FUNC_SHARE(140)>,
+			       <PAD_FUNC_SHARE(141)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
 			pinmux = <GPIOMUX(62, GPO_LOW,
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
