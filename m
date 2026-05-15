Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141ACCD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJ1ckyjFm4zWkVkwZkG3LGbd1HEkJYivCp30rIs4NgQ=; b=DxfOebognzIppw
	PknZuh6QawsmtCcnNGYRtAKiJBtvv4O4ftZ63nT4PcnNlZaXhs8/bE4bRKT3ydgcI5p9AS2+/4qAD
	5SAA7jALhE6miSs54RXbl3KDlp8pGoFWn/bsog0YQYi4dfWlkZyRdpihrG1Iilhe4tPjNjWrDagGQ
	R8czOWZ1InQ+FxLWDUnncugBmbgbVbS6HiTwROhIRbtDXf0BzztHtqdxeioxEulB0ReiDCzHpeqJG
	kKS93xXBlPxAbxx2sbaM2pb1iPvMb3WilXiygzEU75dKtGxts9/jGKAYWlHdCk1BDiJn2TcX9jsK2
	dF67X+WmZOuDVrh7pKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6c-000000085kb-0xoh;
	Fri, 15 May 2026 10:49:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6a-000000085jw-2esp
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 10:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AWgPUQvxpgR7326ne226FMqTKp2lrFwP9NQdMcyNV50=; b=TcZ/OxuVBXPL+ADV+wGfXhKjRJ
	KAWgSt5RDAs8djLn40iae4jhagK1ZchyvP74mbBOIGs/0ZLVPLLsSHG1/zZIMLOKPTVG5raCFEJbD
	+0/9fdu/tBNDGnWEjdWR6YNy+19QgGTsEENbQXY6ZMVY3N0ri2HPSW7CNjCJ4SBCu8PPuxXFG0GmE
	NT1zb8QYINmRtBQprM1eblHR2c9Sxg/6OT0WTZQocV0KlPVtaXA9LO0L8WC4FP5bbRV7NfBDvl9En
	uTUkckX7As3PutBvLRfGJeiV/3anOuqHvz99gKrFuxQCUpJ/jtH9aSh/mw8fXGUxp11Mfk+TSwAP8
	oj1jHZew==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6X-00000004wmt-1lAW
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:49:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso7389137f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842155; x=1779446955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWgPUQvxpgR7326ne226FMqTKp2lrFwP9NQdMcyNV50=;
        b=aOGsK3aWpBqp0L9t9Kcu5R3qz4K4XfmyeOHvNPYLUThlSRIK129MV32izdUyc+K5VZ
         lg9xPw/1ekS3Ria7nElPmmCogafcsguD55tvZMCHldvE25yQ/xSPvOccLibpmtbTwZct
         QD3SB87icCBii0Wb4u66FzgmFvLt4+aIsn0qHg5KNiC/moQk+tXE///JHVSvnz1YGAgm
         PR1o2KdfAQJE7Z2YKPkAik0BxRqh+2RdwmYGKLM+GZ5+6Q3YD5sqFWiXvW/QsSy5HZtW
         cjIUMcZhr6aVwwoiizWfAs8lU6DE/ysY9v0EKpylvAdBaoIsJfrGMiSPNQMymG74R5oC
         ht8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842155; x=1779446955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWgPUQvxpgR7326ne226FMqTKp2lrFwP9NQdMcyNV50=;
        b=VP7xLgz+zLsZ9Qob9sQWDue+xYXsQfkc1Nnm2ty6Hdqw9dkZvG90lWjcHIU4RZtjr2
         gVCt3IBBPkCoUTIpUGloRI47YP+5V5yfdaZ9E4PZmJ7UyCpP8GWwCs/48kHHO9+PK9OG
         lMM+waTWF4x5SlD2o8Qg8DAQ/eP9eZ0X2lziSFR27cC6N360HUzXmJ7hWH+3RU8IhmHw
         ZNp2eRNqxKQqMo/KCthOa0oGZ/E0sFX3Q04zbTMfNiSryiWvHTvqfFY9fqIEylBR6YF8
         7bkpNEfEAf7P8sm1x74dzHQGSLXkj1zOxjyBgXEXsjAZtf+SYOk5GHCI7/1QO5BBjsvn
         m2/A==
X-Forwarded-Encrypted: i=1; AFNElJ/3EQXUKDZCLLCx9o6b4hfir2YjED92Xb/ZGpfoMdEhaRdNZ3s+ghXS8vAcMc/IJxG6vVqIech6rXz0gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEAVd8igNqkahdWUNUiqin+QYaSj38eeJzt+fLtiHZUdlDOwcv
	sfyOy3dYJUPur3t2ZGS6U4eC3WMK7jH7NnhRRSUniU44JS97x0wFJHSk
X-Gm-Gg: Acq92OE9aeztiXvzVGttoQwE1PGx1r0ZQWn3nvl6ET5o+Sq14n6c4VrGHK1hCLtA4KI
	Sgk4m+Lmj/Q5TQYLfjl82wgq2loD0VTwsBpPbRhUF9GQeEfwJG3n30zj/tRDvFI956RB47O4P+o
	6WVZD5KKMQoZsYkLIBnNE+b7t7bhjQjcdcecNp9lF1ZE9KNVt+nnjFyzoJbPcjKKH4NelyRFJdv
	CmWNnQxTiD3EvB/weIQExm13pPAzEG8pPS29mJHhJI7FYrRM2gP/oKjCF/Zkc0kAFrF2ExsZPk2
	kaHZ6PsZ3k/BwbeWt+u63ryRasRkJ7l7uKCBSkiodqpZ3a7tqi35v2AlL/SZoyCkM4HeAT1ACmE
	L/MMcG7HDyI3k4W+GW4JRAEEUsdjlwpL30ChY9HWW2pEh8SgbVmMEBoErCQgX1BigQmqG4XysQ9
	oCkP5zK40raXJhBM4AV4fGLc3FnQZP5CsMLxeFL1NkFM1oVkMB4tZbye2wOocaTisXpg==
X-Received: by 2002:a05:6000:220b:b0:45d:d092:ac9c with SMTP id ffacd0b85a97d-45e5c59f691mr4788790f8f.33.1778842155465;
        Fri, 15 May 2026 03:49:15 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:15 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:48:59 +0200
Subject: [PATCH v10 1/4] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
MIME-Version: 1.0
Message-Id: <20260515-orangepi-sd-card-uhs-v10-1-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_114917_953325_620AB8E1 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, devicetree@vger.kernel.org, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add SD card controller infrastructure for SpacemiT K1 SoC with complete
pinctrl support for both standard and UHS modes.

- Add sdhci0 controller definition with clocks, resets and interrupts
- Add mmc1_cfg pinctrl for 3.3V standard SD operation
- Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
- Configure appropriate drive strength and power-source properties

This provides complete SD card infrastructure that K1-based boards can
enable.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 34d88334e95e..4e9a62d0e85b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -590,4 +590,44 @@ ssp3-0-frm-pins {
 			power-source = <3300>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
+
+	mmc1_uhs_cfg: mmc1-uhs-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 24becab4c959..06469c364eef 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1214,6 +1214,19 @@ usb_dwc3: usb@c0a00000 {
 				status = "disabled";
 			};
 
+			sdhci0: mmc@d4280000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4280000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH0>;
+				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH0>;
+				reset-names = "axi", "sdh";
+				interrupts = <99>;
+				status = "disabled";
+			};
+
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
