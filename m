Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E856FC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKnlG6aON+vHtTrxLaxGgPh/jea6jiLi6DBTsFSOsmw=; b=4XPk4iOjygzwG9
	9GV8Rqx/2MaPQHzES5bKOCj0YheEn6ZvrecaiKm75G9KLXUjozXQYzdOSo7iwY4ztg0X0bLKqX6qA
	SiufFCkKXWBPSpM9dVqRq7+yXkFclTLY28AKV/MaFxxkMcfpJqrnildfELDX3cNeENtm08NSQ9s7L
	d3zcE+Jfn3OgWhjiAxDAi5aBYU5SS8J0X2Xqp9liUVUCTa44mG3dAEjLkDKgWsaMYg6ShElr9BgIg
	qr0hI6B+LPOk+nl5JYxU6wc143wkXjX7uHfxjwj2RqmruEOEtZPh0J5hbKofGPB/cPkbNpjkSUCnW
	AwiauCynX80gzutYvxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MGF-006YGR-N0; Fri, 01 Jul 2022 19:25:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MG8-006Y8d-MN
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 19:24:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D1CCB831A9;
	Fri,  1 Jul 2022 19:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4551FC3411E;
	Fri,  1 Jul 2022 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656703493;
	bh=GQBZkYsOARLee0LoWUcB5KK1izgdhhT3qdxeMqPT9Js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dj44/KsDsj9XCsKlI0DYZVNdzzBwOR1+6l6nZKtgV32waooME0H55JVPqqGngOxeZ
	 /haG+mvmWd90gDOODN5oXUN7hxE9/mfPigkQIAvxorJzI+EOLFq6dXA8IfenN9E7ou
	 qFyHheDQXzI2/FKBLNevZzeurvxUzMKf2Qoe/MvGXtX4flvYEznJ32IgT+mVFJyjzY
	 R0SogVpw8kQHqYI3+tSQn9bKIwIkZbQvIe+vgZOs3Wy0CZDseklj+i7W8Qn3YyxVJq
	 PbxRL5tzIljlVA4aAb2mHKmQHgucMAvRIqcKAPEJ9KzAB4ylsbWQMQhaQ3F/RWVI03
	 NqiPFta0VCoPQ==
From: Conor Dooley <conor@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 13/14] riscv: dts: canaan: add specific compatible for kd233's LCD
Date: Fri,  1 Jul 2022 20:22:59 +0100
Message-Id: <20220701192300.2293643-14-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701192300.2293643-1-conor@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_122456_945007_1B51B122 
X-CRM114-Status: GOOD (  12.64  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add the recently introduced compatible for the LCD on the Canaan KD233.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 4a540158f287..b0cd0105a5bd 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -127,7 +127,7 @@ &spi0 {
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
 
 	panel@0 {
-		compatible = "ilitek,ili9341";
+		compatible = "canaan,kd233-tft", "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
 		spi-max-frequency = <10000000>;
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
