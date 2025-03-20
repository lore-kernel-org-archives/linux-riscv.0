Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B48FC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/py6lahwKaeSYV/3srV411qLKW0ielXuLcqNDCX2z0=; b=aFdjjCldhX/6e5
	X9R3l95pwwnU0y8S9/CBCP2KknHKSbr0kZ5JjBHZ1/Nl+3td6ULsTE2VucBmj+LNYiylnEWnsXzwe
	lYAX+HS2lmZamrcgsqVD7KWH7O7NIfvQPJ6fPYrlx/RSynavtSWQFNH74phHeTH9zt8btNzlo8BBn
	g5xxgHTV2yjT+xghBmtAkZ61bnl3wXsOU+I92B5vVT15MKDNV6cyUvfl4Cc9P59/Kxci/mz7FZbyD
	f8dBXppfZqqiHQD6q98yqcCBZ4NJC2RKCH/wqupoLxW2wGgOsxyap22h0sEg7ZwtfjgJeJaE2g4k3
	ssOfi15iC8BvZoWMhhiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp4-0000000D6MP-41zI;
	Thu, 20 Mar 2025 19:44:58 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp2-0000000D6L4-1Kph
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 19:44:57 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-851c4ee2a37so78475139f.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499895; x=1743104695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbvEkFGBoxFLcT+B9yfnDSBEgyYVKDqcuGRDBtDVFkg=;
        b=P5Py4s6+gOANZG58daF/YP1NxMUJB5b/0YznQXVKmQrkSA+0JPyW2Gqz6yVMgagw6h
         fwp6i/r2Gf/PAVQNDPSjkLujf8FaG26kcTzGRs5G4cFUqVQLtsxSmS/H2wLjvhKmoKs2
         MK2HKtPhS/mJYCaGqGc3DaQzMA5/9VEeVVGIGWOETFdoOS12I8BYAVVNOvhEVfoyQrb3
         J2/uwf5IsWfa9ilKOiaUtut4yaA0wuEjakeVexMvlbEEIXpblQnYq4GlV/Hs7qotajKD
         98ZzNpC98b2nJ90H3plexZa1YykS7lEzVs/aBM13IUfguB8uhcAdxwyAptQK23N8Ue3U
         GRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499895; x=1743104695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbvEkFGBoxFLcT+B9yfnDSBEgyYVKDqcuGRDBtDVFkg=;
        b=NE5hfROk6vTvsgCiPWI5ML/hCIrE0XCMyvakb6xEnm/M/kebySjRdFTx1bt17Y0vlJ
         uAu7sQserN5hQv0SZuNjS+03wD3LGT3SPeM0iAgsmsfW1BhKHy54fF0Wg6OzYcz1teHF
         A5qduZLKQvawUfkzw65pcR2Xo7nnfIkBd0uFc0s8JC1ZEHJNTHxSRYGEdJE+JyMfTK1C
         yMTrAunf4mSE0mv8kYbDPfuvQZhMcNDfBuZQcB1Fqw4GgjTRMMT1IXr8o11d1Iih7/0U
         Y25aKnT4WMx6r+2rOxOXKpFFQNj8xt7/UjlwE3HYB64BazrvG6aBamBpO+OXWhCw24BV
         Bl2g==
X-Forwarded-Encrypted: i=1; AJvYcCUxCccrp5F522Xt5SHyiFWerLSHhEz2d9sre/aeTldd2ZnLUJaSl4A/XBzIVAcLg1FbGEMkZvm9HYEd0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh62A3GuesVTIC3LNdm5T9FUgyLVVDMxDmSqW7bzSM/29x1Z83
	e/2XBbJNlTLsMGi5mmRdlFwEphBShZB3/Atuwm/XkCZm+C4dSL35Oi98qsjifyg=
X-Gm-Gg: ASbGnctQx+Uv0czaEs+NRSaofdlziXMZHNODqOs/t6ugH5C6xntLw1DwJ62wz4+4Pez
	5ujE+29BeFUfz+6KEcSgH+HOWlNZpTW8M/udHne61SVuHWfC1l0Udz/UvUB70Z4AqlHYyXXNRBV
	REmjYm198/AtcT9Ze0eHnnVUq4Q5SW8R3QBErMvsA1PLNAAFNYZ9C/bUcz9fBbArOjxQaXc7bQh
	U1bOE5z76p3moDc+UpvbV4d7vQ9eqtry+ZYwCA5qF77KAVBUyzJThJ2oEVgYJE9puMSEhKvkeFo
	v/pQiSXegfOxWIse5DRE/XcVkryLtjeZoQHCI0AqEewP7iFba0hp7nx+NPB15r3fBiOCFWWgTRN
	Pe8krGzuGdu9V2A/Qet+l/WU2
X-Google-Smtp-Source: AGHT+IGXXzCTsTYwrGMy/HMGyjbx5SoB+leLTzRU46Xkm9tGDSuRbtdCaZzESNwVAKlnXLoxpwPdHw==
X-Received: by 2002:a05:6602:36c4:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-85e2ca6fff3mr65491239f.5.1742499895269;
        Thu, 20 Mar 2025 12:44:55 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:44:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Thu, 20 Mar 2025 14:44:42 -0500
Message-ID: <20250320194449.510569-2-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
References: <20250320194449.510569-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_124456_355230_2375E1C6 
X-CRM114-Status: GOOD (  10.51  )
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

There are additional SpacemiT syscon CCUs whose registers control both
clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
previously, these will initially support only resets.  They do not
incorporate power domain functionality.

Define the index values for resets associated with all SpacemiT K1
syscon nodes, including those with clocks already defined, as well as
the new ones (without clocks).

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++++++++++++++
 2 files changed, 143 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 07a6728e6f864..333c28e075b6c 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -19,6 +19,9 @@ properties:
       - spacemit,k1-syscon-apbc
       - spacemit,k1-syscon-apmu
       - spacemit,k1-syscon-mpmu
+      - spacemit,k1-syscon-rcpu
+      - spacemit,k1-syscon-rcpu2
+      - spacemit,k1-syscon-apbc2
 
   reg:
     maxItems: 1
@@ -57,13 +60,15 @@ allOf:
       properties:
         compatible:
           contains:
-            const: spacemit,k1-syscon-apbc
+            enum:
+              - spacemit,k1-syscon-apmu
+              - spacemit,k1-syscon-mpmu
     then:
-      properties:
-        "#power-domain-cells": false
-    else:
       required:
         - "#power-domain-cells"
+    else:
+      properties:
+        "#power-domain-cells": false
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/spacemit,k1-ccu.h b/include/dt-bindings/clock/spacemit,k1-ccu.h
index 4a0c7163257e3..a1e1b1fe714ce 100644
--- a/include/dt-bindings/clock/spacemit,k1-ccu.h
+++ b/include/dt-bindings/clock/spacemit,k1-ccu.h
@@ -78,6 +78,9 @@
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
 
+/*	MPMU resets	*/
+#define RST_WDT			0
+
 /*	APBC clocks	*/
 #define CLK_UART0		0
 #define CLK_UART2		1
@@ -109,6 +112,7 @@
 #define CLK_PWM17		27
 #define CLK_PWM18		28
 #define CLK_PWM19		29
+
 #define CLK_SSP3		30
 #define CLK_RTC			31
 #define CLK_TWSI0		32
@@ -180,6 +184,60 @@
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
 
+/*	APBC resets	*/
+
+#define RST_UART0		0
+#define RST_UART2		1
+#define RST_UART3		2
+#define RST_UART4		3
+#define RST_UART5		4
+#define RST_UART6		5
+#define RST_UART7		6
+#define RST_UART8		7
+#define RST_UART9		8
+#define RST_GPIO		9
+#define RST_PWM0		10
+#define RST_PWM1		11
+#define RST_PWM2		12
+#define RST_PWM3		13
+#define RST_PWM4		14
+#define RST_PWM5		15
+#define RST_PWM6		16
+#define RST_PWM7		17
+#define RST_PWM8		18
+#define RST_PWM9		19
+#define RST_PWM10		20
+#define RST_PWM11		21
+#define RST_PWM12		22
+#define RST_PWM13		23
+#define RST_PWM14		24
+#define RST_PWM15		25
+#define RST_PWM16		26
+#define RST_PWM17		27
+#define RST_PWM18		28
+#define RST_PWM19		29
+#define RST_SSP3		30
+#define RST_RTC			31
+#define RST_TWSI0		32
+#define RST_TWSI1		33
+#define RST_TWSI2		34
+#define RST_TWSI4		35
+#define RST_TWSI5		36
+#define RST_TWSI6		37
+#define RST_TWSI7		38
+#define RST_TWSI8		39
+#define RST_TIMERS1		40
+#define RST_TIMERS2		41
+#define RST_AIB			42
+#define RST_ONEWIRE		43
+#define RST_SSPA0		44
+#define RST_SSPA1		45
+#define RST_DRO			46
+#define RST_IR			47
+#define RST_TSEN		48
+#define RST_IPC_AP2AUD		49
+#define RST_CAN0		50
+
 /*	APMU clocks	*/
 #define CLK_CCI550		0
 #define CLK_CPU_C0_HI		1
@@ -244,4 +302,80 @@
 #define CLK_V2D			60
 #define CLK_EMMC_BUS		61
 
+/*	APMU resets	*/
+
+#define RST_CCIC_4X		0
+#define RST_CCIC1_PHY		1
+#define RST_SDH_AXI		2
+#define RST_SDH0		3
+#define RST_SDH1		4
+#define RST_SDH2		5
+#define RST_USBP1_AXI		6
+#define RST_USB_AXI		7
+#define RST_USB3_0		8
+#define RST_QSPI		9
+#define RST_QSPI_BUS		10
+#define RST_DMA			11
+#define RST_AES			12
+#define RST_VPU			13
+#define RST_GPU			14
+#define RST_EMMC		15
+#define RST_EMMC_X		16
+#define RST_AUDIO		17
+#define RST_HDMI		18
+#define RST_PCIE0		19
+#define RST_PCIE1		20
+#define RST_PCIE2		21
+#define RST_EMAC0		22
+#define RST_EMAC1		23
+#define RST_JPG			24
+#define RST_CCIC2PHY		25
+#define RST_CCIC3PHY		26
+#define RST_CSI			27
+#define RST_ISP_CPP		28
+#define RST_ISP_BUS		29
+#define RST_ISP			30
+#define RST_ISP_CI		31
+#define RST_DPU_MCLK		32
+#define RST_DPU_ESC		33
+#define RST_DPU_HCLK		34
+#define RST_DPU_SPIBUS		35
+#define RST_DPU_SPI_HBUS	36
+#define RST_V2D			37
+#define RST_MIPI		38
+#define RST_MC			39
+
+/*	RCPU resets	*/
+
+#define RST_RCPU_SSP0		0
+#define RST_RCPU_I2C0		1
+#define RST_RCPU_UART1		2
+#define RST_RCPU_IR		3
+#define RST_RCPU_CAN		4
+#define RST_RCPU_UART0		5
+#define RST_RCPU_HDMI_AUDIO	6
+
+/*	RCPU2 resets	*/
+
+#define RST_RCPU2_PWM0		0
+#define RST_RCPU2_PWM1		1
+#define RST_RCPU2_PWM2		2
+#define RST_RCPU2_PWM3		3
+#define RST_RCPU2_PWM4		4
+#define RST_RCPU2_PWM5		5
+#define RST_RCPU2_PWM6		6
+#define RST_RCPU2_PWM7		7
+#define RST_RCPU2_PWM8		8
+#define RST_RCPU2_PWM9		9
+
+/*	APBC2 resets	*/
+
+#define RST_APBC2_UART1		0
+#define RST_APBC2_SSP2		1
+#define RST_APBC2_TWSI3		2
+#define RST_APBC2_RTC		3
+#define RST_APBC2_TIMERS0	4
+#define RST_APBC2_KPC		5
+#define RST_APBC2_GPIO		6
+
 #endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
