Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081B6C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 14:48:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7082224D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 14:48:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RVSMxToA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zsdBJajz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE7082224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oH486Kacj+kPYropHzBEzqWn+rzwYSsuvTXnQavAPY=; b=RVSMxToAZd/Raqf7zaCxYt7bjL
	yZHcAQVSDIsIuzB9HPwXf8dr1vJ0OpGrUc8ZZgVHQaz+ZP65o2CHn5/ehH20d67yt/XthJZk/jFB5
	dx2qYWK/FB8taS6wq+dSWC9E+o1Dr2iH8nbijepQU+hm5McdheWoBzNvQf78KSmpMNuXpnTCQufaT
	xo5l1VtWo2fiigXPbA8DY7tQClIow7kzd977bYzkSFwSRzuIsCWmgKSFJz5nV27qbBOxqrcaSD69J
	45ZkwJ+WLLPHFccWLXxjKdaOicXLhyfACx3MBMswkOfOsNec9m6Lm804cHk8kLSVCGyHkiIogIqil
	6tHLWukA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwjA-0008Jj-Ne; Wed, 26 Aug 2020 14:48:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwiq-0008B5-BE; Wed, 26 Aug 2020 14:48:21 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9ED42177B;
 Wed, 26 Aug 2020 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453299;
 bh=cabo5bmKA9S3Z+5Um9Eh1dxwPh2SCuYG74GJw0p4rDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zsdBJajz8wmzsUOxsIodz7vIvPB/ZBznlGLnIsKgNBBa3GWHti1ZqtGAllBtLnH4X
 JEP2pBzOPmHv1xubmR+XvhnIj61z8JpLf9HoxkYCxL92cpUa5Slmy7/SPtGXwmBybz
 rPGCt5qFkAURoM+CzgC8RK33ZqP1XzK5f8teQ6h0=
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
Subject: [PATCH 3/6] pwm: rockchip: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:47:44 +0200
Message-Id: <20200826144747.9436-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826144747.9436-1-krzk@kernel.org>
References: <20200826144747.9436-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_104820_580597_211F7EEC 
X-CRM114-Status: GOOD (  14.59  )
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
 drivers/pwm/pwm-rockchip.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
index eb8c9cb645a6..4773969346e0 100644
--- a/drivers/pwm/pwm-rockchip.c
+++ b/drivers/pwm/pwm-rockchip.c
@@ -306,13 +306,9 @@ static int rockchip_pwm_probe(struct platform_device *pdev)
 	pc->clk = devm_clk_get(&pdev->dev, "pwm");
 	if (IS_ERR(pc->clk)) {
 		pc->clk = devm_clk_get(&pdev->dev, NULL);
-		if (IS_ERR(pc->clk)) {
-			ret = PTR_ERR(pc->clk);
-			if (ret != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "Can't get bus clk: %d\n",
-					ret);
-			return ret;
-		}
+		if (IS_ERR(pc->clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk),
+					     "Can't get bus clk\n");
 	}
 
 	count = of_count_phandle_with_args(pdev->dev.of_node,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
