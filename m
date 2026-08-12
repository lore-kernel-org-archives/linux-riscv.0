Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0555C5B56A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 09:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHeQR5jSiwNy8YKiF5tCN7RnnWzCNidGcA3DmqzTopQ=; b=RbUaHDipkffst2
	VUi3N/vThaQrwoDOEedU19TGajl8uOqdfyGLKymFseTNW4j5MCrMdZsU/6R9lPy/QhySZytUiKgkl
	2JhkWlpLB1c3T9zMwoAwkj1Ku2mkt39IK6AGdf3tCc7/TUo5anr7J5Jj3Pdaj3rZ78HZIx+hZ4tg1
	o1RB1K7ENtph2pByjgsQb9WKnxhGp4VyMgX3RdTqR5wY5yG2+9XtD6q88VG6KmFnQq1tT+fURqM24
	7xSPo9cPzVOxI5PtFl21Up/sa9em9pdD8gsXWk43tReUsrgiGvmac5o172SewZ9H7dFbIwTd5gE2R
	Axk0PxVg9ExiNh/6QSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5GD-0000000FkWz-0WTf;
	Wed, 12 Aug 2026 09:28:33 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5G7-0000000FkSq-47n0
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 09:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526888;
	bh=Lc2uktEckigDbEUVNS6VnRB0pAKeekhCQUwl7diL5eU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=aLiJ5DKI97TMEcgCjCnaCKCIF5WLt3h3Hr7ycNsJdGoq2T5CShdpCpB7lp3VXSlSl
	 Xe2HbPoHB8EhemIy7fiJIlEBMA0m8CbsxifXNIFBW3CHeLNO0KzYzsMiaEk+eBUrQo
	 +AqyV3z/wZYM7r8MBOS5KMzeIrUqUdTDwdYFtGDg=
X-QQ-mid: esmtpsz19t1786526880t1a489ab1
X-QQ-Originating-IP: mifgwaU5rE0wyxfQ7HqmILoA20utuNZcAnGFas03QKA=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:27:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16125094110360277280
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:12 +0800
Subject: [PATCH 1/6] dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2
 compatible
MIME-Version: 1.0
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-1-f28cf29e522b@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=935;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=HQevjP1Bk+ZAQOemFL7GBJAq69tQ+wnb040ddwkXxF8=;
 b=txHKNmFk/WnDKiDivXg5PPrgRa9nrZtnLt2YTWh3MaplCXLvanoGkYQHshEcB59xTJkI2EsPw
 5spxlRT8oS9An5Q40UqYp7i5ej1D+Pn0ZxFCcqeIiuNPH3/XpG9iWRe
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NHgT31LhP5vDm3HyzRqsgbXBOy27dbG9cXgXBIAPAv0zwmVIrDvv+MCh
	ZuOgWq4ULHacjauB7jBEALe/J7q0mwIb1Z0yLSrqF2R7X7AmGqT02+SAdBmt11aUqWC5j2H
	H1YVSqXB/OFn5QNCNvyjeuz+QELPMbBKYOaGMjP68Ykv80c2ekBC3sTB048AcUMbTHpyC4q
	z3Expb+S1OwP4e0YI3M4PsP67jm4tDFxUG8cW9jnjJ16wbE8lTG4MqT8GI1F3F51hU3ePlR
	lU7N/W4Bc8Mulh9saIhRnDlTQOQ/StFBMRNFCOehLx4wMmCPYPVQKkTxTEXWaKKsbCc+s4T
	SFf1Tn3ItogSTPPCIjrle1sEY3B/pBIwaa/MHOWVmBstg0TX0FONWrBGGlPnF5+ac2R/knC
	YqittOyjbY4iGaS8bVI4thjPSqr0AIu3NEEpo8GNvD8/7SuL82Dp9DzdMag1ih9s/531J1S
	Fk9BEAP5Ln99v2v80ImRQtP5xhB0ebXTMsC8UIraVakyj1PqeLBcy7ztj+etzrp0uT44EKa
	M2hS6KMdnhQTxXivFFilOh/+KmJZf2p5tvWoBwZMCekvZpCumlnleLB15Kr06wYm3+SuCgK
	XxgWvOVzDo3+UFanyj025DmACXlCDulfNAanZJjT4hA4VBvXZ6b259vvERGR64v8bMb/lE/
	ui41xPiLVGCv3dX0dsQTib6WB5/cb8ijGyS7pB/0H9EPkdUMxSVjTZsFQReDV7N+OFmsPD4
	3CEiDiaJ8lalxrYoEFVJTrKZxMsAZfxhMb1gs+r1t2PWTSbbkUQcdQHHf6Pz5fwSUbeabjI
	q5YTQw1YDHpTpt6gL+Vi6RsZCrcHz7ESZePq2SWx4aD/oQd2Wi3Xce61BQZ6oPOu5Udxqdf
	jEdQCbjoJWHAOg0bVODq3lM4DY8XF7F09e+XbJ7vTd4evsnL324FnZMe7iGA6D1qCTGr355
	/MRXoCDw3YpTrdknDSyg45ZG0JyDFmjChv0K8xSNAgCM++RoXofH9Rc+g3jtVA2JdDTGIPg
	IlXgLmcBkjncmfwq/kWUfqwp/IPxV/iJV0rfzu1nCz8OnjCmFf9acB0id4k0v/ZWPbcC0Xy
	A0mcU9C9NsfuJwDrfPXmakC99yW27SpYg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_022830_187844_E4DAC552 
X-CRM114-Status: UNSURE (   8.08  )
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

The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
has no internal OTG registers, this requires flags which disable
related features set in platform data. Add a compatible string to match
the platform data.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..6f8d88a0681d 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -25,6 +25,7 @@ properties:
           - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
+          - spacemit,k1-usb2
       - items:
           - enum:
               - nvidia,tegra114-ehci

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
