Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FB3D41D74
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2j6fY1hcbwBHwdnLwCNUUL8nUfRFv6JNgFFj7rxP9k=; b=KM83APAAEPYXMZ
	RW1x2T+yy6R805I/Jg/L67IZ3uaugT8pe3+Iocv3URBlLDi9wi3+DCVwD2A/IdhmdmfEX3xYRbOT+
	/kJDOQCtGMW+ksqLe+RDmhu2BCSqZrqgs5vzrkcowU26llG379cVANtBRAg+0ZDRJnaQN+RQ9rPhW
	Oi3/uz9rR9HTVzlhKSSMa6MZ+4owTf0++aGmW6ujnCSfz1Op7n26oSRu7P7UoaEQzWdZLfq2EHacf
	AaM7wB/xyxIllQ0GJY6ZkZv/uLR8/2MHC/pwiWo9+h77ahggRrYi80BXN7nIbq45JX+vu3I8X7Eda
	mqzdDm1txvXTzdaS3OXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5X4-00000003QSy-2RPh;
	Mon, 15 Dec 2025 10:10:22 +0000
Received: from rusty.tulip.relay.mailchannels.net ([23.83.218.252])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5X2-00000003QQV-0pzd
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 10:10:21 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B4EA9461A46;
	Mon, 15 Dec 2025 10:10:17 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (100-103-186-183.trex-nlb.outbound.svc.cluster.local [100.103.186.183])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4651C461A47;
	Mon, 15 Dec 2025 10:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765793417;
	b=6uOTE3dbvbbJDCCy6vQA1apGWku6VIZX2WR1KD/MrM01tky4MpLdLaN4k7ucs8/Khi/ruc
	GdJGr0i2huh9uJSB03BuK7VEXiisB4aOOK87tszOfMLUzY0GXXKJXf76fpdMrfUnI1LSPH
	RNLQuq/a5PdZ85B1l0hLbKMplXpyIVHocsgbo1V6CWCzj2XQEmhDsTxEF6D4EhavWagsN5
	NTnWFbHxQQ/3O/EI8ZTqMmvKylDRJtkVaE8VhjtMOAAq25bcMggiopSARb4TV8myDrDh83
	3BzEVdh9IbY5g4pkw6+XNpcTwMoNIzsRVnW/DnEdW5hAjM2IrjKYyL8rZd8Xsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765793417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=AnwkcjKL8CZY1JN4RPHL/HoPYEhDgbug8wSp0iwO3iM=;
	b=rF3pkPC3EIIgI2hp8Lx5xHtvKyFIke7JfmTD48JbQo4lsh9nAx86JngUrqkqTmpoy0JELu
	neznsIE7uTK3XubASjZYXCgT9zgI1gVII+k2/Fj8vwYH4kecLFHuLE4xWvwtRbPfNjdqwO
	HIrReRHLMewEx+j8JLsEMrLK8ChXb404padzToY2Uau+3CyHkm4+O9kQne8qOrJ7I93Ryb
	brUYdOcqV456AkGCUrlfdXcRzUiVYLitWdCx/8ARPUPFDYl66I7ZFR0GIhzaN4kTmpuuns
	65o15y/7Ap6pt6PTVoKh+5GjMpCIzPNAJr9baTkvB9P8ckO+laBLxyKgSjF1Sg==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-h28sx;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Supply-Cellar: 5509d6b3248b50a6_1765793417651_1409200682
X-MC-Loop-Signature: 1765793417651:4224352350
X-MC-Ingress-Time: 1765793417651
Received: from fr-int-smtpout21.hostinger.io (fr-int-smtpout21.hostinger.io
 [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.186.183 (trex/7.1.3);
	Mon, 15 Dec 2025 10:10:17 +0000
Received: from [127.0.1.1] (unknown [IPv6:2001:861:4450:d360:b35b:2e1:df94:f057])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dVG5f2gl8z1y5L;
	Mon, 15 Dec 2025 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765793414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AnwkcjKL8CZY1JN4RPHL/HoPYEhDgbug8wSp0iwO3iM=;
	b=J42oq1WA/qvSDZLsAMPjVoNINEH2BZ86CFFadWK11FQhn85NOPasToQrCWQ68PXVjGTtJ9
	fNlPDDB3MlMt5X0w+1KG4pOZi3xBF3gLnMFyzBC7CGdfUNA8KLBzuYRFTx3tug+rqx6ra8
	Q7rnuBwFuevFu/ERUTI5UAps4OCuxECgCi0V6oURc56WwbTZzoQ9CF5yJzdzCnTgdzP15L
	yGj1naM80YXP8cqtSmkIBRjhd4mhtNK+w6hgBY+7tOZ8NzofIGDHLLfekhXyzHgUa46V7W
	863V+KDm0C1v349anLLl4/Eb3fWuaKZZ0xAs4bCBcIzGur7PySJtZ7wxvFNIPQ==
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and
 OrangePi RV2
MIME-Version: 1.0
Message-Id: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
In-Reply-To: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.13.0
Date: Mon, 15 Dec 2025 10:10:14 +0000 (UTC)
X-CM-Envelope: MS4xfGv3EuG6IfseyyBcSHR+TEPo5TR2SwlZh5gQvkDLb8XlONHxKMWOSVkIx15lOv6MWABMJXLnxlIkSU/c8FIPr6ypZgvruuAWVGj/+4mqwtcMZYco8w3u SGzSrL6cK8znXHQEDGbuQA0/1erXYMRMxTU9OXdVwKTRYcKTFZ3vxri3SDhov1u/Ya2SEdbyd7Z/3alurUbkK5qxmhgTvPZwKdP7eyzp2nLenlrsso96WmsX hW00mddDRQeqlE1kvkSJOvPkTUuIE1mzbSuQeX+QC8ZeOvugIQEBA0FOCKFm6pTHkZNHHj7ByypKP0RbCu+E5cEXD8oWI1vMQPJblri794ieoGqhl9ghHFQl YgSb7jLZoZXHFsOA6iyw3Ha17637D5UtLIqfJtzIalA4Kz5FtOFur4gtsr6g+DH+OKKgChCzF39YYww5kycvApPrVfnQ4T4Y8GNmdVBuh9gYcR3bDUM=
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=693fde86 a=1de+KQ0ukeRx8XkBeA/5cw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=XoS9KmCxhHt0zztQ1BUA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_021020_404263_EB928DD2 
X-CRM114-Status: UNSURE (   7.97  )
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

This introduces a new sdhci0 node and enables it
for the BananaPI F3 and OrangePi RV2 boards.

Note that card detect is marked as broken in the driver
(SDHCI_QUIRK_BROKEN_CARD_DETECTION quirk), therefore removing the card
while the system is running won't have any effect.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  | 12 ++++++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 10 ++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     | 13 +++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             | 10 ++++++++++
 4 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 02f218a16318..1ff758115496 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -16,6 +16,8 @@ aliases {
 		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -264,6 +266,16 @@ dldo7 {
 	};
 };
 
+&sdhci0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-sdio;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b9b760d7c398..7204f419c856 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -247,6 +247,16 @@ dldo7 {
 	};
 };
 
+&sdhci0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-sdio;
+	status = "okay";
+};
+
 &pdma {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index e922e05ff856..87e84a880fbc 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -537,4 +537,17 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-pins {
+			pinmux = <K1_PADCONF(92, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(91, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(90, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(89, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(113, 0)>,  /* mmc1_cmd */
+				 <K1_PADCONF(114, 0)>;  /* mmc1_clk */
+			bias-pull-up = <1>;
+			drive-strength = <21>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6..a5b7d7c8c066 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -987,6 +987,16 @@ emmc: mmc@d4281000 {
 				interrupts = <101>;
 				status = "disabled";
 			};
+
+			sdhci0: mmc@d4280000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4280000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH0>;
+				clock-names = "core", "io";
+				interrupts = <99>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
