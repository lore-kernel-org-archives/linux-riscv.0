Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A51CC001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRpVDvr8h/SYjyHD3S+CnCn3dkyCbIvLO9zmMBuHNi8=; b=1QcpmMr8Q933YY
	OlgGRCGFLOH09AU1NsejayRM2p8Z8feD+9rvdrenvBEv2GQfPwY+L+QzGv2iPfUNoSPN5r/lv5X7y
	KCqLlTVb4MEnUx5WpOHn/s5mHfISckHr/XJ0KEf8pTNTIlYJmwaQ85scOWJtck+hA8ad/+MUYGmo5
	xQODAQCNzg4vxgSgBwUPIF0IyzRBkHyhf5INofJFaYj3o6ciiQ+HEk3CBQbsAJzuYBgHU0S9jS/zL
	OdYVKv4q/kFbES/X7e7geQAttuq+MX9GkJx+ua82vIzpPY7HCbxBrJTQ4KMyOGXSA1LZqJ4YQeuTS
	xLiE5IK39uim8ICc+uKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbQc-008Gue-0A;
	Sat, 15 Jul 2023 09:19:02 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbQK-008GmN-2y;
	Sat, 15 Jul 2023 09:18:46 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b8413671b9so14326091fa.1;
        Sat, 15 Jul 2023 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689412723; x=1692004723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGXcNx91+FOFHQlW/JA8pAmtg5iwHFhAAWjc2IMaFzw=;
        b=A0p7JiCUuLra608+6ERjSXwqV/tZTvAa1cvPeOKST0ZUmCc2JK1pC5KLEaP5wPoSkU
         uEEGPIJ0XQO2RYAKJ9N847nEcajRUNg94Xk/uSdIQyC9jJQSUzfq1Lu2wXItkcxmQRtC
         BnEctr0DsMWTKOoR7cctgg2fIGYSLwNzynkPYnuftACXr+Kx9VjpteGvPkwPi24Ma04T
         gpxd84zh1lDMJ5OBFFt/qG9JBK8AOf8WuaIm+Pffd1RAdc/pBuODnlSpriWI5mgkdo5P
         +XRa17SpvD1Ospa3DQ/iMIT5X45lYk3ldvFrtAsTNt2judzzsjfmHXLW2je88uabRR8e
         U0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689412723; x=1692004723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGXcNx91+FOFHQlW/JA8pAmtg5iwHFhAAWjc2IMaFzw=;
        b=CM5U5fjrLAcm20TQ+xBj4cnuFyA6SYvkwYm14TMc35/Rj/fB9vQoCu4as1lz8z/hZM
         DtGuS6eOjZ3CNr8gcOYJxI81S1IYQobNZrPK5l6qF8tOF+l9KpVySjzK2c5/uz2WjhxM
         Pkm0Rnr+v0gNzOAEC9CW53wgIsxZng502iTWcZjLODRt8QNpKaMnDR5DddGkeSTjEA8P
         PeUFQfQA8htS3XK9uPtjpl1DRXIxjiBQ8xAi8IV76Y6lAQ5/pPLuC2xDYDgyo9MIEsJc
         Rnb6yhX3qTal6k0Yhc1hxGxFkH3GrU+fdATwVhejBUF7JqleTlfkp6li2LHuSh9Y2hnL
         R8yw==
X-Gm-Message-State: ABy/qLYa6cQNpJX6w8lvRfDHWKtyiET+KAiFciqnJNlmgB8PyhV1NC+F
	HxnLJPUQz9Kh1QGFYOjD5Dk=
X-Google-Smtp-Source: APBJJlHRiGNgyATPByBHmenaTUz4eKt9rBXQerMn4f8H6CVfT4bseu8g9+BtZhxSiCB7X2oIlbbmQQ==
X-Received: by 2002:a2e:3318:0:b0:2b6:cbdb:790c with SMTP id d24-20020a2e3318000000b002b6cbdb790cmr1864605ljc.1.1689412723220;
        Sat, 15 Jul 2023 02:18:43 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a2e9891000000b002b840f283a7sm561784ljj.36.2023.07.15.02.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 02:18:42 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 4/4] riscv: dts: allwinner: d1: Add GPADC node
Date: Sat, 15 Jul 2023 12:18:16 +0300
Message-Id: <20230715091816.3074375-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715091816.3074375-1-bigunclemax@gmail.com>
References: <20230715091816.3074375-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_021844_964039_3CE35766 
X-CRM114-Status: UNSURE (   8.79  )
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

Add declaration of the general purpose ADC for D1 and T113s SoCs.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 1bb1e5cae602..d59b4acf183a 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -144,6 +144,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x400>;
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
