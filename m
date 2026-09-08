Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DAFC79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akPiHFFxFjlnR5DJoDizLHUqOLbb52VSzcrnbrwxfek=; b=o1dbB9gERTqVmU
	RioZJCtPsdz7jFUadNb8CSN4iBF3rxTYXKxE178NY0yx17zx6sa3OBE307QiG18OnuWqGPYFSXeCp
	MxZFMj/og2GtQG+y8/tHMVHK+uEc+E6iULdTocAGx7DXB9bJHmgFFiLXqwnkNLPbOlm08319ucUH2
	dFPmKf/qILrLDdenFWJRmR8cS2qfr7bD3ITew9a58K+c4rbps8a8rRt/+PlR2Yq30aiPpDh9soIdL
	TFAZhMZuP7xmweBEgWCWJPzKcZVF73o868Ly7p7fdb5My1gHlevp+BmGrCsZkGjEzgCNaNxF1kto0
	EVuijj3X163xjXPey5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSG-00000008fDG-1Ksg;
	Tue, 08 Sep 2026 09:49:28 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSC-00000008f5V-2fvo
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 09:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860938;
	bh=dAtRVl8U9qhQzc+cO8qYDvos4RNAOBx2aHMRDfT9Vg0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Fx9hWMBHipwSMDOYk2gWbaPAv+K165gKZ3JwetsbWebn0IB7Ik0AQ96T4qdDCJv2B
	 fmPc4k4C/5f9NDrzeYd9oey5x7aFqA0cC328Lm5e9qFOHzKq6N7qIxUlwkgpV974z1
	 76vbEqtO2L8FAiYw7yNTeJy66Ig1i+/EIL/WPW3Q=
X-QQ-mid: zesmtpgz5t1788860936tbb038d01
X-QQ-Originating-IP: V4usWl30VbC52pKBiMxB7fj5Oqgi44cy6MBkVw0IMuU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:48:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 799141904883977626
EX-QQ-RecipientCnt: 22
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:41 +0800
Subject: [PATCH v2 4/9] usb: chipidea: usb2: add optional reset support
MIME-Version: 1.0
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-4-f07342ffa051@linux.spacemit.com>
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
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Peter Chen <peter.chen@kernel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1604;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=ILxkccm3lB4FrNMTwjEzpIQqeCQda7C5IPIEL5GC+lg=;
 b=SP+EtLL5mSAQSo+J8pUsM662GkuefM5JDnaWHX7n19eKg8dZgd7iA5ZID2OYyZjzL8dyENTGs
 rOaxi9KeFK9AJ5TXelGcR9eZBWp/33hlSKI5QJIJk6Z/OOkgfbsJxJU
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: ONlHltnRcUd4OwnNgn8Cbh4qmjbjDIElbVojQ7M6bl5HkcGYkb+9Tr1n
	vN6jerBW9AXMEFzeUJMYidtYOVUJp5IrvHDVnsG6CW4h93zKbF1wn3B9v0j89Pm8KFiJzL7
	RNJLcEo6zaW+tY9TvBZ7qIlqgL9VfIQ59HVGaPCrWVz+QTA3mJSIt08iUzNScQiLcGQ9CGC
	3m95IqpnYn/Bi6QIS5OHleOOtxJLA5Krn4DoHTkv5KF63l73T3gFlWkMhjTOjLwwQcL4M3I
	hSEh5XNH+0p/De89YtEftZkqOBLiMxVZflEZePNDd7w6YqIuwcHWRuCHPxYwvsIN1Imqy+c
	/ZtAPN8x2XwQ7V5bBeByji2L/Cz1GmM6Y5r4yGlsZshVgk9Slv4uLCpYLonvIZnGW2CehkI
	xWWJiTCPHtLp8FXSCM4CbRrDlBcJ2MZ9IVVUF+0FOQQUgfOEVogrZW4W7xkXBQCJj7C4cHt
	/WQ6fLAUdEyLwC8QRNYTOiowiXRR5oDYfILd5Bh0lJx/Bq4loGH+EnJ/VdIQDirFFu6U7to
	M10lXX2XJHoiCe4/ZqZhWdUA1VoD/qrSM4VBlBT42Toq5JB79ahpKNQyrgDLN8aS2NYXian
	BaGRqCck74uIduX6qQxcsMabXZpMrYqpphLQH2Op+WUoboN8QXm3Ymd9tUe+y7GIjik+Yn8
	peo6LRici8EYfhGJmZocazQRwBJQIqY7bZZKskWWkt4X/7ojdJ6AclqYVQzbCa8BYuskQJV
	IO4h1llRZV7myfZ6414vysuTxx3BWUg7tgOIksyUfvLKyg/J83+rLBg8B4ct4ipqGrxKgrm
	cqpP/6WI4iWiFJWO62H60xZhZyhubveU7Y8dSt2o52kmnGr4MZims4OUGhBWgcrlV6766+B
	kjN7HO71wDazSYrSOt5K9apQWywd3fZkVlXiEQF8Luacy4xqLnUeg0TIVTg0F8ipOs7piMa
	ILTlNnjV2LoHqGYxvd6J8NcsdftQq6Cc/gu2/y6HhaXMWGH3A2Nt0KXVVcMFAxiaQNbMYvO
	c5YO4qU2lOK6PYIw48h6BX6xY9YBGf1SOwZr0gNQKWSoQhcbTaMxdSM/S6fJySGPPeRdUai
	+8Z1HZyuqceMa3nh4XbSJ5v3Sl49GCIA9/4gHN/jvwuKkSnhJWELxCWo+Hb69b7MR3nFPBr
	XP+ScQyQF3oUT+NO3heJXNgWgvR3UmwNAqW/sOcCxnSyJjzS/YrSc+KcHHZcDqB+V4UXKHV
	TCgd4aUg=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_024925_488143_57E07316 
X-CRM114-Status: GOOD (  11.46  )
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

Acked-by: Peter Chen <peter.chen@kernel.com>
Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 6fae2d4a053a..f81673edca3c 100644
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
@@ -21,6 +22,7 @@
 struct ci_hdrc_usb2_priv {
 	struct platform_device	*ci_pdev;
 	struct clk		*clk;
+	struct reset_control	*reset;
 };
 
 static const struct ci_hdrc_platform_data ci_default_pdata = {
@@ -75,6 +77,11 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "failed to get or enable the clock\n");
 
+	priv->reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
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
