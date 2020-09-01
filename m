Return-Path: <SRS0=nmAS=CK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3674C433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 14:17:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96564206EB
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 14:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lmvrtLjq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB20cpEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96564206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bSYEY9gT/l8INpUd+Es/e+gMLveMi5ix2O97dHIRDsA=; b=lmvrtLjq7HlhLVnZEr0EzG919
	nM5l6pHbSKSNh2QbHsybZuNY299UNQ+EeQHgqdAZ8UP/P4Ig+YFSK/X+ZBhv1CxCKnxk5rV73EXv9
	aqLzeiIjtE1DA+SXIqO5RhGLEprsX5dKl3E+9lPHIbF5DTTu2IXiiogit8QIRDW1CgzRabdBxDQGp
	BXl9WHTbTMRUSguI+mkOfaOJS6OCpIqU/8imsKCtczJ6YiaOYgoSjG948fBFcwsAM4KKLTFfXJLc4
	9X/CqtpxlejBJQCI1AeWyJCf45EPmurngb9eEPy5OTZ7KMdZMcjqcH7HYnmGR8t5iud2Hfvd1M2AJ
	5Gl6sJaew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD75m-0002Cn-5m; Tue, 01 Sep 2020 14:16:58 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD75k-0002CB-Qu
 for linux-riscv@lists.infradead.org; Tue, 01 Sep 2020 14:16:57 +0000
Received: by mail-pf1-x441.google.com with SMTP id u128so861491pfb.6
 for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2020 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V+3JHgVNweMgUhzc7j6b8ZRjCMqnC1xbmRm2pl0WCfg=;
 b=CB20cpEqML91DElw2lqnEobmqalA/rjf60OkO/wd35o3JQ0VTyekzIDx/QYPoD8F7s
 AwLtmANxAr15KN6IwOlwQ95Brx7uEGuT98kYZy0Y/JlbjGrRTw91JcloFGznUj+dsNBZ
 l6ApDQG4/5PJicafeXy+yZxGhrac6kzjt6vcOog+Zgv9U4ZBiDWXfYoiQhbaZv8Iz1D1
 X9kejM9Q86UkBGt6doMDVld8qOp3oyG/DJj24ASee8R7OIibieQzbI6f7ZuwLI9XfX+c
 no3jk94IDfS2mDRSM3n7iV/Xl55YmrDtHrszCBy0ChWg/nXWzlnMwMEkkJBsty5S3vdr
 zM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V+3JHgVNweMgUhzc7j6b8ZRjCMqnC1xbmRm2pl0WCfg=;
 b=O+9yAv0FblGPYFUQL2BFOtAi8dIZEQ99LHrjoObapUj+CtMuQVRQ0hzKlwxjgsjDJG
 SFDIgK5V3Vu/QoLwjxJlFzPIRZy1ls8uPF8Or2+aScIUvrBDINo+PLE83g1J2P/zsKrv
 wojjXCLqxCAFOXUXSkueaJnLTsboc58uxhIX50Cmq7/WmpZ6Z/7HnCQIw6FkIzvwj9CM
 gZwPDzhrR48C14GBe42FsQ37pxuNtvkBuOB0yBQUhQdap9V9nEwgeXy/X04LyvjqQSbd
 YLWqWLO/bRxrMFIgFUG4TAtiqV6z6sFNIzhI2fL1ptuxUbu2ZoZn2NEO5K5P3Oko72Lm
 2K/w==
X-Gm-Message-State: AOAM533CILkH7GsPqeRnx4Zl2PjvdL2vRWDDPgnO+kfWJ36Cwym+b13W
 hM9KrM8JBQE5mPXsz+Sxgvw=
X-Google-Smtp-Source: ABdhPJylKehXG36qs/dxLCybNpFCCKXykAX3lh1Xfj4HAPNNOKYZVyumOMiUgeJGuiKwKNjpyRrTdA==
X-Received: by 2002:a63:5ec5:: with SMTP id s188mr1704463pgb.218.1598969814810; 
 Tue, 01 Sep 2020 07:16:54 -0700 (PDT)
Received: from bobo.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id w9sm2212816pgg.76.2020.09.01.07.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 07:16:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [PATCH v3 17/23] riscv: use asm-generic/mmu_context.h for no-op
 implementations
Date: Wed,  2 Sep 2020 00:15:33 +1000
Message-Id: <20200901141539.1757549-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200901141539.1757549-1-npiggin@gmail.com>
References: <20200901141539.1757549-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_101656_875426_F6072B46 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Pekka Enberg <penberg@kernel.org>,
 linux-mm@kvack.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Reviewed-by: Pekka Enberg <penberg@kernel.org>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/riscv/include/asm/mmu_context.h | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 67c463812e2d..250defa06f3a 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -13,34 +13,16 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 
-static inline void enter_lazy_tlb(struct mm_struct *mm,
-	struct task_struct *task)
-{
-}
-
-/* Initialize context-related info for a new mm_struct */
-static inline int init_new_context(struct task_struct *task,
-	struct mm_struct *mm)
-{
-	return 0;
-}
-
-static inline void destroy_context(struct mm_struct *mm)
-{
-}
-
 void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	struct task_struct *task);
 
+#define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev,
 			       struct mm_struct *next)
 {
 	switch_mm(prev, next, NULL);
 }
 
-static inline void deactivate_mm(struct task_struct *task,
-	struct mm_struct *mm)
-{
-}
+#include <asm-generic/mmu_context.h>
 
 #endif /* _ASM_RISCV_MMU_CONTEXT_H */
-- 
2.23.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
