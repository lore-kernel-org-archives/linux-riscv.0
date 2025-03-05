Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A724C282D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IlDTHCQQ9dnzLsYYEJGn7r/3j+7epyT1goLqC8DqXnM=; b=pocD7GRL/WEPyA
	9hfw4OBiV7RAtIrWHgklMC6PPeeHoEyujLI87Nd927pVG/NemwS6ZuDhZihMS6s/lKONZEutDPO+i
	XC2hdt3V3qgxXuNWov9ZSUs9z8Cj2Xag0mSyA0Y+6EOyuHrfeb5M65A6UCiWQqHqGY4+vjUdWJSN9
	Ve3ntkbkFKazdYaSkn4P0zFOLAbeisNkM4bSFGvBW7ybMs7kxTAC7dDUCBWtlmGp7KoiUnwA9tjCN
	/Ne+bcCKQLRVJtw3xLoQ7eY3rftpeA5EejEyRnewz7e8SfndOsc3ZWz+We85kzYOIyZnQ1h9cjbHt
	fS2m74CLri6LsGwo81kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmUK-00000007mna-2W9B;
	Wed, 05 Mar 2025 11:00:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplyH-00000007g2p-317M
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Mar 2025 10:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mCPKjpK6VO4lMEf73NVEG6/3JrmmaR4wPO/hIV6JAAc=; b=T29OvgrdSwdwiTffXqGe9Ruf0O
	BBN4U0GYcZ8VsPNHTGMmiOJjhpl+hTATQi2we9ROiRUixUjt3bODJOtkxfAhHmcdLBg9mpZNIzOLp
	AElXPYq5jgfVrKre9/NPovwa7UngICfvtkncimy6AfTUvrryvwh47eRQVfS2JJqusErVkyATuX32b
	wnBhbiuCaB1cTYmztx774o1js8FfNK93Lahl1h3cfFDvCrzCLeCecmpYLPiI+NinRkBK3yeIncAhA
	z7lBXpBGHITQhQtkKi48fcCcon1AfAURExFqSu612rnhaIqw+FPtpYImOSIaLPqr3DsXDlJpGfvWI
	HZ0GK++w==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplyE-00000005IQF-2yGH
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 10:27:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so24620835e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 02:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741170440; x=1741775240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCPKjpK6VO4lMEf73NVEG6/3JrmmaR4wPO/hIV6JAAc=;
        b=CKJqcMS9S+b9202CNyq0tgRt0mB1ItjPB02eAiL/x7p1sWIq9X1Mf1+dtMuMiEh9zp
         GWlwoJfx+Gtj9UwmQhS1+Ub2FnAb/cmzKGQTA/mQ4biP2VsYQR6ZJ5ZlpNpOZKJg7YW4
         QpXFN+q3PP+rji/Cm+HBKa0FZO/HKqIakmIdUQsUGEb8F3cafTrwRLLfnEXz69v5gjtK
         acsTj1Qw6CFpm7XJ1mSHxSK3/6nD1dngdlUhW9Y0icgYu3QL5nb90C7PAN+Fi0GsTDes
         uMxeTuoSNh6kl4SQEHr8HXxag+dC9QrdjV8upUlSMZRavqBQVWoLo86FrCqaRfWFCh+H
         uKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170440; x=1741775240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCPKjpK6VO4lMEf73NVEG6/3JrmmaR4wPO/hIV6JAAc=;
        b=OxZjf57OGqz3CVOQTJIOzP2A1+o/p4Rq8lJV2VK++x7MfJJN3NMol/fPuXNktwEQEB
         N8YsvN8Ls+XWlk0fPZSB1JCCjJH8nbLjwA/bl/ccUAMNzOcrgNIEnBEKmn+LZxEGi3WP
         XN6vR8L4IZCXGJpI+wA9IL8+zuPYZzCyOMRkIZFaki8P+Z5UhCg0FcHoOmif2G9vh4ha
         GG2wR0WllDbNLx9gKcdiwK8XJ/8D+kKtQHNVQqmilm/9xWw4YJmlF50NZszIUft7EMKi
         kHyOODH/KYYW1S9yZH06VmUln5tg38a7FzEoUZMDK3gh4IJluEdOcwpP1Sh4Eh6obxt+
         DDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjmaopAe0NlCt2/oxNOt4XQahLnPXv1zYzamfR5AOLvtdEIuCJQQjNG5k9slKO26A/45kP9MoAC8IFsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy+UMp3mTnXkxLyrznJ/vHTbEf9hF2AKNpiO/mPv+ZFFpm+MfV
	d/PhP7/BWVy+45RkBpmlQgBcuaNmWB49CB2W9iyaLeMdLBiGXyRBvlD7c17vScfeplix0UxhC4i
	C
X-Gm-Gg: ASbGncvEGPIeC9sgnntEpBdBIORnZy9ipw1wci8fEk9wehW14L0ZB8BOuYmJJ21FabU
	4JnLT04dT1ZLRGnw08k787QfldzUAOoZKw+uszWW8NvwKx33xsapHvzOXRUyNu/CDIVA+tCwEAq
	Fbx3DPZTuGalLJUDEno5cD9QqABlpxxuNMRg+H7BxYA8CrtRXUTnsYEcdHgE/+45hFoMggjphbE
	8f5PDn01ijf3+GqU/aFbBPnjsL5aGpiG0qrPf7qUjU2DQ/jS5b/c/CBcB3Xzxz92ybyodYrMh9P
	RQcGSOUdetJQKHBZjTOjatTwrjPu0hrkukmMtlDHNbAK
X-Google-Smtp-Source: AGHT+IHMvKES4+39p/GD/gutXcsrB/9GUV4+AbW8RNvVpOWUIzKEe0uSKYCHBVcKeGfHAgKJtsSHgg==
X-Received: by 2002:a05:600c:5120:b0:43b:c316:1fee with SMTP id 5b1f17b1804b1-43bd298f96fmr19612845e9.15.1741170439670;
        Wed, 05 Mar 2025 02:27:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485ddedsm20185004f8f.89.2025.03.05.02.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:27:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
Date: Wed,  5 Mar 2025 11:27:10 +0100
Message-ID: <20250305102710.52762-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_102722_856693_C38B2489 
X-CRM114-Status: UNSURE (   9.59  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The mutex initialized in probe() is never cleaned up. Use
devm_mutex_init() to destroy it automatically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 59fd555ff38d..67e867b04a02 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -9,6 +9,7 @@
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
@@ -749,7 +750,10 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = pctrl_data;
 	pctrl->dev = dev;
 	raw_spin_lock_init(&pctrl->lock);
-	mutex_init(&pctrl->mutex);
+
+	ret = devm_mutex_init(dev, &pctrl->mutex);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, pctrl);
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
