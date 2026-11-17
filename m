Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C31F60A2615
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vJpJVsac;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c2ivbERx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Lo9ZB2a3Nnkw7OIVwk9zFQOEaOIA9NOb7wW3OnHTvVs=; b=vJpJVsacxub1rrLlu4hkD5lXCf
	leWiFJMd6xelmhj/c0hcsrt1yPdpfaliNneeoJUJeBB3Fh44ULwKeRf8n+BwSql6ep7X/t5F3uZT/
	Mud5fo2LXS0p30igZrbuDWMXrotNkHreAJU1tHpNASwX3kaABCYcUg7kNecJfbptnqzQtyIxHPB8r
	URUW6FSsJy5wNEnfjxunqgpByT/jjRVWJupBUX37iOUVmnM8Cm1TmDvvXzTa0DfZS+kQSA17wfaZz
	elpQS7oGMwxbYVl8cQwOpu7+5YhHNYKHbJ6FDtnQ8YBd9nywNaLfHtxS80A+LOakIicXmYzh2M3ax
	XOMhLmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITX-00000005elh-0yJL;
	Tue, 17 Nov 2026 12:39:51 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITO-00000005eY2-1ugg
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919163;
	bh=0rrc6yitlg3N1pLwaw+QmLd+KXVWfDzTO1188MqwdCw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=c2ivbERxNx8nC9elirXtOQB+bbNzkoE1XloPLuTjaAjxAvBDCXr20kOGU+boZH7he
	 YyyrPvJ4Cfegjc5NGPQorKacfjrWenE4zYnG5b6QneuLTq8kEl62f4yLgm+qZK3fRW
	 DSqYnNujqGW/WBTIU3xBKjYrY61XbynoWW6iGrHE=
X-QQ-mid: zesmtpsz6t1794919157te1ed1c3a
X-QQ-Originating-IP: ZFf2qHqP7RisJtMpV56HPT32knSUlElPmSfmDLZpxso=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16000574265018229481
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:50 +0800
Subject: [PATCH v5 8/9] riscv: dts: spacemit: enable USB2.0 controllers on
 OrangePi RV2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-8-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1584;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=uu5uKljJfa42eiLZB42IVMHS1wiDxAgRiYVIiQnevkY=;
 b=JzG18KJVb/s05Gol9l2+y4Q3xvN3ebpD82OuoWT7fCktQZeLzn+bD1JSVzxLzwVAqM7AJkkCz
 G80gctPNEuuDVEZrHEwV61BZYyLV37gGtDcV+DNvYgKub2LqnwNqX85
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OLGeby/1Q+87ktHETSuO++mUneTU43A2nxApoGEdAV9B14S2Ra8/Ts+4
	V/hGZ7Rmbnz0P1o/rdX4GUVovtjyClqPKW1b6gXAxrzx/meuQBfPp5+0LjDT2/0sPr/ovlZ
	Hs5ypO6Kp3VejZ8N1EwbYo14t8K0pfVi/iUlgHeXhFNloGOc+feUju2RqaqknUO7Z+H1uQZ
	ejZmR7YaFVHAbE4wIxkYbDiPIy9D7yDGLWC4880kvbkLvUgulo7UAHIfwvVhApjD5mCXzYQ
	adgPksh2yctryzs2XibGQUPKO/rDx915HasGQF6hUxZazk9LDT34MMgzAhciIZO5xnoaE+n
	46Uw3SuCRyeDgeEHlGaGONcbbrWVO2GgjgImIqUDwbS9OBHwfXXWcAX1o6gBl14j1p5D7r9
	l8AJS2j1l/hqyRtKsYM2nG7sjTAbTxmoYFfgQxjuC0FxDtiSSR8tiU9IJKlotV5xgwu5r3L
	iBs/WbyzIFpgDNrXq6I5P5BcNDJ5maJstnNLhPUZqs9n875WSgFVL/Huz/xxoIcybIZleLT
	nmiRbx66bGRLcVP0O1eCWrQwlQiGr+v7tPXoNELc5Vga65ACdjsAeiu4JC3Qud5LzHtOrUB
	33FmvFzJj7UJOs9dy/7+IJdK4pYfN2u4eREZSgKIu2xJQj000OijWG3ZOfMEGDq299NclxZ
	OB1Yq99d9s84p2LYE+QBytfWHPnbFjJJpvWlCF/a3C6oYWYzKz3vGKOu1mabyy8g2/yJVw2
	koeUdob40HpDUo7C5pfD59ROdsWt9y68EFfcNDtN/2l7I7R/encEAq0zwpiT8v97FzCLkSD
	/SGBRdrmCweGHL1QjSgGsMAG2Na5IOPCAymTFT00G9Un4eZCx/FyEauqdzom2utj0kqYsFD
	vHif6ywGTVgkL68tyAkLtReYHnD3Ne6pD4RNbkuHwzbzlSwYrS5cUbyPujHBL0McPqY9fCo
	6ujtA/6bmf4w9DVuSaw6/ZaFzllqFGriGrnjdKB5blR6QeV2+NDLm3zM/Jvi0ZgR8Iz45wE
	T89+kQyeU6FGDHiWN12I4dDdv9ks/cdkEq+LNPqiO8duDoBB45uWA3veNhaBs/KxyOGYF5B
	VB/KebXzTd5jzet4jdbU8kX4UQZfoP3lPdEDnquK4NBfwGHVMkTOM+orRqVd8e5lTfWhs3+
	w4ZfOjVlF6W+Dhb69VY3XRpTPKl7a2LnR/aP
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_043943_629312_F1CDEC2C 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On OrangePi RV2, usb2_0 is connected to a Type-A connector at host
mode, its vbus output is controlled by gpio 126. And the usb2_1 is
connected to the USB2.0 connector pins onboard.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f3550a..53ecf4826005 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -77,6 +77,16 @@ vcc5v0_usb30: regulator-vcc5v0-usb30 {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc_5v0>;
 	};
+
+	vcc5v0_usb20: regulator-vcc5v0-usb20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5v0_usb20";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
 };
 
 &combo_phy {
@@ -427,10 +437,28 @@ &uart0 {
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
