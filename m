Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CEBCA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBAT+55ESykatESgyvx0byih3kEDvbI34MJVN5dhKHA=; b=kcy9YG6PxRkfvu
	+yidFhZCfpO9kVHMvX7k5+zUxnNusJuDSa/cDRTPOZUp5DB/rG1k11IKa5wWACeYP2XM6erbMvS74
	kPx/qT2gD0oqH6IIB5cJIs81nBWbPvtuXcff66yAhnHG+HOoUkqkPV1GWqm4xB15/7OYkuD9dXOEk
	LcK9+TWoeQdyqX2jYf4SWKkTC3ILY0JVDUAyb5t1JqsHPmQyoTMWjE71XVYMnmgPJziONOeh1Dqqt
	d0dfBjn0muyRwZCRvWDuqnE5PCDQcR6XPfe7lU874c5XAyrd1GkGGc71ZkAy4A1JTXAT4lGVDbxxc
	YzztbAVrLQi5gTCULExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF54f-00000005jJm-43QW;
	Fri, 09 Oct 2026 07:31:25 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF54U-00000005jAa-0ecK
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 07:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531041;
	bh=BTTytBE65GMAQnAyZgxBxzfZcQGL9CDRbYMYFK08kdY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=fCup0v7be4zP9QXaSy5MajeuEe8W8R2O6yl5H/u5sazO4PMOaGMzlyZT3H7erBqAC
	 L4KLKDTKixbeHjwupim7SEAe/l8tYxGZKBgA+kIPNZ6isyZIhEzWQrwaXkxJndKG4w
	 I7f4u7F1iySb4KCBeW6R/TgA/9ALnSUGn1y1I1u8=
X-QQ-mid: esmtpgz13t1791531033t5b304c26
X-QQ-Originating-IP: +1IR7HIMGcpNo4vLV16Nr/PDiKpZfpt6/GeoeIPYrU4=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8184074187769293013
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:25 +0800
Subject: [PATCH v4 2/8] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
MIME-Version: 1.0
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-2-2d98e5324d9a@linux.spacemit.com>
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
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=2413;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=OfqdgN+EK6uGKpSrBUmKzW0x/Oxgl2tVTFzRku5jsSE=;
 b=unTP7YL1NvpbGa/dwFBPjW71RsC88G8/0byK2fSaxqlWpIEb7LW2+jgt+xNGH5PQ0giL2EM4w
 AFCa7k23rp4AY1CSVCOnHEJSCq158vgo0sAy+qHDbwzpdbC8tZXOReB
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NJP8Pjfh7nlBCyFaTQYrbkAZ5NMHgojhuoy7G/c2ZG9UEqxxGVamfD4T
	wcRAWWYx5PzVLP/okz2aS1k3T3aRWccVeLGX5EL/HAbsatM8pIL46MHmm6VrYHnnwklrC23
	ojbMJOjFirBTFkm01y3/JXi417yMJ38f2050sRqw3AWbDlNfBnsH/MSMhvLNVfkG+ZEGUOn
	4MDz2QTmFY7gMAAUSfLdmmeSwqoJsfsKKfNiozVSjj+64l+SJm4q88dmOrH1fVquf9Rs9tP
	YPGBznQatZWhVQKO9X9e9FGRhg2eH9JGbISrYys/5jbnhqueyGR5P01KRffiO4JWG6aHV3J
	y5LRo/AfVVrrdojrY+nz0E3Sc5QC9f4A2kYFudl+vQP+LoJ/WnEJlTXQcPHHPKQtFrdMaNo
	emTz3g6yHa9s47tOKRrZN6LUOZAIENS+Wlrprdjy1o2AcsW/3HZ+FiODRkzdleSWH1CkaY7
	r9F/m8JbsqiVKZ/2A1rglH8lXoSs8H1ysMovp0NQd/CGcQ0G7TJUdmZepJW4zyniVDlhO2Y
	5LXPkilAO1rCPNTXRqErXN0jM/JiapcrB7qikvk+4r62nRLYv2+Z1tbfGvufEOoMChmslF/
	Oue+osLBNpJeXJ8/l2yPcfqns601ZWmmdaUWJX82174/ZHFfVmumPSpIVBD8mV9OwNhJGli
	2FdilRyZPWnhE59eRKKKCsNC6BhDpi9xT74zh2mqFMORKYg1aPb4S28At6YeS865WinCIur
	BMjpBECZvvy56lVm6YSH4mUml4BpdHsyRCfgaH+qIFSr96lLY6CjIJWrIVwInZvrIi0Oeiv
	9Bi/EaWx77IM3RlkvSzMLCXtR6qVL2G9/IH60mCTETydfAYHzGPqJ1Am/kKbZlK8vNxOE+8
	KH5zWnug9NjH7GkbkJgqOhc6Hu0cMyR4vR7vcDQLXI5P6m85yLRzBel3yJ8BsMiHxLREhuq
	yMAkSzovqdHek8AUvVdnNwRkkw0kVdw6C4slwKUilVw7UXQ4p/DWTv5Sa7/9Oumwo0M4Cyn
	n3L0zM3oPeLPq2EyQONedGe2+p0b4PiJF5T+AA16GmeJ/+g6mNvzyq6MdLvjmFDDZ6xS8DR
	m3xTHOWc+YGLPCYQA0rDgT4q1McMN5DQlUB3sTM/l9G2/vxrsvx3uZFv6x/1x/ggv+Sag5t
	yh9eSwWgtM35HvZZhwiMoBNkcJpScK4eGg7l
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_003114_737982_FB179408 
X-CRM114-Status: GOOD (  13.29  )
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

Convert devm_clk_get_optional() and clk_prepare_enable() into a single
call devm_clk_get_optional_enabled().

Reviewed-by: Yixun Lan <dlan@kernel.org>
Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 8ffa1e95d8e86..9cef902f36b37 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -20,7 +20,6 @@
 
 struct ci_hdrc_usb2_priv {
 	struct platform_device	*ci_pdev;
-	struct clk		*clk;
 };
 
 static const struct ci_hdrc_platform_data ci_default_pdata = {
@@ -52,6 +51,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	struct ci_hdrc_usb2_priv *priv;
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
+	struct clk *clk;
 	int ret;
 
 	if (!ci_pdata) {
@@ -70,15 +70,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable the clock: %d\n", ret);
-		return ret;
-	}
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get or enable the clock\n");
 
 	ci_pdata->name = dev_name(dev);
 
@@ -90,7 +85,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"failed to register ci_hdrc platform device: %d\n",
 				ret);
-		goto clk_err;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, priv);
@@ -99,10 +94,6 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	return 0;
-
-clk_err:
-	clk_disable_unprepare(priv->clk);
-	return ret;
 }
 
 static void ci_hdrc_usb2_remove(struct platform_device *pdev)
@@ -111,7 +102,6 @@ static void ci_hdrc_usb2_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	ci_hdrc_remove_device(priv->ci_pdev);
-	clk_disable_unprepare(priv->clk);
 }
 
 static struct platform_driver ci_hdrc_usb2_driver = {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
