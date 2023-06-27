Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1027EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPUWlrQPHxOgk0sVU6xTpsjHLCdfobkuQ/4OHTuKRhQ=; b=q110dj2u7ZIzVs
	YW/BO6AbeR71zr70ZWOg/0xo/xM1iZARkCCT3F22hkiuuGZDJjdhTWCyfoWRIlqMKpHTN2fKtrIKU
	9iRrjpwG69TK832MNDVo4vtAViDFtLCzY1KHmx4T96Ip9/hT+WuM/llrN/f8LMDr8cAbwJPY73LHD
	9HIxm03GVGUqsHIOpuCmVaVwJg8nkQC/KoxiSNN9qqOx2XjD9RoJFdsi69xQXAVUwgn4R34vqdHQj
	POwLcIooYsioPtIt9m2xk3T4CfYmxplMlq8Cb6dl6D2Tf5d/VoGMweK6gOSSPWMY4d6ef+WhGz1et
	53s6cT8Ai+IYkVMPPqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3zz-00CYoK-1S;
	Tue, 27 Jun 2023 08:24:31 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3zu-00CYlI-25;
	Tue, 27 Jun 2023 08:24:27 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so5798009e87.2;
        Tue, 27 Jun 2023 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687854265; x=1690446265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pjgEmaLZWbZLKm+zTsTjeEOP7/LCJvRIUhdiZyAT1I=;
        b=TE7f+u5TbI/yG0U+0SyVxyNL4Hk/MPzSwlErkUfNEC8YTRK3M1Vh7mPhmv0rZ7kfQU
         eRR7Ws9gTUZrwfagnu/E8dW7m7MXunWK65JTfquV2cc9qrwQW9GAqTjFQ/sBJX/ptFFK
         p9Awmdhm1YRA+PHkhZwDZI2+y9MP6ZXjxD5pgJe/MN5RqTZsvtkZufqCVro47pOi1WjH
         t6wKmtgRLmGI322xF27HOIye6IcvL+bV0LnBKHknVOKOxDAC+tLsgqxWFGRXVehVaDvD
         RWxTDMdvb8628zNsTAS7lxudN343CwebXvd50Aox32mctKzNVLexHf6BPNPJ39cBB48T
         vc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854265; x=1690446265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pjgEmaLZWbZLKm+zTsTjeEOP7/LCJvRIUhdiZyAT1I=;
        b=HirstDXTsOowa8FHPlCLsDeH4cB71bmuKWRnuJu0RGU1sIVK2sDbYE6lngUkefsyBW
         jfoxENJX9XbbDcJ8n6iBkpGoK3gDAoA1xOFNeAXaND1wcWSICUlcJ3szpP3IKZmZyHg7
         sHo8JpbeP7XEwvftBw0JgvOWk8oNpe7shwAkndIZQU3X4x80nSK8Wcn6YEof8a1iuHmS
         Uz+I2Xy+/Rg/rOdjFXo8y7mFL+icQ4VjTwuUIWbLvjkdiA5iE54vuB0gRTceEq5DopwT
         n+ml+eVl9ieMkBWGS20Xgr/HryNVrWndgWq8KgMWIrJfXq008btaNIgx7EjOTxq4yhrd
         /8Qg==
X-Gm-Message-State: AC+VfDxWUmFSE1K8iNiJAAVnm8QDgapYRBbc66KUaa8j/+2TvYq2hUn+
	bBf7PIgxCkp5xSYZ5MPhBw==
X-Google-Smtp-Source: ACHHUZ4vz531eTh8MoQqbWPlqMxY7J/X7ms73AZisnK4IJIfmP73nvAIsdUP/6rmmWoOTpA9+n88FQ==
X-Received: by 2002:a19:434a:0:b0:4f8:6e1d:cf98 with SMTP id m10-20020a19434a000000b004f86e1dcf98mr13755647lfj.66.1687854264719;
        Tue, 27 Jun 2023 01:24:24 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id i12-20020a056512006c00b004eb12329053sm1420673lfo.256.2023.06.27.01.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:24:24 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
	Andre Przywara <andre.przywara@arm.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Tue, 27 Jun 2023 11:23:26 +0300
Message-Id: <20230627082334.1253020-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627082334.1253020-1-privatesub2@gmail.com>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_012426_684374_EA36C131 
X-CRM114-Status: GOOD (  11.63  )
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

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..e24543b6aff7 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -127,6 +127,17 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&dcxo>,
+				 <&ccu CLK_BUS_PWM>;
+			clock-names = "hosc", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
