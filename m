Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF244CD1283
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGA437xq9kEX9q8EoGE5UD1KG700DcLA7ZNenOan194=; b=s0FCISyU9ITUPW
	myJvluiH89ja7rDpH+CBtZPVSQqmlovTmgpfDML+UdeAmFNcBDpk7F0TBlHyZQVZh1jrUYsXVoaED
	g2T2hyODFQmJeZYHh3SFmS9St9giy5whc9IPZ5bBM2YN/bqEY5wMF46I5XqRb5eUdg6Jha5Ij8xp5
	uSnTOit8MVhpYWauWlP5lSvEJJEj0tfEpVw6aW7lOzH5CGFylihs8e4KJ1EU+6jo6TcinHuVW0p+M
	G3Jz0xtGlcazhTlY8m+yRUriHhn06K+HjjKdlLrBnOhUQ8zKs35Vk+kvKG9NUJG5eMFvLd3hZQPnH
	MOWP9daV9ILiLxvumn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFj-00000007SKR-3UrB;
	Wed, 27 Mar 2024 04:51:07 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFW-00000007S7Q-0cM0
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:50:57 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6e6a1d24770so3576025a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515052; x=1712119852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHzKH2DTKf6Vc5BlA0YNBJTz56l+llAyGgYGMd65KTs=;
        b=DNEPdltqFT19c2YPEYswVK6s5rTb446YAv82B4yjd5SxAi4S5Yv/i1F1E+yUrhhm2V
         g7H5+CIaIpzo5qZjsTXQdQ1EsHiaTCZnFB6cOO0GSiqOrXAiawNdHNrG+c1aNcw86Mv3
         opFixqcuDMKgHjNDjiFKQtV0ROr/3ZRIsS+cXF7NCnmEPZQHe+WEAuLfPTAVdr+grTSD
         ulavVZAT5Ljplk1vZfXq6xX/YE9kj4syFdgd+3qhpNKt3ED+zyRkxY1XFE+zbdVbhQHw
         dIsntfrzuOqEV2y7UJ2pYQ21Sg9AKDSmKZAAGLOD5ZaAVUS1Y79kK7je2vx222mT8fgR
         gHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515052; x=1712119852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHzKH2DTKf6Vc5BlA0YNBJTz56l+llAyGgYGMd65KTs=;
        b=fivzGXeiDseAEYI4HL8GSgkQ8jFvYtv0HR7UZGCq/28O1fa5Jr2UPdDI2Y6aHvf2rN
         IpUjNP5RErjMoLf1voqMnq0MXikRzqRiZXT+cehtlSkZvsf4jc7ASSkN17tyEFyVXhRF
         BJKFr1/YqnFusxM9MqdjjXk0IFBMy0IaGYUBwfbEDIq+h2gVZtF9UznWJJGkcEZ4yjuA
         ydBKXZVQ7Nw1FIWU298FRz53k/AYD58xJiQRPUVxZ2J0XxHiosvRQxQaGldautvTzW9D
         rQ4aRI36MuKMIwgIwbSLEfQ33MZtrR1aCKQI79rD0VnU2KuQNMrrfRzmWlX13f1wjdJ6
         rpzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8ZDzxO8mEyHi/fSbqSHJrRvLhm+vkCEJDgL8feZ3U0jbsjmy828T26vt55iU6utjR5JbY/VIsYpcQaUC3Lg8euDeSu2lH1z7MjBw7jZ6P
X-Gm-Message-State: AOJu0Yxj9GBNesmS96haauPXLoe6g8X03hfCblhMVFD3F520TdbA0b0N
	5jVp2CtXxh0OCc2ABY0Tj78XnYysTWYYg71T4V/OybIJfIc7sIGewt6R98NO3l0=
X-Google-Smtp-Source: AGHT+IFNZ9hbtEq1CmgyYTIu4vUTxuEiR33JD4yc+xyNKXepJuE48avCWWfj7WZgftYdmFVpAMAO4A==
X-Received: by 2002:a9d:6e0c:0:b0:6e6:b2ed:f12a with SMTP id e12-20020a9d6e0c000000b006e6b2edf12amr1764968otr.30.1711515052040;
        Tue, 26 Mar 2024 21:50:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:51 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 07/13] riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
Date: Tue, 26 Mar 2024 21:49:48 -0700
Message-ID: <20240327045035.368512-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215054_565706_D26FF5AB 
X-CRM114-Status: GOOD (  14.14  )
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

commit 3f1e782998cd ("riscv: add ASID-based tlbflushing methods") added
calls to the sfence.vma instruction with rs2 != x0. These single-ASID
instruction variants are also affected by SiFive errata CIP-1200.

Until now, the errata workaround was not needed for the single-ASID
sfence.vma variants, because they were only used when the ASID allocator
was enabled, and the affected SiFive platforms do not support multiple
ASIDs. However, we are going to start using those sfence.vma variants
regardless of ASID support, so now we need alternatives covering them.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Rebase on Alexandre's "riscv: tlb flush improvements" series v5

 arch/riscv/include/asm/errata_list.h | 12 +++++++++++-
 arch/riscv/include/asm/tlbflush.h    | 19 ++++++++++++++++++-
 arch/riscv/mm/tlbflush.c             | 23 -----------------------
 3 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 1f2dbfb8a8bf..35ce26899960 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -43,11 +43,21 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
 	    CONFIG_ERRATA_SIFIVE_CIP_453)
 #else /* !__ASSEMBLY__ */
 
-#define ALT_FLUSH_TLB_PAGE(x)						\
+#define ALT_SFENCE_VMA_ASID(asid)					\
+asm(ALTERNATIVE("sfence.vma x0, %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
+		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
+		: : "r" (asid) : "memory")
+
+#define ALT_SFENCE_VMA_ADDR(addr)					\
 asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
 		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
 		: : "r" (addr) : "memory")
 
+#define ALT_SFENCE_VMA_ADDR_ASID(addr, asid)				\
+asm(ALTERNATIVE("sfence.vma %0, %1", "sfence.vma", SIFIVE_VENDOR_ID,	\
+		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
+		: : "r" (addr), "r" (asid) : "memory")
+
 /*
  * _val is marked as "will be overwritten", so need to set it to 0
  * in the default case.
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 4f86424b1ba5..463b615d7728 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -22,10 +22,27 @@ static inline void local_flush_tlb_all(void)
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
 }
 
+static inline void local_flush_tlb_all_asid(unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		ALT_SFENCE_VMA_ASID(asid);
+	else
+		local_flush_tlb_all();
+}
+
 /* Flush one page from local TLB */
 static inline void local_flush_tlb_page(unsigned long addr)
 {
-	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
+	ALT_SFENCE_VMA_ADDR(addr);
+}
+
+static inline void local_flush_tlb_page_asid(unsigned long addr,
+					     unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		ALT_SFENCE_VMA_ADDR_ASID(addr, asid);
+	else
+		local_flush_tlb_page(addr);
 }
 
 void flush_tlb_all(void);
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 0901aa47b58f..ad7bdcfcc219 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -7,29 +7,6 @@
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
-static inline void local_flush_tlb_all_asid(unsigned long asid)
-{
-	if (asid != FLUSH_TLB_NO_ASID)
-		__asm__ __volatile__ ("sfence.vma x0, %0"
-				:
-				: "r" (asid)
-				: "memory");
-	else
-		local_flush_tlb_all();
-}
-
-static inline void local_flush_tlb_page_asid(unsigned long addr,
-		unsigned long asid)
-{
-	if (asid != FLUSH_TLB_NO_ASID)
-		__asm__ __volatile__ ("sfence.vma %0, %1"
-				:
-				: "r" (addr), "r" (asid)
-				: "memory");
-	else
-		local_flush_tlb_page(addr);
-}
-
 /*
  * Flush entire TLB if number of entries to be flushed is greater
  * than the threshold below.
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
