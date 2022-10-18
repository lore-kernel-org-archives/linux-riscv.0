Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7CBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4kG1X4CQ69kZw8V3tU5KNtMmti3tEQfsCaXbu81dggI=; b=3GICm1WZgLO7BR
	PoEZjh5oQRjukrAouc4h4zIsfZaDzT/viFZwZMc/AupBjLGUlYaqzSNaDZMu8iScNRW6YPGWqymgQ
	R1UKqrPxDW9IQs0xqNTodj7MTE+4ODUWBX/QqFPzKNHf+MmH6RkEO94n6mOJmElmSG+ocuU3sy8Cl
	D1h81PsHVsl+aQFdsg9pdXL0j/qpcYe4sN8sgNBCjtVuXlTB9K5EJAzeLHEmNedB9AKVwsUSD2Sry
	Jg+LtY49ZAj0a2yrtq+9D/P7ndlBET58jVQUqiKItV+65XtNJRbl1mdWJLwfz8rpL+gaQlfow+NkZ
	nPihWGtzu5IDhydgol6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okifB-004n9k-DN; Tue, 18 Oct 2022 09:13:29 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okif7-004mqL-Kn
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 09:13:27 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C67E53F56E
	for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1666084398;
	bh=Hh8fsE9KkAVKP7Lv5PdzMeHsN9pjYg33humb2afrU8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=aDqCQd+FewwtieF1tSynz0H4EEaGHP3TwjG83GTfFE5yRZXZVVQPRMWFSqYlmrBwn
	 mkdAPLeRbieFvpgGvz6QOOVO/6IE7/9kX0AZvLSdtbaaphpXvE7utxQ9bBsmVIKVNG
	 Jj3w+BaeMhUVDzfr8bJH/qCr7VrBnQTm32c7fuF3wbFI/70+i5WzF8O04DgIu5I/MF
	 MwNiQLOK5tjQmpqU1Y13an4KUnVwNaCYr4n+F637HyPP2jcn+ahx/RJAepXi7/AsTv
	 xZVNUQ2kS1vXhYdM06yraHwySelv/fZJoG9NHb7uE7+WhMejLZJUGe5aCZmBrBrsNd
	 Vyncmzq0mq7QQ==
Received: by mail-ed1-f71.google.com with SMTP id h13-20020a056402280d00b0045cb282161cso11235510ede.8
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 02:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hh8fsE9KkAVKP7Lv5PdzMeHsN9pjYg33humb2afrU8o=;
        b=RYBcizGcam3Ouq0PXRpXuvroS+u7FdTvJzPByZXYi3i9vz7LtKblKxakyuGhQ9T05h
         wclc5E19SGOWvUhdjkSFaUzcQnfrgOFTTLW2FLqSbltgfg2OnPjIPELrqvRFFTj1Z830
         6ijvfoUqT5ryFjzx+reAsfZwIwDUeoKl8rM9cwGXiA2Jl9jbP4GnU3wgqtKp2BNMAM5L
         yw0amaxe/o2NasFImbFcqwfE8AI5plvTNCbONXszOzpCKpysl5mmJxlkFNpX2TBShBoQ
         3jJZB6TFJFY1g/XHOheAxyyq7PfgLG7MNGrjajgGztY1snNIQrSOTH9yqCuwiK3wihQa
         eNdQ==
X-Gm-Message-State: ACrzQf2mu8zX/EVPf2jyH1CbnkRuCkEsb7+XuB23e0ZslTuXdxtyHLCU
	/DzfIDvprI8HNA3pwZtlpAZh+HreDvXI4VFQxvG3md9AxMsAeXiS/wWcfSQ43G/aDDkNr7Pv5mo
	oc0uKBkEu3Jf9KRdAl9Ix6gA5bKCGFm6jjwOWrKfaqYgXuw==
X-Received: by 2002:a05:6402:548f:b0:457:ed40:5f58 with SMTP id fg15-20020a056402548f00b00457ed405f58mr1673593edb.408.1666084398207;
        Tue, 18 Oct 2022 02:13:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RtBiVWqlow4RIWQd6Iya71pSIgsGy2YuI+R6Q4lXOuU1BXFxCyytUUPbyjbx6D0cVL2MX/w==
X-Received: by 2002:a05:6402:548f:b0:457:ed40:5f58 with SMTP id fg15-20020a056402548f00b00457ed405f58mr1673583edb.408.1666084397997;
        Tue, 18 Oct 2022 02:13:17 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id x9-20020a170906710900b0073a20469f31sm7270172ejj.41.2022.10.18.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 02:13:17 -0700 (PDT)
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
Subject: [PATCH v1] pwm: sifive: Always let the first pwm_apply_state succeed
Date: Tue, 18 Oct 2022 11:13:16 +0200
Message-Id: <20221018091316.415685-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_021326_054171_EED8F28C 
X-CRM114-Status: GOOD (  16.91  )
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
 drivers/pwm/pwm-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 2d4fa5e5fdd4..ccdf92045f34 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -159,7 +159,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
-		if (ddata->user_count != 1) {
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
