Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71289C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 08:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W12MqYPCYDLER0VZmbDpblGAbsbDB0KxgDffmGszCcA=; b=l46/u2/4AbZI2C
	l5x79YbI6AjkjveOayS2TPx8Kn179T0IVnwARmNNOLiRRH2EOO655sA/+A+zwsbis2XsULuNgAn8s
	/AJ+gQL3qT6mx3DTjr6VDm6nf6VbBCc1PamOi0nz/rCjCpsv4qa0G+p63WuKDzhZriB5pBryHxAWu
	trhaYBjmfVrwSHGzu8qr2W1sj1cNqa2ccFSan8M7a9mbIGHx9aQpkdA3/rpTYWyCT6+C1ayf23bgi
	Ii6XX6Yksi0X1klK2SgM6MIa0gsBXQAxTfyKptHF1IFTvraqYjZdbWsWgniea02iWlrT+PiBi6xyc
	6l/0dQJE4ZYaEYU9pkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNt-00000007Q7M-3gM8;
	Thu, 25 Apr 2024 08:23:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNn-00000007Q46-3MyC
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 08:23:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AFDE20005;
	Thu, 25 Apr 2024 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VS9/5ruLFq4DMfVYGxtTV+BUOQfVMQF+Q0f1QDQmC0U=;
	b=KkeEtjYODUakoc8nH31gG21azCvWKfVcJ51beFKQ0O3NFBReBe3g23Vjrdi19RX/Hpbf5k
	bet4e3FBsfv/KR1BAmCT0jaZCh2J7dEfAMPFe5vMviskcL0vMkcWXgNO/ae0ExXvb/ooga
	sx3VKu3RxBo730Ct2e0+CPZ/ht41wX5R+PbPr/rYPvbQKnBT2mQNH8gqEwQQ+mpdm1DlnO
	4U511No+6h2E41dkxxaqEdCNLq+CY3zNajMHWS3D0+Qaxijd1Wax3Tyccjz4/qgD93r73H
	CNHqUJfv2kCUf5vQU/WuTDhMQ+mhGgEQXMhDwBegc9DyoU+vHM4xtuVK24xAVw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 4/4] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
Date: Thu, 25 Apr 2024 10:21:35 +0200
Message-ID: <20240425082138.374445-5-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_012308_027170_13F5DA09 
X-CRM114-Status: UNSURE (   8.21  )
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

This commit enables the I2C0 controller of the TH1520, together with
the FT24C32A EEPROM that is connected to it.
In addition, this commit also enables the I2C controllers I2C2, I2C4
and I2C5 as they are all three exposed on headers (P9 19 and 20 for I2C2,
P9 17 and 18 for I2C5 and MikroBus 7 and 5 for I2C4).

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..22a6935e7204 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -79,3 +79,25 @@ &sdio0 {
 &uart0 {
 	status = "okay";
 };
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
