Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C847C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lopF61v4UA3lgtFMEOa2QkVIQJ2sI62sElSUipB5kg=; b=QYPSAjm7pMy2C6
	WLfzDpq3GyXF8KTXHX+loIpx29ccn2zzftwwoZU+GnyJtaZApPWxhc5lbTJJdWlufwwFXt8RacHMS
	6jTwmJH9fvpFzlLaMPe+DYLiuYkCSkd0cnNeuPmJmbUq0epE7qY6HdGC/Kptu97H1N7fByPlPEVFC
	pf/FwmmZwqbP0p2S+hMaVdMgL0wq1iypNYieKZYjeVZE5zfM6JUw58zs62+pjr0fInVZbe2AVtXND
	NLgpOw/VQild6+afLracnalDBU2lXJ6+xmaiPNVQBSexW1l8yT0JW6pxqpuXAN4gRGJQKCXoyV0Im
	3DW0OvVzrukEVUz+ir0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcr-00DESs-0X;
	Wed, 15 Mar 2023 11:49:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcQ-00DE5n-1O;
	Wed, 15 Mar 2023 11:48:35 +0000
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 17C46660309C;
	Wed, 15 Mar 2023 11:48:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880913;
	bh=6pqu3NDjc0PwaN3joTu3NO3Kk2EBCYyro6X+vJLjVkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRxoi833KkHvxVBXpNgcE/nS0/8dGbO3nBJ1IW/z5FNo1SJUwG+vus1+H9vEOJSWR
	 c30iR6HQuU20JCegfmmid5Vwu1+VP9YV2r7xHB6N6gBbuzvmgRQxWLOGSHG1BIlYeE
	 q+tLxUmBNQ4OAX22lPfe2iFe9l0oNOaQRW0mkS9hqhF6lle1KJVwJ6iiacicEAFlyS
	 kBdWP1tzt8uV77fJygdITAP1zwd5nm+ZAR56EN0yBrB54CtHR79N+Xl6YJTv6hZ8Eu
	 lw6Jl5zngqKffcmJR7cMu8MIANEFmMOolsdOneIae0gOjw5M6DYahzZHMYUVS+5h5M
	 G5R32UMTS8d3Q==
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
Subject: [PATCH 07/11] ASoC: dt-bindings: rockchip: Add compatible for RK3588
Date: Wed, 15 Mar 2023 13:48:02 +0200
Message-Id: <20230315114806.3819515-8-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044834_613902_D7116C42 
X-CRM114-Status: UNSURE (   9.65  )
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

Add new compatible string for the Rockchip I2S/PCM controller found on
RK3588 and RK3588S SoCs.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index c32b4750651c..fcb01abffa97 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3366-i2s
               - rockchip,rk3368-i2s
               - rockchip,rk3399-i2s
+              - rockchip,rk3588-i2s
               - rockchip,rv1126-i2s
           - const: rockchip,rk3066-i2s
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
