Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52729C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCf8CqQIDvNPpY6/ulmDSDRhlRc+fE4knFhOQQzObAA=; b=J4R9dHD9Lf3jeI
	Qq9bfP+HOfNOsea+w6pW+qRq57zJNa6O9Ai421QOFPLi8Faq1MBuKBPpF75mKK0c+GV4ghOmTvYdK
	IV0yvYLDUee1XLjj/8I29DgXlQIIa3XTYysRnUYG9TxzYZXaPMepudsv8/rTwSy2Xai/NWlnuz8LK
	MCIiMRhnl4QJx2vjJDnh0cAftb3M+xgfpDZ5BdJs6zjGJgUJuSQPX4VmtMOlDk2K/yAY+V3Sx0Eh3
	ToUQYrCJ276hzmGHzFzw7MZveT7Z3ifTdo8NtB7Rpjyrc7hxCb7G7VkZYkvKQf+PgMcALeP5RPcMq
	GP0Ewk772Vrub0GinT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcn-00DEPO-1E;
	Wed, 15 Mar 2023 11:48:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcN-00DE3m-3D;
	Wed, 15 Mar 2023 11:48:35 +0000
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 71AE4660309A;
	Wed, 15 Mar 2023 11:48:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880910;
	bh=3l0zp/LdlFnTwLt41JW6CjdpLY/f1X0Kh6X7WBAo4Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N56Z7F/RiBVINWzpvvoYirrVad1A9TUpyGEm7i+NfJFWoOj/Y5/10vl16VmApQlZj
	 mt23A5ERQqmO1IGGjT1NToReDjp4GWWU9vUYzrEC1NLSoehqJJhMfXnPk9oP11Zh7g
	 aGwFYnvJoa66clln1b9BYoGU3Hi7/k8n37Tr03oglxOnldZDUxrghaTlXZdomDxUEe
	 rlb8jYcAdxQuN9TVVoXFhZTCExbraq/To06LEjW/ZTu0PF0yw3k/Hwbpa7om9bYKim
	 7dipKtAqfH4bq2Fh0ZHqk1RLw81xtkZZuhAt6/ziE/36QokkSQX5+XWUayU5dHqtir
	 G7wTjX307s9cA==
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
Subject: [PATCH 06/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document power-domains
Date: Wed, 15 Mar 2023 13:48:01 +0200
Message-Id: <20230315114806.3819515-7-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044832_195660_2D5FFBC5 
X-CRM114-Status: UNSURE (   9.28  )
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

The binding document is missing the power-domains property. Add it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index 7d2c2991c566..7bb6c5dff786 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -90,6 +90,9 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  power-domains:
+    maxItems: 1
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
