Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B43C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 04:43:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C731613B3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 04:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C731613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zLuv4f88i9/3z1rlG8y/qLdsG8GbyLQtDrhpI+A8m4c=; b=gzEl2WIFY9UnM4F5HTjHXB7Ykj
	1IcAeBgZcLqW9U+7egaNOjmCYWEKAqTGB5anp5ACFAfLP5yJccC3eipo2iD5sOb+fUk5O8l9sw/De
	IKJavCaGhf2Qwzi0LtPbWfAL020vSIKmyrXaK5UdMHc5+Y6U0Y3YZGA4yw9mQ6uj7JGoDgvNr5NQg
	UhmBuCbWjPeHJjJn0MW72BMwaaH8owXlkOJ3qzvprQp5peVNQXIrMyxW/fFnKp8g37w6crXpA2BBf
	X9D53cpuWI/OP5ciWRmhRicywGo8/zWd1o12U+1SwwfQeiT8h4oEnlXr3VZ7+ByxPQl49a3RBst4D
	kVGT9XwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbyWO-004uTU-Hd; Thu, 29 Apr 2021 04:43:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbyWK-004uT3-Qo
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 04:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=To:From:Cc:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=dYuU5G7Tok7W7dteeCw6ZMzwcEHLOIU+TkutgZ/lpVQ=; b=RR038Xeluqj2HTej2ccG+5MYal
 K8ZFJrpmhNJsqv/Bu5i0v/Y+5uFXGl+2TiWSUE/oAw2alYsnGvedn+9FAo9CDe0VKkoyMALcNFeYk
 hIwvkZZeEOTAxK5nyXUQsvgbhRhIYZH2HZpSumgYgBS27azeTnIgF/U/06FuAsmQKxJuNOjmODLrx
 GXxtLWvarkkmvgCozu9B5w0/3rrKp4F8/BKhGCo0qQ8ScyddFbKPRf+aeqnQULiWjKoBjpKnVuvkS
 fIyRxoPT1+QKn9eIOTPDlXfn0zUB7fFsbuait1S+ssRSnAyMIZ4+ZJc9vQJli2aC+lkhHSHZE/4su
 KYhCOJig==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbyWI-000MyQ-6C
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 04:43:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id md17so6564205pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 21:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=dYuU5G7Tok7W7dteeCw6ZMzwcEHLOIU+TkutgZ/lpVQ=;
 b=oZYFFE+Bkk/IeFoxxL5IEGMza6qcQMtcphBKKgOPvFRBJ/A/UxQOUgWqXISyL47oq0
 QJxhycOwaHu3xPeTTTnxbH5il2GAr+OGBa3hZDXqRTZJKuyvMZCP9h64a+zTQVM0YuLj
 f7kuAgnv3Z9xrKYYPdHKxM3PVXKG0brumHKSaL1EiSRfjJFZ31hqb97KLubg17FnRb+j
 JW5sQBv/5TdAEf17pYJ2LHxb9IaR9B3PfncY4vjzjFa7tjRhoHUYsz3uiTHIA5NeZFT+
 ijyhmjmPzJyl320tohcGYOvmLZ2n7FHXUpHQdMH7GuyeLU9AmP3bKlOtgWJeYNAABdwC
 2ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=dYuU5G7Tok7W7dteeCw6ZMzwcEHLOIU+TkutgZ/lpVQ=;
 b=e4oOAFAgjXbZ21bUD2dhIzGHK458ruiawi/oA2ZDialq9vTUia4PAoDpAo7ejiU83I
 PLGflyq9hBA1UgreLsi9RxawF/V2ROMG1eV+ry3k1/sYMo1Oka9+X0YvBWy3q4ihLdv7
 uG7s/CHpRfqiZKVSxfT/mdBNS8LvXtHMMcSmDC/1BlmydQvNZ/snPswkmXH3GLDCu8YS
 e1NZVReiedyuEmMg1vryutowz6iXX0JMY3dOjVTYh5mYQtEpKVy1OE6rTufBUFJsDQSs
 z+tZG7FrZp5WOhORw1YPIGepDHEk4GYh01Tf7wG7e6CE6xb90dQhEf/hcaG3vzarF2LT
 S3DQ==
X-Gm-Message-State: AOAM530ug0ax0dHvmK1L7UvwhNw7HgGeKNvXJFMf0EKM7iNbYSh7k5N8
 iZ1stllhO60am08Fz6QG2fjZwXFJg79mBg==
X-Google-Smtp-Source: ABdhPJzbBoKq0CWXBqDbKoCDFpbY3JZr/Wxs75/h7bIUGoyXzgdWJ2Tu4Dj6t0ZUrWhVEID5QI3Sxg==
X-Received: by 2002:a17:90b:78d:: with SMTP id
 l13mr7789191pjz.182.1619671398668; 
 Wed, 28 Apr 2021 21:43:18 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gm17sm898788pjb.11.2021.04.28.21.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 21:43:18 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Always define XIP_FIXUP
Date: Wed, 28 Apr 2021 14:45:12 -0700
Message-Id: <20210428214512.551153-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, Atish Patra <Atish.Patra@wdc.com>,
 akpm@linux-foundation.org, rppt@kernel.org, 
 Anup Patel <Anup.Patel@wdc.com>, wangkefeng.wang@huawei.com,
 vitaly.wool@konsulko.com, alex@ghiti.fr, 
 greentime.hu@sifive.com, 0x7f454c46@gmail.com, chenhuang5@huawei.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Guenter Roeck <linux@roeck-us.net>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_214322_251671_11583721 
X-CRM114-Status: GOOD (  13.41  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

XIP depends on MMU, but XIP_FIXUP is used throughout the kernel in
order to avoid excessive ifdefs.  This just makes sure to always define
XIP_FIXUP, which will fix MMU=n builds.  XIP_OFFSET is used by assembly
but XIP_FIXUP is C-only, so they're split.

Fixes: 44c922572952 ("RISC-V: enable XIP")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
Changes since v1:

* Clean up the commit text.
* Define XIP_OFFSET for assembly.
---
 arch/riscv/include/asm/pgtable.h | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2f1384e14e31..9469f464e71a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -73,18 +73,10 @@
 #endif
 #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
 
+#endif
+
 #ifdef CONFIG_XIP_KERNEL
 #define XIP_OFFSET		SZ_8M
-#define XIP_FIXUP(addr) ({							\
-	uintptr_t __a = (uintptr_t)(addr);					\
-	(__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?	\
-		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
-		__a;								\
-	})
-#else
-#define XIP_FIXUP(addr)		(addr)
-#endif /* CONFIG_XIP_KERNEL */
-
 #endif
 
 #ifndef __ASSEMBLY__
@@ -101,6 +93,17 @@
 #include <asm/pgtable-32.h>
 #endif /* CONFIG_64BIT */
 
+#ifdef CONFIG_XIP_KERNEL
+#define XIP_FIXUP(addr) ({							\
+	uintptr_t __a = (uintptr_t)(addr);					\
+	(__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?	\
+		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
+		__a;								\
+	})
+#else
+#define XIP_FIXUP(addr)		(addr)
+#endif /* CONFIG_XIP_KERNEL */
+
 #ifdef CONFIG_MMU
 /* Number of entries in the page global directory */
 #define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
