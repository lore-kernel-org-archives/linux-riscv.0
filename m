Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929A9C5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWwrryY9w23402V7aLA56SOSVobnZOim7D8ELttXXGQ=; b=v09B6rwxkJ8A5z
	5BBYAkVQl3iIX3lPog3kP1mhVCJ9M3auIngjVRvM/kmxXPmsMO2sY+s5pM2+LOb51MIcHhPklzd5z
	8P2P2uVd7UA99g4pbFbtCnsxr5tTVIgGOXAVEJl8Om7LuCOS/PUnid4WGea3IzHZTBwDjIL5EmCOB
	7Gc/ohw06qTmDkR73Ob2FSlbRsNkRqEMEDTB6rdAGLDbjDMrrsAN2laRCOosYPNF5qdfQtxNov6on
	RBA7fldEjOqnLbWgkqfu+VvRhCA+27QuoBL0XB8kgHERT4zeAhgHq1rfO0nI678AWIYS4xwHh6oBq
	weEcXzwAaT8ccf00ARXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5GN-0000000Fkck-45lC;
	Wed, 12 Aug 2026 09:28:44 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5GK-0000000FkU5-2TiG
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 09:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526904;
	bh=/Luj0rZ24gi3p3hMkstLtxRbzL+iDj/w2b0VHzCJzRg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=cBHwSGuKTepgb1nSQ1bI8LAhEjHK8Zo9b5hLyCYKM9Ks/0pSXVC6z2p7ury0YObos
	 a1rT7ppc3c3vzqHrPn2Qe+6AS00B0x0/K+Bl1mZmW9J3bT1BXH0EkiqW8REYZO1Cdr
	 RDUmxjXv+/p4XK+1gBFo2O35bJbDyOy6DjfgLWtQ=
X-QQ-mid: esmtpsz19t1786526896tba3a8412
X-QQ-Originating-IP: 1v6gxZgDFks6DVDmVk6b0Y5oOu5AwdmrEMIGntXc/9k=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:28:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17048200102989443850
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:17 +0800
Subject: [PATCH 6/6] riscv: defconfig: enable ChipIdea USB controller
 support
MIME-Version: 1.0
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-6-f28cf29e522b@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=996;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=A4xMeuEUHZCqpZFp4jvx/SNQJmHIuu7ZfE8MQ/Z1bYI=;
 b=YFJ+ho5R1xV1nolURCAMGeV8vH9qzM3btXim+BPuoScCG1Tua2ODkUbg/NQUU9cN4FFXV7EIM
 Rb2YM+L552NBQ3vX0RED2XDpGiDyrCml3/9fehNnCtkRJ+Qfl+KRPhs
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MBXtwlJo/hB6PmUs7euJwYNZZbwdbdLTGdLQPvM5lCa6IsSndZ0V0JQN
	TigE9OMd66D739jMGBBmHeilBjqRxOFkVjI/+3DfTUCsxgN6ql4xkOgUBTc3YqQ73dGC24Y
	AXq+mg2y8WB/zVIhiWhG7KYZ/tVs9ZH61bxui8+DSzKmMUDN+pRD24pXfKKgHTYxP4LQNQS
	Rd0ajJz2XVrThGM21qbFxgNeq6wNHYaP83tf5CSOEPP10HPzUyr0mnIh5A/rjji7j7FXX6o
	OSps/EVm7vcP5pMmEbDndrYsUz/8HAS8WqDiZBTg2EhDVs1TiwKo+olTug72dDorZ+R+9M6
	rlERXH5dVsBa0Zf3E5tY502iQEp1JEhCYd/euABgkYOUHf3MZkp0vJWqsIKMXLzGED1NDwI
	2pwfbfeXElk5SClS7QAM7ziPpXNrZpy8I7aCa3Sk/3IAjp7espvq9Gzo7LKOeq4VMXKnBHQ
	AhvE/vqbvM4DwX40s9ppWBbJ7DJciAMppAS5CY152vy0sCGJTnJ1wgDxzOzIY0z2cPGQMDj
	fOFiieqM/zWQPQqo2c8WOOfQK5Jq3l/gKJ5+BwI1KQXcB/Cb2URO0cmZ/vprZ74FgpxdFeq
	jNiOAJ2cSZ/07+KE73QCW9Hh7t9HDnQv++vRLc4R8HlA2sjyO46tsg3FHY8Svpso5hEakz+
	pffgsW2jbIom2T8GfpBCdgaIMW9JrgJL0qmylbTD3FJYTtLVYlUvW0D0BTl7s3DswXG2wyy
	QXzEU2wp01dI1ZEQ1CzCADs3pSLVEp852XXh0/bWpL8ZitJkkBsueGaWVS3ECtI08oltQK6
	L6Q5ar4fEabqnOYpHvHI5e/46xoyKtzWJK1fN8hRYkhSRclAC3TVcDfIQeC2I1fW0/rv1fk
	SWWDUUYjXulqVBVM8RakAqZ4O9HWTsKNDQ2GELP1UJhyJ8STjoTJU2QDYiF6U6N6toC42sD
	RoFEZJycylPOV3et8PEROJK4ytdz5fREHNBN9aRzxf9S+w5Szmxg8DFu80tb8lpH5egKJNy
	r3XVSn1GG/owjPqf36M4voiY8hhw17LFbC2sZEU50Fsj1hCRtsEaLsRmv52GD4AyGqQ/PJx
	AsYkBXmj5BGsKonBdpVVLqKUaP629yZsrXXIXllzDHnSONc4RxuYJA=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_022842_002898_7492FD23 
X-CRM114-Status: UNSURE (   8.97  )
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

Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY to support
USB2.0 controllers on the SpacemiT K1 SoC.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a4..6e8c9f620408 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -219,6 +219,9 @@ CONFIG_USB_CDNS3_HOST=y
 CONFIG_USB_CDNS3_STARFIVE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
 CONFIG_USB_CONFIGFS=m
@@ -269,6 +272,7 @@ CONFIG_PWM=y
 CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
+CONFIG_PHY_SPACEMIT_K1_USB2=y
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
