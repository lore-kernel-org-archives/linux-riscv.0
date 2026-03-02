Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246DDD58E49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 02:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pS8FCbMqwz8IiBFpf8oRGr/aO9eSIJodoQdMu/wtwM=; b=BK18SOAWzUn+At
	H/crJ7Z6wqVq5TYsc8F/s7LFTP3Z7g3CgntmFecH4EFPd+vI6U4pBprHVBeWTT1Sb4U6tFhBf+xp/
	2/kAhpNY31Py6N6bOj9/JdwHurlop+pOdrEZ2fL4qYeDB0Ufll9Xfakefh23zUR4XN8E6AJz9ybT+
	yiwnUYpWjuixqcqDGjzYTrhdJVi0WQefO2EMUwN4uDmG+IJCe1eYtxt4mjgoe39PyiWqsFuDgcw2T
	VsE/NLT94a63Ik6TO2hE9wCF2sY/SpjXo2LNBcgUg5tmoRS3fUY+MVmVOT2qepjNtXictOZ2jsg1D
	f9ApLAJv3yNUcE0mb10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsv2-0000000C78I-10dt;
	Mon, 02 Mar 2026 02:22:00 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsux-0000000C76v-342N
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 02:21:57 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAD3E9s39KRp6CWmCQ--.11902S4;
	Mon, 02 Mar 2026 10:21:44 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 02 Mar 2026 10:21:31 +0800
Subject: [PATCH 2/3] riscv: mm: Extract helper mark_new_valid_map()
MIME-Version: 1.0
Message-Id: <20260302-handle-kfence-protect-spurious-fault-v1-2-25c82c879d9c@iscas.ac.cn>
References: <20260302-handle-kfence-protect-spurious-fault-v1-0-25c82c879d9c@iscas.ac.cn>
In-Reply-To: <20260302-handle-kfence-protect-spurious-fault-v1-0-25c82c879d9c@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Palmer Dabbelt <palmer@rivosinc.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAD3E9s39KRp6CWmCQ--.11902S4
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1kKF18CF4kKw1Duw15Jwb_yoW8Ar4xpF
	Wakwn5GrWrCr1fX3yavw42g3yrX34DWa4rKasIy345A3WDJFW7GrZ5KayrXr13JFW7XF17
	ua1akr98uryUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUO0PSUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_182156_170111_68918F73 
X-CRM114-Status: GOOD (  12.62  )
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

In preparation of a future patch using the same mechanism for
non-vmalloc addresses, extract the mark_new_valid_map() helper from
flush_cache_vmap().

No functional change intended.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/cacheflush.h | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index b6d1a5eb7564..8c7a0ef2635a 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -43,20 +43,23 @@ do {							\
 #ifdef CONFIG_64BIT
 extern u64 new_valid_map_cpus[NR_CPUS / sizeof(u64) + 1];
 extern char _end[];
+static inline void mark_new_valid_map(void)
+{
+	int i;
+
+	/*
+	 * We don't care if concurrently a cpu resets this value since
+	 * the only place this can happen is in handle_exception() where
+	 * an sfence.vma is emitted.
+	 */
+	for (i = 0; i < ARRAY_SIZE(new_valid_map_cpus); ++i)
+		new_valid_map_cpus[i] = -1ULL;
+}
 #define flush_cache_vmap flush_cache_vmap
 static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 {
-	if (is_vmalloc_or_module_addr((void *)start)) {
-		int i;
-
-		/*
-		 * We don't care if concurrently a cpu resets this value since
-		 * the only place this can happen is in handle_exception() where
-		 * an sfence.vma is emitted.
-		 */
-		for (i = 0; i < ARRAY_SIZE(new_valid_map_cpus); ++i)
-			new_valid_map_cpus[i] = -1ULL;
-	}
+	if (is_vmalloc_or_module_addr((void *)start))
+		mark_new_valid_map();
 }
 #define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
 #endif

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
