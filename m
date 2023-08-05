Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C313C001DE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7OF5NzFeIvgdR793ADeSERTSGr/Z5l6YRuO2zdpOdU=; b=UCdEhI9LGVNAh0
	ByqvlaF2RT7mnrrrAcErWo/PnOwFbpDJxEby4VbnQ+nAQgcOE7snumedjiFDLl4SSfZFb2d3jdI4a
	i/eDARVSgL+F8PeDFEG8RC5G6lGL30pFhsXXjaQljYy5+nKMjn0G+kUKHzwAdPX0JiZGVm4VnfWR/
	/toouy3hmB/in/7o0KaDTKJ3fJP/RHhoc+7H76lppUQ6RglqcsauvElSyJV6Zkjz0TvRvqlIgp4OJ
	4lBRlUHmT4XjYgC9X2PfNCj9YEVz+0nDMMbMotqoakS2oUGQ9VII9UqVl+Kk9H1sj28uCHpWeuLQO
	0JP+cfWlYpV05YSXAE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLfB-00EQvH-15;
	Sat, 05 Aug 2023 18:06:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLf5-00EQoq-1W;
	Sat, 05 Aug 2023 18:06:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-317715ec496so2751590f8f.3;
        Sat, 05 Aug 2023 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258757; x=1691863557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjaA2yNdWRxoAIXKsMRIdPQiU+5JdGf4g+hfiGSEvXE=;
        b=qYKcS/LRkaOGXq4NdDRZzuiufmfi/JdXCUCdjxwvNlMaybZDSX+xGMyEpQTIV9OZnZ
         Gp4GB7jEPbcH9CWDW84PAFwbO0TClcrL1aQj9C8N3+bq0nxcYCPolbMCJ0eeZvdBV9ay
         ZAxs/9qDf+W5rvv6Y9l+xHmmsRaC5BJEAfFMJSpt0sHRKes7er/87raNN1FouMnr0lNA
         iYYMr5A7x6LN4+vL4w4rTM6AwN9sc0kyUnxH5uI4v5kMrNw/MNjSdGEhaL4kvXojMj65
         CznA+lUQm1lfKGBNQPnmKeQYtKKcVEGKXUzGXIRDiviT6mXGGyTe0umYKJHf2Up2LKYA
         oYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258757; x=1691863557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjaA2yNdWRxoAIXKsMRIdPQiU+5JdGf4g+hfiGSEvXE=;
        b=RNjrbmwlGRLXW3n23xkYad5yV7orzisa6WgGoJc9QnkDbYiCqV2+tgvjxkSrQnQODl
         EXd31/hT2E63WLjhcMwPHn10IwSJ+dNPjBfSjD5YR89SuyClZjE9+qboh8b0Pc6Skpo5
         dhudicfGziNf9JpN8lBnpvGXhq/8vlbcpQGSFio4gL+gdaBrbl2vpM04DoGr7j2kZg6W
         LbMmgonQPtk4H/VLQc6pGyWxZJw3J8yNt85ESfO+lpmaNBL5/zyfKRgmqu8kOxH2ejmG
         vJXk1+f2XS+wAGRM3UmZBKQIEdMzhI2jtQWuZ3oikX86H3YbvuIoW2lPS77BoBC2uKuv
         YZrQ==
X-Gm-Message-State: AOJu0Yx7D+LY1llLud8XZEuo9MEHyR0+dMnJHZZ/CsLuGSzF0ehKWgOn
	e4qK1r0ki3LktoVkVa/iFas=
X-Google-Smtp-Source: AGHT+IHH4WVwBu7aihjp9nuzFtSfjcWnZEsanbwbY8snGr0wZKCSwwwsVErXaYwxTLHpE9k4p+t7Qg==
X-Received: by 2002:a5d:4447:0:b0:317:3d36:b2cd with SMTP id x7-20020a5d4447000000b003173d36b2cdmr3214277wrr.71.1691258756721;
        Sat, 05 Aug 2023 11:05:56 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:56 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 5/5] riscv: dts: allwinner: d1: Add device nodes for internal audio codec
Date: Sat,  5 Aug 2023 21:05:05 +0300
Message-Id: <20230805180506.718364-6-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_110559_544031_BCF3E18E 
X-CRM114-Status: GOOD (  10.41  )
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

Add DT nodes for the internal D1/T113s audio codec and its analog part.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 1c48bfff1715..6ceb141c3f93 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -180,6 +180,28 @@ ths: thermal-sensor@2009400 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		codec: codec@2030000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun20i-d1-codec";
+			reg = <0x02030000 0x300>;
+			interrupts = <SOC_PERIPHERAL_IRQ(25) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_AUDIO>,
+				 <&ccu CLK_AUDIO_ADC>,
+				 <&ccu CLK_AUDIO_DAC>;
+			clock-names = "apb", "adc", "dac";
+			resets = <&ccu RST_BUS_AUDIO>;
+			dmas = <&dma 7>, <&dma 7>;
+			dma-names = "rx", "tx";
+			allwinner,codec-analog-controls = <&codec_analog>;
+			status = "disabled";
+		};
+
+		codec_analog: codec-analog@2030300 {
+			compatible = "allwinner,sun20i-d1-codec-analog";
+			reg = <0x02030300 0xd00>;
+			status = "disabled";
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
