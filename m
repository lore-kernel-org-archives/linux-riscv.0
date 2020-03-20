Return-Path: <SRS0=lqWX=5F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751AEC55190
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2020 01:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0A920739
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2020 01:41:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QljwJ6TZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C0A920739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcYsbBs0GN1YMi2FcxliDZ8kExRw80Dhk1WarHyw1xU=; b=QljwJ6TZCTRUXE
	yAeGpujz9ty2CxMsHpU5kgcKezUVjQTIjyyFQ7AANqps0APqVLTyU+miDQtAfL699SU35CShvbGG5
	xtIF1sq8LJb8UEZNFYa1pcqEjWQdcRJ8MhS8clKttuocyxs9ACOTNvjE7MHgA7UxWnI3MIhMJkiv1
	1Dzl7xmvn4MvmJ2p8soSLP0ru75UCjvmonIPU0MIFKgw6hLG/uHalQpiXd9EOMcSGkiDGGfVE29/8
	2gTKNj6b/yun7Y85uU813sulyjRc7Yy9FZRKSBRFVWafrpBY+HjrmZfJ4ARhcTvqkfVZUovjRe8OE
	4PZ2reiQ35GRHmhe0hFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF6fG-0008I3-00; Fri, 20 Mar 2020 01:41:34 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF6fC-0008Ga-BN
 for linux-riscv@lists.infradead.org; Fri, 20 Mar 2020 01:41:31 +0000
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Mar 2020 18:41:26 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg04-sd.qualcomm.com with ESMTP; 19 Mar 2020 18:41:25 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id D31F14559; Thu, 19 Mar 2020 18:41:25 -0700 (PDT)
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: linux-pwm@vger.kernel.org
Subject: [PATCH v11 07/12] pwm: sifive: Use 64-bit division macro
Date: Thu, 19 Mar 2020 18:41:18 -0700
Message-Id: <002b29ba22b38121e6ceb42242c5e825be4e0661.1584667964.git.gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1584667964.git.gurus@codeaurora.org>
References: <cover.1584667964.git.gurus@codeaurora.org>
In-Reply-To: <cover.1584667964.git.gurus@codeaurora.org>
References: <cover.1584667964.git.gurus@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_184130_417926_E187B811 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Since the PWM framework is switching struct pwm_args.period's datatype
to u64, prepare for this transition by using DIV64_U64_ROUND_CLOSEST to
handle a 64-bit divisor.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-riscv@lists.infradead.org
Cc: Yash Shah <yash.shah@sifive.com>
Cc: Atish Patra <atish.patra@wdc.com>

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/pwm/pwm-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index cc63f9b..62de0bb 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -181,7 +181,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * consecutively
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
-	frac = DIV_ROUND_CLOSEST_ULL(num, state->period);
+	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
 	/* The hardware cannot generate a 100% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


