Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F868C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yk7ATO9bYO7dE6M+oZLhca0BYMhSwSKMENeFFZSmU5E=; b=psyVOAWtCrHDJV
	dMcS37ZoVt94H5ZEXFdu9Z9YCEvLl8QH7zbP1m+s51/+wdo2XtA+NRRpMT4uXygkB1Z65/19em1Qm
	2TqwbIqrO8qVnbfLhm9PAqa9G2Z0IsmqGcHfTZ9Q0LfB2NprgEXewNbAtcyKET8oFOx7/lG4MEXVc
	go6LfmSKmnQY2CvAfWdg+hSc+N8hL9yBehOEeiERZqb7Ad6yFVHCmQGuQpEz+wiNMgA1KGmZIrRse
	RXgE0J+YOdXzkDpD9LPEWgQEERo4HFiA1b25uEGKpAkaIzDuKHncZhWOo6KEXc72wS6BPvBKb7j8X
	vwW1JFGsKpVFqW9PljTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPch-00DEKc-1E;
	Wed, 15 Mar 2023 11:48:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcK-00DE22-1f;
	Wed, 15 Mar 2023 11:48:29 +0000
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31F936603097;
	Wed, 15 Mar 2023 11:48:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880907;
	bh=WmlYIXlwpuzhwVps27jROqCbyY1XeyxnNcY6/AOT2zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M9RJ6PAceWIS/F096ZRjHDj6oq/zdzauVQqUYqZFKTB41xuqK+bIYLQCdzTH7R6vj
	 EpRExyRFTXNKOIejNh0gMkOrd6TXyIGI3nrGofgMH4W6sdkyO7APNWQPnc5/cNsaA7
	 G86qX2OLQOv2jgP/mjvNUOg1a87Dd/fJXDazjiZLpvt4Gt4l7WKY/eUrvHAykmFDGi
	 fhUhlaqtnz7kT/OnyzLZvesOhgPIoG4l/T7TsCmX/oIRv/Qc5HTqPxkfAiXiTL0DOo
	 zrPAIVTNOTAP3oaZPO1vDSO36JpG19cT+BlQg7MLvsWyAvAGDx/RfTBPXHSSyQHsYH
	 WnhWObIAbXJsw==
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
Subject: [PATCH 05/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document audio graph port
Date: Wed, 15 Mar 2023 13:48:00 +0200
Message-Id: <20230315114806.3819515-6-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044828_683018_A13375C5 
X-CRM114-Status: GOOD (  11.55  )
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

Document the 'port' property to allow the Rockchip I2S TDM controller to
be used in conjunction with the audio-graph-card.

The property will be used to provide an endpoint for binding to the
other side of the audio link.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index 4c95895de75e..7d2c2991c566 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -86,6 +86,10 @@ properties:
         - tx-m
         - rx-m
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
