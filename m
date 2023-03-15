Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4DCC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQAJAKTJXlo9PRvL6EsxK6ukzwVGpFvn6s4VcX3lpNY=; b=HizrSdLI0m0OCn
	7/VpkoH78so4JqKGAy6/uzFD81HmZRxfHK/0+Ljfw7KZlKVXvf4qGNbZkoNjHJ/BBqZPM3q7p0Xuf
	f6W7xtEo+Nt/NcRggVcklOv/ZcjSBJ4Fj8d0bFPZrfl1o6vu7qOmLb3LZidaGPnB4uRQTm4XzlCcN
	ImK2LwuO5ZJAsTsVrfiUGTzBPaRtBfaLptg5XV+C4fSo4WEAV/A5zzC5OhcqdQsXWos+JmZXXJWWa
	DrtSOGte6+UIfFfF9YqXAmxGku338vMBS4rsm6ljLpuboVnzYarMTAICbnqxwCbLnmYa0XBZFQrsi
	rjPG6nwzgaX/PfhoynYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcW-00DEAb-0h;
	Wed, 15 Mar 2023 11:48:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcE-00DDyp-1O;
	Wed, 15 Mar 2023 11:48:23 +0000
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2435D660305A;
	Wed, 15 Mar 2023 11:48:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880901;
	bh=ZuudVlc08qJkqAcQq3C5hE5Igxbt5HAMhYKp817ykE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QnqfcjIpg5gttJFa+xtfCRjgiVBae3/YzdOmBS16b1OuDD46PK8oVxkSaACkGJBkk
	 klYXjhs5023D3QNkXny0M6lJuOwWsNPun8rClZlYAdehPDXHxPvdlylk+okNUiD4jt
	 VonMl5KJLV4eHNeiAeDOyl8S2jbBFcBcLZ31s8LtByhkGkzSsG8+vcHHyHIgb0euJE
	 Ca0t2/7YsZJ2dzSAUcIOy0EDddNaCpnfSI/7lrXovZOsMqsZEo7uE9B1UuAj/APL+Z
	 zuvAQ+GUXLkWOWrRzq8l5cEpPfnYqRXer+uUnUTOD2uryVHe9qzwLoFn6SwidkBm2u
	 NlxzqTnfY4y0w==
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
Subject: [PATCH 03/11] ASoC: dt-bindings: everest,es8316: Document audio graph port
Date: Wed, 15 Mar 2023 13:47:58 +0200
Message-Id: <20230315114806.3819515-4-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044822_597675_D81A4122 
X-CRM114-Status: GOOD (  10.90  )
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

The ES8316 codec is currently used in conjunction with audio-graph-card
to provide an endpoint for binding with the other side of the audio
link.

This is achieved via the 'port' property, which is not allowed:

  rk3399-rockpro64.dtb: codec@11: Unevaluated properties are not allowed ('port' was unexpected)

Fix the issue by documenting the missing property.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/sound/everest,es8316.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index d9f8f0c7f6bb..80cd81ecae6f 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -28,6 +28,10 @@ properties:
     items:
       - const: mclk
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
   "#sound-dai-cells":
     const: 0
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
