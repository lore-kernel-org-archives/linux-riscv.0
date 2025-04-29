Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1431C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFuaSNsRAHuRrHZqKEonIcY6diVVJCWt6pwiNfwWL4M=; b=ky0TWqDhFY+s3o
	1dpFNCZdnQLFJ2DaAjOJLWHgvxMTWKtLtzBnhHwSBAI1upnDxzJr7Hhhrkq4/F3YsVDEQcgopHmXv
	4M3Q3LNGMcNK4tDMGelJiHMvYgjNU9cJuY4x6dGtZSOMqMUrsPlgKwfOEQz+NgC+uDgxgyiNOANJj
	PsnS3RI8zlC7j7p5nx0dqsbwCHcXlO123n1RdC/baAEExAsOstMAtwuUpG20XqZGE0bfqp5KW9JTk
	6+FUM099SOQPrU8lxPWjNGPj+odPOSmSRu0fLHnlVzVfe1dUZTkGBPe7993vVqEbfuhKmJCHO+Hsu
	H6MDFV4ndhhYveKDJ+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gmX-000000091r7-1TXG;
	Tue, 29 Apr 2025 08:57:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ggh-000000090Os-3bf4
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 08:51:37 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22c33e4fdb8so60657745ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916695; x=1746521495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf1MyA5jv2WhmjchTZbgQeXneBCKmWDUyNLFyQlB0MY=;
        b=jbIAJ7aXMHEO7KNpTxK9d4JhoVA0yqCVBLM2s1J8z6ZrzenpWYycTgkwQN5bP46exR
         CsNFp/a+q3zu2VBGLRdnxbnbm8fhCscahMJP+GRnMU3Fjg/0YSk0tHr0x4yIHHNwjn5U
         TEq/vcXIqsQb0togB7Y41OvToMO1GGCDoSxXYMtsH9fUJDUsVFssLg+XBSOoCIkz5qpV
         aWbZnY0bztj/gm318/28cbFArBxWNabUPvN8zRgnhEwlqJN1n6FlwgfJQ7NO2dfCNJAS
         BgKvnqeHy7kZyFioyNTfZ/311qKyNqh/6WZ+PsAfLCdMOPAU61FcduQM7Lik3yIG1tmw
         0uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916695; x=1746521495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf1MyA5jv2WhmjchTZbgQeXneBCKmWDUyNLFyQlB0MY=;
        b=oRD3UEW3JVBCDQEf60z1maFxg6RBTKx6f6oVBnK6f/b9w8VGRD08/ymr6kg2IsgnFB
         ldNwewAHYPm/Cv0uylqnlYI5NgWQuLreDMHWqpE7G6ODWIciZ0tAqrIa408DJb7RcGxI
         LsblMx2LbXUG9W+NOMcQycpyopkFYKrXjvlFihCouTH5rdo8DpK9u+hLEPvLphwUgTzE
         NHk6ImY/q9VyFNEwzNWIpWHDEHzF7j6H3fkcojoG/hjoxKwOGNPO2gCj96Wo5QNyaxAh
         QSrIeQN4Q+qPJov6AYW8o5yjPgT0LD0Ra72wbRLcS8ij1HaS2aOCmPjuBxH16UgYgrNT
         1C1w==
X-Forwarded-Encrypted: i=1; AJvYcCVWpNccx4gFkWBnbPa+qhXS0Fr7GAmaV1jyhSw71T5QYrrLVrjJAwxwWqI6j8UXsqcmNeEOygWudfQaHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo1qlyN3xAnZGfqnfn2UC+y0GDw8tqDpqm5ifKKkiyNQasrqb0
	VhMiASJENfqY1hDddsdt3q3CTugARIAfMNa6lOYVCfrkmVmLtxNobwWEfZZ+00o=
X-Gm-Gg: ASbGncvblWW0f+rxn2YkrcpClZA3ypsVUyHt1PLfjmPJR7EQzUFwQczETDscOsCREgi
	eVBzUzF0wyQa3njqVvpoCbzkTjkYd0UG6qbgfRR/D0khSRRRx5tV42hs8amCtnLW/q0mEhfbEjY
	V6kRNbx5j76MWs3IyrHTTSfvYrGLmeEDiCR9GLTMmYn+cv4MijtgylxbVW2TQ5Z0l+YY+f/zscC
	mJULMlwergYruBc64/v4BSrdEVphf9snXdfQiu1us4pud7BF3j/fjRGwnxyr28t0V3ID7WFWzds
	fu2W2AXTPa3d6e7KIRgXFzosi6nzAzMUPIsNVEKpCEByZKXyFyPR7vhA9q/G4kYPM04412a384D
	526fY91mq+548HcQ=
X-Google-Smtp-Source: AGHT+IF/YTb11QJo7KHbzLovwGKhpZslh/Bu4+pqk61lazM/ExJSKXK7osXi8PFQQCc7TGaXhCoayw==
X-Received: by 2002:a17:902:cf07:b0:224:23ab:b88b with SMTP id d9443c01a7336-22de5eca712mr35763465ad.8.1745916695179;
        Tue, 29 Apr 2025 01:51:35 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:34 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 2/6] pwm: pxa: add optional reset control
Date: Tue, 29 Apr 2025 16:50:44 +0800
Message-ID: <20250429085048.1310409-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015135_909892_74274B3A 
X-CRM114-Status: GOOD (  12.07  )
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

Support optional reset control for the PWM PXA driver.

During the probe, it acquires the reset controller using
devm_reset_control_get_optional_exclusive_deasserted() to get and deassert
the reset controller to enable the PWM channel.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Dropped the addition of a reset_control field to the struct pxa_pwm_chip
    Using a local variable for reset in pwm_probe() instead
v2: No change

 drivers/pwm/pwm-pxa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 430bd6a709e9..f6a862531601 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -25,6 +25,7 @@
 #include <linux/io.h>
 #include <linux/pwm.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 
 #include <asm/div64.h>
 
@@ -160,6 +161,7 @@ static int pwm_probe(struct platform_device *pdev)
 	const struct platform_device_id *id = platform_get_device_id(pdev);
 	struct pwm_chip *chip;
 	struct pxa_pwm_chip *pc;
+	struct reset_control *rst;
 	int ret = 0;
 
 	if (IS_ENABLED(CONFIG_OF) && id == NULL)
@@ -179,6 +181,11 @@ static int pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->clk))
 		return PTR_ERR(pc->clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
 	chip->ops = &pxa_pwm_ops;
 
 	if (IS_ENABLED(CONFIG_OF))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
