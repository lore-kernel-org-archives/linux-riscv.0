Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DF7F459EB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 15:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mJPllUwtM11RJCllAlfnL1PNUqmbjAHG+jmK2KnYbU=; b=cy8LvSenFAMdES
	qwRadpRt9NTBezp5jkmB/I710b4fEI4RyybumbT1EN3n5np3H7XfRlXAjPryG5nfzVrNs3j2wScyN
	yrnMT64e21TmUa3nxkM649zGnAuj4rt4+dnsk8psBagMIUFy3FcZpPNyFh+WDn7844cHxzFt0LCA8
	Uuf4tj6qJemcGznZ62a7JmTJelpY/65vt4gk0LM9HJ7QoLFVVzS84QkbhTi1TYIrpkTEg+1EG8FnQ
	max2Ijqe1gx6SV9ARO1yLoMY7gwpt4+Hp2TWbaA8S9linNyhOhKfp+fkigRkjuk7NHk086xzRjZxu
	8g7XZyfwvUr60RC1g90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDQD-0000000CPsZ-2qId;
	Fri, 10 Apr 2026 15:05:25 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDQB-0000000CPrp-2GFE
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 15:05:24 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c76b95e652bso967730a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775833523; x=1776438323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yoe0HYlE0K0NbksazLkXaws1bR4DgN+t36khjDPYQVk=;
        b=lZteh1U5L58W3ZQKwP4N1Tult7t+XlFcRw6u7eXWX1+K1voGzbAI2BenSaZV+3TEr9
         9+1nlV9exK0hwQiSPsSj7cYd/sFnaDh7pJ8F2nz50qoQFTwWN249H7nrlesqkpWQx+5n
         99BbgnyJT/mIA0T3VYtWnAvqrx1mTu3ZNMtfxQAsJs/I1vXI5IAcIn0sCaXQU+S/dNCr
         Z1fOWAT+qABVnwOlmYQJQCWjeo06jXHFwZ+3z5sZSvZAyfYGgGyLQquhXXnA7v1da/Pi
         laqZdi78cjSTlcZVQfw/NlQeKU8b5FCRMHzL6eFAAsX0inOQ9LSW7XxRlcTAOC1A4iDf
         Go5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775833523; x=1776438323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yoe0HYlE0K0NbksazLkXaws1bR4DgN+t36khjDPYQVk=;
        b=PazqDKkTB6jUWM6neLcOSYu0GqQSOwn9aljAu/o+2WK/F7iFzxYwlBloCT65wOznci
         aM2H8Tjyb1XcdaELSUn0qxjFA/QtHGq+aOhjNr4rqzC1lJNI+SOTQ9lEsXji4hfHeJ8h
         Ojroea0AtACBBNexkPMeVw4iKMlv0lN/N/PyeERHpocuVv8bhtvufIF6yO3coRa0be+2
         9yncgqEM2d08vzDvFtLsszbCFQ5ApFjcMOK5V8Re2LCq9TAUg2I6UJjNTYQlmSvKMk11
         ccYy8rnd10XmeKRZlVoMU5hsF7pHFQ+EVftvroKUd3UYx7TCD+cpPf4D/O8Z1XLK51KH
         iGGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYsSMTQKUiEzNHqBhLEv0ZG8Gel7cJSmhlPZrQ9vJo8NHxYTFCoqmSYYcb0FvVVw+jIrerKtPA9KIH6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB4MyErzvME7dpSE68bFG7P+WCVpjRZIBOXytCqJdBtTS3a4OG
	6C0gVv+CNojrKwaDleeKUOvT5fE1kZGtY+ERHj7usheWp55AaObDn+J3EfYuiOGjUWU=
X-Gm-Gg: AeBDies16myEFe9XyWxdt+pnm/fKHGBBiVAaCjeXT9FIsGRG+CWXOFPhwOaXBOGUee8
	kP3x5/BopnZDzGzUqbPecFfncI7V/Mxb6sqBJ8ycWbeAxvxFPlqntq/67Qzt+0pxsvsY3yLTVlW
	+6t8K9b9syrE/btf1O+29hI5qUP/+HtdHZg789Y7cqWdhxvZ44RkWzopF9IYydAOhA3eRXItIxh
	lpiT1CsGSYSlIFVacZ7mjf2JAqnWyq7Ae0aMhMW5odZjLJS1KMRyDxEQsy0loLiOI3yjSzSkqQh
	1yIwQavOvs/D+Crt//RMEHrtApajVK12f1Mv1yRXvdwmSzrLM3g380iveGtlt2dr8iia+CX6nPH
	/thleSiBoG4sjld0bPZoUABpjtODB4ZOj0KpX+TUpmAbxfDDfZH2M/g6ycPJrgBo7UWp4trrM9p
	VwtBgJMsWwPAS25IlclYvtc1wmLj6MrkOzktjnJ8jporEkjr1OqB4hJPphw0FeUwDJ
X-Received: by 2002:a05:6300:210c:b0:39f:3559:7516 with SMTP id adf61e73a8af0-39fe400f81fmr3967582637.48.1775833522543;
        Fri, 10 Apr 2026 08:05:22 -0700 (PDT)
Received: from [127.0.1.1] ([45.8.220.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4d5413sm2970532b3a.40.2026.04.10.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:05:21 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 10 Apr 2026 23:04:22 -0400
Subject: [PATCH v8 3/3] riscv: dts: spacemit: define a SPI controller node
MIME-Version: 1.0
Message-Id: <20260410-spi-spacemit-k1-v8-3-53ebb48a4146@riscstar.com>
References: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
In-Reply-To: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_080523_585089_617C37C6 
X-CRM114-Status: GOOD (  10.38  )
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

From: Alex Elder <elder@riscstar.com>

Define a node for the fourth SoC SPI controller (number 3) on the
SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 15 +++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b35..61b93765f42cf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
@@ -327,6 +328,12 @@ &pcie2 {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-0 = <&ssp3_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66..34d88334e95e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-pins {
+			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
+				 <K1_PADCONF(77, 2)>,	/* MOSI  */
+				 <K1_PADCONF(78, 2)>;	/* MISO */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		ssp3-0-frm-pins {
+			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
+
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 529ec68e9c23e..1ecb09e58042f 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -983,6 +983,21 @@ qspi: spi@d420c000 {
 				status = "disabled";
 			};
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts = <55>;
+				dmas = <&pdma 20>, <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
