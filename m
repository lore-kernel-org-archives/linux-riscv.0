Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF5FC43465
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 03:35:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E2E2206D4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 03:35:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xlzMXMix";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/Nr2b2I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E2E2206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z54XAYkcXaavPm3DviIJp4ShQ793JKWOR1kxfxqt3Ws=; b=xlzMXMixwr+1G/jvedT8w5viR
	qjEaHMAyhx1zhayDkm8Wn5s2CcCAgmiKRgZiS0UCzcbJ5xhKDPFC+JE1TFzdyAoK2Z1gB8XUQEE1I
	aWCMUcaZTLmLBnNSrtN/7SekYB6fhZcOYV1dmjCEjeR4QDAa6OF4MwrHWHtsDIoYZdQik/JsNZIBW
	6yECiconYm2E1ZsrnFRa7bNnc1BJfbJDFHS3TRAnw0ihFOQ3a31jQD2/MbDFrVq8LOyCbgmTHdOxe
	w9lCl9cvW2uS0alKaUOXcTLft4YGMS/yNoXwX79VYZDzhancoVciP4lrVfqhltK72F5CjMd331/Oi
	rJP8S7Kkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0GOm-0003s7-LG; Tue, 28 Jul 2020 03:35:28 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0GOj-0003qi-Pa
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 03:35:26 +0000
Received: by mail-pf1-x443.google.com with SMTP id w126so10003253pfw.8
 for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2020 20:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qyDAiHf1mT4LwA7F2omwzQoVQ8iMHIatldNjXE0mQY=;
 b=f/Nr2b2I4ELY5hyYHRUh6KooDJAlp3MrLw/PlVdYtLw3CE1D9kZNLsNeTow4Ki4oWD
 UESIefuHP+6SCTPWw58PicUJqIO3L9dsXl1jIzmj9TiQGxEILaVEG7R2kOJBICiqHTix
 u75FgNTYAb21zm+Uw+Hfc/xghYm25Cyz+k8pml9ggMf3IQgse97CR9xKTnOzC27ELrdY
 d7ZqqozQfMo2SzG++C3CTwVzxRwkHqKzIaL4KxDjPma2BftsER8+IWR6aoBEayc5H2i1
 aRKLa6KhnKJMFNBHZewP7jZc9OR3yUynufcskhFJ3rNgmZ08TTj1LAuB71sT3Gm+blgD
 FqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0qyDAiHf1mT4LwA7F2omwzQoVQ8iMHIatldNjXE0mQY=;
 b=Myt1SAM0BIlZSaW1odkm7gEI8VDdn5qa0I9/QVtRp6DxEyxnnyoywG9ON6/tuTUTNg
 ibewcdFeOCKR4nWFiJPev/Z0mtL3O1z50V6HF7guanPd4c6zMvhbjAd7Sd0qcqhNA1P7
 4sItJJAMiGjeFrKILAy7mnD/+ff5Fi+KtknSU0s7uGJJZyzmTErODvGcM4ER+YjpdNuB
 JjHx+QMH2mE5yAYF3Hy+et+hDULzNbM0k9sribwCkVkVaS7N0DhTNoEdqVz0Y6seQm5G
 vhOuLuf2wXERJoL54kmAExLItVmZ3PEHnm7DQLMutn6QXVjSgJYQLVJeFMbE6IYTXLkl
 bhPg==
X-Gm-Message-State: AOAM532MoE1BdP0c//bKHq+nwc49aBZkhWFLA3Rz+dXK6fJtTRvAaoiE
 7ClpshNMrYNz5xjX8Ed5BLg=
X-Google-Smtp-Source: ABdhPJz/AALwV9gd8acRqPIn+a0eJSVgKeEpHZuxSXFC2/WisGDuvgIMt1iJw+CKzEAuR/p7tE0YlA==
X-Received: by 2002:aa7:984d:: with SMTP id n13mr17303136pfq.276.1595907323703; 
 Mon, 27 Jul 2020 20:35:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id r4sm998707pji.37.2020.07.27.20.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 20:35:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [PATCH 17/24] riscv: use asm-generic/mmu_context.h for no-op
 implementations
Date: Tue, 28 Jul 2020 13:33:58 +1000
Message-Id: <20200728033405.78469-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200728033405.78469-1-npiggin@gmail.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_233525_869666_6E15B5C7 
X-CRM114-Status: GOOD (  12.98  )
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
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
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
