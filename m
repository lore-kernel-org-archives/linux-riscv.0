Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF64F60A6F51
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtniUNFd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=BPXwFWLX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bBAT+55ESykatESgyvx0byih3kEDvbI34MJVN5dhKHA=; b=NtniUNFd3nzRw82EikENrTjJJU
	vWWXIqTIfydqQR5Ybj1nETMHqG0hle23f5kDQOvYKu9aN+C4KgDmcEhg3M6qNkGXxhHmZgXU/limu
	Nwr30F3TpYoVcW93K6JEsv3yC/cV6+j80gOfOw1H3Nu1UCYMpV0djpP9Cxey5Kxt/++wQRD9bhV//
	BTkB4bjiDX+qLPUCQjhd8qF/f9Zs+dxgNG/GTVbtFn7vxO86sfYlx0KKIzvaZ/SiwlGpkI2E5FKd0
	4Tl7y0SUGPpf1Rv1UIBBTjmgA0EdUNrxl3IjrkJFlJtq9J8PSPsPtdaw6i7eipSP+tdNk9Y/og5pS
	WDHrp0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITa-00000005eny-1eaj;
	Tue, 17 Nov 2026 12:39:56 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITR-00000005eYd-1fyS
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919143;
	bh=BTTytBE65GMAQnAyZgxBxzfZcQGL9CDRbYMYFK08kdY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=BPXwFWLXguwODW87s4LLybHUimd0/ewSvVOFm1CUSyl3i174S9u5Bwj1YusJMLQ68
	 5kyz5Gft4Qv4WnUX/8yIRDmptfXXj0POPi94WzkNqCMXMqcFXqrigEJ9ZYn14Wj/o6
	 /eQA8AhV5PFYLYDaYGkFbt4DyQQqw/DRmNLJzp8A=
X-QQ-mid: zesmtpsz6t1794919136t7060d14b
X-QQ-Originating-IP: 8m8ta1vulOOip0/FP6MymXUvN78gB7sACsH87H7D1jY=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:38:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13246902958322791925
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:44 +0800
Subject: [PATCH v5 2/9] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-2-52c3829cca69@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=2413;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=OfqdgN+EK6uGKpSrBUmKzW0x/Oxgl2tVTFzRku5jsSE=;
 b=3ArzyvxM7dDKylh3j1f1J00O+MGlfVuw2DcuO44mPlJUGpPvmZi3bmQkH3WMS8d+6Iq2wGq/4
 S8ZTM/IyE+UBlekP7IRF2DvNhueJKUV7ceZGKBJ5/xLu0RDz/REeTvV
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NE2OwXxkCGATXMeVuOuU46NUxLggEdijvxtQz/hIChBGyahx4XUA/THB
	o99XrST77u1WJX02PJ3sLaNnnwvCV3vayI52gRmCQkDJEDCdmrfMQhsXJNykK+1wEQW2pRs
	iAh52uuW1+eBUP75QsdoYX4YEF0yQdHeWbI1iUPDMgBpbluXoXugenrBsRh8W26nnFji+EO
	V08Tfvhnhw8ZDfQhszGgc5Mfj4SPYALwilfC+YJDLvdQ9actTWQU8NelcgeQHR0zctUiNLo
	jPJYBhLVdTbEZNbmEyR6CbE6uwWvGwk/UvmZ6ekOXN3IXcAhoSGbmp3cKDU+VGtiE0CnA/v
	YrYZsgSpPnawCSMLOVI1PF4UvDkcPLiAtraGm6lxqDijACFGw5EGPxUcnQksch9/M3RstTW
	9vmJtl4cUwYMS3tnoMK/+tSIb28SIp9EIUoqDuRio4kOyRS5Z1PqxTiRSSNJsRU67+s2m5f
	j0VE8uNu+yXDdJJWQsdgbQfIPGK0k++TSMvaY4Jh+hB+NDEMaT1lNT0+xRFJ3eW0O7G4JX5
	yUhWoBtZc4i2i7lRpLaY6fayWxvxSDdEW2uxAiEpC+O22Y908/07yOD9hREQYTkTDXPIfLG
	Tdw/5hmN9xuy457tNBe3bg+rbbmUZP4bN1CWLEF7DpZtOXNldLRiyIGI6HFeg3HGJ4zatOa
	eEtEytxfbf21MGKbauCS3l16kG3K4XAXVqeo3JccNE/bJE4CfocGD8SymLmiDgE028N8iYZ
	669GMsIzF+FyVFDXlT1gdjZwynvyJVDyrznp8PZdTR0wf6ITB9ZtE3X05jYpRnE6gpXOVzE
	vlYFJtC1p0tU6wfMcEpXxTQCn8SVJYKo/2D/439xHZSVOSCx3vFZyWonjChHBQMORGtTBZ2
	DrU6xOoYiky2QUk3p7J1kcAv+F73Clp2qAxmvjsSvYRf3vhIuMtXaEaQAiRovnQNHOChnd4
	vk71ueaD9B9zTp9MfEnnUr5NwTb1zhycYAmwZJfXgsiw/cWE/OaxmKnh9l6qCko/R0qgGcc
	4I3i70qj++eBvm8Z9aTAIrXZN3VAP9A4ve0Qy/20V+cNHz23jGx32GPyj7OTNRIK41JsE/v
	tvd0lCmIHdRvjYCvNS0JVQ6GfS+/8EbbMXvrikNYEOrEC/VptvrHqHRlWZENj5Z4ynobiEw
	4qBss2GIhMCfId0taMmf3Qb1QA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_043948_088551_DD59F368 
X-CRM114-Status: GOOD (  13.27  )
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
