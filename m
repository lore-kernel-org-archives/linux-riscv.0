Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CE8C9833E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnGbabTTdQz2dVuvPQvgfCHnHXuDNDcMV6ttTAnOls4=; b=Je8vVuXORJ4hqo
	BEYIaEHhu5c3IHqY8SQJxs5gRBOuOBgRv4g9sSSNOZJE2oGEIM3254CvBNhx0D6CyCoreQwMFlr2t
	7QIy/m7yjVKzXEWYamSXKKLwHgxUqat4KqbAVV4O1S+RsvPPjdf1myB1QPK8UJL9Q2flrZ9r6L7YL
	v3x4myQr8yjHyx3xrvj+233FULLrHAbEUNTnDu0u7riA9inXlsjWk6zuiQKnKdSlLJDDTh7lrCi85
	G6K+NAk8rlGLYONfXYFxLzzP4tHYgdD/2+AiC3mdLJSRJhsJ+9X9KqdPnuk+ld+ozh7mSXIAP8Nyu
	Vlr/aS55+mqcPBemhHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFL-0000000GFML-3IC2;
	Sun, 27 Sep 2026 11:40:43 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFG-0000000GFJh-1cKN
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 11:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509222;
	bh=h4oHJopTwmhm8QXLGcigKQeUNnt6dZ6MO8N8wIcFaGk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=BJBGpqvzAfxPTclLwutNbuLxyF+wKQZACDrRIrwZsVv3abVG52SKWljgkAjSwiNPi
	 7miyyR4bgUNEGVpX+cngWhY1BCkDaBc4caR2L2oHOPfZr6lA2GBi6As32G/Y8PA6uT
	 9+5DxZnzGVEWZpfbHrWheIHBSoFaQgW/ahfhGdZA=
X-QQ-mid: esmtpgz12t1790509216t394c54f7
X-QQ-Originating-IP: EpgsY3yauFQD7npwLn383yght4CbzVSYIOcknKMO4+A=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2763273516611729407
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:05 +0800
Subject: [PATCH v3 3/8] usb: chipidea: usb2: add optional reset support
MIME-Version: 1.0
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-3-ce7095896039@linux.spacemit.com>
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
 Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=1648;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=Ua/csWHkT+Np17zutzyFedzmjd63GLpRnamAb9RnY0A=;
 b=ubnub5pzcWYlpfxf3kN1aMmkxluhTN0rn4QXQbDvHLlORd3EG4tUSlGXbHI9QSH3xh9QqJgKO
 GXAbiNWoCFsDu6OIQDbujpWz9VdljF1feB0JFwBXpoAp8GWjaV45hbm
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MXEOQP03yY66/oZQB+p4gK07tJ36yKM7h00fpPjny9jTXwIIJ0GVrKgd
	p2Ai4wJimg+cq2eLYAP8hUQBPtFeFwzSegRpHaZj/5HMw3ZWH8Xm5jtjsQ+YTJa0lvTxMAH
	5h/BZ8NXDkk/u4AqVMSjaBVZK+n3mNpWbNPU5CRD6tW0XNRAu0OumdBs8jbqXmYCnoPmqHL
	0gtf6IEWa040RhAVSGzzXHt9bnsxCulW44Dy2e+J+nG1GYNx2/ZOJDzkFmYEMbBaB0ManO3
	dPzK52VCTwaIstu3tXWAEDAJD9zAWhzeApeYxsPsC7KG0EFu6NpEs9O8ceEEmbhsQTWdSsj
	5UKW09PAGeY4mMXBKIzP+YZsZt9rMTxVVLZOlHrCXIfVY3i27Q1lqWGKJIiuP+t+ck7qK2R
	/SI+vxDsbYWpsYLTeEQoHEotNzkClP6zjt/Xw9DKtsbOVmXOdjttE65rh55ar/oirpKM/Eh
	XWsOs9wZLkwbNjFhIOcdxobQakuP2W4AIuqQ5dIQLgx+wAi11tqrT3mwRMOA6U2Wedybv64
	pwDTeMFO/9BEuWMa4YbHb4GQ12cBj7mWWoBl4Yu5/OoQHA6OVYoTgYulbQCLtLlMY55hvag
	p1b6+ZzXUd2x2Xux9UOD2ERZhC+Wltktsb0Dx8TUzT63JwZHm+OlllvE3AiGCKCZ+SnyROD
	q3IoamREjipoT8Hv2a4vzjRZ4gtLJK+OFuXegNzsl6WE2pUFrwgHQXK4CNXaN1GcbksbTYJ
	0fxGwgbIb9j3ZxqoSZlZsHr4ZVhm92tmJ67Gx6lQpR1cBclz7jK0h2b8ytBek4HjzHkQfzH
	s++VMua2c1KwlFpoK6NU1lY/2STJ1ZsiWqDDnRC1mJvPUk1jVUHNa7zq8qzIMgWWcEOsuu6
	0ILBWuS6If+JXuTird5Dr1xjX1Lgkf/2eSxfAqhUJnYmsQo2Mcc/02YAFmguFQVAFErk0RW
	GavlmskWqlYwoTAfi5OeJO53ZlkOm89KqowPaSDpgCo1rXyarPopbnIz93PbZWchsOw6QLP
	nQgqGULUtr12pY9saaes8pRI6UYM9O0CNUo1lUh+ObB/QTkeC10hp10tDwslOi4zEmEg7ve
	v35nFFUwNIWaaPblTytQ/TWjnewYi6UEvGfaSp2fI1nSUnCSgFjogfAEPHzR2IqRK0D6y1i
	EkdPuAKA+7n3STH02444Xw3N9ANZl2p0pdiV
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044038_992340_10259A32 
X-CRM114-Status: GOOD (  10.46  )
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
