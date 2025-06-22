Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9667C7115A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 03:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leVC3lNKq9GrI8x3a+o37IhB5PAqCXAD/IqVN6J4ZnI=; b=fkUWI+TlPtppwc
	GqMefdGcrjUFFZGy5RgNj2QoGNhhPNeSW8ZyzMUEywHRk5qJvDVIoOTJCTzAwC6nrX2KBmq6O8CeK
	TE0R6h8lJDjePo4lgAqyMCBU4PeGd2qgJSxCFb50bIKYJZ28s6CSAokMBABZfcr5tVJLiwek+t82L
	W/TwUeg3M6PCBBmvSr9jSHbZB7xgXiY9lBabR2N787ElQQze0PsR5A8i5xysDy40zPL6a0bbbT7Lj
	eahJZCuBpvod6HQC5v/OCJ3qrkFVor0pdsJB1QAuJk8b31Eklc3dHwP8fG/t/uU1OBs7Safz1+UMM
	3p8CfvP5hFr9F6pK4Y0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBP6-00000000Tl0-2A4D;
	Sun, 22 Jun 2025 03:30:00 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBP2-00000000TiP-1gX7
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 03:29:57 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fafaa60889so19197756d6.3
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562995; x=1751167795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=zs83Qt8idPOBlaQYzyqtIjOAA+QqutLzEnLhXMCb26NLGYf4scXTCZ54ajvjz102s6
         CmuU7psApGaqhA5kPHIH9UlGoemDdwL80e0qaeIPpWi+ho3avTtYSyE+WRCLw+WdD5fT
         tXR0ixDuq29zPiku7F5XQF1uyJ6XG81jApNR9+7jtjD5PyDoCipPRXK10zESYF3ZZosk
         Y/dt/B/qDiMSnq3sxVrTpxtO8d/BXYGjrXR20W992BX+23kweWheYUgHWVqJJnGKYjOU
         Zg5EdXbZ/eA2I3onkRGn29pgKV+JJvJw8O7Cef4KRUjBv33dfnIqvtCqD9Kxp+I5kdab
         y8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562995; x=1751167795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=VkIXizGnDoOi3fenjpoQHJ9WujIb7H8YIbtNWUT5QpWIwLexevJx6FB8STwMSVOvPA
         GXd8InfFUykF48l2I6nDkDZPavRmUp0lVIoBMpHg284/LsDzc/UeGN1bf3b3ZfM2Nay+
         srqT76YIpbLpRY1P+ytxC3PtA4C06Yf7+w+G3wNpULxHhxAecUWmpwQjumD/J8820sCM
         QGkD3Ih6BcsXHdDM+AqhuI9pxJ9FYQ88l4J/kpOz3bRFpnAWf+v7tOCPfC6uc0bT1ct7
         vqBqLh1V0xLlgqzOGwbpqOpYw6VExR791yuIGNp2zWn7jGZZb96NcmMC3MxGauUnlC0w
         Jx/w==
X-Forwarded-Encrypted: i=1; AJvYcCWvFHREQwz5PoYQNGSioSLBR/TGele1bW0k2ZmC1J50dDG/pU55UbT2pN0UPoN7qcZG7T/WZeINPKIAQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkZOHZOF3zQ1qYcwqdSwYSDNs5+4IPnwalTqn7mwzx/GSLaoVB
	xuf9joldofrmsGjEnSuu9kSxTMYUNj0vJTbIC/vtKK8F4ohhhtnEFLFjtFThs5DIJ38=
X-Gm-Gg: ASbGncvZW6TfIpsUXpUTu6RvNTgdj9uwrJWBNwVma17GWkt41g5enGTNywGT+J1q9tc
	JcJe+gUbox3fx9Gr+nJeVsQT9cHco+/w/+o+tU3/ey+WWPqUrPrjeiU5gENDlUZhq6OVgmpEbko
	5wOjtbh8PIyX0F1LQB4QZZcWgirzLRG++/6jaCWPSUHu7mtg4MYfmogHl8DzqLC7OE5d/gtpn5u
	I0sAUekEtysgo5qJNMqqR91D6hBt6PBrzQVStVxicnpmqn3z7v/nqCnYLpudrMAG3BMgjF+WklB
	jJFvu36Gtdp+p4ML0qSV6A+iKoFDw3KvlEzvI8qso8s2zbkVcUjmwn+rgAa5ehAURHuply/kk2U
	uf7NmoLGY3X57JdgrsaYxxhz4Q2OsNf4R1nf5c2LndWlgsA==
X-Google-Smtp-Source: AGHT+IECbHxini7Bpk4pSil8XqWCldpFqGPbjiNx6S6FZjM9RIZ/M0w9L9+hwhK6KfptNTvkIzyZsA==
X-Received: by 2002:a05:6214:1c4d:b0:6fb:16a:da41 with SMTP id 6a1803df08f44-6fd0a31cd2fmr142653846d6.0.1750562995562;
        Sat, 21 Jun 2025 20:29:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 7/7] riscv: dts: spacemit: define regulator constraints
Date: Sat, 21 Jun 2025 22:29:39 -0500
Message-ID: <20250622032941.3768912-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_202956_438567_3D0D3F5C 
X-CRM114-Status: UNSURE (   7.70  )
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

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
