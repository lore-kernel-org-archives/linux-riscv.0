Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51378C44507
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nc6YoWrs5r9nVU4c5wpA7vny0/my0go4g0WKGDIv7k=; b=TF4im30Z/TXEZQ
	RTtdfayEyFTq1Aps0jmaSbXZdQjc3UAbEQ0hYTZswZXQq5s5/YqgUQNpLFb+vObGe0v8TQk/4RKYY
	X12RfVTpLyIcZGN+BQqlXTVXs/dPcKSm7RL+DeCYnH0OPsXU1SciLnZ90ixxaomOT0noDi+6mrvnE
	ZE6aSE9FAu6zqX1jUSKkHxdfsJbZpqjjX5WfzynAvlbVRzWLpvSQ8E3IM5rzibf+4zgNksC43gW6Q
	Du81+5oVlCd7RGMGskX2+r496TxddtvUiVoJt6Fiv/RR8lOtpd6bigNE+pA4rMFuh8Y/7wsZIMY+K
	UdA7fcQQW59LirET95Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9xO-00000008DOE-2jzn;
	Mon, 13 Jul 2026 06:15:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9xJ-00000008DLo-1C59
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 06:15:56 +0000
Received: from [127.0.0.2] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHF86CglRqddeRFw--.29971S3;
	Mon, 13 Jul 2026 14:15:31 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 13 Jul 2026 14:15:20 +0800
Subject: [PATCH v6 1/2] riscv: mm: Make mark_new_valid_map() stuff depend
 on 64BIT && MMU
MIME-Version: 1.0
Message-Id: <20260713-mark-after-vmemmap-populate-v6-1-b945ceba29d4@iscas.ac.cn>
References: <20260713-mark-after-vmemmap-populate-v6-0-b945ceba29d4@iscas.ac.cn>
In-Reply-To: <20260713-mark-after-vmemmap-populate-v6-0-b945ceba29d4@iscas.ac.cn>
To: Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: rQCowAAHF86CglRqddeRFw--.29971S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJr15ZrWUXF4rXw18uF1DAwb_yoW8tF13pF
	sFkrn5Gryrur1xZ3y2vr1DWrW3Kw1qga4aq3WDur15Xa1qvr48Jrn5Kry7AryDXFWjgFWF
	kFyxCryFkw1jy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7VUjhFxUUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_231553_713900_085CF600 
X-CRM114-Status: GOOD (  11.97  )
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

None of the code relating to mark_new_valid_map() does anything useful
without CONFIG_64BIT=y && CONFIG_MMU=y, because the
new_valid_map_cpus_check code is only used if CONFIG_64BIT, and the
exception codes checked there can only happen with CONFIG_MMU=y.

Therefore, make these conditional on CONFIG_64BIT=y && CONFIG_MMU=y to
simplify programming, since we do not have to handle CONFIG_MMU=n when
changing this code in the future. This also removes some unused code on
the entry path for CONFIG_MMU=n.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/cacheflush.h | 2 +-
 arch/riscv/kernel/entry.S           | 2 +-
 arch/riscv/mm/init.c                | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8cfe59483a8f..58e787fad029 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -40,7 +40,7 @@ do {							\
 		flush_icache_mm(vma->vm_mm, 0);		\
 } while (0)
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
 /* This is accessed in assembly code. cpumask_var_t would be too complex. */
 extern DECLARE_BITMAP(new_valid_map_cpus, NR_CPUS);
 extern char _end[];
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index c6988983cdf7..3ae498779adf 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -137,7 +137,7 @@ SYM_CODE_START(handle_exception)
 .Lrestore_kernel_tpsp:
 	csrr tp, CSR_SCRATCH
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
 	/*
 	 * The RISC-V kernel does not flush TLBs on all CPUS after each new
 	 * vmalloc mapping or kfence_unprotect(), which may result in
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b4d1..3e450890be07 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -37,7 +37,9 @@
 
 #include "../kernel/head.h"
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
 DECLARE_BITMAP(new_valid_map_cpus, NR_CPUS);
+#endif
 
 struct kernel_mapping kernel_map __ro_after_init;
 EXPORT_SYMBOL(kernel_map);

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
