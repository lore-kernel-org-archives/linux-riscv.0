Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA504D735F8
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aM+A5epJGBWthBo8ApyCZ1/bpb8kQqQOas41Kmcosv8=; b=CSHnTTjoDH+nS5
	QSEqtoKxuP0+/lIgRDH3UEzv9fE5S6tl90hDBp0CPt3GKnXXGWRf0oq3a96Ytf9h6sY0tEAuYkEXz
	labCEab5T4/n1ny0iC4QYcUyKP03WZxEHJjGHpT/5+WPhuXrhmvSBd6GyDO967vaw67p3Odb+qTQF
	ZfctvX1jUfJnJctlMO8X2CPH/CwWZmCv/5MZJOrGOkG44giNmaBITuESFxq7MAtoYnIpMjNcIKFb5
	s1uyANGnO9vPkOiy0wMtsZlYLiuxapt08rcrvftcU8URmp549gdLfq5mn2FAs2fuYmAIrIAujjsPy
	S8116D7OATLMkN79EkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKOB-00000001oC4-1p2p;
	Sat, 30 Nov 2024 10:07:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKO8-00000001oAi-204f
	for linux-riscv@lists.infradead.org;
	Sat, 30 Nov 2024 10:07:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa532dcb470so156322766b.2
        for <linux-riscv@lists.infradead.org>; Sat, 30 Nov 2024 02:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961263; x=1733566063; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTiN4AcsE0vQHpWePTXXpdIk4ANIHC/O3POgP94FzkU=;
        b=QNlSe/dJs+USfj00RYqhorcLqCyzpXqRz6B8jl05EcYFHuQcVTgdQDLL2SYn9hH5/a
         jeoncULMw2avi9IIMXFNZm0BnvaoqZ++V8rG/R7EhA+OvvInTu4T1s3V1MfPj4C78svl
         goK44dOdyfNlTDjePxurEp/AJr2TCWmSV/u/dtAGtpw76aUg5Q2reB2yZnbNb1Cyq2rE
         sSDd4wJPhGE7V+QETCT2+qGW7BXscrXxVNZMFEg3CWz1ce4DV7BWfTnAXuVDdiZTi/Fk
         +JZttc0Toz8cFQJo6YEPs67/CGvZfS0uI1APM9X9oLAk0hJ/EvtGVI9ELv1p/RhGGnm4
         /WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961263; x=1733566063;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTiN4AcsE0vQHpWePTXXpdIk4ANIHC/O3POgP94FzkU=;
        b=oWkiVV6QX2Vcm2ob9w0a+5DhivsfVl9w8e7w5aDv4IMhbVJAkU3TRhNCsq59kg/o2+
         +RPP5mvhQL/0gO128EnLsQHoL8N5GXjKDT1AociphHgn+wZ7MIJ6/Z7bUK5aj7gyvQpP
         sH0giAX+S8tt28sRI6dfXaH9wzYdZ/MnkidVsFijRIOjc31mJVqrJl9eBG0Ahd3xB0FL
         oas968CL9w7VnF9parW8e8ueljcrJpm6cI7WS1cQNuq/gsatws0NWAuxXFUnuwmcgFZ1
         4CldSoAxQdDJXCAYpteI+jUFZbur9W+PIovYCvaJY868qxqdfL3ss7EEGrg8HvUh6+eB
         Dx3g==
X-Forwarded-Encrypted: i=1; AJvYcCUxWFm8Y1V+0FmvB1OIwHm82mbnvpbDBvj3/N7VNsEyE1+77Pg/Wd9EZVAmR8bIPdHPmz4oLyHKJsJJXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYkyHI2hcERh4O9/fhxffFFeblFnmUOx4sDhe7V1HLb5/NFvzP
	YUdEjDChDzXwg4Kleqc8grcWx2ZBTSkIq26gR5W8LujSsNL0Zngxf/stWJd+ay4=
X-Gm-Gg: ASbGncupB3Ien7yrfzJg067nvzYyBPTXTMkyiuPxw8he4TUJIF4Bz6VS7+ZF6F5qIwA
	Ndqh6mDiRiw4VWZ+IUnBkFLlHWxPVmmvfpd/lnaOxGC3a/DxXkl/hcLqsk2ZBiu+pcFqVgLBqCy
	fqkRXpgG85N7EQtuFxkFybLUQAjtkaDucI0xFmT775eUFt4tccikJvXdM+ExrhZqkpE9ERjb5Ht
	sm6oA32OnBL+r4iyhGt1gAClc60IPEZkURQn+d3AOgrd3PxNe+HYRXRHqsThnk2OGqF/BwY
X-Google-Smtp-Source: AGHT+IHcv3RQB0ttGHB3rHF8kVixpbGo6oU/NmsBDLLe1zSp/r+M8Q40bOxX/CZl1ALhhzeDN+WQDw==
X-Received: by 2002:a05:6402:3589:b0:5d0:ced8:d22d with SMTP id 4fb4d7f45d1cf-5d0ced8d41amr1610681a12.22.1732961262750;
        Sat, 30 Nov 2024 02:07:42 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d4124sm269133866b.64.2024.11.30.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:07:42 -0800 (PST)
Date: Sat, 30 Nov 2024 13:07:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mailbox: th1520: Fix a NULL vs IS_ERR() bug
Message-ID: <bda05d7b-5a6e-4f57-a124-ba56f51da031@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_020744_513000_40145EB2 
X-CRM114-Status: GOOD (  10.98  )
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

The devm_ioremap() function doesn't return error pointers, it returns
NULL.  Update the error checking to match.

Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mailbox/mailbox-th1520.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-th1520.c b/drivers/mailbox/mailbox-th1520.c
index 4e84640ac3b8..e16e7c85ee3c 100644
--- a/drivers/mailbox/mailbox-th1520.c
+++ b/drivers/mailbox/mailbox-th1520.c
@@ -387,8 +387,10 @@ static void __iomem *th1520_map_mmio(struct platform_device *pdev,
 
 	mapped = devm_ioremap(&pdev->dev, res->start + offset,
 			      resource_size(res) - offset);
-	if (IS_ERR(mapped))
+	if (!mapped) {
 		dev_err(&pdev->dev, "Failed to map resource: %s\n", res_name);
+		return ERR_PTR(-ENOMEM);
+	}
 
 	return mapped;
 }
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
