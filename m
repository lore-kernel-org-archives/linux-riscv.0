Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DF5C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 20:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rGh5s6B1cp7CALn0HQgToT7+WOjkfQqqV+VfHisXiI=; b=XoL8LrDdHyoEej
	IwFsGFVSWJsr+2fItan+qwI26BsxINfh3TlBPcIdf9QUKrMFz9BT5Uu9kFlrUR1H2wy+ex2BLok+n
	FGOPJA6/WkiPw08wWs4l0J37TF99x2w62UcI8eKTiefhrgeeTQjbSAHbn/MgC9cZ/JetVWl9i7JJy
	TqyipnBqKqrWKZhRLOQEVOXgnOQc9dc3V5RQGzAjS7daAyHzMwrcal9Nc7of8wd3KwnLebuJwJzmV
	RH/DpXv9H9+ZXtJy3dDDVwzuKFcfMKxBUeeieJKZzt2NbEQfkpg2Z5S7KLJGf2mC4QBvCraWk3GdU
	om88coah/2jbJrXhTyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEF05-004VFO-1X;
	Fri, 15 Dec 2023 20:41:37 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEzV-004UqO-0W;
	Fri, 15 Dec 2023 20:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702672860;
	bh=13nYBaS43Erb2zaIsqmjcCswwzKBAczeiQDmZKy/7BQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0VQUmgdONlp6DemfkgQSJY2nfgtPZUkSYhTKzKQu/ko3Cfrqz1nrkHG3GVRq/iI9/
	 MfYfLNFOoQIvbBo1uuagYJtw5sGV48VmDwoF1DEs7VHWXUwi2bYfNmOm7c6mwgB9Q8
	 bgNKswAoIUCrwoupL5SYqqef4hVreifFVilixkoLFQPnRsXdXvAzukM7SlUKOX+PTo
	 HZ+Oe2cei+aDH2mupPN3PyOtUTy/i0Ob1hEYFJy69kLG+rVWXuxO15aOWyoDPivGjf
	 HFORQoOdkT+2TiDhdQiVIXnK0fbeqDn4obOyZC8WRLup9gqSXXWalHXdSMhYg9MHzx
	 16udmEwUDGzNA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A26483781FF3;
	Fri, 15 Dec 2023 20:40:59 +0000 (UTC)
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
Subject: [PATCH v3 7/9] riscv: dts: starfive: beaglev-starlight: Setup phy reset gpio
Date: Fri, 15 Dec 2023 22:40:46 +0200
Message-ID: <20231215204050.2296404-8-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_124101_327298_B9E128E7 
X-CRM114-Status: UNSURE (   8.21  )
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
---
 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
index 7cda3a89020a..5ac9961226fc 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
+++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
@@ -11,3 +11,10 @@ / {
 	model = "BeagleV Starlight Beta";
 	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
 };
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
