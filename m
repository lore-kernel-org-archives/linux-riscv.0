Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A892CCF9EE
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cCI3QmsboGeA8m+osGP5SYB0XQbRhy7BR6jGk02lJE=; b=aI8s7Q8Xorzkh/
	dc7Azl1ggFGRXt1o0P/lC1jPO/Psx5KVeLtUNL6TnJ8YDhqt410H9KzLr6uIeyeskLNQikeouPGpv
	cVYECzPnNPm4451W+j7gxWDdb8dEqNgZkrcpklZHtkZDbZtwvGXlqDXUQGeTw9h7QpGrVeZlY4SzU
	sCl66JkMF9QR9SVL4vjitK55V5AGwUrKCkZV0SfuAJQ1LhYDHOlrycQ6ye+/4gkqqcdETbLiKb07O
	3WoFTVqzlhxuF4OGLr4ohysEEhiBS+A4jYztYoM+69/w5O2OxkN5P7aaWTqSl66ubHTQTuGNaY+Do
	46tXWEnN/JCsw4isTuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGi-0000000ALCC-0iiV;
	Fri, 24 Oct 2025 19:16:08 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGe-0000000AL8w-40zA
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:16:06 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-430ccd45f19so25240705ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333364; x=1761938164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdMeTbCiZFImBLpdSseleACrRi7JJpgsujeJgyCXmeA=;
        b=WqWXyIOUQ90HtHK/spVCXFYuDtzUGhFSBjZqkUgZVWBT7aUWck/dHZq7hyjT/Bh1Jw
         EUgl4QJV3oHywqLHGqjhj6XCFyGZXmknGvoBnX0kfltTyGq3ttZ7m7Sp9pdwOmsMHdEg
         J1qr31c7OwDky71CRQJb6h1LBlnTsbYDHLVGnaxskYgofvwCPWc8wLWfGjZ8w+UHsn8q
         sYD+/CNQKGpWpCP8Q6FBz2ekPh/ckQuPFZRsm2wUs9IYgc1p+ZqJkieFvl9S0HwkpWrr
         9bdBdpK+Xuwjmxob1GXtUbFavakWbMvoy7Nnx/AGuvA4lqlMIUZilrLO5XIjrW7oqvUf
         EoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333364; x=1761938164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdMeTbCiZFImBLpdSseleACrRi7JJpgsujeJgyCXmeA=;
        b=q4ommfnF/dYJtU1WJ8zn5Z9s/b6U0I7SeWdPEDoFryo1PFbwdYI21cfvbvRvempcVm
         NbnVmfbjjQyL8Fmz/X7AfpJB7YgKoAoy8XJ1dh0JHpNJo60FG97CWqw+e5BqH0Jx4eEz
         r5DWaK6+n4nTelzQ8jLGXCq0Hi8AAEfzm1tDFq3JW6D3S42bqvhvVGCARIh7jnNEGJ88
         zMypMasozAWQNRO5U2ZUSt61KgQxHgXJ55Ckv227JG9GJxVDg5RcKdM0pCaxBc5P7dpr
         bc03H3gdLO2At1V2m9paZDAE8+ZK+FMWPPuJTlLVhGhdtX3rlmNMnP3tLCTSsN4nIlO8
         zZjA==
X-Forwarded-Encrypted: i=1; AJvYcCXkWo8X7hQCuKvlEyubJn3TL9iTgPQC8ZCnAzOP7aH/B3Rzfcw6eyB3zhNFW6ct/HUn2lX6CixBEF2b/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj7JK2jmnNs2t7uJsVH5iXKoR+dHL/3d6uTXQBQAl1TAxyIAg6
	YmGABy6/vendK6CUM8vhBbD0lzKf7ITybWFJxQaoWystTWVUOWjde7+0m/Xy7pd2jx4=
X-Gm-Gg: ASbGncskt3YpP28qKQtFyqFuf7KqsiFveoDSbDrKb98hyKAU7B/+lqjUc64OXCs+zMH
	hFJXV7G19cjAWI/IQg7/dukdsWsW4PUowJfKAZI5MC3JnQrcRsgizaKwW1o5Vpb1SLfnDh+jCth
	7zfi/I7DpKhlJUI+5kS2crFwqC74iu5wsZJqbY42ROZeDbMc2SXTOKzVtGAak3P2HM7l6KZcehi
	A479Zo4NBb+S5x07b9ANRZLr09GRu7HxsgOcguy8NyB4SwWLZUjv39GU4z4vkWYcKqdqYtduL17
	Px8yAVp8TLs5hZOce+Adytnyd8heThzJiOVutMSAehI4VbOU4KV8znv0IOF3a2s/FJ83uXseMJ/
	nOXg61fv/GgPZKPDZXnFnOOy67ZboQWf+QZir0USazGtk5VPLWhIU76PUO+GE/8PoXSR+ymMPBd
	x5Q6z10zPTa76sMSQL1qMJVSoqccRvFp54aZTgXMu1Hrc=
X-Google-Smtp-Source: AGHT+IHdac+yNZmM0pe7fb5MedOFJ085tc7Rho0L92xEnV6VaHpJ93hLc5aHoV4AFkJA7fa9m7wHzA==
X-Received: by 2002:a05:6e02:348f:b0:430:b290:b6c5 with SMTP id e9e14a558f8ab-431ebf86403mr45545195ab.30.1761333363919;
        Fri, 24 Oct 2025 12:16:03 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Frank.li@nxp.com,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
Date: Fri, 24 Oct 2025 14:15:48 -0500
Message-ID: <20251024191550.194946-9-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121605_003167_5E968330 
X-CRM114-Status: UNSURE (   9.71  )
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

Define DTS nodes to enable support for QSPI on the K1 SoC, including the
pin control configuration used.  Enable QSPI on the Banana Pi BPI-F3 board.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..02f218a16318e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -113,6 +113,12 @@ &pdma {
 	status = "okay";
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
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
