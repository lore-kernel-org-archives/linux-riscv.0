Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378F2C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 14:49:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035D22177B
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 14:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zFhDOgxg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x3kYit/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 035D22177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gZG4BciXqcxEovNX+42IVzLsV5YrzwdE4jTrbwxL20=; b=zFhDOgxgHxQPVpjEtcSTTinvQb
	skjWIer18ey7men7tP09RVjzO2vG4pegT+u+99lJTvD0BTxcs7X+NSflDZGujHW2YSIzPMH/xIpEQ
	x0Gseyu7HWx8yup5B8lerr9/Wf0xUmike5oRJFi5RhnPemIlBJJAfPM7QkL/2xWgTvjZfCycMiSPj
	WUewf9P+A15zuDpbnsq6c/0w7bw4CtGp2RGXmhw2VN1rly6CN7gBwWNAwJ2dTgMyCdHiFVseWoFmI
	EEFtHZPFQgeChtgmY/p+PnUUgy3IJEiPo/hIjWkKz1tvj48nCv1W994jlnOolOfuSNDmcahs6a96Q
	SVTETwRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwjf-00009v-6o; Wed, 26 Aug 2020 14:49:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwj5-0008Hh-Qj; Wed, 26 Aug 2020 14:48:36 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6185722BEF;
 Wed, 26 Aug 2020 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453315;
 bh=35hMooZ97OwQTX5jjyj8bENeQbr8kEyo4eXDZLy1lwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x3kYit/gvf86y+JFUux3GqCO99SWjnPVlhnZf6IpzDlQZzoEcVsp3YTpc3MDCtbXo
 oX6eqODelTnXDj3Ju15PdNXcmcEmS0I5a/glLHAAewv0P+Fi0X593uhmfE342tf03u
 6a1hXYC4ZXLX0yWlT+D4jUbMz7zmLQgVr2KvbukQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Paul Cercueil <paul@crapouillou.net>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-pwm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: [PATCH 6/6] pwm: sun4i: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:47:47 +0200
Message-Id: <20200826144747.9436-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826144747.9436-1-krzk@kernel.org>
References: <20200826144747.9436-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_104836_024327_465A8B25 
X-CRM114-Status: GOOD (  14.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pwm/pwm-sun4i.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index 961c59c99bb3..38a4c5c1317b 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -423,38 +423,26 @@ static int sun4i_pwm_probe(struct platform_device *pdev)
 	 * back to the first clock of the PWM.
 	 */
 	pwm->clk = devm_clk_get_optional(&pdev->dev, "mod");
-	if (IS_ERR(pwm->clk)) {
-		if (PTR_ERR(pwm->clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "get mod clock failed %pe\n",
-				pwm->clk);
-		return PTR_ERR(pwm->clk);
-	}
+	if (IS_ERR(pwm->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pwm->clk),
+				     "get mod clock failed\n");
 
 	if (!pwm->clk) {
 		pwm->clk = devm_clk_get(&pdev->dev, NULL);
-		if (IS_ERR(pwm->clk)) {
-			if (PTR_ERR(pwm->clk) != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "get unnamed clock failed %pe\n",
-					pwm->clk);
-			return PTR_ERR(pwm->clk);
-		}
+		if (IS_ERR(pwm->clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pwm->clk),
+					     "get unnamed clock failed\n");
 	}
 
 	pwm->bus_clk = devm_clk_get_optional(&pdev->dev, "bus");
-	if (IS_ERR(pwm->bus_clk)) {
-		if (PTR_ERR(pwm->bus_clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "get bus clock failed %pe\n",
-				pwm->bus_clk);
-		return PTR_ERR(pwm->bus_clk);
-	}
+	if (IS_ERR(pwm->bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pwm->bus_clk),
+				     "get bus clock failed\n");
 
 	pwm->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
-	if (IS_ERR(pwm->rst)) {
-		if (PTR_ERR(pwm->rst) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "get reset failed %pe\n",
-				pwm->rst);
-		return PTR_ERR(pwm->rst);
-	}
+	if (IS_ERR(pwm->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pwm->rst),
+				     "get reset failed\n");
 
 	/* Deassert reset */
 	ret = reset_control_deassert(pwm->rst);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
