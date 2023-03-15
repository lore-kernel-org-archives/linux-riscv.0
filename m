Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9CCC76196
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+Tw7x3Bl7EbIXkjnHHRj0YdRgiKBRKpo68/JThO2lQ=; b=Kc/3RW9M04aUEy
	jzK9YoNGqGhvuQQI0EaRYxjR8YD+IJloP9mPgndSqzcxZqR5QoprXA4FBqhkp/TVDRNH0sm3T4ZfH
	04eCKUAxqSqyAqqu+U4MlKaYMkwb1nPna6x2/rTYQo37Znnn3+aMQh6SGjIFHsRtYwHPng5QTaiPi
	kN0Gb+2lJYV+zidXHeKAmlEmis+k0qMitU3m0GssnJT5mb6C02LfIDRegZ5JnT5sWp8LXROyF9em/
	JsH81GVuRq8E+oVe3uNM4ihVN3hGTuxn8e0wZTeObwI87GT8TbfzGoUeP4uHX9GZRIgFUWBxKG+RU
	VDmAEGA2sk0iYMFweFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPd8-00DEhx-3A;
	Wed, 15 Mar 2023 11:49:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcT-00DE88-1c;
	Wed, 15 Mar 2023 11:48:38 +0000
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 247F5660309E;
	Wed, 15 Mar 2023 11:48:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880916;
	bh=8ybPDR8xtX9t6uUcpa4UINGux8SedQXEu+GJ7EQBGX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDPrRCZUdG4hj8fpBOvt0eQFDAyrIdw9ujRofF0plHYlE14mJQGnoeA9UjOkXspNZ
	 cycgqJmTSZDf/nKyZbA4PNITrx+z18+8OOttvwiJ9ZyJc+bFd3fsOKj8dyyUGU47Ol
	 LIFEZlYkTPFEp47ic+/P7N8pSDgmCgW5LVuBtE/5xza9uUFwmWfeaLH3qjK+E93ZEX
	 TOoxqaVabUehbrnWBScz9s/6xvYLkfF64R4n+5KHwl/mIbd3LChHFM3R/q+jj/gffo
	 sppae26uX+iIgqeD9Mnfkck21bR1cBTKilXWAB1qWdWhHEF33uHJGmr8X//QNxcnb8
	 n96f9753RDe/Q==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 08/11] ASoC: rockchip: i2s: Add compatible for RK3588
Date: Wed, 15 Mar 2023 13:48:03 +0200
Message-Id: <20230315114806.3819515-9-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044837_705895_B9758544 
X-CRM114-Status: GOOD (  10.88  )
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

The Rockchip I2S driver supports the RK3588/RK3588S SoCs, hence add the
corresponding compatible string.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index a8758ad68442..2e24cc0570eb 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -659,6 +659,7 @@ static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
 	{ .compatible = "rockchip,rk3366-i2s", },
 	{ .compatible = "rockchip,rk3368-i2s", },
 	{ .compatible = "rockchip,rk3399-i2s", .data = &rk3399_i2s_pins },
+	{ .compatible = "rockchip,rk3588-i2s", },
 	{ .compatible = "rockchip,rv1126-i2s", },
 	{},
 };
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
