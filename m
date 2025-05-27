Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2CCC54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 05:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ZBv92qifzC9/TMymYdOwGuKIGcPQSHknpxogxfSF7Y=; b=FiAiXeZVLYu/dS
	K3il0zBrQbffNB0/R1D4e503GiZX0CjfNAiLLtRe9MSPmA3cd75Cnow5fqW7BrJAgLYSuDA+bSoPi
	ABZVEefyJuioMQt+M75mGthdT832ViVnpSRxYg2YUQTzxlYxfbdVlRL702E68Cb2nP5VLk5yMB3ab
	h7T8WRFItVUbVou652AfcmEB92uTDzeK3xUf+ujqG38ChvUn0yN3KGL4tX8DfLPr0wAuiO+LCjCQz
	9Cg3G3gH9++FpFCr8QvFCRskrJqC2+o69kTeAaVwinAMBZwy7o4F6Cf1i00tcMDxJl2agaBYuBtbC
	OhCfTI4rPnwcowq8l4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnHJ-00000009yFa-46ef;
	Tue, 27 May 2025 05:55:09 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnHH-00000009yEv-18ua
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 05:55:08 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso5705092a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 22:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325305; x=1748930105; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/92qQ8/8bI1foaF/B/6o65zGGONk9qpEUFF2woz+1A=;
        b=Zkl6ZMqL4wVzytbYid4YSYvdV6tO1bYOXRRWyDH9cErEEwLS7j+zNIIDBKBVm5mtiu
         /AWRuFyt92Kx1l7T1APawNLf3waiBd7nw2mvsvHrLgy/BHf+WfUHGisMyQLCrCZLkRqZ
         1W/FrRq06i7ad+da99jPle3XyfG4cW63/hmO67HQipABYJxijMHhwQGNM0C6u5xR4MbQ
         uKaCjLoXX2tZ+ZWTvMSM5WROcEp9z9BpE9YsEX5gzPFAT6iOK/ywyKO4/gqNxCMkeBfx
         1tGx702BZGJOE3Q8jkRVWBi4vzBbfeYaPeLFT0+i6yF//xNnv0xglwMXDSXrSeUbELKj
         H6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325305; x=1748930105;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/92qQ8/8bI1foaF/B/6o65zGGONk9qpEUFF2woz+1A=;
        b=GDMgvRa7wABTtM0ni2xxFNNceIDYOTQCgWkToA83YZHzwN3gEF8IygBA+3yqzoyp1z
         BVJ5DAOt9pUH6VGmGvxmIFCuNA5SWvMHowDFTJ66WCXMjQWazvo1RRZE5r0W2NJSQ4U3
         wVVyXQ4XDBUCjAX21xGocWazBVKBidRgrZ4c2f2abtGahd9o2MmGljsq5suA6v5d2aDT
         rmUyHDlHWjeQ8BX5xjUDMRNMoo0Kzwr3iiHhrMJLZbPhCBh+b3OPTHzZCen6VSfoVVY/
         FQqd/5P+1uYl1O7vPYU84vLQEKCZvng+U2XZR9d/snUTy89dBoIa7qJg9TpewVM12P+L
         PiHw==
X-Forwarded-Encrypted: i=1; AJvYcCU0KTO1DJzXvWtY8/m/HIjz0IzWNVpqW60YE4LTn8dlqyOGnLCto9t9XV+UcYweAMjGLzza1vRoRYhZ/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4FoIIpTB/+h4OENX1yst3t+w3RxJC3BwXf2lnGBDipCzwl7ov
	HUKGxc85cYFNn8avBDLjLKuv8KW6zWp4VsEGX2CSSwP3UKXRsTKXJ/j6R9ZMoHKxc30=
X-Gm-Gg: ASbGnctPeXqd6aQowNflqOYl6RDvCfe5ZWiQ1D2FPIMa2svlOVI8tRNRgKzDqXwbS9W
	F0f5eip1pdcjaImiNmfQI8eORuvEKubmTAma69kOIOJqlphQyS2JweSa7JRGxfKaY8gPB3E1Pqq
	F6us5/3EtW22RYoal7jryHTTBkt3O+m9KQD4tJ/rh6Zb1hNvbKuxCyBZ0gwXC1AKjTeG0j5Xnbi
	dlbHkrYXLvRB6UZL8ytftO8YCipkNm4vdw49m+/vjdR86OWvS/J8qyfS0YoS84yUXvexiZYjNmJ
	8hi+AvXwofgEjL/GA7S+imSvADHp2XsHlS9yradbUTpe1cDJW6YOSMe3RQIMg8Z26nMU67qyqWc
	=
X-Google-Smtp-Source: AGHT+IEv5s7xDmY7xLIqn57Glb7AygAOacFI1nEFLy11fNwi+mIgMvJcQA8W8aLW+zQYLW7VY4hQDA==
X-Received: by 2002:a05:6402:2713:b0:602:1832:c187 with SMTP id 4fb4d7f45d1cf-602d8f5d5camr8978474a12.4.1748325305573;
        Mon, 26 May 2025 22:55:05 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60464875b8csm3393023a12.76.2025.05.26.22.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:55:05 -0700 (PDT)
Date: Tue, 27 May 2025 08:55:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mmc: sdhci-of-k1: Fix error code in probe()
Message-ID: <aDVTtQdXVtRhxOrb@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_225507_350582_26159325 
X-CRM114-Status: GOOD (  11.02  )
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

If spacemit_sdhci_get_clocks() fails, then propagate the error code.
Don't return success.

Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 6880d3e9ab62..2e5da7c5834c 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -276,7 +276,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
-	if (spacemit_sdhci_get_clocks(dev, pltfm_host))
+	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
+	if (ret)
 		goto err_pltfm;
 
 	ret = sdhci_add_host(host);
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
