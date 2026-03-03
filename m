Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8637E67A69
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 05:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH3g4e5IFLoPHB2c7bHq89lgRyV/34iAgsow39NKoO0=; b=kTVO1h4PneNVgC
	uQ6cZzG2bZN8ujhrclCJMP13dZbyX/GEKiU8pIel2RCILUHHEAfT0qgGTBFbtC8A6oComzSjcMwJK
	bdS+BX1NvZtJkLyqY2g/DY1iE0jEWt6MuANfmLt76oL+xTGBOWEjnNaRQnPs4gtBXiUt7rY358mKk
	S0z9sCob11pz+MLOFz1VMJehepdNs2ROl2YQ3Vj9NlyAzbLno+tcEyEgww13yzPmTUOCCWtWFuEuW
	Q5kgXvSfLUlpzoDuvytEGONtAAHFJ3yDpBxlfRrWvKXaBEeu6+simNy2v7W+i/KFIfnOOsp7piDMe
	+1AwgvDBBvDYSgOOWkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxILS-0000000EXfW-1U4N;
	Tue, 03 Mar 2026 05:30:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxILO-0000000EXd0-0eCt
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 05:30:56 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAAHHdT9caZpAmO+CQ--.19798S6;
	Tue, 03 Mar 2026 13:30:39 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 03 Mar 2026 13:29:48 +0800
Subject: [PATCH v2 4/5] riscv: mm: Use the bitmap API for
 new_valid_map_cpus
MIME-Version: 1.0
Message-Id: <20260303-handle-kfence-protect-spurious-fault-v2-4-f80d8354d79d@iscas.ac.cn>
References: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
In-Reply-To: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Alexander Potapenko <glider@google.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Palmer Dabbelt <palmer@rivosinc.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAAHHdT9caZpAmO+CQ--.19798S6
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF45Gr4xCr45Jw4kXF1rCrg_yoW8AFWkpr
	Z8Cw1kGrWrur1xZ3y2yw4Uur4rGa4qgFySkayFk345Za1Dtr47JrZ5Ga47Jry7GFZ8XF4x
	Cw43CryruryUAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUeLvNUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_213054_564007_613A2FE1 
X-CRM114-Status: GOOD (  11.03  )
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

The bitmap was defined with incorrect size. Fix it by using the proper
bitmap API in C code. The corresponding assembly code is still okay and
remains unchanged.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/cacheflush.h | 8 +++-----
 arch/riscv/mm/init.c                | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8c7a0ef2635a..8cfe59483a8f 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -41,19 +41,17 @@ do {							\
 } while (0)
 
 #ifdef CONFIG_64BIT
-extern u64 new_valid_map_cpus[NR_CPUS / sizeof(u64) + 1];
+/* This is accessed in assembly code. cpumask_var_t would be too complex. */
+extern DECLARE_BITMAP(new_valid_map_cpus, NR_CPUS);
 extern char _end[];
 static inline void mark_new_valid_map(void)
 {
-	int i;
-
 	/*
 	 * We don't care if concurrently a cpu resets this value since
 	 * the only place this can happen is in handle_exception() where
 	 * an sfence.vma is emitted.
 	 */
-	for (i = 0; i < ARRAY_SIZE(new_valid_map_cpus); ++i)
-		new_valid_map_cpus[i] = -1ULL;
+	bitmap_fill(new_valid_map_cpus, NR_CPUS);
 }
 #define flush_cache_vmap flush_cache_vmap
 static inline void flush_cache_vmap(unsigned long start, unsigned long end)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9922c22a2a5f..a2fc70f72269 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -37,7 +37,7 @@
 
 #include "../kernel/head.h"
 
-u64 new_valid_map_cpus[NR_CPUS / sizeof(u64) + 1];
+DECLARE_BITMAP(new_valid_map_cpus, NR_CPUS);
 
 struct kernel_mapping kernel_map __ro_after_init;
 EXPORT_SYMBOL(kernel_map);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
