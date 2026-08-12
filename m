Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E59C5B56A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5TotdIjy2j/BI9oN6oRveIotlAF60Wpa+BDAzTDol0=; b=CQe9rpxcgkspI8
	oTCjmz1qFuFqYD3D014VpksbB+PXYAhitEJ4TugL8qeP4/XZID1n13Wu+gt3TaudS4OuWpZZpZQm3
	G30gM4X8k4hwVVOqXTXrLkyeQMHS2xyyUwj0Kyouwzq14QmK1NyKkr3gEgPrJpSzVGu2HQygljb15
	I+rVKejATpO4/GDi85i+v6wI4yOYaaJGD8Mt2Xft4FlSUgoPcforstcy1X+7KiU9uYFdcfQSw5onI
	C5RZ1IgnfUZ510zbqeP/aWxw/l+umjXZ4ZnA2u8N16N4I5RIo7m2a3YE5047b/bcjusuu/1AC48he
	Y2BQ6Q1NOFfZV/jluPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5GQ-0000000Fke5-1iPU;
	Wed, 12 Aug 2026 09:28:46 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5GI-0000000FkTs-3JOj
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 09:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526901;
	bh=DdnQi7uIspErf3CglYHsPsOXNgZaPH7GbyYVrcY4z/M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=NTkk68866o7SlopsKW0vb6kHphWEFmY1reX1B1WzsDk9d5zJp8ATjKhbU5cR4RBDO
	 5QhK405fkSbnBjvQxF7AHEk+SEqA7QawluuGQs6n0d7U5chU7Tu5De2AOI9EAB9eOD
	 riTunwcv1b2aS1xcP5uDmEod12GwUHBFjOhNIpJU=
X-QQ-mid: esmtpsz19t1786526893tf6457763
X-QQ-Originating-IP: G8HrIQpFl5BaTpLlQKM3Aw5AI3ljjOb/JsD6DVLyPpI=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:28:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16169041162177916491
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:16 +0800
Subject: [PATCH 5/6] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
MIME-Version: 1.0
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-5-f28cf29e522b@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=1044;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=MpRAtsb89ZpTQlLxHQ9ITceVhO1zFp7m2aej/8/xxEU=;
 b=FMXYLVPGavNWnQ/M+MdGUKb8XaNxqQWc05jgYfHLKRBK887cXZ2e2dg5Dvco0GC91MRxVDoAD
 rDNyBUa7QYNBLf/o5t7XqKWO4dNUFnggOouOc3RXYOIrGdb8lXYfRkz
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OaHhCqwLoLqrzX++dvt8s+/RqzWls5LV03GNLKf6you89PsCBbd/zmnt
	gkruFjI2U+3MbYyum+G8mz0ZI7SUbFSNZ33QqOLoP4zMqvUniaEFj2cM/SlnMCLStq8nD3w
	spALFgC2SHv/FOIWBF3nfOaujkoWBjXmVvxC3e5x5tC60KILrklrzVt40FVsac2ChjDRlqQ
	nbZCl+aL9X/xvQqYR2zEddbKa1OjtIvuRH8uhabFr7hyVFZSZnoxaSvKGnylNTLWm8Rodhq
	WlrT3WbuP1kuEWExN0D1b1jCJSWjLBvLYIZYQS9BKXep66anHwbGdKLvYcOcRC4E8LMcUdG
	FasagB3Z9j2+ev+NWmt/aOIXsFq1IryimoU+hW73bN4pS2d6zqexiqVtLlbjjgyRj5/T/6Z
	5o6pDr8pZq02d4Agojgob8mykL8LChIUHOiRWkKygSjpACeqb3gCqGs7I/OSqjDPYb3vMeE
	VSbmUYM5878Y6MqtuOGUo1j4wVHpxfmHJAp0SsBkB+gt3QwPPXtSlFFNP1jk/sBPfcWfonn
	LJfKcDqefZnrF35+Q9bEiSjUVsePG0cti9JuopVybMY2jevUbx23ZwIlGMEh4IBTNFa7z6f
	Ghy3P4UibCvkhtZ4z+59G7uRlmw5lT3DL3zBecVrnYoBIqhlY3ylqOnQOitWndRzY5BGffB
	SEoP7yj+DTmn6Ay3fr9oG0wt/siqdu2kmhXbtNvNGhx++KtNtCdCdfOL8/qUgESVVbl4MZL
	JAEx/9Oi+odN9/Phy0mYni9qr1TY9gmqz6rkIaKeq2L5aa51IufThN3zRCoz1MNlLn21/Hd
	xyBSmRdiB4VNhjRN65qR+NIZVv4GZ+wCFc8kZDXW4A6Q3sNMdyeJ52DSB67Qp7btpehxt6U
	mk7ZjASu1J9iB1xB48nit17mdrHGdM31ZC509MWJ7Y4bm4vJFG/QjJp1BwX5sWq0xL8OVis
	vXTkoMv5gqlRJ+i1+c8zrnBz7yODFTa5c9cbBNU08cnEaPBsqMcBTO2syH/eoIdtkppUs3e
	mGEvvmaJaIsh2gn0FEgOmjhw56MRy++5vO/sPQwhSEE+bwVkWqZrvUjfNTQ9RD8qprR1HpO
	oUw8ozApVP4Z0JX2ba2AGPwERx+Bh4qumaLRdMF6JZ/+df6qWsjaryQkgDjn2P1TIdk69Lw
	FITVUGELBcNX1wZn/vztr6OL18yUWIq4Twxa6rFO5PzW2F4=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_022839_695495_89661C31 
X-CRM114-Status: UNSURE (   8.74  )
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

On BananaPi F3, usb2_0 is connected to a Type-C connector at device
mode by default. This port have no VBUS supply capability, thus host
mode only works with self-powered device or hub. User could switch the
role in sysfs.

And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
support cellular modules.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 72f77e9edd63..fd0f96262009 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -350,6 +350,22 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usb2_0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
+&usb2_1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
