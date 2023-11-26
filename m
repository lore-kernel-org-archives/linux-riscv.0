Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4C8C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6l/+se5w/VHtru0eWazUqy5Vdjfvq6AXmUV5NZWkJQ=; b=bRf1Cli9i6PWSh
	ZZ5DY16GZm7yKN3RnW1osZlh09saHEMG+VRMUnQGQfT0I+JL2Cm9quPMa+J78NJKxvK3rlsDcRJx0
	nfmgE9wAG5lRqiq2NB89fxVUCQ8QmHoXkQrqzGQ8/otHLpx1EseJxuAGfdD1lUeiAYEGUB79sEETT
	4CnLdcpfiFp7zTeiG7uS2i2TEgDjbfdMbUghGMdOk7B0eXcrKua4kGkLJaWemOxqjrisDUg9Ph8cX
	f3sKwk8LN/gGh7cDfGD/c2GO6mFAIdWU0tKqRudRCl3ZT53ZoHb2rcXqegmreDgCvFsy4bnjliNZE
	UnaW2WCs7WMRG2x/potQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYY-00Ghd9-2N;
	Sun, 26 Nov 2023 23:28:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYR-00GhWc-2O
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:51 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8B8DB3F885
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041326;
	bh=3BV4Vz9z3QHFiX3Dv1bjv4P8f3k40Tur0+jRMIWhjwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=FZoeHXHWvyz/kKxWZ6nr5oB4aFa9WsY+qk3Wv8LVQj9uyUcoJgP+MSCse8L//XXhI
	 cz5BhPCDmHQYL4D9JG41A2tQA4/1QgmdoQJryJQQcshLXcgCyby1nOUidDxLkKfPTf
	 apNH1sVwOstou57IwQHut81xyexvY9oSNjjo5IS3frF64EgKmcoaygRP8+Zp3ABYNB
	 vclZhZkwl+K2ApRdAEQTuW/oAHadgakkAgDuKAfmgjI9Z6XoR+hzvtY44z5Dzbqy+V
	 uKyHdFU2I2cFHYOPF4odsIb1+dIpluTRf9Xz4LO0wkV3RxpP2TCnMEHh8KOahhT9Z1
	 PBHC7ofGKSg7g==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cfc42c748eso5815065ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041325; x=1701646125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BV4Vz9z3QHFiX3Dv1bjv4P8f3k40Tur0+jRMIWhjwA=;
        b=Ucvh8YJypPKg2RtSvu4U9i/1P943zINm+Bhn7yyhuKb2w1KKHyTc4a+ThpXMnPh+Nl
         Q+MHZDZxCop2udpf9F5W13V0zpWvaXJrBtM+FUGy8vuDiFPZN/SAOj6VJsn7soid3f/Q
         pzA5jmEwFF9od8johEh5YVu0fyLRfeRcoW3mFu9gkxDfBT6eQ+HUly+eEDeC8TGWoA1o
         VDSXtZNTqGmC3KQYQN5DA6Z8CsdP1uZ47ZIKYgB8QujPF4H94/+bffM9a9X1sYP1ouUb
         OALa0wJG5iNQR0TDu6AFuFho0RcpslkJR+k2iyqIKg7hihZ+kYL2udpEewzNBH2AhLZx
         h9rw==
X-Gm-Message-State: AOJu0YwqpFwZ9otcf58zshfkIlwLc51f7Zlgx1BAaRgDwgJrc6zJFnlL
	YNbNswVMZXc7BEhyB3oG1h2jnsot8sc5J5uRmOLog9wNd1voD+54RA5+mmmpErPwCLXsvVl1Tps
	iJSTTF/RRSOuHzF2DwCdue5IP2NGJ5WZHZkqV1FG1N2l48ieroQWcuA==
X-Received: by 2002:a17:902:efc5:b0:1cc:32b7:e5b9 with SMTP id ja5-20020a170902efc500b001cc32b7e5b9mr8690142plb.67.1701041324950;
        Sun, 26 Nov 2023 15:28:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu5REQhM9BvA/Q6QjZJDOHExkoWf96BeljpTfWoUEfeaxHnVUPLtF62hI5iumuW9CPgiN14g==
X-Received: by 2002:a17:902:efc5:b0:1cc:32b7:e5b9 with SMTP id ja5-20020a170902efc500b001cc32b7e5b9mr8690128plb.67.1701041324714;
        Sun, 26 Nov 2023 15:28:44 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:28:44 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/8] riscv: dts: starfive: Enable SD-card on JH7100 boards
Date: Mon, 27 Nov 2023 00:27:45 +0100
Message-Id: <20231126232746.264302-8-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152848_685366_FCDCC5B6 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add pinctrl and MMC device tree nodes for the SD-card on the
BeagleV Starlight and StarFive VisionFive V1 boards.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index 3af88e6970a3..adcdbbc4f57f 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -12,6 +12,7 @@
 
 / {
 	aliases {
+		mmc0 = &sdio0;
 		serial0 = &uart3;
 	};
 
@@ -108,6 +109,43 @@ GPO_I2C2_PAD_SDA_OEN,
 		};
 	};
 
+	sdio0_pins: sdio0-0 {
+		clk-pins {
+			pinmux = <GPIOMUX(54, GPO_SDIO0_PAD_CCLK_OUT,
+				  GPO_ENABLE, GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+		sdio-pins {
+			pinmux = <GPIOMUX(55, GPO_LOW, GPO_DISABLE,
+				  GPI_SDIO0_PAD_CARD_DETECT_N)>,
+				 <GPIOMUX(53,
+				  GPO_SDIO0_PAD_CCMD_OUT,
+				  GPO_SDIO0_PAD_CCMD_OEN,
+				  GPI_SDIO0_PAD_CCMD_IN)>,
+				 <GPIOMUX(49,
+				  GPO_SDIO0_PAD_CDATA_OUT_BIT0,
+				  GPO_SDIO0_PAD_CDATA_OEN_BIT0,
+				  GPI_SDIO0_PAD_CDATA_IN_BIT0)>,
+				 <GPIOMUX(50,
+				  GPO_SDIO0_PAD_CDATA_OUT_BIT1,
+				  GPO_SDIO0_PAD_CDATA_OEN_BIT1,
+				  GPI_SDIO0_PAD_CDATA_IN_BIT1)>,
+				 <GPIOMUX(51,
+				  GPO_SDIO0_PAD_CDATA_OUT_BIT2,
+				  GPO_SDIO0_PAD_CDATA_OEN_BIT2,
+				  GPI_SDIO0_PAD_CDATA_IN_BIT2)>,
+				 <GPIOMUX(52,
+				  GPO_SDIO0_PAD_CDATA_OUT_BIT3,
+				  GPO_SDIO0_PAD_CDATA_OEN_BIT3,
+				  GPI_SDIO0_PAD_CDATA_IN_BIT3)>;
+			bias-pull-up;
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
 	uart3_pins: uart3-0 {
 		rx-pins {
 			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
@@ -178,6 +216,15 @@ &osc_aud {
 	clock-frequency = <27000000>;
 };
 
+&sdio0 {
+	broken-cd;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_pins>;
+	status = "okay";
+};
+
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart3_pins>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
