Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA8CCA476
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 02:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3omoS3ii4XoAGXisf8WnKeclYnwug9tGnEiyf+aepHY=; b=3ANNWSD4g8qkjM
	1JKp1fzKZ5/4y5O2y+jSMchqUXDAHiyk8xQAF3qLO3njzfS/ujWBzQj+/w5sPZXiQYdExtCIv8HzM
	1F8HJUPPiMhjN/eWSmmjYNH/76YDt2Fv6VDQdorxlme1zCr8G5LblyymLEJ+Ya+CMxxueT0WFsF4O
	1DOfNESLzYJIqCpEPqD1vBdhZTsxa8WqSvtcLdwOEvwPaycmrAJCmKqOHiICsI2E9XftNBppAQ9To
	EXPom/MLIY1U46EAEFauSha5KbCIjPasQWs7LxJqEBgbeQUNB9NqYd1qbQEYvjYnnCRLKkRsulLC3
	P6YseUJqpFXjLplt61uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ln3-0000000B07W-16vg;
	Sun, 12 Oct 2025 02:26:29 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ln0-0000000B06X-3ct8
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 02:26:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-79af647cef2so459751b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 19:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760235986; x=1760840786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oeNoAqAwXapHedMDzgCFy5RYkdc7bA8wxszUU7mEjE=;
        b=kxknn9LkxJFwvy4UbOB3lTTi6sBRETQyHpDCwWbqN3RAzf/Vpw9R1Mbbg+vtGzg7nX
         fK5qfOhjHWMo7n0hLMMapnboxWm4aPLf7h1Jomr9cri5aioRLIxpSk4J37ltpeVjHpTa
         XaB88H5DYSsqhiZy04S18r0en89Crll3Uso7x8mdnZkw/Kv753ZCKbSFaJyg1O5Dy1E3
         5V+thS6FuLWgb8MX1pMhbZ2zUDwdGkEeyd8H2lhDMCvyiEM3uUGRTGqqxqMy7fPnIo/Y
         sjTbgprt5f+0YB3oKVFC7ttNcyAuU1pWcBj1E2eazt4H5l7/PjyvNDFhi34rpdZtQL9y
         50GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760235986; x=1760840786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oeNoAqAwXapHedMDzgCFy5RYkdc7bA8wxszUU7mEjE=;
        b=N8fHkpD9F36KYb1Qcs3G4a9KNEO8JolAALNh3Xi4WtkqyByoy2BLxow8YZhzOrHM03
         p7GrpyCK4bMseaDN1g/y2MX0k9XG7U/0o2Wd1JAbqT0dSsXmHgOMGZXY2WRkHKXRqRrb
         5AE3LGp1SEceRJeHC2urRaGJYYX1I6t5YvroIhrqD0HLO4eKkkWXaGWKRd98sG0aAAot
         93ADm44GT8U3iRk0Rqp3r6qCjlVpIsEWwrZDKTkJQShloIo08U2f/jHFa5I0chgRux5T
         DWl+TpMPDyIlcvhTm3qrAxKrf442ipyGlsfgP1fd6whK7C7QlHDF+Vg+edoIwkrwmhXl
         e4nA==
X-Forwarded-Encrypted: i=1; AJvYcCXGa63VCJ5nraQ8Wi6YalzqfXC6ni9B3yt4+5N0m4bISRJj+079sR2i74hebhkE7kijdYZ79xwT7C4MDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL/48NwfU0V1jN58GfrO+ESDaeG6X0EqTY6u+8cYpVK8IrqJHj
	MO4EV2sEBqyaPHdSodYKAfn3w4zRI5vrLuxaHj52nUInwRux4xQrF4pp
X-Gm-Gg: ASbGncu/S0OFvH3JlAIz4e8d4fezYE29htz4fzYPKms2fbsi3591OEDUoxLmIk14pln
	5XLjxye5zkgbLFufYKQbLzKsb9iOWAK0Qv32eqzkbEAbv+1wcAq7O8T8hjSuTVFSkPaZcG43xTR
	BCsbctDMO0S/9Hw42Miq0aQNmeaO0+YfNECwg/DBf1FiRWY6sxD+n6xxulYbi0N/SW2VqSknstu
	16sQi5re5vcMPG1xmaAfKKToQtqr9jwF49VhiVAMoQdC99m2MxtcZD+SNqMiBVFgoSuTmCF29mD
	wMUeo/PhpqX3QJiHlC+CKHMyZilGTbO6V7KOvQZShguhTq7aYxmgB8Dist2BxXCQWRV4NRIrqQF
	x0x55IUkBK9OOakPVIRbTWSfIcT+9m1gLi+WodKIlgIl+Io0yuwsVneZPIQ==
X-Google-Smtp-Source: AGHT+IE2GiIjqdXwdPD/DjVNY5FvlpNDYD6mAOE9DF+isXGRIky0pgWxkfR4Ic5vWRPwpbzzqM4c1A==
X-Received: by 2002:aa7:8892:0:b0:771:e4c6:10cc with SMTP id d2e1a72fcca58-79385324d9bmr21779339b3a.6.1760235986084;
        Sat, 11 Oct 2025 19:26:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm7180489b3a.80.2025.10.11.19.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 19:26:25 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Sun, 12 Oct 2025 10:25:53 +0800
Message-ID: <20251012022555.6240-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012022555.6240-1-looong.bin@gmail.com>
References: <20251012022555.6240-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_192626_923276_1DABD57B 
X-CRM114-Status: UNSURE (   8.70  )
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

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ccdb45498653..42303acb2b39 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -25,6 +25,32 @@ soc {
 		#size-cells = <1>;
 		ranges;

+		syscon: syscon@3000000 {
+			compatible = "sophgo,cv1800b-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy: phy@48 {
+				compatible = "sophgo,cv1800b-usb2-phy";
+				reg = <0x48 0x4>;
+				#phy-cells = <0>;
+				clocks = <&clk CLK_USB_125M>,
+					 <&clk CLK_USB_33K>,
+					 <&clk CLK_USB_12M>;
+				clock-names = "app", "stb", "lpm";
+				resets = <&rst RST_COMBO_PHY0>;
+			};
+
+			dmamux: dma-router@154 {
+				compatible = "sophgo,cv1800b-dmamux";
+				reg = <0x154 0x8>, <0x298 0x4>;
+				#dma-cells = <2>;
+				dma-masters = <&dmac>;
+			};
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x3003000 0x1000>;
--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
