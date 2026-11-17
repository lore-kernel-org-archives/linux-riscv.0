Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5508606A330
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qfh3ijfL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=E20r3c9J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U34v8YYJjr6klvIfY3cSd5ZGf3Hp6oxCpRH+8HgWy4M=; b=Qfh3ijfLHpRSBbY8t5QUjebO2d
	EU0O4kppwjV3bEf+Tb9Gg+vd/xNYRz38Cww1lDCKYPCLIKDmom+xYO77/MhgBMTkfpQIjrX6pweCz
	mYtRJOyu01ZTTv1Qe04+OjAXXeSr0b05obCleBDtqb65n8e+2vU2S0SmLTA4bAJiThTCDJJAhQR9N
	nYzENJD2Pa8ZkiG7tVgW/Nl5Spq9rHBeyfGFCnBqcF6FpNzwEHtR/Hi5ymVQ+LgM6A1QHJx25J7Lj
	YldS04u1aTNZ+DmFsT5bsHVxJLGXWbXUjJahs9qudEA7C537Dax3pYdviqj/AnbFKqx+1c+nAG6Vn
	ynNcf9QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITN-00000005eeH-0AqR;
	Tue, 17 Nov 2026 12:39:41 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITH-00000005eUg-0Adz
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919159;
	bh=CQs8yOC4qlgYdYPEE/Hd5eDHwv6uNPSMlM13mTV36EU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=E20r3c9JlhXNgPC3heuKD/189fu6zIX9Q69Nj21JI1Rhp6t9f2JGSD/XU2h5ochyq
	 n3Rf2H6rB+HTrk3IJCH6ja+lxSUvA9I/H2WGaxbueHG2OYk+fVOdOZBS6+QVVRvlYk
	 77JoGyR3CBfGwvig88dmEdEXS3i2nf0LWRx4x/70=
X-QQ-mid: zesmtpsz6t1794919153t7a6e2926
X-QQ-Originating-IP: vRAHI7qxW8TfwigGmSJSPLYxtJRLVPJYExsO5HE+VgE=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12991783526982754364
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:49 +0800
Subject: [PATCH v5 7/9] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-7-52c3829cca69@linux.spacemit.com>
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
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1213;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=1INXjO+Im/ugaM5JZKucTtKwbca9TtSPK6qmT5NUkkM=;
 b=7Us2h0HiYr02hzULLqs/nv1oQvVBXDVAGH18Ahss0UEhUrJU7pfw6xsl1vwPq6SWtZ/M+cKu8
 WJSiOhdcyyXA5DGtEcUsBOHGGTa8Z1XIRzSoZqTl6HOZRe6iVsnBTA7
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OZsapEVPoiO6WTztfOElqFVyceVGXNwVEr6MN2spSl2oAqJdoQPFakp5
	HG/zLYKY3Gk8MPyCBgMpcnqtlNVkLL59DtkC7tnuzh5OzE8kU39DOYOaUHFvxjZF3f9yZWz
	aYVl3mq7gALc6F5nBjt9rCW4r2XW8WrMraB/yDVUquTGjFY/nPA6mz5ie50olM+E+pPOqvR
	cLkCglW/c3Rmq8prxCdn8CRdgQcoB6EowaOyNPOAxgLCmR4//PGn3y89Df98JnAGNIwLEVh
	LKZOGPpY+ltflIL7xlsyH014NI/OClDa1nlSPiL8Coc0JC2RxvSUJaZmgmufQ+Q0EsMhRNF
	NZk9lIpmQJp2sZBgRNZ9o1jkK/yzm5GdvNUPAIQc4mgquz1fLpRPZor1E/9vdxo4TWqO0cr
	zJ6RApu9jY0DhEmISItQZfXayjzmMQkapHwVIgA4YhEj3yc3fSVh2PlwhyxO7WSR/2nvUyc
	yNY3Vp2Dlq2nwMdw/LjrTuclcngyyUQCIqCiPdHPqpOgWzxb4mJpH6czh9hZ9gFRGnRrO90
	oqOmT+ngjG0OV3uwpvN8ipPir95d06w7OAQeLuBr6w0DcwKhOw6ckyD/qGco/7PULvUaY49
	PFxg2B9woLMhyq7PG14h2Ha10HZaftkc5hj27vIj9VBX6XWj4f4seg6m48TAtY6ErMHn4+X
	OGYZhzE86TQoygxN1fGInhTsUhnd31xxOQpe2n1cpeUMapnLRA+1IdM36ApTF2L9UnmxnNa
	wD1ETpBP8VkKgrwD3WhJEMQ4HPoigB8bZRP7yM6LkH9NBEwDB60j3L17LRX4bpqePr7jlvD
	S/SubmH2lSfbFx4UA5fvMSuQXT071/AZQBiKJR2xLI4ovQs59acf2sFMUmHBtbkFWb7/oUx
	rO0gzu8+uKIzibGp+cNZy/sKFwFS+Lnn1bZEul6kzrRbqc6wBRBwlIdviJNB695EDCxZv5n
	5WVyoIytnpL3bygL7p/YFIRBkj5Ay0KzvxMM5dU939KRNn9GAZjxV9cJo9TgRvTKTd/PZ85
	3eLwQcDpHUyPuKBXhIVIFoqssroWLVDr/sVcyq+qujBSLV1UuDz37TmU84CFAMe3mNuyTD/
	YqOKG3C1CRv5/9HoheKSTmE5lJaer0z30MOZuO5LtyYY/uCHXPcOID6KwlXST6FDma6D/lT
	NQup
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_043935_622944_50F11CFE 
X-CRM114-Status: UNSURE (   8.27  )
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

On BananaPi F3, usb2_0 is connected to a Type-C connector at device
mode by default. This port have no VBUS supply capability, thus host
mode only works with self-powered device or hub. User could switch the
role in sysfs.

And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
support cellular modules.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886bf6..ce36250e2deb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -383,10 +383,26 @@ &uart0 {
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
