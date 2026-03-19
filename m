Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8B1109024E
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUP3Id45+mdsweRQbm11bqgWnemHCm8rudsfDVo9Hxg=; b=u2Ea3mAFeSx5Hk
	p9NcoTf3gnqm8fzTaFBxr9lmvkNqZCrq5lHvUD2kpUwYoHf1eUdA7Y/IY09zm6ZqPGA2hoWkSGbPA
	aBv/IxrPCtlhaC8v23kQW6xQoGInIyRBi5wT4genNWZtWX1wOPeKGxhhzv9lUVlxf5K66ZruwAg9C
	ns4jF9ycMTkTAbDIWohqZQHFsclT74yoR8udP9qjBqg4ySX/r4wmgOhf/vH8DI01bGbWfhhMwGmot
	p92HCUtzA/2AscmHOmTi0QPNpiAOr7/erlq1puB3yVNR2gsYSPQQ/zZN0nIIs91lNTnKDgaPGOvZE
	rJp+Y/pHlcOdkJGBpKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHl-0000000B5Ch-3Ntw;
	Thu, 19 Mar 2026 16:31:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHj-0000000B5BH-13m6
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 16:31:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B72FA44496;
	Thu, 19 Mar 2026 16:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72461C19424;
	Thu, 19 Mar 2026 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937906;
	bh=LC8AGvhNSfBeDV4o59HbCCsVMWiNjfa7P4YQigFlTdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OhyCW1sN1z5Q3uaF5X4vFd6sxFqeq/n7jBmC/O/sc58EkDceOx+LPFuTxOfhReu8O
	 uKeNisq8vpM+lyXP0txjOjPckf83/xYwsj7skedhFSnk99LAK4OG+kkN7g0TbJ8Fgz
	 QH4F3DF8DdBvkAB+6nRFbUDfBns0wdX2utiO7gr3o8rxrUMqGg58APPQiqQIMjop+g
	 93JA6GraGVFPyTD4kp/Ip9Sx0vjkj1fsBpDz2EMiR/QcqhyaxzRKb5X2SIUYnGa0E0
	 ulkCovsLTIKSzhVHuVnnHOPDA0vciBTDZllYuaXRPFZmEuxVud0zGTasGAt6UazIUr
	 NpubKHYSh+7+A==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Brian.Burke@microchip.com,
	cyril.jean@microchip.com
Subject: [PATCH v1 2/5] riscv: dts: microchip: remove gpio hogs from beaglev-fire
Date: Thu, 19 Mar 2026 16:31:16 +0000
Message-ID: <20260319-prorate-groove-c55784a89775@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319-outsell-hypnotic-94b480408ad4@spud>
References: <20260319-outsell-hypnotic-94b480408ad4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gl16q2VnxS62lKXakjgLtV797OjjPaUC6kdaGQx5NmU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl7VK5Mn7v5VtCP2Abzf80XLC94B23YMX3Lry0SEe0X4 17kbjN811HKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJhHMyMvR6TfzQIqxoO6OD TS5l8pWk4DjVZX6ur1uS6w9xFSV9uMvwP/vPh/APTnUC64tsGfXOxYUqJa+4ql6aM+HRhhWhbFm LOQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_093147_313782_BE0EC51D 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Conor Dooley <conor.dooley@microchip.com>

sd-det-hog should be cd-gpios, but when the mmc-spi-slot was added, the
"cd-" prefix was omitted and the collision with the hog was not noticed.

vio-enable-hog is just a regulator that can be modelled as such.

Fixes: 1088d49b62648 ("riscv: dts: microchip: enable qspi adc/mmc-spi-slot on BeagleV Fire")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/mpfs-beaglev-fire.dts  | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index f44ad8e6f4e49..2c0a420d89ff0 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -77,6 +77,15 @@ imx219_vddl: fixedregulator-2 {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	regulator-1v8-syzygy {
+		compatible = "regulator-fixed";
+		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		regulator-name = "syzygy_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		enable-active-high;
+	};
 };
 
 &gpio0 {
@@ -118,20 +127,6 @@ &gpio2 {
 			  "P8_PIN27", "P8_PIN28", "P8_PIN29", "P8_PIN30", "M2_W_DISABLE1",
 			  "M2_W_DISABLE2", "VIO_ENABLE", "SD_DET";
 	status = "okay";
-
-	vio-enable-hog {
-		gpio-hog;
-		gpios = <30 30>;
-		output-high;
-		line-name = "VIO_ENABLE";
-	};
-
-	sd-det-hog {
-		gpio-hog;
-		gpios = <31 31>;
-		input;
-		line-name = "SD_DET";
-	};
 };
 
 &i2c0 {
@@ -287,7 +282,7 @@ channel@7 {
 	mmc@1 {
 		compatible = "mmc-spi-slot";
 		reg = <1>;
-		gpios = <&gpio2 31 1>;
+		cd-gpios = <&gpio2 31 GPIO_ACTIVE_LOW>;
 		voltage-ranges = <3300 3300>;
 		spi-max-frequency = <5000000>;
 		disable-wp;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
