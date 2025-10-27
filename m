Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0959ACCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cCI3QmsboGeA8m+osGP5SYB0XQbRhy7BR6jGk02lJE=; b=rV/iT+JRcmA8jM
	jfNzWLQ3zFqXUddgD1EJvM72TFmWohpni477cN/MnZHpPV1Fv+Jhc+vkDlnR11dvZjuRaV1JzfxOe
	l1pl810/IjUwH7h4qTy1Uu3ZVK0OFIj0yMo8J3EKCGlxCIHe4/JMucG1vNcwx7/eakotmaRScDIhj
	U9cnDxsA185jrOA7t+O2Fwo4BCja+C+OHdJLpnUi+8Xw56I7nlHYt467duD/RnkbiQBjkeqcDhQR+
	icW8LO4cRjH1R9bzuFoWFsZ0KkKAgWD2IOUeqOjPP6WA1Nqn0dUYrucHYMo0MIiCTsor9YKd4pTXU
	pRy3cSV3ue6/h6xvuW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIu-0000000E2Ao-2Opp;
	Mon, 27 Oct 2025 13:30:32 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIr-0000000E25s-1WiX
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:30 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-431d65ad973so19486665ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571828; x=1762176628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdMeTbCiZFImBLpdSseleACrRi7JJpgsujeJgyCXmeA=;
        b=hxwUUgDvEHNlQV1NpewDbvBkfp/C9KXbDAOAUjMYHAtxjUqABYjVLRpUaJUmG7F8+d
         5+UIt1hgyNWs+Gfu0uTzFOe5+S2iaXiDKw3jPOI8SHDpzH7Vl/8gwfI7u56AvLMzGAtD
         DGDQHBO5viY41bMswtJ4kdXO75L288i2IcGT3OFSjrkvMUy7AMFNn0SvQ01NlwLDQ/Pm
         glClp9+0vEwOPXvCBXEz1nod2UQ6b+LBiCIHxrUI5XwFV1iocxVtCh2bNEZvWuRGUKLG
         pV1NgdgWUsQQ/wwAHZiOENO99ZfqfFiEQPfBK8y2vcdfQaOrYiWOnaqSNhmkB2h/iAyc
         yjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571828; x=1762176628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdMeTbCiZFImBLpdSseleACrRi7JJpgsujeJgyCXmeA=;
        b=p2H3dBlXH/EJUvi9CAg1ahmbE7RDxtqveuIKxbz2loVnl4Rq+hb89w2a5OsGDoNmxh
         ihhrwtEVnh1CLmJ17xZFcOurW4ZYkgsNytk+mCeeMLmb0hLteQ3sMOEUUU94et3dle4+
         BJ8ySW9w8JAqe5Qi4eAH3nGYWORsPdRQt1DH/KLGJEs+Io3Pmc+/SkpV1eNsc00Jov6d
         xHimJ9k+oUs/BnHhyPYYSIXBXqT+bvBWdOhPpOqXuSqiP0zWUPQxeXQjYkGj+WgllEpJ
         8LiQfja53pCPdbcP477nEkfais0JFfNPzMUEte8dfBT2tYtc0ley+UBnTqPd/lqUeIXS
         udhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7B8IiwwuSMIvXdmCWB2hc5TelEswHXqRliq+VIxCl5TRnIjX2Gxr1Vz1gI2p3TFhfG3R1XQog17Kmag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy18Z6RjdSHCo2LCw6AJ3fCfufhUSS10ydfvBXH4e5OEm/jI9im
	7f348UuKis8oeskU244uaaMcDf7zLc2wC2Kx+skYOcH3K5NSM1ATIMX0Nuw5D/Nqj6s=
X-Gm-Gg: ASbGncue65kTxVh+pOoOcpcYOT0vhHA8emmXQIHTjKavNkKKL7ZXTdADbLkoONjABLa
	iKsCvhzHfLsbXjFV0vrVBKXNJs2m7hvxu9+2iDXU2FAjCxGs4+4LKfn9K83rBxKw+k7nD+cSATC
	xMZCWjwLJNJukhqCmocWnIQbhocQUOgA/tfP1sOESRo6ohkroCwmo5q5UICFjUmwMSwbSo8azHq
	pNVBki1DLXFvqfn69CFgaS5WbN7lsMD6AOyhffRwIsy8+yMiXjXrOd5GPfNTHPv7Z273eJqzbZs
	EsBWRDwtl82aDnQMbWRdXQuMGXoHfD9bZVR2Y7gIbPqcxlzxR9pi3qqAUFuKT2g4dFIHSTY5zR6
	1ONp7bhlq7oTMs0Lx9riqP1ALj0pgQlSbc+cIz1v5P5dAqUJE7Wjc7xA7B8175kNG4qKCJOA2y7
	6EviufpJMMUGl8xDoJyzKW/wh77Yh37BQ+9KfJnDXrKwc=
X-Google-Smtp-Source: AGHT+IEwi0+D29qzwfaIeFc/gnHZPerYoM3xz0awvDXq4gN/Y7hOOLjB+JgF5YW9xp73OHzxinZJ2g==
X-Received: by 2002:a05:6e02:1848:b0:42f:9847:15bd with SMTP id e9e14a558f8ab-4320f860164mr590635ab.26.1761571828284;
        Mon, 27 Oct 2025 06:30:28 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:27 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	broonie@kernel.org,
	han.xu@nxp.com
Cc: Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
Date: Mon, 27 Oct 2025 08:30:06 -0500
Message-ID: <20251027133008.360237-9-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063029_474257_79C0CBAB 
X-CRM114-Status: UNSURE (   9.94  )
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
