Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE18CA601A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 07:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38AtdTDK/7Q7ouilwqtTSCH/q2O+p2lrg0MBjiUVrf4=; b=LSc4oMwcBwZosu
	cL87oVVZrt9nDcOahIdHoEP1BBCm9Roy9b+AUGpXq61s+bjzaqwtj1ZS10c9+nOX6zgCAcJEKHsjd
	DcMYrE1k6wDCRuXqzDGg12z/GED8ThqaJccam/Wx9gQtOFD346zWeGHRYflrpN6401c8YARYJdeAl
	wGNXccTBYU8tVf2BOI+/qCE+0nhBaN0mSBdezSUQpRo84VYZSbA1AFsozjzw6OsD+u5RCyMPiMb9F
	LN0hAuoGdeGyF7NSyUXALEHDCM2ppZb91/mAlygwLJFPZMrYrSatrLpi89L3qtjTcnQRXysXmdUGq
	mqpMz4t5Cc6vzws95idw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF54f-00000005jJf-3Wss;
	Fri, 09 Oct 2026 07:31:25 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF54U-00000005jAd-09eU
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 07:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531044;
	bh=2AkTQKYvM79m33kLtZNYPwQIEwo2w87FfSkeBFySuJM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TyLK3ltS6ZqaTuzJlv7Q8NWovmQOs+N8mwCSbD1+oI5YLTO/RYRPKgFCncUT/zeMY
	 uX1k60u3f3hoJ6fTHMg6mqXhwwErhYwCF6TIbOznQ2tHbqBARt5JqshNkRav7zHSAI
	 nZffzzal7vMVV2pXeAGErKc7ltXrjNSaxCL1zFwg=
X-QQ-mid: esmtpgz13t1791531037t4ac2aa76
X-QQ-Originating-IP: jnojmnhWkhTmf41VMHwFt1lQEonSHKmuIEqZspJ9H3A=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10186281489538183657
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:26 +0800
Subject: [PATCH v4 3/8] usb: chipidea: usb2: add optional reset support
MIME-Version: 1.0
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-3-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
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
 Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1690;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=2IxCEOKKjMHvLmpnCgI1SGHmqvFF8yLBlmTGqtLvMS4=;
 b=rglPJRW3wV0146sLKSxYi3B0Zhyy1EPpIIgg5VELo8kj6hsrHFtN/pY7VZxjSjhTQKN+YRZq4
 qXXX22n+hzbBlvZPmyLKLTwz8T4lQ2/pR20OylINOFbzezVg9eJoV2K
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NTllfIjJ3Elk2EmZV4PrDakm8b04Y01/W8B7lxHzUH1yirzDeEDSrwc8
	8vTxn/WIH/lXXW1PxoM1ap8B4g68No3kGdf2IU2vmAksT3lllgAWK6Ncm6+xncF7AOi8qwn
	bfG3beGa1M7ic2B9VEhIClhRKlkeVy+qWnXu42Bos49YjalfMX+3uxMfuel4Hs8fPlPnODA
	Cn/JIJno07HuqjxKy4XY9wAzStyy4jQ8qpxC25vSWcY+Vml8nzFrPCPiXQFzj2iunpXHQQi
	DIiQf9n4LhPrBPexpEq4RS8TWsC+D7jUirc4uG8RBf4NI0/wftEQF2JZfZVrzrgHc4Y27qg
	CokFFyKs7lbjfLm15UqAHffpC+ugNXk2Wg00AF9zSjSfKReUDFNa3BIOBjxDA/F+lLPHFTZ
	cQA99JemSWprizEWN183X5N44Uk5ndB7yetNeNe6NF8hxei6IdRUPNbYG8wGbD6ugL7NVOg
	3/H5pFzSyUXWnSKkUNKzgoO83Wwccap3agl4xd79GlCI1gEFxJE5MMZP8J4Gt4FOXhU7Yf8
	QvOTcx5XWUSdzzIEpJqYWGu6ntwrt6R2gNMN11WuFsm7DlBOGDp3sbMxgcorbIpgdUPerY3
	p+NENggFtMt7WFq433Dj0nUDRfWGUlLrjYKytB2Roodk+bwzru4nTdVD6z0PZhCnJtXs8YS
	iIwacnghWrNvrKbx+DMNStyri6JFXRENNycGNNXGfbr67upDMUImekFAlaPaBsR8lELeMh4
	Kh765jSqTipTXijR7tFWk++zBqqhMINV4H8c84GaYFME30TlsSggBG+vdk2oeWMaaL3GdOd
	Nrpg3NKzBW+R85tzJZsVkl4A84X2+t7yOzV2v5sB2ie7ce41CofVHvkN/RbJGaNCZrFE6KF
	HCJ4wI8HQglI5LklrpsqWJP0zVr/+0hMC+Vo3aYOA6OLoanQIDe+zFEIzHRSPAms3bxt8dd
	YA3/AhR1PA1mzjsPMrvWfmKi+NFNbjraalTIxR47h/uWlTvYDNI7HIrgMPsLRHAySkjwDhc
	AyUVq5fH2YaFn4HaKVpRUim6fmzH95qMwzRyCOEEwnG6hUodlXpJtBY+GlZcdL45n91xjvY
	63EzSBNeuRc31pMae5/i3t3YQvOCr9JTEHKA/b6L1w1idznLeqGNDg6APSoQYsMFTpOygL/
	M46xkrEXW9MyQ8U=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_003114_431399_C27A463E 
X-CRM114-Status: GOOD (  10.33  )
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

The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
compatibility, add optional reset support.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 9cef902f36b3..85244e8bbc3f 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/usb/chipidea.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ulpi.h>
@@ -52,6 +53,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
 	struct clk *clk;
+	struct reset_control *reset;
 	int ret;
 
 	if (!ci_pdata) {
@@ -75,6 +77,11 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(clk),
 				     "failed to get or enable the clock\n");
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get or deassert the reset control\n");
+
 	ci_pdata->name = dev_name(dev);
 
 	priv->ci_pdev = ci_hdrc_add_device(dev, pdev->resource,

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
