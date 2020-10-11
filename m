Return-Path: <SRS0=iHCa=DS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD272C433DF
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2020 03:05:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573CB21734
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2020 03:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lZByJURe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t81ebUlJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573CB21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8BHGnb40luCRkCiiW3Kci+35c64tC+QYdAkRCF5R7p0=; b=lZByJUReL3eivr++GcszTxsE9+
	ZnRcRkKGsCeIJktYTDjbyxfg4EeVLDH1qOCzDXPjTfz1eZIJWYJ2zLzuNKPmnFBTnVCzYULftvvXw
	xBJ6MzMeyo26nkUHiXYrXyKMiB8kwt1j0fB+Ut9/ttIKRlOMERP76xWcB6E+tU8/dHai4F0+AkbIt
	Y4GdK96kcsSfDMnKWngMMHgoyHTe9CxLclQo0TwBcDXLPYo0V4qrZEXHcz/7JJ9GFq1QhuPMHQ3+3
	3X1nqEpT8Srdanxvf6Dxd9mmTmLEfPXrnKFPQHlDM203XXgActgiRMr+BE7tA7pT3fW38urbMcFxJ
	lOjV/uqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRRfP-0003DM-AW; Sun, 11 Oct 2020 03:04:59 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRRfN-0003Cx-18
 for linux-riscv@lists.infradead.org; Sun, 11 Oct 2020 03:04:57 +0000
Received: by mail-pl1-x643.google.com with SMTP id d23so6583372pll.7
 for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2020 20:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qO6nuQUyuGyserco0gU3gcCQDY2NGTr1pWvbXyeqv+A=;
 b=t81ebUlJb42YhvlO/hFbSD98Qc9uHt47kxM/QdCwPpQt1acNswG6v9rINqAsVk4P9D
 t5u06PBpJEIixpXlFfwGiENCo9fwl34i999jJpl34iu5YA+GrgTMUsZj8GXGdC1SsmdM
 niRjVe+2F21FJwvW4owFYNKJrO7gJ2/aum0vaiokMrF9k5AuADRWBhd8c6PeN8t986N8
 6AdUCfG5tehKX+po5fqEIJ83DPRPl90Wo+yxQ1CI0nc/FPV0v4HDjicCM/5MlIHc4pFY
 3LgvYC/WGHh9i+qrfIIBLhT0VqREGV+TKL8qi0j12XLq0DMunMIrd/WrO5UzDW31Isci
 nWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qO6nuQUyuGyserco0gU3gcCQDY2NGTr1pWvbXyeqv+A=;
 b=H17UCjcL+C1frw4tkHWhBAmxLS6o404IsQFbJ4kAt8jT+FaJKYqPXEsgYeV1oL9ZRS
 tf5hACActcHpa6Qch3IyYyXl41AO0yDTjPNcpbU47lANMYb8D8cpOs+8csYN4gbP1g/m
 QCQ3R6WCWHvQv3/oLl9rXUSwa5kpTo2DvwF/IN0nvkT9vf0uJSktzlTaCMDsvrYvygYW
 SjPNVJmrifkH4R9pKaXKPE70ZQRojlAf7wY2F7KCxVr2KqWlxOEt9vlbnYp7Zp3r+dO9
 fgpad/bHIyq0nvxZztymCRS4Iji+xug585kqjISRCUYv1g+GN66Z53i0pQcWewAsRV5x
 ymhQ==
X-Gm-Message-State: AOAM531AJj0OHmIrGR+P6f5oWj05VTbfiiZLZ75utEWI7awC0KHj1BNI
 HBM2f8qZ14cqmD9JxMBrU4U=
X-Google-Smtp-Source: ABdhPJyehudg9KH8YKCqKKFWN3Sq5s9woTPhA1B1g5ujCDIm+hymvjVj3M+KVTvzLxt3dAnRdn7AWg==
X-Received: by 2002:a17:902:b611:b029:d3:89e2:7957 with SMTP id
 b17-20020a170902b611b02900d389e27957mr18227295pls.19.1602385493628; 
 Sat, 10 Oct 2020 20:04:53 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-82-187.san.res.rr.com.
 [70.95.82.187])
 by smtp.gmail.com with ESMTPSA id m4sm14601218pgv.87.2020.10.10.20.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 20:04:53 -0700 (PDT)
From: Ryan Kosta <ryanpkosta@gmail.com>
To: rostedt@goodmis.org
Subject: [PATCH] risc-v: kernel: ftrace: Fixes improper SPDX comment style
Date: Sat, 10 Oct 2020 20:03:51 -0700
Message-Id: <20201011030351.4619-1-ryanpkosta@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_230457_099842_D9987FE6 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Ryan Kosta <ryanpkosta@gmail.com>, mingo@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Ryan Kosta <ryanpkosta@gmail.com>
---
 arch/riscv/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 99e12faa549..765b62434f3 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2013 Linaro Limited
  * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
