Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE96EA4E21
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYRSoltKcZu7Jl1kgOEZK7HWOFLrQ9yZ2guXTz+BOZ4=; b=RT+jkOnQxlgvAY
	ISt3WSMHsqi4c/LayUMkkIw7pjmNjG7iuPReAwP37XZQAPFwOwrjKGkAD1es+eq6lE5qyPLwomSjO
	KHHuc93H6fbhoz0EW4aLVhYBHvuBaCboOwo91eASBIUf0Zv5FYSxcRqvcKAHv1ahVjnAaZ7aPhx+z
	m6+dz/hHwZpA6f+tEdoJ/zpEt7GEblguvSK3LpbqG1AJQFVw018kSlUJTrxsVH9V1RLg6Kq62U/KR
	3mgBx67LLvNWt385+cXzSk0kGRrmFbsPtSAY7+EozzbVPzJ52TTh7B8/8pbL+wHpxJHdhmUIOPnvw
	Ybu/SG5PhV0mcl/cxi9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yG-0000000DKCH-450U;
	Mon, 02 Mar 2026 15:14:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yE-0000000DK92-3OVa
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:14:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4837584120eso33055895e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464445; x=1773069245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiI3b1wOWntFX27ERmDlj5qmTKTz44jgUTrCNSLGaQE=;
        b=LoDotHwDf72M0rLpIsCx4YG3fNMXJRzDGAZ6Uxps8Wuo9igtU9hjJ6Ggrw5dxVb7sB
         NLusFimJIbdMX0hiOXtrELKgjQyy4ypmWez/o97WQm0qwxJhc3RvSRQkAHJltOEctR8x
         /RiPgSTdUwtsdkIweehY0h5nAZW3D1sMoPxCK/iQ9e+iF3cd3xdelOpIXwg9MwygO63P
         lOeuwRLiaIJnHcC/r/XmXyCu8YovPkkOrNrTiEEu/VnhaLKEzrSGFdmvJX/CFWDN1jG0
         F4ZsUsN0fzlL68kRz5f7Q91zVFZP4qoN80UimeSbHnX0vg6gRi+3G4HQBeteau+MsJm/
         b5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464445; x=1773069245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fiI3b1wOWntFX27ERmDlj5qmTKTz44jgUTrCNSLGaQE=;
        b=DtLdLdokN40kyNCZEdj16HKTzcaBEYYtkixPA12RskLjF+gtX7vfw7lG6TbUsRjzAY
         j+yBK3oBFGgRcEsgsR9xXSjGhz/8lCRuVdX9dKOxkd7Iz3qFihGoic8FlltKZ2j9uwUC
         eSfizfQRLQUDFm6h6yvGQPEJm2F+4ftxbpbSoWPJU9ZHSnmoduII0FItPKpmc5TMCOYs
         utQFXgJVxUVOQRg8+BVGDNV1KHSUiAOzL+vCaBPqNCUV9uyqe+KYc6SD2EH06/sboTWA
         Qmon73ufDzwgVIfiZXKubPD6iTQ514NRY6+6wPDiwK/5FOVT3NyWeQiS8CuG6C6mdKRX
         GqHw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWl8urLkRaMyxXf3aniM+m38bJfAZ+tMxQs1DoIVMgpL0GlWZ33TFdpRPpyMDa5gS9P/KZpmNHtBNeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8UkDeQbBdacraNtCec/+2M5hLq0dXEgCKmcs1QqdZPk94HqD9
	i5/7HOEobrdMfF5DN3DJC7BchJNmZQterpzLUrk1RJaWXV6vC6FlhEy2
X-Gm-Gg: ATEYQzzERe8Jv9gCxwtzY7Hso+9fgV6zVKy10oWDpnZh7muRP4RDhi+XCB2sqp7I6FW
	Wo+4w6UCKwu1eXoZv9wuBZzn1F5idH9k1xeDqikciq5/v+PmH6kIWLbtb2uyx/72VyS1xo5QXOv
	EEo1mus5kfsCQEy3tK22mMkYmplDPH5lVmP5iZlmr6L8Ra6oHOLdNtehvRTb62hhSK5bF+vaFSE
	xccRFLHna3A7tTJuZg9lKvX67w3L5xY/y++06RftW8Mddaeh4SwoWnJ0Uoxa6VthPDVFPPQos1j
	7Lrf2NvR4KkUvEMcLgNg43fYxYUO51ZprMaTFnighew8yU5NoywYv6Ap4VMce8OZ8Ec2ux8i29J
	m8KMP/sIA083D0WcFyGgmqhxpZN4K0fi2SDy0lpvAPSKeTcHI3zTMzjTEsifkWIf+renfuCpUUE
	tu6pi9NoQmqMXnK9TKPwepuSjxHtRs1KJrzkxFrIomgBRPS2xlnqxMo3TrROVcXdvg2Q==
X-Received: by 2002:a05:600c:a085:b0:483:badb:618f with SMTP id 5b1f17b1804b1-483c9bc5b7dmr211763895e9.25.1772464444896;
        Mon, 02 Mar 2026 07:14:04 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:14:04 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:30 +0100
Subject: [PATCH 09/10] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-9-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071406_880583_7BAEEE37 
X-CRM114-Status: UNSURE (   9.02  )
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

- Add board power regulators (12V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f5d7eeaaa0afb4e86425ae36 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
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
+			sd_vmmc: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			sd_vqmmc: aldo1 {
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
