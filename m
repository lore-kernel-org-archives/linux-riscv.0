Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEE4C9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6YVNEJi1Fc9quvjDYLyOsfLAwQ72qOTIsoG65GQJDM=; b=djBapIyZvwZ1eq
	r4U6ouVtKwON2foVQDkGsauCilNN6fc0oFQfFc7tHw3Np0/XZ7NQ4fxu423EQ72veyOKDfViyCgCN
	iaHR3l2VT2tbNWHsCJjHQ9oay78iAfs6BSsbsvzwDIi6djw8ypFjtPA0VRZYwFRCNPhi1V40kUuTd
	8+EJMpHgMsVR9oqRKmkOhpA/EYh1r1IMH9N/y6WrVQ9qe2HdJOdUkI4UtIl73YDIJeYCS2oMYct7K
	wWHxjC/3Zm/1ezIio1kmJWBgH4uiOCVa6aaUPGqxRccBAEEflU82C6ozrHzNhEuKFssrmIokObRHH
	S5L6wlpg86kBRhy4KIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFf-0000000GFXo-1xWW;
	Sun, 27 Sep 2026 11:41:03 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFd-0000000GFNG-08nc
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 11:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509234;
	bh=4Pto2CbMqgiSHY+cyI/cnRJeRvRyAB0n5HA+ns2H17E=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=rebJmHN5uQP4JJaB4cyYOCq/eDoSU5n6vlmzMOccD0c7o5g8YuQBFlUcTMdUhmsjH
	 GwYtO/18+mUXW8d679eA6KqzjGI/rKyMQQFAX3OmA7y9KNmEBTNpsTotDRNgp3Vh6U
	 uYhreHEYUYZ4rdVvC+2V14L54+Ln+ny9LJQoF5xA=
X-QQ-mid: esmtpgz12t1790509228te9948562
X-QQ-Originating-IP: r25/DGgcZLhsdAlFJldW8RJWICJZh9QRUXi5zwK8x0s=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17715700320622488950
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:09 +0800
Subject: [PATCH v3 7/8] riscv: dts: spacemit: enable USB2.0 controllers on
 OrangePi RV2
MIME-Version: 1.0
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-7-ce7095896039@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=1524;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=QacduMJQZoP4ifs5fYWJikyOsuhP8hddT5yYcz6iGbg=;
 b=vjmJummGTgJqMbkiLLzIwEHbZtZoKeHrFRjQUTy2+XzOmgNle7iGdbZqZWcckge73W6WIM8eO
 xS8NM2IhcODAorfXXSISZM5xNELT60xGOXXa27f2RLjHiIoBR7Oy45C
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NR3PJyWXADsZH3TVTw4by9Q01diIFFQhdDTk1/TN7TvVsVmsxrcEVP8+
	DsJTue6N49SgsNIVbb14QpmglHFJrKxs7h7jer3BMGTcr2E7aArroGrTkf+8UirVoOuK+jK
	zOLAYb27Xll1Ie6JSvxQws/sqkPs6RELNxtRofOP+rQXKeGI3IwYLzzfnZoKVXCS2xpjVN9
	ezSVfloVmMpp3J1DbP9GQG9Ga5tJn0TP/tyQYvEKlrQhaTUE9SFV3qbi/tOCLcZRoIXB/Zl
	glybj1FpG8yjNCBVVfPq4nxx0NyDS4wWU49Gw3ne67fgDWIT0B4PND3ScPaRLK9CGwRZEFY
	3DZL9boQmTjOL2Ks4Xkwj7iAeWZWw74CTJ2BpE1zhfGJ5WeupVZO1CCklOf6LkBKW8bJjLc
	uVw71qyvT7pksipL3Ds/51xnlUBcf6cIT23YxMB+pPWmd6TBPCsSf07HCcabfR38nPbwolR
	caR2ApgyIK0bDVsCq942Y292TQxjMR8APTaFWkztgTRn0OCQ2/JGdTe44jDuRwbTGpC5sdv
	eCKqNXkGb0o2CmHeCoLp2xwXDcPp5ZXnfzODPxoATmSesZ7O3nwBQrZ2X9y6kGYHez/mPFu
	MkssY4P8An2Ha5YKlN8mNL7UEreW6WQl9AHZGnuDzCyDiwg8GJivY+hXh042lgbtHk3//Ks
	rDZo2tnU+yUaOYemMrmd/VJPdKhKd29jyizLgpmBP2GsVrhFviVw+jopIDL5OyRItqEP7J5
	7JPvbvCrWo6AS8JYaZ9qtODTSgbOLa4bTsDdCpDe9RN8330BdOaXGN14LVdw+No36s+wRWT
	5ede/eZDV2sb85R19IkakasmdzDmGeV36eaLsnjL+LOS0DQhltwsQiXZ8TY8Qu5jVvc0LNw
	5kjYozVpQY04tHe+NQfl9Rnq9n6+lgJFkEWLA6nCoMjr+5rM/TokveoNk5z8iTm9oMvpK0x
	EjX9JMQ7pbkQbZgdA5tiozooLDo2myiERlYD8Ir7AQjskb6C3k1OuTouKC57KlVU0tfpZQ+
	dJBNdNB5N5lGGRDOOSzUOooX80L3hIZGio5GzNMG4SEmAYYhQ+pSPzCpxG0hJhRfxQQAzP0
	+asLgmHUrHKAQc6kJyqRfQT/5NGw4TZYr0u7FrSofYt6Qwb1+QfRpFyHEaX+/5I4w0YZCa2
	4gv+CgySOf9daSQPRsFkrQiuxHA1X5oTvZ1NtxiRLf746eM=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044101_536506_AED544BC 
X-CRM114-Status: UNSURE (   8.62  )
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

On OrangePi RV2, usb2_0 is connected to a Type-A connector at host
mode, its vbus output is controlled by gpio 126. And the usb2_1 is
connected to the USB2.0 connector pins onboard.

Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..32d1aafc88f7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -64,6 +64,16 @@ vcc5v0_usb30: regulator-vcc5v0-usb30 {
 		vin-supply = <&vcc_5v0>;
 	};
 
+	vcc5v0_usb20: regulator-vcc5v0-usb20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5v0_usb20";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -341,10 +351,28 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };
 
+&usb2_0 {
+	vbus-supply = <&vcc5v0_usb20>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb2_1 {
+	status = "okay";
+};
+
 &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
