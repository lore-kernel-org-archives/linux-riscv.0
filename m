Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E875AEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 20:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djpfVY7DD3PqQDSn9ptG/qYrIiW9KvE+OBgfgiBiT6A=; b=M16+/NcgIthFgW
	FJsZ0nQ9yGMi9MKsJpKkI11tXvqPKHcAN8N+DHUIagTebmwdJoFFkH9tWtVOp0mO/SU/CT5qMl+in
	Fyllz5mCDFZBZSckA66XF18jZLYqsiSHNRTclRSa02D49CttAOwFp0DrDui8RoXqqr0uZ7usfcySR
	tHH26vKUFgTRNMSyl6H6IrlYJqjXZXvDJ2w62TNjnZVh70avs/4dACZ6RUJzhnDzuWoro6Fr1ABKA
	uZHbhi1My12MFFFZRWOPmMFrmbQGzYbj7ZAzKkgHceAA0WAaVdx9ej/vcULheYX6vPVghdF7D26o5
	jXmohHMAJVN3KNR7LyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9u2E-00G4xx-2r;
	Thu, 15 Jun 2023 20:57:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9u2B-00G4wi-2j;
	Thu, 15 Jun 2023 20:57:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f8cc04c278so22726185e9.0;
        Thu, 15 Jun 2023 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686862653; x=1689454653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPsNG/FZ1k4UaDSBhJRqncRzudNFaZG2hOicOFjuDg0=;
        b=Lq6c3nOqJ/m4ocMF35gRFAvHKZHsdT0ZTfnmTKDlRj81mkl4S2DzbrY01Dd3MHb2vD
         LKJ97u3S6t32HPcaIzJTkSnBRFtCIckL8AlSf8FvbbsFpSZmJsjxR8HjSQ5Ne87RfOeg
         ZPKNUTpsUwA4zB0uxL2nCVlzZNtepLrIrCT8WU/S/4fcFEKFsG9CGji4LGTeLM8aiv6A
         r65sVgWOecbSgMOoDwgg4nJgtOopirkHV9raIkZOrpcLVGCHAHskpEkwBp0oChLBhBCI
         ubn5vE6xVLuNZqiEBJBRzmyDsGs5llJ/gj52BduyjC6lr5TwlGH/x/NSYa6gR3IJSosG
         PbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686862653; x=1689454653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPsNG/FZ1k4UaDSBhJRqncRzudNFaZG2hOicOFjuDg0=;
        b=bFzqn9aRbTFTJJw4JqYBhrU8oactjWS4z0HaU+Buf1v0czQIO21Sb0KvLq4OiDYceM
         zQtkinpZg3N0soOqxROvcSb8BRDD5vFtL+xv4fSAXfOk/4glcH2+S1KwrLCeTsCxB4yL
         enXCHxBi6TWCGSykxU/O1vAru1K4eck7pfohmyYUHtu2Tu9M7Bylitvs4DADO0Yz1dY4
         6SBts5aIdeoJIS4C/zPpzqImmaJxD6AtC25dQRPEFN5W0wjsXPZsHEsFlv59JZHEZkAs
         URXg6KbSJjLMx16Nh7cTcI6B9L863LZsxaTkF3N/pWNFJtWOoFXbBSBoDJS/li6Pw111
         h1IA==
X-Gm-Message-State: AC+VfDxJp0uNL0fmlzWEyGjZ7bnPu/3At7+Zg+CnY1KTvkB50XR6WWvQ
	Bn98W6Eup96JU4ZMAUBuw9U=
X-Google-Smtp-Source: ACHHUZ6G6BjLZPo9OOrHMIFog94EWcKf0LkdquMRmMdpIg/KVI+L1MZrvO92xcPAZ8zBJyiX2LWPlQ==
X-Received: by 2002:a1c:7907:0:b0:3f6:2a6:e2c with SMTP id l7-20020a1c7907000000b003f602a60e2cmr288223wme.9.1686862653373;
        Thu, 15 Jun 2023 13:57:33 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id k24-20020a7bc318000000b003f733c1129fsm176372wmj.33.2023.06.15.13.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 13:57:33 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Thu, 15 Jun 2023 23:55:22 +0300
Message-Id: <20230615205540.1803975-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615205540.1803975-1-bigunclemax@gmail.com>
References: <20230615205540.1803975-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_135735_883356_1CC76E11 
X-CRM114-Status: UNSURE (   9.70  )
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

This patch adds declaration of the general purpose ADC for D1
and T113s SoCs.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..90c79041cfba 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x1000>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <1>;
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
