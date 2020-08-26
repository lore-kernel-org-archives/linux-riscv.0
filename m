Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B95BC433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 14:48:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41AAA2224D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 14:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hbGtdK3b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="byy3D3tn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41AAA2224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fORjZWvltgh7B5uA6tZ9Fww38pFUqwgbn/jg6vqbx0=; b=hbGtdK3bI2NTdm+Q2Onx2RYSqe
	lXQpdL/8WkSFLcZVgKi/t8V20AhuR0epFfl74snM7CVolzB3x4rZGWqps+kI3fGGcWNbBwjKhchQu
	WTvoOW4/jzjzwN12DcqYJqbpwdK+obwJUa20AsY0ruCHZG9PE+AV8aX7UxQATko9Oj81cwoZiS0SU
	u10slRLq11UV69P33N+YPXdgkcFhHeFIrppGRY4nePQKAZnZwo2r8wVwqURYMvufKP38quowcCeab
	bhBERapFEfEiakY6TzBdggaKhi+xPT4Zjs+VqP6qDiJKiueh8mEHYn2FGmHRdDKtg/cXNV2b/Oh8g
	b26w7VgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwik-00088r-Hz; Wed, 26 Aug 2020 14:48:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwif-00087m-IZ; Wed, 26 Aug 2020 14:48:10 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C1FD2078D;
 Wed, 26 Aug 2020 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453288;
 bh=xX8No7Dlt35uVRtG106IwB/R7I/5/jIBaMyqJ0vQmGI=;
 h=From:To:Cc:Subject:Date:From;
 b=byy3D3tns5AIyEhsP6N685UlNNM4Np1NcLWi4Kz3mfpU6GO11lchcfMMXlnWKaiEs
 9caKQ8wIDDAcf43Mj3+RXx/5EJ6cBZLWsieGF3Al7nYik1drYyc5TpkijjP8D8HLN7
 nVoWPi3D5m0rCkAw+iNI6rwMXuzClgI+P/AaTTVc=
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
Subject: [PATCH 1/6] pwm: bcm2835: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:47:42 +0200
Message-Id: <20200826144747.9436-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_104809_696118_5611DEFB 
X-CRM114-Status: GOOD (  14.39  )
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
 drivers/pwm/pwm-bcm2835.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-bcm2835.c b/drivers/pwm/pwm-bcm2835.c
index d78f86f8e462..6841dcfe27fc 100644
--- a/drivers/pwm/pwm-bcm2835.c
+++ b/drivers/pwm/pwm-bcm2835.c
@@ -152,13 +152,9 @@ static int bcm2835_pwm_probe(struct platform_device *pdev)
 		return PTR_ERR(pc->base);
 
 	pc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(pc->clk)) {
-		ret = PTR_ERR(pc->clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "clock not found: %d\n", ret);
-
-		return ret;
-	}
+	if (IS_ERR(pc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk),
+				     "clock not found\n");
 
 	ret = clk_prepare_enable(pc->clk);
 	if (ret)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
