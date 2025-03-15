Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D73C28B28
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Mar 2025 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mzJ9b0wgQc+6pHMiUzOwfOxmBSf8otbFtAMaJDfjuew=; b=iQyHLWbTYbY2Y1
	fMYwjY+v7RS2ZGJ5Xu46Tx5urAGEpZvax/SuKs4ofePVKQPzyGOIvjvl9BhwZ4oDoKEYxxBlS/zBr
	5Lh+C5mvK498b4KLGQPYa5cIlDos9S1wU+QFSFgM/Pxc/VWEC4DnDdzdw/vtknmovPfa76GS0aFza
	PLkxoxkudJLYRq45jBqf5FOCP8x7QsuSparTqYOgNI7/jQh3JA8w9ubOdpr2xJlLREjMAybo2tSXA
	6VknOj62BAt/IUdznDovyGpWRIDqmtxCPr7wrgzXE0+bbNFf2t8frRGCGlWgocAU08idsQkr+HKd6
	HHiWV76Ib/lXjvWewXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttONc-0000000GBdH-2AkP;
	Sat, 15 Mar 2025 10:04:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttONa-0000000GBco-0DDJ
	for linux-riscv@lists.infradead.org;
	Sat, 15 Mar 2025 10:04:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0a5cfd7dso3285305e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 15 Mar 2025 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742033068; x=1742637868; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Ome34xzBD6ytuYkcLvh0hzc1tsMwWzkshxKre3ePFs=;
        b=qxageQWcHNSSb+O6lrDiwauvPm3x0PMFRhDbCqz/W2ZgQZKqHWy+sC/OclF0MKrtp+
         OjEWwLIXxv9hvXLjQQ4K0KVyLG3wSOFzu2Ku2K5AIB0Aa3bOBW5jTcMtTRgwP8FM+/M9
         bALeBBHgVAYQylC9yDxKr9FZsGrW9211p42kxVbV9ZSlpD66NbSWC6wrBqfScxH8dIum
         a4GDPNP14rKCWXod6Rn1xb4Qv67MuQ8cqUVuzbuqVRfVZinnPRrOR3hwGUxFHRdZr7iH
         pHj9b9FD63I2YuOf5eFOrCDgrP9xPG8FC/19GTJWhbb4VdmEC6QsWDigVouuSAqb1XId
         9pjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742033068; x=1742637868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ome34xzBD6ytuYkcLvh0hzc1tsMwWzkshxKre3ePFs=;
        b=tOlxvPXAYmvJugZe7FJd7rxEt7UkbDcPzjquLf/j23bQoV8AkyYsx8DEPHmREvdGJX
         +bTAyjDKbURdzx09txcy2gko9mIUNV2JhD7vIq01crfx7td0S49SojM0qnRAb4jV/eai
         INHJbl/rjFzby+jCD/DAku69M6FuL0vJB+n13ZVC36x8+b4ixIOEnr91KfP7QGq0CSih
         F0nzKx6N236zlDpSxTip1+dZu5Dmzcxqi2Q2gqlAQz2WUuoCqWIlEk1Y8cuy9EzJO2mR
         BNux7UhsXKn0OuaTarO2eLE3RNXTGoIRI1+N2edJL3IxDqkuOQAE6lkF1Yb/gJEpHgvh
         bVsA==
X-Forwarded-Encrypted: i=1; AJvYcCVZmy41j5s43uGbi9zT3CJdyFs4DGWIgQIJTnTuyYFhXf6rZlV6yK/HgnTCGGHrg/wsjH3pEI1mTBTBFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4sazLe2HxEgdZ/u5fmOXV0OU1LynUOwnISpdnmWfxCekgLNvd
	YCTvu1E9iMiOrO29TkL2HODxqvqzVl810chn6f2nws52K/TMZZzy84dRfLYF4go=
X-Gm-Gg: ASbGncufnd1QHeDh8MSsRDCg4dalNjVlhZ2yPzCj897sf0hYbYu9+ffjybmnqCZN5f3
	VkaxMwreeuyhyjT8b08F6b2XeSfIsj7qz6SGfUJKaK0mhEEI/Bio8tDWP2MULT/L/HZA2KeR5E6
	zqpr2IlScuvj41tPf4jJvxqel26ugp9HY7XauDjDmi38yIDw4Zd6PrmrTIt2qw3HPMvn76/DV5n
	C351jeJgs8x3NTpMxQmfCpLWm8TyfcOs2HRhxzfGlocFS6X6J5z5nvFzm8j+CBgiAkDjovog1eU
	ugE0UqcdiM6AoQVqBKIdX0JXPRwq4PzABLNce+BcveRybkHSu11ARPDAJ2mq
X-Google-Smtp-Source: AGHT+IGe3a17ib1rZeRVb9c77roGjaqcKEfvjE/17j/FdHz+4lRmpBlGIjmzzYo/ezgUaqKEpaF2wg==
X-Received: by 2002:a05:600c:3515:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43d1ec622ccmr51862355e9.1.1742033067870;
        Sat, 15 Mar 2025 03:04:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1ffb6292sm45076095e9.1.2025.03.15.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 03:04:27 -0700 (PDT)
Date: Sat, 15 Mar 2025 13:04:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] firmware: thead,th1520-aon: Fix use after free in
 th1520_aon_init()
Message-ID: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_030430_111491_D103BAA0 
X-CRM114-Status: UNSURE (   9.68  )
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

Record the error code before freeing "aon_chan" to avoid a
use after free.

Fixes: e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/thead,th1520-aon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/thead,th1520-aon.c b/drivers/firmware/thead,th1520-aon.c
index 4416e9bbf854..38f812ac9920 100644
--- a/drivers/firmware/thead,th1520-aon.c
+++ b/drivers/firmware/thead,th1520-aon.c
@@ -203,6 +203,7 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
 {
 	struct th1520_aon_chan *aon_chan;
 	struct mbox_client *cl;
+	int ret;
 
 	aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
 	if (!aon_chan)
@@ -217,8 +218,9 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
 	aon_chan->ch = mbox_request_channel_byname(cl, "aon");
 	if (IS_ERR(aon_chan->ch)) {
 		dev_err(dev, "Failed to request aon mbox chan\n");
+		ret = PTR_ERR(aon_chan->ch);
 		kfree(aon_chan);
-		return ERR_CAST(aon_chan->ch);
+		return ERR_PTR(ret);
 	}
 
 	mutex_init(&aon_chan->transaction_lock);
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
