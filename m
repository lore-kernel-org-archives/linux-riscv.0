Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010BEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0t6yYvdgy6W7BSgkjM8X1unm1IoT8v7iDaOOFBuRkQg=; b=PMkh/1ka6LpAco
	qzv19wvz/zUSW3SFhFz6Tknt13BDACAIQ3ME83F5X8KQ8xkHqv/odrpIpTpfbQZA/8TpyuOoA8yI/
	9KoYDx1QHX3um628XIf2ac5Q6vCoIY0RpkK4NNEq9RnPPwakzV05YRKI15evz8TVgaInqz3SZPjXl
	nRJDF7hZYk6yvc4tYmctUBRDS/rx5dIxprbmwvGcTW/QPoZZPAMPRAwubigi/CmQz28lNN4NMWyCT
	DKlvVzIClDDilLJIZp0mr5UOAhf6VrOFeRBa2Xh8haxGZ4lXJ4ZZvLyRoRY1kpBPj6UxfLmLQ1rkj
	xG+q7te6sC4dsNfGRnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXPAh-00H0bK-0g; Thu, 24 Mar 2022 15:14:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXPAa-00H0Wp-3Y
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 15:14:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so5452435pjm.0
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sX9W0jJI3V+TTQxrILZfbGus1iz/Yao2DvXh0KaNAVk=;
 b=gpAjqtAs/CMCFYARUt91j9dwYBp7kop9q3skoKNqjx3CyCpsH5capaNKZB2s3KtrgF
 InywL3AK1oN3rwIFie+KLNYK9fxaGbFY5Jh32IuBj2HiIeYwXBqqXvcIhPUPVuwm+JS6
 f+od+jsOz1k6SOhWeZRTylBbfmxyBUqIJ5tOTKqkXSW6QU8LLM/Bf8VDxL7LG2pJBU9i
 NUsyTwJPM2JJK4EvY9usKAe7GH9fdsPUfVSUfFiRjc67GArUHiQw9UzhUcYoJxNtd+Xg
 vYJdbhGM70igS3HGexUZW46dlh993NUFYyVgPpLWSpevNWdKv/fLj4ua0szXwJ1zSf8u
 tEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sX9W0jJI3V+TTQxrILZfbGus1iz/Yao2DvXh0KaNAVk=;
 b=2ogWN15bOO10Z69TVI1eexiIBkGJv3fVEtsUbFPBokBAAT3ksAqGdwPgYezPUIsIPB
 yRT7cQPWBNkRE1AJc1l3pUAhLWsSkehEql89b8KnTvQkNT2RxdZgMA1hO+8PE7F1adoy
 LL1UoHh4DULif1u+LGHGN4iFtLZ6u+eLazXL8LpunCtNMuj6YSbHAfDnyNrlaJZu/srS
 aMssPB5lirdKNCyqUwbAndjtZWyPCD4CrLMgJ4mCIumTvo6F/V7XJSEngieVR1AKyZni
 YOSORKMWiFI3P8qf5VEedTbhrTNq75nD4ZLc+t2H73vmofo3HikB+rhphKKugBt0Fqaq
 J8ow==
X-Gm-Message-State: AOAM531GCD+Nfn0pMj6YCUB7g7Bfc4hzDQ13487Glx7u7iNVWmt+LGNJ
 M+2gSHD5fYsMpF2IxrDeTLKXIw==
X-Google-Smtp-Source: ABdhPJwvUWFP9fjVbmuW8smT32M8pSxwW2UY70TQr8HUafEViM0ns0c8WcusCbvLPd3lTLGS9DktJQ==
X-Received: by 2002:a17:902:bd88:b0:14f:8ddf:e373 with SMTP id
 q8-20020a170902bd8800b0014f8ddfe373mr6576185pls.89.1648134875096; 
 Thu, 24 Mar 2022 08:14:35 -0700 (PDT)
Received: from localhost.localdomain ([122.171.187.87])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm4166065pfc.41.2022.03.24.08.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 08:14:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Thu, 24 Mar 2022 20:42:58 +0530
Message-Id: <20220324151258.943896-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324151258.943896-1-apatel@ventanamicro.com>
References: <20220324151258.943896-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_081436_176577_DDDB9882 
X-CRM114-Status: GOOD (  11.50  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..7c7e44aaf791 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -18,7 +18,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -66,7 +66,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
