Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A6BCCD1A7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBs/3TwhGCFb5WJbqqpTGgcGB0S1xhEvC6R2HEmnCac=; b=ieSU8FeEbTg+re
	N+XWlU4f1SDRLv7PuZ7VmNZ0K85Dfbep8oQov/f/bZZ+6Ft/Tnhj8U3syTyuTKl4WCvbcSuR8nBgN
	JVAHOw8HagYnjCgUCz4HKpXJq0IDBdh+spedSxCJB3d6L8Rb990rnCLMBcbZg5hZRMB0FSrasKKFA
	7hh2SYNBhaWaOH6zQ8t1lAmTHiJ6W/XuyaNyn2DgeapgLMhVItFCL+4gnWoe0bC9qfGKDWvtGn9w1
	dAnuq8i6LcRu0BJlAyD5Ti36QRe28zTd5KJT+yiChED4aInwaRPMhOQRt/BpR45Tc/boc9bg/N2YH
	zQjGh5WLON8oX3zUfu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt7D-0000000ENGa-12RT;
	Mon, 20 Oct 2025 16:52:11 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt79-0000000ENDV-19OI
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:52:08 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-93e9b5bafa5so75043939f.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979126; x=1761583926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME7tN0yU+7BkLvgNaV8YZoYvs3CU33grIokhdTXS5MI=;
        b=DDHH4sAUZoUGEjnyT8pxgao+SnL5PzQuZCKGP7Gd7l3qgoK2/ebYDiVo+fc6A180Jo
         7P3lE4S7LxeBOEzskdtXGPDRlOlV6jykiNglzf72Wp8JsBV+2UlphfnSEpIqhGQPdLo8
         g5k6jtExPYyNBu0yodfaQWlN29lo4tjA1brNiEXgb6lWVTUZfvEOVUwSd5scl/j4YOhB
         v73XhUPNqKRmi5UGggxzx1DDC91v6eWGs6WG6s9vNTxxAkxFmRJKoGTCgLozh7n80QsY
         bVEIzAEpWtbaGWsgCzlALyA9Bm/8auEV5LaN1+gdZx7/vYqijrbpUcm0lpJAM+b4KmJ5
         yZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979126; x=1761583926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME7tN0yU+7BkLvgNaV8YZoYvs3CU33grIokhdTXS5MI=;
        b=SmmNdKnxTJ/FLsfFVk+6KNrFYo9agZbxN2ndfkAi9KoHEG3h1j2VKlaMLwI8Z2yeYO
         0MaPAgns3cqJyqc/Bxj4S36uegGlpNrSQ95j7nZLgbfSqqyZ6H/sV3hinwDmDl32GzUS
         RrfrQhrpIO2HhmJbNwYZlpvXq/XxuK16OCqCsRjx60epJjhJSGMsxcv02IdMI21HH4JZ
         r+ky9t4qT28qhhEoPrAKFKTKkl3IcXVk+y6e6KGQShIQYksZIrfLLvCHumBIaNPY7yDe
         XDuiOo6f8S7R8EA54RtzUeOp0E1CjAQTvuCI55j4OGalS2hkvRI5cMJh9nyW80Q5eMZK
         9Now==
X-Forwarded-Encrypted: i=1; AJvYcCXqh3aJJBKq6rQ9LrBFXYaB0m3FPJ+EqqjzHV0AUJp+BAr+B88XpgAX9dHOrUTsrCtfJUO6XDqBKQAsWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzLypkMPr99cuLyduD1+IV2kbp5WIg9XklgyQ1m9CHmbR5CN6C
	Q0rbEykiFS7HsSYKfmZgElHIAuX/yMMwwIsBnJiT03L1vIfZctRqiQ+uUnbI6zcLXHI=
X-Gm-Gg: ASbGncv46UhskhaXfH7Q71V9rU8sw3LtwasL1JFHre6wk7JAD4DG877opqnoaIu/047
	BpNsHir5SFNMVpfE+wR/psKoO3tOqW1C7J/jOGtuBY7idditHzt5RmScuaWZM5oPoSrg8pQfWIB
	RKB0peoB3+V9hsvnwlzlAamMcUPE2Z1imEC/G4b6bgKCKxtOjBhXi/lfAIy74QEzk5Yu0iQXgaw
	HaOqXPRjTY4f5iLHU6MI1cHesGfH3ro3x8YmXg0HsZia0MbzlhgGYBYhn7svLmdMUD7/Cu4rcF/
	xZ4pb7C/XO25vdnvfhRbztPpKTue42YXH2/yrqQy0BplWiNcofwngZxL9zFdomJ5OhXIinzhkNZ
	ZIsjS77socR8XWtcywtiM1pyHzKtCPEiJ8S+ek/yV/nRJcqribbVIs5eHq8U9RoRNeqqqc3ARxT
	mx32vkaP6EfoWHgUZ1AI4Q0Xmy36fNzywJqFgvt2p9ua4qmoOaCBnt6iNrzAK0RgSS
X-Google-Smtp-Source: AGHT+IH2irmcbwMULie9OSrSx0zC1Cu9OY8pd1/5qlpoxwTt5tQIMKxjTuK3uX5gEo7j5Pm6IgtfPg==
X-Received: by 2002:a05:6e02:2301:b0:424:7ef5:aeb with SMTP id e9e14a558f8ab-430c526b27fmr218824855ab.17.1760979126308;
        Mon, 20 Oct 2025 09:52:06 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
Date: Mon, 20 Oct 2025 11:51:50 -0500
Message-ID: <20251020165152.666221-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095207_316077_443CB849 
X-CRM114-Status: UNSURE (   9.96  )
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

Define DTS nodes to enable support for QSPI on the K1 SoC, including
the pin control configuration used.  Enable QSPI on the Banana Pi
BPI-F3 board.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..2f3750f7fd6f3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -258,6 +258,12 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 4eef81d583f3d..e922e05ff856d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -73,6 +73,27 @@ i2c8-0-pins {
 		};
 	};
 
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K1_PADCONF(98, 0)>,    /* QSPI_DATA3 */
+				 <K1_PADCONF(99, 0)>,    /* QSPI_DATA2 */
+				 <K1_PADCONF(100, 0)>,   /* QSPI_DATA1 */
+				 <K1_PADCONF(101, 0)>,   /* QSPI_DATA0 */
+				 <K1_PADCONF(102, 0)>;   /* QSPI_CLK */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		qspi-cs1-pins {
+			pinmux = <K1_PADCONF(103, 0)>;   /* QSPI_CS1 */
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index af35f9cd64351..47f97105bff0b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -823,6 +823,22 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			qspi: spi@d420c000 {
+				compatible = "spacemit,k1-qspi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x0 0xd420c000 0x0 0x1000>,
+				      <0x0 0xb8000000 0x0 0xc00000>;
+				reg-names = "QuadSPI", "QuadSPI-memory";
+				clocks = <&syscon_apmu CLK_QSPI_BUS>,
+					 <&syscon_apmu CLK_QSPI>;
+				clock-names = "qspi_en", "qspi";
+				resets = <&syscon_apmu RESET_QSPI>,
+					 <&syscon_apmu RESET_QSPI_BUS>;
+				interrupts = <117>;
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
