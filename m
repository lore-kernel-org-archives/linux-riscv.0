Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EB8C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Km417M178M7VNHU8sw0CQmOgupeLVkJCkXXVyZL6y/U=; b=EOghE6xrx3LKuD
	B7sx7qL3OqcbHYYx+EX8I4GB/uT5BtS5eIZCrktW4QieyIuzBxyG2Djc/TDJ78qQhiUAz3Rn0b+AN
	C/iMiHfKnHajoNS8YCuYIrCQd1FBcMk7wKl894lV56+4RQaQJ1ttbacytxCnqL1OGJO8ulcOl/vDQ
	wN3B84Vvjw7dSfXjG125YMfiqwuEhTUrgRg6EmWAdwgmJwqBub2UtpHa8HhVvoJVPJbLeZiYVgkuG
	v51+cBeoJiTr11fJ0Dr2Wt2yGYYjUUITR1YMEgQV7n4klfUaxMQULGDmelX0hEPeIw6eOVVib6gHF
	VDeZbR4gjqADExcvul3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64s-00000006DOf-2lGv;
	Tue, 24 Jun 2025 16:00:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4hM-00000005vLG-195S
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:32:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso2205125e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775551; x=1751380351; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uw4x1TQGrA/MBrQhecsgMke6peLxrAZP3r5KIxkbAtg=;
        b=bvIvtWepwyY2y7M0l1YTDLub2VBZNNo/rgQVkT3ylHcKHlavsll/q5d1GYiZyijvqe
         kgitYYDrvIlcGTa7/CfH6xX+sVzAHSsBdlCSluRlEzJSWEQL0AirmZfej0pLlPeBYd9U
         gvBz0MzMJ+VEjNNSGvWDb+VcwaLi1H/l+j+g59P+8RnPibKvxQukg9sHFJ64GwFT1BlK
         1vnZz4Z2girOP0KiOKE/njrH4k2T7YwuEw+DmKObr8wOUcQ7+bIZDr+KBYws9tXo3AMg
         zsd/GwjFLXQeX8pjBWY8OCcNArhTK43LUenFemktuqWJ5kNoIrTwNLsFJ+A+NpDj3TFL
         PNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775551; x=1751380351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw4x1TQGrA/MBrQhecsgMke6peLxrAZP3r5KIxkbAtg=;
        b=XngJTjlmu5eVe7lLyy6jdHdtcJZzVqliw2eXtcR1sQd3OPqAJV+sg+V0SSim/nhiiC
         cs9ovuMr5Y5/xWLwFDp6Isl/Jr2IqtevpXk8zsQV/reRa9IhjrKYACgHOiSCWjmI1SZ/
         cmndGmZaUN3nQLRYT3X88m3PzXpTCFp3zGSOiqyhCAExNM93oeiYIXClQolqnjjz7Eoz
         wXHYn8KWJKFTRqz8iVsz5tycE0KR7qn/ZM9So9K7TiMkM6VZ9Hb3P5myDgdbtlrTX2x2
         kVWJoBWYunVrxzjbTswJlUoA0Af08kjxEy4XAOeUpovxZ2+rjY/m8hchuntzRJ9SBihV
         CPkQ==
X-Gm-Message-State: AOJu0YxfOFbCf3Lh7FJQpPpKq/jDoecH2Hm2JECQ0KNtTEMmp3LYyPRA
	HlfWuKzr7wF/aF6Q20/VqJB9GuCETURJBw9rATNttJTSAxTlTgMKMqpDbCCwgR+XbpQe+Tbkvq5
	aibCB2/g=
X-Gm-Gg: ASbGncuKq6TDShLDwlBTpvTKF0C2KhAlY17RXjrOYcBYUlPIieKkma8iIJTK8BLHMxR
	8rG5vUvC+SVeM3M65TO1pEQ4XAppRJLmCp6MSBGzZwxDxZ+5A5HiRwkMBbOGNvryaM/4TUq3DHW
	vGtePCUcYXqrocm7ydI43UWHyHmgFeY2Vj+s13qdKqF6AQysQY1UrAo7wqCmQpZjWG8mhpyOYWM
	668jjAZ4C7JOQJb09IVT0vMk5uQJfzX5HlFfMmHlOxRweaaTRe1r1poEoLLpMVY+277XLQ/V3Ym
	8SoUSvZkrRUZVsA1UmDViw38AuZ6H0n9wnOhQN0tErbqwHWghBiU1TmViQmZ+ZexSsY=
X-Google-Smtp-Source: AGHT+IGnv9OAm6kU3yC9OQdJrsGHg+VSoZWXLELg2p5G3m4MaLGEgPnmo4tXgJNKP087uSEZKo6VwQ==
X-Received: by 2002:a05:600c:1f0e:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-453659ec182mr147580495e9.21.1750775550906;
        Tue, 24 Jun 2025 07:32:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:20 +0200
Subject: [PATCH 3/5] pwrseq: add defines for return values of the match()
 callback
MIME-Version: 1.0
Message-Id: <20250624-pwrseq-match-defines-v1-3-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J8hhxEPGTDWzHxMDIGZhdqk+RbnXtaJ73h/HNS5w2Tg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb6545ElYvrc1gET2OFrM9gsPHxKk7OK16+E
 9Xxp5PPJKOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+gAKCRARpy6gFHHX
 cldDEAC9QFYvQdgFCGmN1OsF83q9dP6J3ttzdmws4vnanU/xhmtw5AvNBLkGJnyf4wiuUnhY9mS
 LsUBGrVxyeZlPf3WACN8cUMUqb3hhQY55Qszvh7fRvs0I2OF/OCai/HLPvzX0v92HIYJ+iSR6We
 3MpJmzSDBWEXsEG8Hhz0bNys37m9+IL+PlWbQ68d0LfokWAUpfXTwBUa4+jwQMKVJcrGCyTnu8r
 hpHAEEwMRHRMsWt2i/ifysJANuqldhaThp6Rny0pK0Ymwa28RP445JPMWqGK43wjhO/e6y3RX21
 ZvM9Qs4uP/EEzMDEVzFGfRYfq4GpNP63Q9efcGYe/tohWCydW2dBOYVD1ZZ2tVu4bauoHpamPyB
 64HT0qbLoZA1CIUYyXpwY+q3zUwaHeJcKlK8EdM3R+PJnSjXb1x2BB2V/CqC+01JQ8nJG/CFzR0
 pop1bz38H32jBaud5py5CTPMwkztfda0zwstBFJuW+YyZk74gs2wRroCbE4hVJKtbSvZShBpC61
 d1+S20Sp7XJphn2nm8HNpOIm6T8WlSdpgwfNHJyKY5p2obqwPJhvS/tNbKKVkGNE/MO/Nov3kkG
 XmEonDNdAVE+6z+Z7zXH4Y6rLyOJ0MjOygcURMP+OB+XJvBdzjJcX/JgdMYzQ7ehCkr0JWgeXgq
 +V4Rib0enUeuJFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_073232_446747_BF4CF860 
X-CRM114-Status: GOOD (  12.79  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of using 0 and 1 as magic numbers, let's add proper defines
whose names tell the reader what the meaning behind them is.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/core.c | 6 +++---
 include/linux/pwrseq/provider.h | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 0ffc259c6bb6c8333ba1fc5e6ab43e42ba0d3524..190564e55988557940206b059fef52981bd49e5b 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -628,7 +628,7 @@ static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
 		return 0;
 
 	ret = pwrseq->match(pwrseq, match_data->dev);
-	if (ret <= 0)
+	if (ret == PWRSEQ_NO_MATCH || ret < 0)
 		return ret;
 
 	/* We got the matching device, let's find the right target. */
@@ -651,7 +651,7 @@ static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
 
 	match_data->desc->pwrseq = pwrseq_device_get(pwrseq);
 
-	return 1;
+	return PWRSEQ_MATCH_OK;
 }
 
 /**
@@ -684,7 +684,7 @@ struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
 			       pwrseq_match_device);
 	if (ret < 0)
 		return ERR_PTR(ret);
-	if (ret == 0)
+	if (ret == PWRSEQ_NO_MATCH)
 		/* No device matched. */
 		return ERR_PTR(-EPROBE_DEFER);
 
diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
index cbc3607cbfcfeb5acbc94908a1eb4a861159dc41..33b3d2c2e39decafac6c6fca9254ad4329d90e94 100644
--- a/include/linux/pwrseq/provider.h
+++ b/include/linux/pwrseq/provider.h
@@ -13,6 +13,9 @@ struct pwrseq_device;
 typedef int (*pwrseq_power_state_func)(struct pwrseq_device *);
 typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
 
+#define PWRSEQ_NO_MATCH 0
+#define PWRSEQ_MATCH_OK 1
+
 /**
  * struct pwrseq_unit_data - Configuration of a single power sequencing
  *                           unit.

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
