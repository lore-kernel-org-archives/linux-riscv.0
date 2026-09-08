Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCCAC79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+oFEQ9P2gFdHmvvSZ8YTjzE0itkdFBjnQu7NMw+FDE=; b=33HKto5NBnGFnQ
	PtNTKggzxp+JhA1gIRFXIJXT2amnz3diqvtslWzfh3/DgiyA3XmxCzodkv85j8ssGXXD4KkBc2rXR
	XOTEw3TnVRWPvzycFPnNf6n5bEqrFU+vKm5sGOYHmXH9KNrMhx0JoRKNsha7PNl/V+hjjIpCzRTWv
	Qve+2YAxtM95Tjc1bGRnYy2S9zHQ53zqSCGvtf5Vw/SGf4/vdTpgtekEuocCfvraEtONiFFRZ+2lD
	hpJIUQMMxm1tt4oNqAy0Uelr7ehX5ddIPQ9PAkoEZj4hETG5qN+Q2wxGLkS8HLJEXEbE1AZDPSN20
	o4faNvmUY/cAGNeFq25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSL-00000008fFz-1lYd;
	Tue, 08 Sep 2026 09:49:33 +0000
Received: from bg5.exmail.qq.com ([43.154.155.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSH-00000008fCy-28d0
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 09:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860956;
	bh=ye2+hgCVmV0Etm1pl9xkufUO7A0KrAmi8ijs9rtlA0o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=QCWP5cwLjXDxyQgk/qT+n00h4w6x++tKlMPqP/Njy4UhgjP3AyfckarqG9vX6MtUc
	 R106hQPavNHddEr93FE1kJg/pFwF61g5kAkgizJKDUvrZHpw/++NYiUiXhNO4AicFl
	 uRjYv6TTTmi2EcFK2/FdTCYmTNCsURWEZJFvWsQU=
X-QQ-mid: zesmtpgz5t1788860949t89de5804
X-QQ-Originating-IP: 6Ndtnxhbk5qMEClSO2NDX9xqhZSsCRHuewa1p8jnSHY=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:49:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16003229966512833213
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:45 +0800
Subject: [PATCH v2 8/9] riscv: dts: spacemit: enable USB2.0 controllers on
 OrangePi RV2
MIME-Version: 1.0
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-8-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
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
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1482;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=5wPNIMHVow6IcqXG5hxEdCFYBFcsMipryVBMs65G4aI=;
 b=AqnMCw2Sn8DMnOe/3+AoncErphhyEiXtEQJJMGbEJfO+dsObsflnctvCA4m3nexAX2dyJoM1c
 1ZjeylKO6MBCLm9qtJbaBEhBiCCOD+wdGEK15Ehcph13gFAViPpI2uD
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OYb98MnhMkFdQedmfe0lf/AKlvnA2XtaMPAJ+w/B9olySAQmy5RLpTuE
	YYfY2yaQMn5MK95lcy42x6drti8ykekPnSlMAYxQpPutEaaUhZaUu8ENgnNKrFr6ulXCJVf
	6xHVO0JDNGDOd2I1xSto0cA0vnPlnxvg07HEMKFooFCHRUmhlF2F1KQlhLp+aJBiswZLn/W
	aIlBoWh5//QeeGNIc4GCq+43fd9BP6pNeEW8rQCsB3gnzrXzo0zqlZFpADOPy3XHOD8sozC
	5wb0EqhVmHWpsPRgDj/uamlI0BdBfB6Iqgoxq779PRkrLx5zi0hBL9zP/NrTkkFsRGYhPho
	biYLw/aF94jNgM1kS8RJOQbjQkqGWw2HI4qB0N1+p6/Yf0vt+/hGuDaRPh/XQHM0tlFh42j
	pwqqXUhM0IkzcY+Z2sqfXgWxB2TFTxZ/SMT+C4aC3L3wPp8gLMJAhNdO4EqKoETV6VNz6OC
	3ChxVjmoBMV35L770sQqIJlvEQUsFYfuSFHEe5E6Xz91zkqBW1VGy0YNGDV9vcjfvXTnFsj
	I3P7/YqYfTY84B6h//UGLkxoWLmHaXMJQsxwW57H6/YMajZ6Nt5ZnubuJRz/AlkYT9uL5p1
	3CF3SHaOX0IPOWVB3DruyiwGqHcSA5xGINcx1e1GasJKTFe497QrGuGTLDMeFDXkICq/UyQ
	JQ9V+4zYY+QEy0IVczP+5ChpOar7HjL8Ti10pt83YqI5Vf4+2142dG3yYj5T3iuGK4Ok0zL
	RJUfkUK04V4dDyLMSyhzC7Q+ZwJDNht+O8sFBhGkr2ScwsKel0WyG6mNhbjeBswo38ez2M3
	Why8IzkR5/NafKgG08GW7HZc+GA+720Ro9ff9HGd+KBRRE3dFuMF8CjRkH0hPlU4f9noODo
	rvYQJ4Mdm8wCS7ls9m2nDtNSD0xbJdtWtY51kqNiIkiMG7LR8PEZcwORJ1sQ0LwEk+14Ia4
	UR3bMb7saPvkNJMin66xvMFMtt7IoDaZrGvWfjSFHXMB9ybgYWbxXqQYbLpuBbGjJbTytRB
	VLlkcjm5pNPQZoRghNuYcYqpUrG6kpVEvz/hPkjM1SVqL3I+ICplRdrQKVNYcJe/Z2A+oxJ
	0ntWauHRKrg+Yp3eI6XwfXbtzjRv+kZIs73Bos8NlW1KIsIHb18uTaDI00H/2eKKbDQ/6TK
	HcnxEQuDUNJbH15v91LFnmnFvBNB4x5axy8LyDMRZ/wLD/c=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_024930_778642_6C69C501 
X-CRM114-Status: UNSURE (   8.95  )
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
