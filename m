Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF5C606A89C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P0rV3hbp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=sCppH1wJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XUuVkCQ9v0N2wNZqY2PM3HTr/XzRKpHus1pfEd5pCEA=; b=P0rV3hbp19tilBl2qCzR/nxhkB
	rFbuLvhKe5nlB5PdZNu61IZfnrKzYNhYl+op7ohlb+qc0N11Q28g7y/tCvIuGO6zIQibF4XXAccPq
	BGkfBb2bqm8Nuuh1U06SudgnSQHUsL2JTKRTUn/5ZaQCnlZkRMSZxG1PfUSoB1QLcnitJuVX9kcpA
	i82enZ1YqgoQt8EgHbMkBlwaJCHm91Qarp1Jcs0boOZ391QNlkkvFRp8cVJv5XOedvKyE25HXW4me
	WvB1SQ+TtOU5WrGfxcqgUoBfmR+6bMOcdGofhzshP33UYYdow35XqAvPjnnsR6ERzU0SePmOmXZdJ
	s4dzQfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITf-00000005erQ-20CV;
	Tue, 17 Nov 2026 12:39:59 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITR-00000005eZR-29cE
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919162;
	bh=g3XrxVl29KacKlQRIN1gy23c2VjGF2woZUCFggJlwt0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=sCppH1wJ3liVVHPDa+8bt44Zl/b+1YP8l53ottzJVp36BP9xhmu6mgupC4zTbiaBW
	 xLITLodET/sFEhLgvlVWojCiv6OaQcG9ZhAd/S/+4KE2z6OoLAaso+mJ99bMk2fQyL
	 LeKoECc067JP0K/JHtA2Vp9jXBXe3WAd57bHH93c=
X-QQ-mid: zesmtpsz6t1794919150t0231c823
X-QQ-Originating-IP: xXPFKjlewoV7k+nvY5YMHUzCW0y+VjSdI5kYEFc/whM=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12814507513609067506
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:48 +0800
Subject: [PATCH v5 6/9] riscv: dts: spacemit: add USB2.0 controller nodes
 for K1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-6-52c3829cca69@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=2186;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=TE3ZmoSbwMioV1cYWrwZplLOf4/AixJgi7cmhlpJlr4=;
 b=NKUqtzmZaXjoAU8RENbPSPsPupJ4BzMvAKw2rcSWc6RVTtVRGKKe0EmJWhDTVByiKhexzvR2S
 zjUkK+eGbJqCsajwHVR4GMkszb8xSDybO8X7qUWzn5viZZH8cgrxLgn
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NfGQECF1EzMaCFIGEthIjp3oc6NCoW5U9RYC1n7+M2qTGxvawEEQeicT
	PFbC+auVWr4BtOqsRFR5cwDk6e1h0v5ktGI9SwKotyAN0YC5Xda6XWfhIECkE3Gy0ByJKFX
	eeoZyEBQ4vsk7aVZ6uMyOfrwbxTm4AicsAR24+g2zD4GZKrd+oAB0TysJz+F+OXjfdZNEGC
	NygI9YKXQDJwM0C5ra9h0caj/dxl22mDZIfDiN3tJDoNyjs8UoFY69Y/YxnA5sB5wFyv+Vj
	yPnIzX9B3mANbR3s7kBz69RRmY5+hWyWhd+daabCnuox+pI2wdfnR1gPKqZGoCC8Hy8e+23
	c4PSNGGF+GJx4WKUUpG6ztv3Hc8lScMmeHgAKiPsjbd+ofcfwPIf1RNRgtbbTyUKkSVFOcD
	g8HHaKoGf2PWGfA8hTBuoR4Fw97cgzh9WDy5c651XxKt3NQizx0uK25kAqRkIkOowUBAQCL
	MZc1LH9X4keBTjT/xUjURmTndpislu6PJ+co0jq6CputNwdAXAKF5GVuLHihNtf3KLLeR7p
	Q2ztAcZIaABXowhEGucGOI5ZueuVoFkIfRMdhGqu4kfC9isWbbexI0uZB305QJx08Hvmv55
	QgeGoDrDhcqb3B309cw+6WyXBzmYEMssYfaMz7EKR9ke14QKoEUMhtdl6gtPAlJcS1CiUBJ
	ifKSEtO81sqKQW/RrI2WdBLNb8z8Ti7dV66qMLoQKw6MlbLaeM2kmbcL02VnxQUAMvoA4n2
	pYzsm6m7EPKk74TobFSlj/jxU/pR3QcjD3aRkB7xrI6DIsO/WZKbTdY2Bxa34kt6FwLu65q
	MqnlRuq3UgR+1e599ArmopAJimHDRcg41cCt/qFJlNIsnxPUEtpmHF4cJXy13Po2CHNHJt1
	QD62piTltjKkjxR9kzzkSSLqXRXQkWlXdTE2zfLkIndkrJXkeyD5atSF9RH2RhO7gGP/i+x
	gJ0KvlhwhR1LzA6tJtaps4qTZpqui58kT7lOqACtALFlIaHgoftkNvUf12avk/AXdiUU2ET
	RiFXOUOYOIdFoTghLe1x4CKP97L0NJURvFE9NG2Gx0MsskcevoNlk2u2ZNrfeeYvUZ0i5hl
	6OU5Mou1hw63Y7nXf0FP0b4FPVko/LefBPm+IT5iVPZcquBL33xQVYqhZtXEw8j5xLfYGKM
	NeaD1dqC++dir3dtutgAMojLUHQIhNm90oSe
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_043948_057900_5CBFACAF 
X-CRM114-Status: UNSURE (   7.89  )
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

The SpacemiT K1 SoC has two ChipIdea USB2.0 controllers.
- USB2.0 Dual-Role
- usb2.0 Host Only

Add the controller and PHY nodes.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..e5c701f488ea 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,22 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usbphy0: phy@c0940000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0940000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_AXI>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usbphy1: phy@c09c0000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc09c0000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_P1>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usbphy2: phy@c0a30000 {
 			compatible = "spacemit,k1-usb2-phy";
 			reg = <0x0 0xc0a30000 0x0 0x200>;
@@ -1301,6 +1317,30 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			usb2_0: usb@c0900000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0900000 0x0 0x4100>;
+				interrupts = <105>;
+				clocks = <&syscon_apmu CLK_USB_AXI>;
+				resets = <&syscon_apmu RESET_USB_AXI>;
+				phys = <&usbphy0>;
+				phy-names = "usb-phy";
+				dr_mode = "otg";
+				status = "disabled";
+			};
+
+			usb2_1: usb@c0980000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0980000 0x0 0x4100>;
+				interrupts = <118>;
+				clocks = <&syscon_apmu CLK_USB_P1>;
+				resets = <&syscon_apmu RESET_USBP1_AXI>;
+				phys = <&usbphy1>;
+				phy-names = "usb-phy";
+				dr_mode = "host";
+				status = "disabled";
+			};
+
 			usb_dwc3: usb@c0a00000 {
 				compatible = "spacemit,k1-dwc3";
 				reg = <0x0 0xc0a00000 0x0 0x10000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
