Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC82EF506E1
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXDV3LAZMoMgXC3u11XinZD3Aehcl/gbvwztgc3M3cs=; b=MX7oTQPLxWOB6e
	GINLfuQF/7yoch5RjN3BFJxDWIkhkh157oTcVDDUIcRFg6I0tPND+6dsPKpP5425rDz7v+yuRk2Tu
	Lid+HngUO1/LP8FtcbRI0/jco4R0zjmPnwvRRmerMCVFjSVbW3G8Sd5xyGa4F+D3WnxWA6BF6BNpe
	3aCIt23udgiPATbZXM5xOuNFzJ0w1gcIE8nEzkixSzW/4BO7uZbseys8SWq9TCGy/5GRpaSnPL4G2
	XnKXQ/2NdAy95X4yl7DuPnwvfzeqRpPEd+MWCSMcFTJCHE4UyRKDrPfUPnk/cL1RVet+fxrB9QFgq
	OHvEzEjuqbpcSLI3/v2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Mk-00000004GUY-1ftB;
	Mon, 16 Mar 2026 14:56:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Mj-00000004GTx-3cQJ
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TGku/l9FNPrwiqABN5hj0gv51qaKMC4DWzEN52XfCG0=; b=OVh/ZinYFUKn20yBRFalqGnY//
	gni2WiTBWrBvkV5HXOaxAkPb7C0v9bU/yHvcxAt1KMAZzlmFtfZZnDkF9VRoxcmrzA9fST/DlwzV5
	y/Fjclne64/MYQY4CBrOVf9FWvcBGPmtNRbt9DA3e28VczO5DfMgVnEntRXyy7+co8rtTBFAGXvk4
	yTV2XkDuPxNFs+7oZd9tg4Vv1IhY9M5e919jPhn9Hn7hVUdU/2Lnvy5ZWLwQjJ50w9EZCFYsvNFPn
	qYJ2Rv+y+WBTp5NibwTTEgtpnGp3i7NUrtOKknxVf1g9fGZImbNmLfE5vjad4vVbQu2426RLlSUDj
	K+e/C4Sw==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Yk-00000006tgt-3Rvj
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:04:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439b7c2788dso2850413f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669881; x=1774274681; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGku/l9FNPrwiqABN5hj0gv51qaKMC4DWzEN52XfCG0=;
        b=ljiWh2oX8WryK5UcmTLcH8tzecXIyCviwUedL1hvVWj3OMaY2kMupRecDOB8q7HJNR
         +/MAkN3H62slwCjnGurTGGpGMoaVuabEei0Le9gKSpNZDGPzDdtgDv0Kug5VdgOJ1Ol3
         qmC94SafiXE9wkxo7ynPqkPH08X1W95SC8WObHMvcwt6eBOLWYz5hz0kOcFoy3pGkqJK
         1V0KvJ6uxJsm0lh/jTcBwMV3v1OJ5b7ae7XHgEyvbtRle24TuLGETgNdqMEIN5DFZJgu
         oEYsYnorI/8KxRyC8wjAexUDHrO5PFOFKxEehRmnv5K/4dAO9m+zaOmYkDYAPELrMWhI
         5QEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669881; x=1774274681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TGku/l9FNPrwiqABN5hj0gv51qaKMC4DWzEN52XfCG0=;
        b=G8PMtHW9YAXP/vSQM6ZS1d9bUENUXp4QkL58z9C3VUix0faG+F4DHFqW/edaQo/Dbq
         WATmM8lLChz3EdGmKercnDxQym2WVMRYWWQMt2m8LCIW26QFs6+oBzmad4Q6Vzy4Oq37
         Rcr298OLxMOEa0E1p2p7yzhq4P+YNwwwiUyV5KV3KuKUmP9gToIUGL7CBfzmNoq2z/RZ
         G7+CmGt71xwkCHYwkVDszouEwmopg1Tu9nY8lkFBkpBMMlazA9tLYiX4bFvq0xYG+9j+
         l4vR69SyFleD8Kbjujy+ipoklkBuh0iCw/XuskWFtG5vdTKnWHSpdSaRi2UMBZFp2X50
         Tbpg==
X-Forwarded-Encrypted: i=1; AJvYcCVRqskqeQCAZbLx0HbyfFF4EX3bV+xJzlo77irszf4afAYM9S3VIH3OCAzx3sVcaONNIEpcN3Fitv8seg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxM4316dp2Lt9tZYIfDTYxOpg7E1YXVeeD6dZy9AxqEnQqeGEn0
	4/miWiP2Rf1KfA5rF0G9D0wJd1nOe86JI6KhOTvQM+9iF+Ar21AS5DWr
X-Gm-Gg: ATEYQzxKtHFWVj+GrjWNN2wfpCqNzkdAlwMC7KeSa+gPIA8J7wTfV5dN9YINsYvE39A
	IxSyLhyUjNxX/vkgjEl01NsqI3Usx7ibl2U0HqjYI1vzCZsDpX3FJc/qa4bG1Jv4ABcFl84/eYp
	fegvwZYN2ukJAGZwwrR3hcUSLAJAN/0xvVX3dGdfG3e8eCtKcuMwHwz5teHwBuyvEmahEmkG8XW
	D2seTEWBcrIxkHKFQifxGkkECwlVORBdUsQILUmxQ26OHzKpEE0gk8euUxRVIrOR7qLNKCLTcnU
	g7qq0iOi+iX9l7atfFIkQHfqnJfivCv83ZJPGKb24v6cH3VbuvmmDp3Q4b+hk2P59/Hs7L7uDcQ
	p5wtgWJAZeJSfBF0lS3OLSTLudGlisz1KCKz63L2NHhLL8abIZ1YNKy2y4L42PAjLpz3aE9quqN
	pCK36koy1WFaffhaQIM/k3xEFUZKVqOPUhgi8PRWVhkh7D7Yo11JtPQpV81SLoCgS8
X-Received: by 2002:a05:6000:2889:b0:43b:4153:c2a6 with SMTP id ffacd0b85a97d-43b4153c45fmr7601207f8f.36.1773669880512;
        Mon, 16 Mar 2026 07:04:40 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:35 +0100
Subject: [PATCH v3 7/7] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260316-orangepi-sd-card-uhs-v3-7-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_140443_050738_FCACDD6C 
X-CRM114-Status: UNSURE (   9.81  )
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

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 404b69c47b91f8c37d74a3031dbad0d94a28d1b4..a7d480d01ccc0439dbf456ed5a81f467af68056a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -222,7 +222,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -243,7 +243,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -369,3 +369,22 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
