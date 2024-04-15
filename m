Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA7CC00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUD+b5Nu60cVMGtCuuOoVaAMTgey/gBRkrKYfh/1heE=; b=YxouzC/xqyZLpb
	GXF1JOSqf8tyYzQvz93TrpgspgYt8K6CDO6IppicgyUibyu4Ro89K8CVGZ9QFO9BMdQ7Ed3LovS4Y
	G/326S/tXw0pcEvb/b7qEdaSg/ygjwZTNiDBomeTj0JGhWpFL20KN0JS2N+ITRNmS7J9zzaDBLfba
	StU02msNJP57PB+9kSM87yJCqYfLwV0BVWSjjSSvMCvuFmENvVdGDllU5T8BOGmGQ2zE/r1ZKOYuM
	ddLcQ8FVBayKY1QDvYYd/X7Ut53VfieBoLmRJit+iX4cJf1cLY8mTERxCZs2XWILkRRZPtQja1ofy
	GtnsFakZbN9oGZrQkYHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLnN-00000008HcD-0QOX;
	Mon, 15 Apr 2024 12:50:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLnF-00000008HUK-2G8E
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 12:50:44 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 04332411E8
	for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 12:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713185437;
	bh=KmekjPunqQwx9/LdecI0/rtOQB/X9fvmAzvCggbvjQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Gx8DB9LtRLjkw7SEvI7Me+D79gd/E9mjRErDF79nemkXReawNRSHWOQY2ahsexOU9
	 hwTCOMTsKxxetw+KMi6QfxS11hrp+hDuLFVWoxxMVd3mYmugiKQgcuTI1pZ9KyqZkf
	 QiTL0+wTnof2fkpjhu0Zi1dJbUeftvF0/G4z4D+muroOF0jrdGP6CusL3tMSEbaIZR
	 RdmXVNRig5bmSuwhynQcWX/wcTA+R4XrQupOvppFTH1ILaXP+/h7WPaHnlSry+xHMG
	 e963I7NPbV+vbrqb1E2Vta5pjX/wRytZYUOTNgsCa1xssLwVh66YgAfhccjV9oN500
	 jKwC9fYQ7+yDw==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-56ff7c2a5d1so782981a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 05:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185436; x=1713790236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmekjPunqQwx9/LdecI0/rtOQB/X9fvmAzvCggbvjQY=;
        b=B/fg39OCWBMfgPUGel5cdC2xGyeD3prVPNIiJH+NXBXC83giWC1RF7caos3iH7hj+N
         VzPal40hotUEaUuloNBF8locnXKYtH3ge4E6aAGslmdNQSI9VnBSR8KpU86S1T0n5zr+
         PNATh3EPelJPqxLTpiCnETDB3fZKdeY83hLXGArfot4LrCM4xxwmHqjmjus8ErQw/ic8
         zZ7v7AjwHVz+5ZEi5a+E3kIXelr6lb4LGPth6JwdATGTtaU0cn8V04M62SsQx1X+1LEa
         3MNlt+K7hPllyczId8lZy9y8FPldC/UZLw2sNMtWstPWwypr8vEU6QS0lpitAB/kVLT2
         FkuA==
X-Gm-Message-State: AOJu0YxVKQzsWN9ozcvlprHgo5O3qVhw+xVQcMswyGA8H33PznI1uFYW
	XIj5WeiACTRU9PN9zuWbWiUbIRz/SKB4IYRaOLqYKZVjYK9ijcIgUnEyfPEBz5Mr78UETue+t5W
	0thErDXj6pHqSQAE42QUPz8lSAfHXeFRrlnqGHcDRxcUFaqL/gsXCJy+M4XkCOvY5kXs9ChVKHq
	sADtulgh0Tf2z6P0qw
X-Received: by 2002:a17:907:928a:b0:a52:3d34:bde5 with SMTP id bw10-20020a170907928a00b00a523d34bde5mr5939393ejc.1.1713185436176;
        Mon, 15 Apr 2024 05:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbDSFDAh81t4CyCpnLMRcCLXKjawAJU7twGdLHmsQPxMI6uKxYLnFjMX6oz36uGBk2vF0fng==
X-Received: by 2002:a17:907:928a:b0:a52:3d34:bde5 with SMTP id bw10-20020a170907928a00b00a523d34bde5mr5939384ejc.1.1713185435879;
        Mon, 15 Apr 2024 05:50:35 -0700 (PDT)
Received: from bojack.fritz.box (197-53-142-46.pool.kielnet.net. [46.142.53.197])
        by smtp.gmail.com with ESMTPSA id bz2-20020a1709070aa200b00a51a9eccf2asm5455573ejc.125.2024.04.15.05.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:50:35 -0700 (PDT)
From: Hannah Peuckmann <hannah.peuckmann@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Subject: [PATCH v1 1/2] riscv: dts: starfive: visionfive 2: Remove non-existing TDM hardware
Date: Mon, 15 Apr 2024 14:50:32 +0200
Message-Id: <20240415125033.86909-2-hannah.peuckmann@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415125033.86909-1-hannah.peuckmann@canonical.com>
References: <20240415125033.86909-1-hannah.peuckmann@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_055041_952877_9900536E 
X-CRM114-Status: GOOD (  11.78  )
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

This partially reverts
commit e7c304c0346d ("riscv: dts: starfive: jh7110: add the node and pins configuration for tdm")

This added device tree nodes for TDM hardware that is not actually on the
VisionFive 2 board, but connected on the 40pin header. Many different extension
boards could be added on those pins, so this should be handled by overlays
instead.
This also conflicts with the I2S node which also attempts to grab GPIO 44:

  starfive-jh7110-sys-pinctrl 13040000.pinctrl: pin GPIO44 already requested by 10090000.tdm; cannot claim for 120c0000.i2s

Fixes: e7c304c0346d ("riscv: dts: starfive: jh7110: add the node and pins configuration for tdm")
Signed-off-by: Hannah Peuckmann <hannah.peuckmann@canonical.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 40 -------------------
 1 file changed, 40 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 45b58b6f3df8..d89eef6e2633 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -622,40 +622,6 @@ GPOEN_ENABLE,
 		};
 	};
 
-	tdm_pins: tdm-0 {
-		tx-pins {
-			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
-					      GPOEN_ENABLE,
-					      GPI_NONE)>;
-			bias-pull-up;
-			drive-strength = <2>;
-			input-disable;
-			input-schmitt-disable;
-			slew-rate = <0>;
-		};
-
-		rx-pins {
-			pinmux = <GPIOMUX(61, GPOUT_HIGH,
-					      GPOEN_DISABLE,
-					      GPI_SYS_TDM_RXD)>;
-			input-enable;
-		};
-
-		sync-pins {
-			pinmux = <GPIOMUX(63, GPOUT_HIGH,
-					      GPOEN_DISABLE,
-					      GPI_SYS_TDM_SYNC)>;
-			input-enable;
-		};
-
-		pcmclk-pins {
-			pinmux = <GPIOMUX(38, GPOUT_HIGH,
-					      GPOEN_DISABLE,
-					      GPI_SYS_TDM_CLK)>;
-			input-enable;
-		};
-	};
-
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
@@ -681,12 +647,6 @@ GPOEN_DISABLE,
 	};
 };
 
-&tdm {
-	pinctrl-names = "default";
-	pinctrl-0 = <&tdm_pins>;
-	status = "okay";
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
