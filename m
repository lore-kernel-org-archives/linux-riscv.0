Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD52EC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 15:00:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D304214F1
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 15:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ks27/6/q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u9wJQQt5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D304214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=shUaSwJPVhw974Eh5hMdvN4pLGDTqoAa5/JzWMT2i0w=; b=ks27/6/qGKbf/2RDHuU9S/1d+
	NlLthLlxeGou9koqUjuWKODbjqANyKz9P34lDPP9zRJYmjODeN8DxsXy5lLcxst/eWFpon1Bln92K
	MdeeE+ytwbnY+EPsHVbii3ox/mJluVjoxEf+ByHXtFzPRYzM9wgHCQBp491scTJ3fVhskTt3/Ycjc
	jH582eqSUwPSVVJ5q7h7cBFMSv83hWQdQKoHsW9vUEzr4hDrJmY096DYmSkYbZMuXWxMrFdN8AZOX
	u1tcWIYz5PtvJSJiSJ4C8UEReiY6km8bDNynckdHLzNnHKV5eOAR/J23sQcM3s5P5UK23ZmTBBtAH
	5HszwhFIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwuS-0006Iy-Hb; Wed, 26 Aug 2020 15:00:20 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwoQ-0002gy-Nv
 for linux-riscv@lists.infradead.org; Wed, 26 Aug 2020 14:54:24 +0000
Received: by mail-pj1-x1042.google.com with SMTP id nv17so1000534pjb.3
 for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2020 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CT6s1M0q19YFhy+cBpQPX3nn1CscA8mpaTfBdcn8vdo=;
 b=u9wJQQt5hW3qa3ya9qPXmEQyMDTWMQZHbSO3RwJdp2sKyqS30CDXWxqirn98P9bvjq
 5k9b4obnh5IAZeF3n7nfI5cHz7FVY+P1pluo2c6rNimHuQV8OYtaeX/V4Cced3rL7xFH
 NCmQH0Rh0EknPo8Tvnt6+BRX7xfXxLWINB6359wCNE+lf1Khs+fny6WA4kqbxPx7sPP2
 4Wu6b2bDlHb8ThVwsTbMsR4G4gOOz15ZBN+OjgIx4lyrvVzbF9xPrFpaYgkafvJyfa3m
 0kzpltobbXHAvhfSdg/A1z2zfQnA54cJJtn0xYgsVjEazuZMO04Q6WmKCtnX2fM2uoeQ
 xN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CT6s1M0q19YFhy+cBpQPX3nn1CscA8mpaTfBdcn8vdo=;
 b=mRNKmuEdRBkClRBJO+Lg86SIDj4UM8Fhsc71nzta60Q/i+nOLzeBCT5mywmJMf5VAw
 MV7/6/3SNLOsIDt897cd3n6yWg2+Oq4cr1IJh/V7e/uHosxZRdtAWugy+NLivjSNK5yV
 mdmBkwz1JS9X5MfvynEb3G90E1UtzB0SEV15wJs4mecc/UHP9ttA5kYoO6QxFS4IVb1/
 1CU3UZ44jADultmwILH1nIV4eWMawluPbUofEG2L4GC2zHecct9X+kCpoRAqfiE9j+It
 VVrq4hbX+UB2Q5HVbzf3zwne3JWNDOI+ALyqTgGSm6oXTc3DRBcjV3Ik0UDaYTYZp3U2
 4O6w==
X-Gm-Message-State: AOAM530QyrBukpEHYL6JvBiA4AdmnHJEghILnudPA6XAC2bsVCc1mWBb
 BH0C6NE1WmIByxctY8WcVNQ=
X-Google-Smtp-Source: ABdhPJxvkuoGl75ZVpNr1RgzK005jvzedZlnd2QDmA+7r0p3ng9I2IdwjyZLrFMe98sls8FJaqrpYA==
X-Received: by 2002:a17:902:c395:: with SMTP id
 g21mr12112718plg.264.1598453642763; 
 Wed, 26 Aug 2020 07:54:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id r7sm3327140pfl.186.2020.08.26.07.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 07:54:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [PATCH v2 17/23] riscv: use asm-generic/mmu_context.h for no-op
 implementations
Date: Thu, 27 Aug 2020 00:52:43 +1000
Message-Id: <20200826145249.745432-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200826145249.745432-1-npiggin@gmail.com>
References: <20200826145249.745432-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_105406_917771_012A00D8 
X-CRM114-Status: GOOD (  12.34  )
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
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
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
