Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3DBC5B572
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+IpW9SenpzcTelu3YL2b8PilCKpSfRMHosJGwVAvUbg=; b=iUmEAPagNfW/tL
	i8g6n7A0WYXZ3RDMKGmdQK/6VVkgxwQ39ES56WAg3xyUZ+4er8XS1MoeJHNXTnuams9QdqOSNecCW
	o8cfkv5a8RK5mVm3CCePn7ueCR6rbKZYpcKj/dJQos5pUjp8IKfchVt2lMideXA+OJMbkwAtZF/EG
	zNRyWGJpOjmkuI9iTKhG7af11pBLoqOr2YzKoRgcbaLa4tQ7b6RLfuOfIK6nJvB+JEo+8StAZeNp0
	vaze4IrFypqNylTksIEZT+rLqcJngr6/589BdzRvgD2CS3AJ8q+ONU/yPqhQjb7ss9dOq+XKBFyEM
	DQqRoe+WeMgGQCSwOrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtodU-0000000EMdl-32wT;
	Tue, 11 Aug 2026 15:43:28 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtodQ-0000000EMcp-3UMs
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 15:43:27 +0000
Received: from localhost.localdomain (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowAB3qEIMQ3tqSXcKBQ--.29050S2;
	Tue, 11 Aug 2026 23:43:09 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Magnus Lindholm <linmag7@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	WangYuli <wangyuli@aosc.io>,
	"Mingcong Bai" <jeffbai@aosc.io>,
	"Zhang Yuhao" <xinmu@xinmu.moe>,
	"Kexy Biscuit" <kexybiscuit@aosc.io>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] LoongArch: mm: Define DIRECT_MAP_PHYSMEM_END
Date: Tue, 11 Aug 2026 23:43:06 +0800
Message-ID: <20260811154306.3764527-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: zQCowAB3qEIMQ3tqSXcKBQ--.29050S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8Jr1UXF4kAw1fJF1xGrg_yoW5Xw1xpr
	Z8ZwsxKr43trs2k397A3W5ZryUG3ZYkr4jg3W7C343ZwsrCa48Zw4kC3yaqFykX393Z3y0
	grnIgrWkKw4jvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwcQDGp7L1Ap5wAAs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084325_249554_B747FDB8 
X-CRM114-Status: UNSURE (   8.42  )
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

get_free_mem_region() and mhp_get_pluggable_range() bound their
search to DIRECT_MAP_PHYSMEM_END.  LoongArch does not define it, so
the fallback in include/linux/mm.h applies: under
CONFIG_SPARSEMEM_VMEMMAP it is (1ULL << MAX_PHYSMEM_BITS) - 1, a
compile-time constant that does not adapt to the CPU's physical
address bits (cpu_pabits, probed from CPUCFG1).

The vmemmap window only covers physical space below 2^(cpu_pabits+1)
(VMEMMAP_SIZE), so on CPUs with fewer physical address bits than
MAX_PHYSMEM_BITS the fallback allows get_free_mem_region() to return
a ZONE_DEVICE region outside the vmemmap window;
vmemmap_populate() then wraps the memmap range around and maps it
into low memory, silently corrupting the page tables.  The same
search also picked the top-of-address-space region that crashed
memmap_init_zone_device() with amdkfd on 3C6000 in 6.16 [1];
commit 2969b42c8f99 ("LoongArch/mm: align vmemmap to maximal folio
size") keeps that region in bounds on current 3C6000 configs, but
CPUs with smaller cpu_pabits (e.g. the 2K series) are still
affected.

Define DIRECT_MAP_PHYSMEM_END as the vmemmap-covered physical
range, (1ULL << (cpu_pabits + 1)) - 1, capped at
(1ULL << MAX_PHYSMEM_BITS) - 1 under CONFIG_SPARSEMEM, mirroring
commit f3336b48cf9d ("riscv: mm: Define DIRECT_MAP_PHYSMEM_END").

[1] https://lore.kernel.org/amd-gfx/20250814032153.227285-1-jeffbai@aosc.io/

Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Changes in v2:
- Redefine DIRECT_MAP_PHYSMEM_END as the vmemmap-covered range
  (1ULL << (cpu_pabits + 1)) - 1, capped at
  (1ULL << MAX_PHYSMEM_BITS) - 1 under CONFIG_SPARSEMEM, per Huacai
  Chen's review (the previous (1ULL << cpu_pabits) - 1 wrongly
  limits CPUs with 48-bit physical addresses).
- Note that 3C6000 has 48-bit physical addresses as well.
- v1: https://lore.kernel.org/all/20260811115749.3465579-1-gaohan@iscas.ac.cn/

 arch/loongarch/include/asm/pgtable.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 223528c04d73..8395aea209b5 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -125,6 +125,14 @@ struct vm_area_struct;
 
 #endif
 
+/* Needed to limit get_free_mem_region() */
+#ifndef CONFIG_SPARSEMEM
+#define DIRECT_MAP_PHYSMEM_END ((1ULL << (cpu_pabits + 1)) - 1)
+#else
+#define DIRECT_MAP_PHYSMEM_END \
+	min((1ULL << (cpu_pabits + 1)) - 1, (1ULL << MAX_PHYSMEM_BITS) - 1)
+#endif
+
 #define ptep_get(ptep) READ_ONCE(*(ptep))
 #define pmdp_get(pmdp) READ_ONCE(*(pmdp))
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
