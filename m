Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C31DCF042D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 01:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJdJfUQYL5DvdI47D2097qNS/SU6791FEl6qFQG7B6s=; b=klzw9KzgxAov1p
	jF1iQ1lc9YqqBDqUVG6+mafe9hCLtQJ/R2PaAyOZUfs1qw7OUBANRqt7x/M3yXIDpb49g7W2bN9zV
	gtFPmU34O19CaN/+CRzN6FwmouWtWE2b/6xyzaqJqmWRCqFy0Sf0RGBVy2NGsoHL9dgqUA4TG0t7z
	LL4dhX6/E/JwIOTzZK8yGCiWnxcLKU3YJNvfg0H+nyuSm9jMMAijkNO+Q7AAT90aj8pmJ16KoM4IH
	PNjUmDhFxVqVG4tEDj0R+OnvVBN7VWvQociH3hKZC6U5qscXL8iBYiCwk78P38qMGfnll2iZR1dbb
	GLEZOw7qQ+vlqWQU729Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syLKm-00000007a7k-1ksQ;
	Wed, 09 Oct 2024 01:17:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syLKh-00000007a6k-1bHz
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 01:17:45 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20b9b35c7c3so65883635ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 18:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728436662; x=1729041462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0aqH8Nz3YTxyf3WOUwJPMSHP7Sz01anRaWLkW9KhzE=;
        b=DaIljaEfaRp54++xltV9s/BPobFn2ED0hDJ3fAKsWuVXgAyJan3EmWS3zloeZh4cED
         yynmYDqnNmD2UxMKMr5UOQxdMxOedAazBvkxMdX3fPkaRifR0b3wk5jpTWUVGXf7FKLg
         R2Axrj051Xg9jgSHwN3JV2xhMmFhEMupksLwTtkj7yXVXJVT8VdEN7nQvV+/+9JGh2I1
         TARqEPPjrVjo/vx73ycgTXcfZYb8Zu4pHtYMz3ZQPRhwFmWBMsKmRGkXNBAih6FA6Wdt
         B66Ueli1pahb1vBrTWwm3C8+9Dh4L7F78IH5YbVDYOuDLCHY/5IudU9gRHSJhokQt8dR
         BpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728436662; x=1729041462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0aqH8Nz3YTxyf3WOUwJPMSHP7Sz01anRaWLkW9KhzE=;
        b=QdiGPHZn+omwomkEonHlXdSFhFDeHdIewiKabi8Y5j0QCIE3A3GvyiKV1VS9RITmsR
         bo6eRMbHSE04y99NFNeHneJ8WJ/+WIbrJrBhpyBa2r3qmvurfi7clFNWkOiAVbPDBN1R
         17YQcQeLSREp/6vgP7fQVI9z+K+C+VSxl8DVzWVN38ONmYWuO9dsL5+d3ur79/reCBjO
         OVNhhpVgWKLGJRBIs580vFxQ0wEv9BSbeBeJdWD/MVyKt1OREZemsmABTrGJHWKV9N/i
         CPlW2w+E2TCFAwFscL4lmlbQf2DLsS0QLXslmEGoBad/Jv+VEc46lCaCI+CqX82ho4On
         ggGw==
X-Gm-Message-State: AOJu0Yx6JqzB3dZIfWCEkvux4GxTZR+dlt7a86sRafxWsFERKUWs32Gy
	DHI9XCwJCZh4vhNhmht62NlZ4lfeX8nh/9ccMi0N3HxUtRgrBVqbt2v2VPS3Q28=
X-Google-Smtp-Source: AGHT+IGI9taZWLdFpMIE4dgnATWsHC+Qt+VhRQuoR+YZVLfax+9lGozJReoLif1bhqH7Lg+Rw73W4g==
X-Received: by 2002:a17:903:1107:b0:205:6a9b:7e3e with SMTP id d9443c01a7336-20c639172b2mr13200455ad.56.1728436662596;
        Tue, 08 Oct 2024 18:17:42 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm61076365ad.78.2024.10.08.18.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 18:17:42 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Tue, 08 Oct 2024 18:16:47 -0700
Subject: [PATCH v3 2/3] pinctrl: th1520: Convert thp->mutex to guarded
 mutex
MIME-Version: 1.0
Message-Id: <20241008-th1520-pinctrl-fixes-v3-2-5b60db446a49@tenstorrent.com>
References: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
In-Reply-To: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_181743_425994_4FC6DD3D 
X-CRM114-Status: UNSURE (   9.50  )
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

Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
thp->mutex.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 265a75a78d5a..7ed3f82b9339 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -444,7 +444,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return -ENOMEM;
 
 	nmaps = 0;
-	mutex_lock(&thp->mutex);
+	guard(mutex)(&thp->mutex);
 	for_each_available_child_of_node(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
@@ -531,7 +531,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	*maps = map;
 	*num_maps = nmaps;
-	mutex_unlock(&thp->mutex);
 	return 0;
 
 free_configs:
@@ -539,7 +538,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 put_child:
 	of_node_put(child);
 	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
-	mutex_unlock(&thp->mutex);
 	return ret;
 }
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
