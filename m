Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B307C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RCI96y5CHsV/8yKAWHRt9yuLu5FhrfCbdeL8HVrkEo=; b=BmLaokXw3qZfEZ
	ps/6sykwMAqxdLvqMBJNswAxTWV7CqPqdxz+Ocyd4OVDdXPARF9evMLaeFNk1BIeG8SPBVqvQVeFw
	aM4ctdHShRlACb52aQ+CYuPy86zuW+nuHnzXSNF3AsXvxZ/mpYXESzNM+Wq9121xYcLgSnbt8UHYS
	3yh17/yRzIPnWOsfs+ULq7Zi1fq4Sw3u67d3qbhRolgJMiHNVOhaeplevJIeTmtafNB47Mu99Kzhr
	QVLtxvV555dgK3JAoKShPJQm7DlY9hUH7RdJmNb0nn+fmTIttbi7NEdtk2dKHxTY+wr0P/MepHHUv
	YitKDaXPfzS4QOnqVUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2C1-006DLU-2m;
	Wed, 19 Jul 2023 08:05:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2C0-006DL8-1n
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IIZEzHVxC1Fx70Cdkz+V0OVQ6Dog78uDmiwE1vZt2q4=; b=qAOVo8EbA2YtFSPC50No80JvNe
	OQS6YIcg7Yg/P1QMbMFIpLFSGzsfVFcdkxoU92MZVHxBas3+K/oyEmD/i1N8qMv2uulsGjA08U5al
	NauW88REEdH8FEfXCHZdlxBABD6HYNaBkA36sLGpFHgZlO0GInqB8jWkbaeofSWYlL1OfhYmWXfba
	cLfKmzq1+U8fgdSiGdL+2mYqdcuDuRCa9ZqeY5kNQzuCVbqP/fvsLST59M7U0t1HcKK1lF55TDNQV
	Yx5QN7u1RsDiI447zGVO3XA4+uGDzlPkFA3NYwgnDOSXD0phinpHLIxVUTswQj+LG0XbKgT4tUpwT
	NlVrD5EQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLVPu-009NdF-1P
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 21:06:04 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-66f5faba829so3611520b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689627839; x=1692219839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIZEzHVxC1Fx70Cdkz+V0OVQ6Dog78uDmiwE1vZt2q4=;
        b=BPsBDwWrNKB91DqaWrNhpO/v4ykSqWSBCirIAnuxFvOs77l0rqsU8+TqkOv28d6dXr
         WmYVAVFOM9vjv+UHSWcME4r1ezRlHwg5UqohAqTvLNhkEnaX5Hcz/xICNS3d7dBZx2Iv
         GvTFOn4TF4Fw47/Bm6YeEH648hSZrlKW22TNiQ9ZRZR+GIbPaytAhRE0ZhEGwAnWSUOu
         yZ2+3zkaTUHT/MggTaWj1HOAknAkIdJCOfkXNZXkxX6lAcMXp3eJYHfdKdUaRY4p8sqg
         3GBwAf99mw6qFjNqVtSdyTeC8uhdwG9Wb9KnEINmXUoKYaNFsm+NslcdAJtzegeo08S9
         tp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689627839; x=1692219839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIZEzHVxC1Fx70Cdkz+V0OVQ6Dog78uDmiwE1vZt2q4=;
        b=EBII5OqLkVAUrV16Sqq1HFy1ue+NFuEH7JkpuK7wocZalgTuEJWragKl6pvuKfWMAJ
         m7A/DMtmC3UgdlOi/bxFSImJbmnehSOTmob0OBJlFexaVM7zjbiBhB8RgMoqXaZdHlE3
         oYbQCBd6ew55oOCHJTz73WN8Wb8H3CkJ6Q52NhmyhB1pqNHCpdoA/0cMYi/OkMOrVSe2
         Pq8gI6tVLzU+yt1x9Cn6K2VRf4GyAgPD8/FQfEw9B6HeULtmEEf0ANT3Om4T1tBZnkHk
         P3pOjlzqODIxgUxagnNkzGjCNTB6AULRmRge/eTayPU15PMEYAQSK2s65AnxnC0LyCLg
         hR1A==
X-Gm-Message-State: ABy/qLYQg7H/a3fSY1n2ZfhI3qqjq4aa1CA5veIP8/TpG/HkQrYRRn0D
	eH+s00V6Pjh1M9z3Bnxnt8g9phR5G+gXuhM3Pr7Pgg==
X-Google-Smtp-Source: APBJJlGh2y7l4Mcb4h+KipYMEFcoZHbETqHgVjohsP4Fa5WcrLA/yfUSBTw5rEOHn+qg1Eica/L75Q==
X-Received: by 2002:a05:6a00:ad1:b0:67d:22a6:2f54 with SMTP id c17-20020a056a000ad100b0067d22a62f54mr790132pfl.31.1689627839264;
        Mon, 17 Jul 2023 14:03:59 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm191915pfe.213.2023.07.17.14.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 14:03:58 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] clk: sifive: Allow building the driver as a module
Date: Mon, 17 Jul 2023 14:03:56 -0700
Message-Id: <20230717210356.2794736-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230717210356.2794736-1-samuel.holland@sifive.com>
References: <20230717210356.2794736-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_220602_973873_3D431BE4 
X-CRM114-Status: GOOD (  12.54  )
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

This can reduce the kernel image size in multiplatform configurations.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/clk/sifive/Kconfig       | 2 +-
 drivers/clk/sifive/sifive-prci.c | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 2322f634a910..49597d95602e 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -10,7 +10,7 @@ menuconfig CLK_SIFIVE
 if CLK_SIFIVE
 
 config CLK_SIFIVE_PRCI
-	bool "PRCI driver for SiFive SoCs"
+	tristate "PRCI driver for SiFive SoCs"
 	default ARCH_SIFIVE
 	select RESET_CONTROLLER
 	select RESET_SIMPLE
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index e317f3454e93..8c67d1a7c8df 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -7,6 +7,7 @@
 #include <linux/clkdev.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include "sifive-prci.h"
 #include "fu540-prci.h"
@@ -618,9 +619,6 @@ static struct platform_driver sifive_prci_driver = {
 	},
 	.probe = sifive_prci_probe,
 };
+module_platform_driver(sifive_prci_driver);
 
-static int __init sifive_prci_init(void)
-{
-	return platform_driver_register(&sifive_prci_driver);
-}
-core_initcall(sifive_prci_init);
+MODULE_LICENSE("GPL");
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
