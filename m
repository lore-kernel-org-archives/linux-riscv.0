Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AC8C9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iGpNEZZfMyalik2IHWUjcYGgczveB9lCVzcIcYztlE=; b=Scn+QNxQnApCTX
	8xSKMbYPZWzE3tzaNEwyQ2Z+DvcHTZjY5rhCqO0DprYSSo7i9OeI+9Q3cKLAY8vmxNyA8SSUuh9qN
	8pfv4lYiEpaMERJd+nPUuJGSdRATlZ4vlKRUK3Q+u8ULqrFdMJ+N205/Nx+lrChulIYJ4in0I9uSo
	bjEmDWpvs2IHjk/qbtIZeVnnso7mA+QjOt4Z9t2ADcbsddqeof1XGQynUUCK+7UKzC1e8bqzvY4xq
	cT/6pJW3sV+rZujm0EGAB5Mz4jlKx6a6gR4Bp2cUPz2VQnwG9rtYR8wrrojsXTgkkDpGJQULB0uKC
	z3rhXk84X3WRK4amWRYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFf-0000000GFXg-1YF1;
	Sun, 27 Sep 2026 11:41:03 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFW-0000000GFLD-2Be1
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 11:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509238;
	bh=JTyCbtrgP2g9V2OgX8/xH3LSUFd4JxCqfiHkw9i9h6k=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=vMkIgeUJLWPax+ovaZ25W/m8UW97NIqJMXIhPq/s1Pteh6l/U/5C+hm3KhrArIAlQ
	 XkkS9ZwoTVmf5HnJOThHxHe21QIx7PdzUcXtjH1m/DIPIOcqTUL7BYNGf+UFKYwlXe
	 zQwiE4hoRijyCIniN7RxB0nNraT+et4OxIEMykEE=
X-QQ-mid: esmtpgz12t1790509231tadb578a8
X-QQ-Originating-IP: kOAQ5nIk/4ivFU6vIlotAvAKw6w5FJMKjM1n1qjroh0=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9188112944598650534
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:10 +0800
Subject: [PATCH v3 8/8] riscv: defconfig: enable ChipIdea USB controller
 support
MIME-Version: 1.0
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-8-ce7095896039@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=1116;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=M7yRx7CHlUpyiVy2UpKQtpOjQFifiBVJZkfFIeCLp5Y=;
 b=vSuuK0FcIGk5WAZSyTznYPbJBeFNp1MztZ+Y+g70Xlg3H5yk4/GZG6vdW/kgIAmCUnI6Y1tv4
 gM7awmWOXkVD2AHqb1fb+4ZvwuXIg/iJGiqL9VjpeScIUVONvAZ2Sgk
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: M0ZMWCe4fs0CxHMcAe3EX1JmCyns9CrbYTnPTq9YnT/8er8E/rP867oc
	rPfQ272FlaarwxvG5CnbaFylW75bmaOCRuI6RSkP5aOMgKDBjG0pLJ1vSok+0WUSo7F+D1b
	z5mxhIOu3A+U0oPQfrnPJ9TCWDJ4b9Oyn5yx/yIsvzCUo1aX6ArDI7GJKh54omR1g1Eh0xn
	UocgA/ofsDgIOQo7HCpTfzUYOgSK0XgfAgK3pL1JcjEKliBUJwG/4ZdP5TLjVK0Jf3+fZ3c
	L+gF2qEO4KhF+XIpSPiFitTnVz6XdL049eTLJgpEXY9j/ixLus0PTG67XuZriLgH1qLkCUq
	thVaVL6hm+mQDWGZSFYBvdHGDiOUm0y35aLVRPlQyJ5vdUlOW13t4kg3yg1Qe+opCPOSpfy
	K1osSDDGMTCLxq8hwuQ57XzlIRYbweksOWexCBFaV5j6/BCF75zuAe53DC18teebT8Rf6El
	itYML9FY1yC5DjjmK1JQkeq/PpnjBYPEuOfNHmgzjGk/DG34D8Q0Ua0LbrAdCapCoDujh5W
	oMRXRwNYr4/Nem0UAfkfmjWx/3oBW/+/VqN3yamXV9UxMTxboRqZgWBmurlJBJARIBpuc95
	wyRi+f381aAsLVnjxZTJwYnZ6jLqjmGTKRQ58EbzlNNqGfHJZ0FSE5gcE9/0A0597GlOfsr
	RmOf2d+M5dNia+QRoI7+IZmY2ixz5WUVsUcgWU1tSeppNmZOJXMNLlNS8MGUTTpMcL7RDKm
	gMzxhehyAfrDROuSCQjO6bpjxODUYyICgZyR3obh0Ugsg5CkbYKlyWq/avM2LEUI2l93wLl
	6/zuxwm/Ko56PTfSoQdfhj8gO0/lkGZt/J4gmzX9Mj12T38EEZS+qq8gVBL9CEBPM8bYCo7
	srWxrhpPIDqwrZ82ciBupLj3Xu3sdMa8Vx5yvah5CnklqinGrezpLWjRieQRUCJviYCQF27
	mhbbPRKmKjSePY19A1dh+bSenaZGO4HdoV+VYNchpMcirekHvSpZhKciGFa/pYWjVsSg6aX
	xzp9m9lbQp2HiW5EyFodFx75/lTpKSLlO8QUOgq8NCRrtPzNj0apEig7VxJqKOU/OOcr9iO
	/T9Be8M3e9Cj+NfvsZ6KffKTskXJkqrejvDSsDhKbXKiJl6wcN4G+c0JGIWlaI8ep54r1XT
	M7nkvyGFemt36rma8QLdkZ6cn//e/KEgg0kg+4Maf9RV3+7EwWxGeb22zg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044055_045825_B83301E7 
X-CRM114-Status: UNSURE (   7.72  )
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

Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY
as module to support USB2.0 controllers on the SpacemiT K1
SoC. The _UDC and _HOST are bools that decide which roles are
support.

Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..9a0b3847ff43 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
 CONFIG_USB_CDNS3_STARFIVE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
+CONFIG_USB_CHIPIDEA=m
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
 CONFIG_USB_CONFIGFS=m
@@ -272,6 +275,7 @@ CONFIG_PWM=y
 CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
+CONFIG_PHY_SPACEMIT_K1_USB2=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
