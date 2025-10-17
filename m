Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5A3CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RXYkY7CxXQ+5DLDL5YrQlCGvRwWjbTOJAdHFs9HQCMg=; b=HkPgLJBuKmUii7UKc9Jpns8f15
	pnYucjo/+W8V31cVz+lFCaqE1mEYyc8oBvuZlRe1svolQOxBpaQztKTh1f9pZF2ONQ2EUf8fz6+Md
	OZzdfgFy7wLS+dghyKZ+/b+TgUKkjfyMdl+qef2nsTiAESNFob+7ShVGyKFDcfCYcDjAp2o9wovtV
	Q84UWzBBAcvxEQO8Kdw+5BmPK60QGWXt/6CROA2u79UboCKsUDzigKzr5n/yYPqK5MH6/gDEbjSrc
	12FzOm4uRy5VIU1VG+xu+ZNMhoL6KSxTxZ7xQ74zCLVNdyhJRRDNE9x7gMlB6U49pL4PAOfMPhT7X
	NtqwvNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hHy-00000007OoB-3nlM;
	Fri, 17 Oct 2025 10:02:22 +0000
Received: from gecko.ash.relay.mailchannels.net ([23.83.222.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hHw-00000007Oni-3Mh2
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 10:02:22 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 09A642E1B91;
	Fri, 17 Oct 2025 10:02:18 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (100-116-176-114.trex-nlb.outbound.svc.cluster.local [100.116.176.114])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BB4902E1D15;
	Fri, 17 Oct 2025 10:02:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1760695337; a=rsa-sha256;
	cv=none;
	b=yWtJxqws8ep8csveUYJdwSVv/4mIBkEMlAgHFQ9aHtSt3I+5yAacKouqTef2S+mqO3qSdF
	c5LjLt28I3w7I/W03cLskQQeozcEZz3KJxkBcCne7NNLnxzM+Z2sdfUC98R/nyK0O89OM9
	ZwhsPrrdyHydFvPD4WefEKJGQ4dw6M9Pa74jrGu4w+75j8MHcFOEFxJ61RTTVA8jh0VyLt
	vpOKGAglwHtlN9hvPUIWM8mPxuurma28CSxuyWGDdwFJBbihNsg4kI/Ku2Y+g4FVy1iCpV
	5cKk5EDyc9VCizHFQ1nUq/bITYZOudYonrDdMIbMjKGkJZKvPr1H4G6ptFIBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1760695337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=e+L4LtthuzsbMVQgg7aAgZxuB88Q7T3LvO1UekWdj/I=;
	b=r1r0moGr6fzm2AxrQhptbsn2ka8vZgl/CEf2Qso7DxcLy+3fnrwcvfzs4Fn4Op34c3Oaxh
	U9dujecgpPQHotvNaNBCEo2r1g8PKQn9wfl5gI4+jUZOdNUkVCzvV3i/PVnjshilFgrdco
	nZqj6CJral2EemWrBH496I3grPO3ajlwPc8u/ZJ79zuo5zy/JGJKTb8GqrluqPFSDqWxs9
	pgVDXF5dwcPrKDX6DYwr7ZNqxGZun2TueHNZK4HZJUv0238a4lAp8BI36eqZega1s2wxto
	RhxCoCAVbDn60ep3VNa8g6Unnb5CHZzo7rDrB6cZ2+Vd0Ie3j1Y8IeaSYx477w==
ARC-Authentication-Results: i=1;
	rspamd-645b74df65-m6ztf;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Print-Lyrical: 75b15046794db809_1760695337884_3215376560
X-MC-Loop-Signature: 1760695337884:1846653184
X-MC-Ingress-Time: 1760695337884
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.116.176.114 (trex/7.1.3);
	Fri, 17 Oct 2025 10:02:17 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:2f55:e31:2877:ead4])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cp0jZ4lPsz1yVn;
	Fri, 17 Oct 2025 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1760695331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+L4LtthuzsbMVQgg7aAgZxuB88Q7T3LvO1UekWdj/I=;
	b=QNWw0WEw74xVcQ7ZAyjUeNOt2xccBDUkZ0E3xP8XS6RYlc6chIOsnkecW415ykuz9dLe/+
	zx8pExi19d/GT0Kqg/yXv/BQfIMNIPzPPdTwPGFRZQsL2JxfCtBKFk815lkgSRjvmXWkrl
	xmAV9hA5nDDrw5tQR7w+h1BvlLt0gLg09r0KfJH/60TuspBfqJuJHCksJ68WBCNea39NQ9
	QQF0HZP1qjZ7SKLIsr4SpivlnIGrRwjuMgMP3YTFCB4CUFYSy7+h5yME1KiV9SjZSNAOcl
	Bq/a5CukvjAPQ/iYKQjD7POvzoKbN2IyW/cDZ5X5DfF66ljDLBHmKMokD89mrQ==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: dts: spacemit: add Ethernet and PDMA to OrangePi RV2
Message-ID: <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 10:02:10 +0000 (UTC)
X-CM-Envelope: MS4xfNEWRm0UNZiN0SV5T6PbToMN20Bt3SC8JFQBUchInAmHgfHddIKs54lWKqEDgPC2Th/egqXIONX72UzV1GR0qFz99D3P5f/YcFFA+0kNyqN59zDPVLFC soOO5sXVNo//pgaEt/S6AYJg+gm2GhGG9CHFgYNMctc1SwRL4DiDip5Xbz6pfojVJxu9hJBU8tYm+UE84zQ+j28XeohS63tTXI7DYXc2+5zjaSnkWJs7X4BG as/H52XpQAw49cRnpaY1vyT6LPw1nBFec3pSdeLPZvaKr8v22oIOGgAmPKVtfKk1bPDpkregEPQI7mkyPalf4L7f2Q3N4bZBYJmLLyaU/NSHKIhLT32o6sL0 7eAnR4h4WQk/1aZz5geGzZojIKD1YO5t61Pu+aLNjBPNwnZpag3nCjro64gT1IiFgtIZ8b3fYXxm3VVTUAfXGYdC2P2dnNLoPj1qrh2CvTT1RINLn3mBrMwq t/nWgj4w+9koqP4esIp7hYwijjuU/nlZqtzvGjcq5Tv6TIgKU7rq0/U3/WooMV74oEMNrnDCNf6s4O+WoEN0QuCJo2ZC5rIxr9/wPEqbyzP35YYeaFxEbY9V sehDDUB3Ccurx6ZFtBPkmfq7+22jS4FTILuLq4ggEIXwiH2o0mg///nCOOpqMknKN+9zm4KpGf9uR130tbD92/3XwLPgHa9/BEJoLIPd+1WcgQ==
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=68f21423 a=/5xBaVTRis1tCxhfvtIJdg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=zpIi79OUSNkBXquUYVgA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030221_058498_9FF2A2C5 
X-CRM114-Status: UNSURE (   5.34  )
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

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Aligning with k1-bananapi-f3.dts

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 337240ebb7b7..2a75ca93b499 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -33,6 +33,56 @@ led1 {
 	};
 };
 
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii0: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&eth1 {
+	phy-handle = <&rgmii1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <250>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii1: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
