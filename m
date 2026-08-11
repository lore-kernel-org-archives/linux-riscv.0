Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989A6C5B56A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fyLOspcGiPW95AeRvlc9O1SxI582M4MIbzc/AAw7ulk=; b=xnugTtWjOoY5hV
	zUl6oqObo+crX90JlHbrMjkCSYpeHsPEpm7V9bbWDHLCAhgVnySL/0pV/0JKDjRmFNVzEV+Y8IsP1
	jvpJ+oXgTQ3NPp9+9hCNAzWODlJeNNbcY/X3qFsu0iSshmJrXP9zImHhBj4e75BFoJDXFTg/roSvM
	QKi3trhHlWodHaDW+0dJtx9V1LXZ5Xk/Ws0fZAdsCSot/XpNbxP0KdH5GN9v1JiIHVPTcfxHne3qB
	T77Z4VDPwekKIIvAGVhIbETBO1LcnKxyuGGzpFn+RA0+NYHPcZa4QWXQp0l4qmFm7/aqY8o1pSt11
	L7jxOYKBDHzIkomBQgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtl88-0000000DyCR-2uhG;
	Tue, 11 Aug 2026 11:58:52 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtl84-0000000DyC1-1JYd
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 11:58:51 +0000
Received: from localhost.localdomain (unknown [223.166.93.127])
	by APP-03 (Coremail) with SMTP id rQCowAAXHz1XDntqZQatBA--.2222S2;
	Tue, 11 Aug 2026 19:58:32 +0800 (CST)
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
Subject: [PATCH] LoongArch: mm: Define DIRECT_MAP_PHYSMEM_END
Date: Tue, 11 Aug 2026 19:57:49 +0800
Message-ID: <20260811115749.3465579-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAXHz1XDntqZQatBA--.2222S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8Jr1UXFy5JrykAr18Zrb_yoW5GFyrpr
	9YyanxGr47KrZ2krWxZ3WUXFy8Wa1vkr42g3WUCry7AanxAF18Zr1vqFWaqFyvq397ua4F
	gFnIqrW5Kw4UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwUQDGp6vVv3bQAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_045848_719734_C4B93643 
X-CRM114-Status: GOOD (  10.86  )
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
compile-time constant that does not adapt to the physical address
bits of the CPU (cpu_pabits, probed from CPUCFG1: 48 on
3A5000/3A6000, 47 on 3C6000, 40 on the 2K series).

The vmemmap window only covers physical space below 2^(cpu_pabits+1)
(VMEMMAP_SIZE), so on CPUs with fewer than 48 physical address bits
get_free_mem_region() may hand ZONE_DEVICE a region with no struct
page backing:

- On the 2K series the region returned at the top of the 48-bit
  physical space is outside the vmemmap window; vmemmap_populate()
  wraps the range around and maps it into low memory, silently
  corrupting the page tables.
- On 3C6000 the vmemmap range of the region's last section used to
  end exactly at 2^64 and wrap to 0, leaving vmemmap_populate() with
  nothing to map, so memmap_init_zone_device() faulted while writing
  struct page (reported with amdkfd on 6.16 [1]).  Commit 2969b42c8f99
  ("LoongArch/mm: align vmemmap to maximal folio size") moved the
  vmemmap base down by one PMD, which keeps that section in bounds on
  current 3C6000 configs, but the 2K series is still affected and the
  3C6000 case only holds for the current vmemmap layout.

Define DIRECT_MAP_PHYSMEM_END as (1ULL << cpu_pabits) - 1 so that
both searches stay within the vmemmap-covered physical space,
mirroring commit f3336b48cf9d ("riscv: mm: Define
DIRECT_MAP_PHYSMEM_END").

[1] https://lore.kernel.org/amd-gfx/20250814032153.227285-1-jeffbai@aosc.io/

Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/loongarch/include/asm/pgtable.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 223528c04d73..244931e4bc58 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -125,6 +125,13 @@ struct vm_area_struct;
 
 #endif
 
+/* Needed to limit get_free_mem_region() */
+#if defined(CONFIG_FLATMEM) || defined(CONFIG_SPARSEMEM_VMEMMAP)
+#define DIRECT_MAP_PHYSMEM_END ((1ULL << cpu_pabits) - 1)
+#elif defined(CONFIG_SPARSEMEM)
+/* DIRECT_MAP_PHYSMEM_END is not limited by VA space assignment in this case */
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
