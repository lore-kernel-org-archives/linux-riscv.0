Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD17EBFD0A
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3KmEHV+iQvPfnF7MVnfrS49+Y8iRMBWvP+Pr5uDOOU=; b=Msz3hdwQ6Ior0b
	e++/Dzn7l+r+N0dFDkEuBgtvXYpBFFYFYsEgGtMAekm/TigFPEyY+mnCn4B8G7fFHzmtkg5JwRa0k
	wKQcZjm05GL7htibgxLSJp1cwjVe5w5/mpet2Z8bNULULuIrDeOEEUhKO8Vm3lWvX3+MjH0fF+COQ
	vJyG73RqUyzkEMtDjejJCrX0Pjx2ux35eId6jisdbBH9MuJS8/1qO6/8dOM51hONSiV5P1ixIvoWj
	capj2oezPL8liDXR+cVpiVC96dxo8VmdWz/5V6G2T6CFevoPy2eCKJVPbC6nICZshJtbcgVhnaMo0
	BSyOlWAS/fFxwje8bedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgs-0000000F8gz-0hoY;
	Mon, 13 Apr 2026 07:26:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgq-0000000F8f7-0LT7
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:26:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d74086e5bso710683f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065194; x=1776669994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=H1EWiQQlO8F+o5ZZciLzWii+4LjhdoFJLU+u5tgCGImDlPdDrighlbhToGcpicq4cR
         ynQGeklFOm14SLLi/DrJ10X32gd0ErJz4K+h9dfdYtp2lKTIP/Euf2pmdylsfi3QppQg
         PQTsSaXMA+WYjHSAGiOboH74+0hSGsE1ee26QNPX4mC50bs2n2Kb81VFBP3ZhMjAf6Y2
         M6/vos0Kou79oqhn9hDt3oSuMM81kQV7eqMjU2K86lLmQZANzyZlCLg5heN+/ibjLiML
         UpfhA41YW6urKijB8RNJRxRPZrUTGWM1fpvQFKOVVvRMWDpP57ia7ZBfZAu2JMN1frvE
         fULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065194; x=1776669994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=JvmOYSAIHM7QOBjGEsPU6WM0pTHqCwDxfjvPnZJpKZDhmwRyeMrOihi4OdNmNkYtLQ
         G2yG3nj5Lsl6C9MBa7wYxPXOvs+nTXFuSzsFsZ4PKv47xcRTJZZalJOxozMQCBgxTmKG
         K4qy5wgMFvroy4tJNDF1qee6IjKONLm/2eil/O7E/bJlLyPaUHh4orihxuHpF44zXYwT
         WZB8LUOfnPbrPFA1SmwJ4WWFuQ6Fr5Q5I7xfWAC3zCXF/0/Ab7YJXUrp6ii3mdESQWhi
         f0damcZMrGWieTfqRN4QA30GMYYZ2ixrnLa+LLeIpgINHCsftgyn2ghB41TyaiVrYZ9X
         Ul/w==
X-Forwarded-Encrypted: i=1; AFNElJ+Ha9AxioHxadGYYN9hnHWTfpmh483HtS+Bvay6uJ+SWYhkLnashszITGpt5wpm9FYkE7MIGcFXtHsDvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE/xbjoxUw1TjhKGKgy9QTz6hWz8hQL9MnEeRFMQeGE7Ue/MzN
	ps0PzYfF6Jyw6q3v6slZOEF/kIYEKAXzERc7lHuPTviMB3FfKkTMf3uV
X-Gm-Gg: AeBDievZkQnBQAePw9NXMOX9TU0xW6+DIEMN53yyw7wAvJPuQWG3fVw+sQ7/ReQy8j9
	QBi36Sv62n9qwkGGg8xQvilGzH6UgGlO76L1WWWlj8gmP4BPPURxphe4orHxh0U89flaL0S0ozb
	ZF/ryN9Ew7l9Ib4HONdLSmZz+Yrzyxum8sPTTybHiYiDvlILybQKaQRZtO5AxcyyDHTE8aiF9te
	U+OjVESLh9DoUhP1Lo64cewm+Z+DAfwm91EkfKUQWYCUelFXcBR4PC2xLpYbfKlqW3EwMpWBOFG
	4j6veLIv7IvvYJHEKmGfFwdFQcAmBzbMRM3AqkEKs1rz9U8YEa+pY016ZL7TGGcRxxWu3oAg50Y
	91Wag0PLnhYuj5PXjDhniMOtH6vJIf0tNz8ICrLbHqdrHUCXKUgyqMUSE937DvKLyQk8TUlCl43
	/yjMsSzsqog5pufop48Bvv0jTDH45GJdaC7nRJf+BXbupdmNi4n2KfY/SIGdAT8D9n
X-Received: by 2002:a05:6000:1788:b0:439:ccd7:cdb6 with SMTP id ffacd0b85a97d-43d642a4dd9mr19113605f8f.14.1776065194020;
        Mon, 13 Apr 2026 00:26:34 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec27fsm29788453f8f.11.2026.04.13.00.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:33 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
Date: Mon, 13 Apr 2026 09:24:48 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-6-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002636_138265_20D22F17 
X-CRM114-Status: UNSURE (   8.96  )
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
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c72..9c417a483f6b 100644
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
