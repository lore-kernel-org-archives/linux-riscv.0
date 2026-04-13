Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2754CEBFD0A
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YRzH1De1qUNF52gyp7qu1/diOIF5X7eexibNMjWvrg=; b=k49/m9xfp+89/3
	Zzp4zmH6X3RB/9gnJg8lLfan8YCT7TWFc6zyHPh8X126sjAUJ8X7/R593wLCz6NrqvGEVE/etTu8a
	FmO3q3Q8CHBZWKD4HSsYqdIYaAYyF1p1MPLtqrxZ1zJUG0Gkxh5urvgsmXyBDW7k2DiBEG9V3euUS
	VIBuXG1uFwbATWYc01Qmw+GhP6mO8A7fKcAE6XqoHzCKe5W1+ocx4RH0XwM+saZ/v3o7ZMv9Hv63g
	xWdn+ZVdZ3q5R6Tv/rJKMscCLE8+Ycp3KRjRXyQ2866h5PnKgGMrlYRBscVa2ZByxdutxJyQ8LpAP
	EPlvmawSDg34Otww/JHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBhH-0000000F8u2-3m9q;
	Mon, 13 Apr 2026 07:27:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBhH-0000000F8tF-1O3C
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Apr 2026 07:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=; b=X+iFQNTviW0g+aKQurXOBIKfNs
	+a3KQE+rjqMVrCYZir16PcLrznmIQgQ21HPCWrfU3be7lLflZ38HLL5MexCoeWjsHFLfQ5OxtmO9r
	1u2Vz1FAkHFN8n4Zs7x7h6m701JeNpUo0ZcEfKtLTmZIZ10TP7yTT53kzJSxNtro65UraxrdBfJ8f
	N3g1QpbGBVb9yejKmrSW7StCUf4V2tGk/Di9MJcrMkkX48+XDn0NIIc9dJvL0Mt1pgIALkY7pzF2d
	+GsIR581xOIf+Gm6Ntj6JesugqTXVJif99OKVghmqcFzHE26KiZ9tvdtw80y68aBWRNJ9PLY+H7a7
	5jh6XIFA==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBhA-0000000GH6W-04gY
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:26:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43d73422431so732115f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065213; x=1776670013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=iSN47ZGIom/fqfEPzc2u1BdOzG3MvsaKneaTQGm8bk3AQUW05tfnbbcVOqZO7dzBjl
         DyzQXwqqdc+y2/Lfid3l3N52wb7ntRlJCQ+4sYlOdpTE+h5pfUedkUP5QVQahAWFSo+2
         lU8njWs2DqulP3KiQx/yoCIEwbzJKM34fccUIny2CPOrh03Sj+UQD3uRDH84Y6baBlgs
         c92vqGYx/YM/uPQ+sNTOc3k+QDvNRxvQs9FfldVO9HFwZ5XaoMXFc8o6rKaSguhyMhow
         ddaxdiHE1xEO+qwRNedojIZo7T+pgBv8T538HXxIapvRcVMdVYPyQhyp/gYHLk8FXZpS
         xDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065213; x=1776670013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=qsFmgkv6OPceXf9ELq6CR24b1/80qOOFRk/1p1sYTB29WAkPUiBXY3UvgxNTrQjLBB
         goIwFYBXGh75wnl0cpvvGqaCQ6L/ogwcomh8zcnV7oksJENsYJV5pwqKv8Uqzj1UN8MG
         ZQOLlNNzN7D0mfYTP+/hkzA+DtI6aqXsb4jVFN5hes8TNez4X/GJi9utHtuqqLxaAkax
         I3ogUl17hb38I0HMiDGGTmehvN1ksPClFXStwsIilM81jjyxHJb33atQdUEO5v4EPAyJ
         xapo+IH1pS5KzdINPTGuMSJs7ji0BFXrQOv68BsTkE7yR96bajkxI6EyvSmGHC+LFWtF
         5hAA==
X-Forwarded-Encrypted: i=1; AFNElJ83hwRu6BvMsFpv94PZbVtqS06LQnbQSIyAzxEgr9pU9iqxIN5pMkLrGzKStoRatvXpmikmhbrbYocn+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDpvVFk8c9MEkm9/iKYgyKveMYBYq6Mc4eihPJ0NUEk645e2UD
	ReqhxOTtP/DEXX1HMWdANONrYaPe79pZFxU3JzBdiFezSzeSmddehaqS
X-Gm-Gg: AeBDievM87PsF34kzn/h4z3tFTf5hH2+Je+lHdaXThOYYfbfGH132ca4bqfanIKcJYr
	H1EPYKqc6IbsXEScqQr+MfIDcZRxmkQg5k9X0Mw6gjUOvUYYawZsaqhjdOtVhn/i1jbzw2KA/sr
	B7BE0DKVdBPlp9nK6EyejNdtBPLn9hXJFboQTazyGykxCE6Y23k5j/EVpY6N7bLMRZBj+biDRdY
	BuO2gPuPSQwuE0o4Cxw691wzD6RC+UMXNwMoErrtQ/3++CksViNEibSkyDYwq9a6AnZ4lwHBL/d
	ysSC4dfbV2QPGYLojM8BmHLf21myfH19qkHnOWtBc3lc7bzkE23kJRGGOUiPIamANZKwbVHY12R
	MotJTSli+1Gjo3heC/8KKeJdzu14ZNm4aPjosPiVJ89PfRF4MsZJnRAPtcerxnqAx/Kh/zeMpUi
	QbWj2i4CpOJCYSZeRFq8bripO/xrrxOTARzzksE5yl0I2SvJEgbcpsGkPpEJCat04Q99Qmj8DA9
	Ho=
X-Received: by 2002:a05:6000:2586:b0:43d:1c7a:8b59 with SMTP id ffacd0b85a97d-43d642ea4c9mr17192774f8f.40.1776065212404;
        Mon, 13 Apr 2026 00:26:52 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7d5812dcsm340817f8f.32.2026.04.13.00.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:52 -0700 (PDT)
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
	Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v7 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:50 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-8-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_082657_666429_5B0539EC 
X-CRM114-Status: UNSURE (   9.98  )
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
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..a7d88564630f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -220,7 +220,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -241,7 +241,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -367,3 +367,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	broken-cd;
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
