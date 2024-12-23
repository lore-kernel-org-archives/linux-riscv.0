Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E602BE7718D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 09:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLF1bvpK+f+aX3mGJ5gDYGE+kAdA6sGstjzK1JWKAas=; b=2ag9fXaxpF+RSH
	B+AXhqa2N55cQrnxFcVrihAF06qJbA/FROvsbp+iqKZwOa3JFcFIyFwxtQAH+KlDdXzAseI18pA8W
	+IGG80j4aM6dWjhwsbl7/RIyQO9Tqh1PWs1CAlfmmqCPwwBcKgxQAskYKRKWf501Q33tUQg2zcAoD
	TZSAbilEjMao3c0oNxZLMmCBXghmD1QN2CdDN9uDfE/zdzWGzfm2e6u/LO32FUqT0kFKrVzocjB2X
	XtPSDxD3pZlVxPEpC8XwpioUSIm1uzKjxLch6BYJd9qdZOBzkd7V0t5QG8JotFjUfuAowmQ1cjYki
	njk05wzgP0JLQipWSxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfDa-00000009k3s-2QCq;
	Mon, 23 Dec 2024 09:59:18 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPf0k-00000009hWr-1spq
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 09:46:04 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-728e729562fso3164700b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947162; x=1735551962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=hTtSLAP5sAPY0TF89JKr3Rb2m5Xr6h4ihoj9/EC79sNLnuyRgZkm4qjmVV8G/3rG4E
         8so3/CdL78cmmycHIETwLNKHqdlbVS22UFokPJWJPytUII3Nn3BtdsZVJHVRpZoBgfL7
         a22akR0Ll/MlRBmQZFibM8Aw7lsgF5BQbb4n2CS6QwKAG2RHk5IneY7Im1bdIUanhrGX
         Ndvw+mUpt/NHZV1Nkw/CbqasqywKqC29jcGP57q7FlJGMbxGBCAse54oMiYST5PL+zbD
         Dkdr+oA7FiEUeYce51l0yaMn98ow0mLH4wvphuDoTaoNBHQlBy+YXAY6taBBi9BkcbHx
         hYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947162; x=1735551962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=k8Q26GZFrD9AfOLx5w+alZhTUELfuGQ4GxzysXE1ANSM77PdOfFdjICc8P8ftGGhRT
         A9tmath4ACX4k5I7ZZEts6BbI145MvRAUxjVot2x/4j+lOw7mJ9tiLsWUmOA92VbdRGm
         SjUUkDuOtf69pnG2gbdv+C1Txs1JAxO1V0pdH3bbKOGplWekq3WKIEYAmR0B05Yz0H2N
         J8JQQiknGDSXHDvutAbMr2ZCLjGTt2gXCw8WO6GpT4wsMh2naP3EqK0sS7FoMbTTLUu9
         f8cmCH/4up/9K5EGZAR00YcGYAtB5p/yRUPxAilCF1va8mQXuN8IoUU5xJ9uBBDcbOFz
         TiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaLFIG6BvoYiLMbvNg5LUz7U7Ds7AN9pZ3KnxmhMkAldnXWGOB2xeFRmLcm35gdnPSRd4r0UGalOjdQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylpGgFnXHReqWflKNVcNw80ThL3Ghxp2UAhl/S2itxmXA/AkLn
	/z6hb1rwaWFrLWoxbtG4qCDCOcs7VUcHuuUyyWPNJ16Nw9z75JuEA0dYalMqjCQ=
X-Gm-Gg: ASbGnctKOGAmoBkjNwV7tlOc74mUSismS9onvqqcg26pWZAGbC5ndJ0DNPJZaZZG82W
	1nSApXF/0ECNjfmkUOFP4M/2w7XRMV/0bhGQ5do0QksoCE7xb9pW775UahMBTdtExR/T1sNLJ88
	NuiJDT4L6ZwDzHC/Btg+H+6g/F7VGaig+EhHHcEhi1E6zP7MayqjwtoyMS0kJ+o7f721lLNs1zJ
	fa7HHhMiNoeuHQVDtS/0mzmbqs5Xsz1/Ju23UtiUrEC1L8UGJfwyKEyMxOgVhmD/tAyfWMMMIqJ
	eBdKrNv0zrtQ/go4F57BNg==
X-Google-Smtp-Source: AGHT+IEiKQiNoCztX+vEmXJ78+SVJHcoRjQcReSYKDpgexw8hG6RQW+fGx0o5GN+OmUz8JwpFgmgkg==
X-Received: by 2002:a05:6a20:c88f:b0:1d5:10d6:92b9 with SMTP id adf61e73a8af0-1e5e07f88demr18787949637.30.1734947161832;
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 14/17] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 23 Dec 2024 17:41:00 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014602_487226_34C799BC 
X-CRM114-Status: UNSURE (   8.24  )
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

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
