Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FACAEDB7D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWGrYVTcR3Uov1vMOt77QWuj/JLwd1/2KvplffNRAm0=; b=qiMCfJLXaXbr2E
	RCdf7YQFpXRzk3NxGn6rTljdDqnR3sTVvZlVzU/7t3rOsHk382N8gsjkGVGncHV/oxoPAJ/+TC+7p
	2xpc59qGR7bHGzn+znw3CvD4byRbjJbNyaOLLc8yKCDdotnVpGpi1f6kMoB8zku6pbqh30Sga+KcB
	M80gXguZeQpZGKXhHl+2J4PecSoea2ENngpLzOy0M10cKe1j6IBcq5j5uiydgYUFgldjtC32tIkfS
	+ec6VBTHEWCSpJi9cPMe79rIxftV3sYR7DUk/YMiXe/5hCQG9OchxQu4C/FrLVN6ePR7gEXHIHtnU
	e1am/P4Uvuf7n5/x6wrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lH-000000068jE-1Oci;
	Tue, 07 Apr 2026 08:26:15 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lF-000000068gv-0RXZ
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so3832986f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550371; x=1776155171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=Sm1Z6M/xGB8rqzNPKkdN4ODJn/uGnbAtmxEx9Gxl4BM+cAuNEpPknrbau+HPAz8s/8
         Epnbu0a92JnVyAGcx4B+lG5Xj/puCTWg01TK7QB/NIkaPB7YmBv8YwsQYztS0jeNbeyu
         ts9fTsK/Nrr60+m+Hp9qxDnxA4ynTWgJH9IsULLmgB6ZSp6v4KvhMD2fgTTf8BLd0RVb
         rQzzaIoiOBhonvptAf87gSaCous7hBG9jeLa/ER/hMVltCUOxDnnfsSxLCZ2AulH9yTm
         yzIZ0QakNRt3+2RjdeCDFzqQyPHiSQdcu09wmUTZ7+5Z471Eh0ecaJ4PCZ7NRkr9KZ/1
         fwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550371; x=1776155171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=GrD3j6lOC6gP7Clk1rf3E2hygJxGZN9k1Z6eSMsjveQ4uqG1wSOJGZX+pL8zNtB9yC
         XbDHthajViEzb+Xy5f3wOVmhoDxWzX3KjQJsuc8iBYOyXp8chsdvwg2slYbY6I2Ann1V
         wM1/7IO7s5BEDTWAPrEpT9lPg3ZZVzY+pBu3GdgTMYeZs79t7UhqbOlZQXiU/SZ1WZXz
         LeBHiqCJRseMn1kOZ16AoKWq+tDtgyeg8VNKb4N+7RhDtui/KchmIrCBlPjuUg+wRfkL
         M6oZLBc72wTydXzGpG/am9V8lTu6aeWIsIOhDWYgDGlUQJJL+VNhb5oy+N/vxzbWDBbd
         dqKw==
X-Forwarded-Encrypted: i=1; AJvYcCWWYL2aQTFE+aN80Piz8OjGEVvNAC+msHXtXP9aMG2xkzAT1LbjT0S+HcbN744p3ZzfgaFlfDXb8buI1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiCU9cvFRzxnDnQLE7bP7NMfvFP+sxahdbgCyQoA1KNHzXv/GK
	q9ZaDc3FwN7xTNkRkWfm1glK/NaFDRHrKJhQJzGmCLiVT8dxI711/Qsn
X-Gm-Gg: AeBDieuEErtL11TOhPo8L09Vmbhi1TV+6xRjWh7pcHHSQ5dIBp/KCVroEUflf/4ZlOK
	WS2hHxyLFoRO1SY22s3zoc9f4lne3IiYvqEceQ9LZCpmCLyMXu6c5LgqTXDmvWfDavmFnu4ix6I
	wEnNkNGfGF17wKFPRGw2wXZWoKTh5yFBxUTlnp3Dz0k+UcgbbCh2I58sc0/idTwQ4tYpXvxl8ng
	rncwqQE+WwcQe+RTqzlZIvNLwiO+DvauV9/8fjooadAppGauuMB3QM6PpL3acACEFc4S10RXtD3
	56DIB2STP9JQioN80k7L0ZMKT4umwtAaV6wJJp0LT5plKm5huKjwvt0/9isN6U75QE1g+irBwYP
	ktr4yxVz42b1i92aB1t2CRTdIwKJgJzWAb93q8PznFi8FbgL+tg4SYZQMAp5rIVqwBGRHpxJaA3
	yli991G/Qn2PZZgzes3vTPh0Kj8aOeDb32IQ8kG6krqXlWrAj5gkXMHcUkrxW6j2r5
X-Received: by 2002:a5d:5d0a:0:b0:43c:fac5:d382 with SMTP id ffacd0b85a97d-43d2118dc50mr29229253f8f.12.1775550370963;
        Tue, 07 Apr 2026 01:26:10 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:10 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:26 +0200
Subject: [PATCH v6 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
MIME-Version: 1.0
Message-Id: <20260407-orangepi-sd-card-uhs-v6-6-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_012613_270576_00685ADF 
X-CRM114-Status: UNSURE (   8.94  )
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

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..9c417a483f6bad6e60617cf8d5400ca079588726 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
