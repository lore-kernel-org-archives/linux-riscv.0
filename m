Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA63C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KQgvbhTFgUT9i8KjanLrroXkQqaDrHeoYW9qTReE7Ys=; b=J5+X1fdDlebDJH
	D6VUSDpJ521OPXLbfcBKcJRgXnfOsV1qc2kdwvZfSynphgEPGmSMDN+9oJ2rbclypIkSmhEK7qLFQ
	liRlPW0RStGN0/XprIS+PLpmZZLn2O+DjqQrBp+UH/MOVt1QHTt7FzIgEmwG3AX3ucHO8u7h5bf+U
	LAZ2aNx123eVxkWOtyfL/cq0y7K+AdT6EqYmXyDn+TgDcQ7xKe1HTwHZl3O5EpM8kWIfctoW71Mgg
	MYeOiRW1FRYDBLifTC9qBImPg3mnzbW6FRNd8N2pDJtwLtsej15R0BGIkpratdEDpLA2Msk1L0oZH
	LrcwhLkdjmDTHHSscz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjOp-00D2Jz-HU; Wed, 09 Nov 2022 11:37:43 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjOl-00D2Is-E3
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 11:37:41 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EDA70412C0
	for <linux-riscv@lists.infradead.org>; Wed,  9 Nov 2022 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1667993846;
	bh=PUPJbzepJx5AFbllHqJhTSHtk/HwYip0Muk/9EDtYSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=MmrQ2LVIc+NXpRvTTrrTO9+fRdLs4V/YtQyh4kLdi0EGsZ5P7iXmNPi+AZrx33T3I
	 bH0huCjcUczj80ltgE4kTX5Uippw3jbT9tloKL/v46favap5NHJ4484BZDcxXPvLVo
	 vPqQSnq8E6N3li8AK00dbCkvb0/2ZYfSsikF3OmXhGZbUNnnr3XnXv/hCgx91ySqXr
	 ettLO4wtSO2Y3TnjwnFbd/dzJ6sLN9YKi9gVgY5o1EeuMejb6z+sYTlPyyzi0YGwON
	 Jxm/8LYmfPUFrHiOUjC+8t9HjRqUkc3tXuq3ytxqrHM2faddufJXbSKChPlAUJ9SmL
	 ybHqD8qFi1gzw==
Received: by mail-wm1-f69.google.com with SMTP id l42-20020a05600c1d2a00b003cf8e70c1ecso894081wms.4
        for <linux-riscv@lists.infradead.org>; Wed, 09 Nov 2022 03:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUPJbzepJx5AFbllHqJhTSHtk/HwYip0Muk/9EDtYSQ=;
        b=qk0BE1yQlx90d3zuPv7p61gmwfBpg1gycHgGGCssaPtCpvrGm8xl6hjX8HkvjcvFp4
         sfaOTjCiNA/umOgFhPH8FC3/Ud1pcweI8vF/1FCuuBSr5X7HzeVdz/CI3aBvsyByR8m+
         i1C35roh/C2jRv58h4cQuzTmrh7o/Hp2bvib9D1tEjyKNBCCQ8UxBWDEG/kTLxN2CDEB
         PR9l28M0nBhaagz58FMFFQTUVltAaPCSN2kpgSZWdcDhZzB1GzggqQnw1485fQ6+ROFc
         9W+A3opYt0yi1X8rGlR/Tbirej9KbzYMZ9DVSMuKLf7Xl+Rcq2oOX2NtV6GJHsaGQPdD
         bRXg==
X-Gm-Message-State: ACrzQf3Ns4S0b3cazL3lrrYro6pKa9LgIO6UFeOwPeFMduPS/0TTbnq/
	fgEtK7y20v8u3RxDMBSoNbVL0zYT6j98ufpnRbrpsU4kVaXr5C9cY7SWAEeXnL9wUD5+To79RFc
	6xSKFwqrELZX0HedTlZrIm1aFE54kkdUe0XX9H12FVCBTRA==
X-Received: by 2002:adf:dd88:0:b0:236:57e3:fc86 with SMTP id x8-20020adfdd88000000b0023657e3fc86mr37599036wrl.493.1667993846676;
        Wed, 09 Nov 2022 03:37:26 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6NtbE5g2zTudkMZu+AtZfvOOIrFo9uWBtwl+NVJp9Bq1Dv1FfXdNKK8Djewf5xz5JNHgBBSg==
X-Received: by 2002:adf:dd88:0:b0:236:57e3:fc86 with SMTP id x8-20020adfdd88000000b0023657e3fc86mr37599028wrl.493.1667993846479;
        Wed, 09 Nov 2022 03:37:26 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003cf6c2f9513sm1487261wms.2.2022.11.09.03.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 03:37:26 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>
Cc: linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pwm: sifive: Always let the first pwm_apply_state succeed
Date: Wed,  9 Nov 2022 12:37:24 +0100
Message-Id: <20221109113724.519021-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_033739_927010_9E560064 
X-CRM114-Status: GOOD (  18.80  )
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

Commit 2cfe9bbec56ea579135cdd92409fff371841904f added support for the
RGB and green PWM controlled LEDs on the HiFive Unmatched board
managed by the leds-pwm-multicolor and leds-pwm drivers respectively.
All three colours of the RGB LED and the green LED run from different
lines of the same PWM, but with the same period so this works fine when
the LED drivers are loaded one after the other.

Unfortunately it does expose a race in the PWM driver when both LED
drivers are loaded at roughly the same time. Here is an example:

  |          Thread A           |          Thread B           |
  |  led_pwm_mc_probe           |  led_pwm_probe              |
  |    devm_fwnode_pwm_get      |                             |
  |      pwm_sifive_request     |                             |
  |        ddata->user_count++  |                             |
  |                             |    devm_fwnode_pwm_get      |
  |                             |      pwm_sifive_request     |
  |                             |        ddata->user_count++  |
  |         ...                 |          ...                |
  |    pwm_state_apply          |    pwm_state_apply          |
  |      pwm_sifive_apply       |      pwm_sifive_apply       |

Now both calls to pwm_sifive_apply will see that ddata->approx_period,
initially 0, is different from the requested period and the clock needs
to be updated. But since ddata->user_count >= 2 both calls will fail
with -EBUSY, which will then cause both LED drivers to fail to probe.

Fix it by letting the first call to pwm_sifive_apply update the clock
even when ddata->user_count != 1.

Fixes: 9e37a53eb051 ("pwm: sifive: Add a driver for SiFive SoC PWM")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/pwm/pwm-sifive.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 2d4fa5e5fdd4..b3c60ec72a6e 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -159,7 +159,13 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
-		if (ddata->user_count != 1) {
+		/*
+		 * Don't let a 2nd user change the period underneath the 1st user.
+		 * However if ddate->approx_period == 0 this is the first time we set
+		 * any period, so let whoever gets here first set the period so other
+		 * users who agree on the period won't fail.
+		 */
+		if (ddata->user_count != 1 && ddata->approx_period) {
 			mutex_unlock(&ddata->lock);
 			return -EBUSY;
 		}
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
