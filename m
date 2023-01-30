Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26015C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0RWT+dfLAERh4XXNMytJyix50cbr136Yev1qLwNF14=; b=vESdQHmtrsbJvI
	qiVWhxBnPg8EueLzP7GSOCDa1i9gyVTnlyxRZ9gjkUwQUsl0MH0TfRbwKmVFHxhiaVaosJJFNdyev
	DyepVnet0o69MpHRkmpetTfVLJn9gZE2qkF9/9wXS2+7qcVWzj7ELN6c6+VpYE+5quwtDLUNT13Fa
	vMZ+SFKJjpzzgDbG01Q1g3C+oJRMUBdxRqN09+V7zcwIa0njOsVZ5kULYJRpw3T3D48VWXL2lqanh
	BvDQ+9+0M+FbEaSNm/xAWgCegFHALh0dIq8YB7P9VE0Omb86eWi9sixaCQ6+t9fdpRMSTgwdnJLk2
	aX0JOwAgsHFEVpB/Xqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQX9-002u7a-Cj; Mon, 30 Jan 2023 09:33:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQWv-002tvr-7y
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 09:32:53 +0000
Received: by mail-pj1-x102f.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso10473264pjb.4
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 01:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w06XLuTGv42ExA7kvsEzi3HmqNn0e+XIKH+7gH1xWFk=;
        b=PPfshnuneZVuaGMsWsf0abmeP49jp4AxSkkBj/mh1QI/DzHKXdaR6hl+H+ItCxqyBK
         8EvW4xXW6VegaasREhK2bUhShb9wvty8UOLr3wp/rbISnmKVHRVvA0rpCOSUt0MCj0ZR
         oPhRoLukyOzJLiU4C/lp/aLdGjZGUoPkShPRj19HLGlGJVneY/5JrOxKgYSDAs+kHckA
         ZbAar3Gjnh03WMx7A3k5Ncx3kq8vJdKp0fzptQZusU7UMj0/chZLjSo/ClNBAAPUYkSd
         8bm/XpTxdY/MmYvytxFvGcJV04KPmAG08wqBrYkaeFcuRA8URaK7P1WcmVaJR2IZIpdw
         jMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w06XLuTGv42ExA7kvsEzi3HmqNn0e+XIKH+7gH1xWFk=;
        b=obrsJctr/YRz4Sm6HZ7NS30jzlGZRGN167oopgm5kO7tIBYIaS/HekSIuQreZiWRfj
         TPSp/JxrI9FTmiaxP7IyiE1FVN9kD+JEMJIWlxAsT864VJRLAroapaZld3yEssn8zZKs
         yBT2P2+MEHQ9JHlx0ABvmlvrApRFF5QbeAEGe57lROUjjVOqlIGgzn0rqDPu2zYkOkiO
         efgc1Lp06jucEBznTC72aTLHGdkxFjj0+uFVW7AGTQgM0xBc5BNufPUvnd8aKEmP9V/e
         9riBgYUD4gyjSkaIXIF6m7O+dtgBd16tfyI3yT3pYnO1jRLEN+aVY6jqXblyV4dIN1Cu
         TYHw==
X-Gm-Message-State: AFqh2kqFjVfTkjiXRYv8pNRh4o9XObAMEA16L375MGqXGBEQSIJ5s97v
	tiPJSlyM/w+Z/YuQ9wF1IeSouA==
X-Google-Smtp-Source: AMrXdXtS3CCualmkzbk7XdCqctKx3U6p6dFg1oHURin04Tlb0OJZb8OfiFW6kp53r9/H5XL1owCXrw==
X-Received: by 2002:a05:6a20:1596:b0:b8:7905:b6c4 with SMTP id h22-20020a056a20159600b000b87905b6c4mr62293777pzj.61.1675071165340;
        Mon, 30 Jan 2023 01:32:45 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t13-20020a6564cd000000b004db2b310f95sm6245704pgv.16.2023.01.30.01.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:32:44 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: aou@eecs.berkeley.edu,
	conor@kernel.org,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: nylon.chen@sifive.com,
	nylon7717@gmail.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED algorithm
Date: Mon, 30 Jan 2023 17:32:29 +0800
Message-Id: <20230130093229.27489-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230130093229.27489-1-nylon.chen@sifive.com>
References: <20230130093229.27489-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_013249_327291_E59D03EC 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

The `frac` variable represents the pulse inactive time, and the result of
this algorithm is the pulse active time. Therefore, we must reverse the
result.

The reference is SiFive FU740-C000 Manual[0].

[0]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 62b6acc6373d..a5eda165d071 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -158,6 +158,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
 	/* The hardware cannot generate a 100% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
