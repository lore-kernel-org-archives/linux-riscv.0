Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14452C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UsVvln0BJaQyNEb3MxcDxMpCpQaIqmwl+4n1MBOGcs0=; b=CSDkbgRD+oBmOL
	Cdp5I2t/eaZTm20CPSqOjEB2+ZT38D/wx82gqgiw5xjVf41fQb2YX47NcJpnBcyie2wAM7gkUu9dK
	uu83ygL57fVz8ByB7nlx46nGl1BX/e9d2dXJJ4C/5/VVmSqiMDxJJItKzw90hA9AYu5+sFbVkRrHU
	lkc2WnED/FD1I7JPazhfLDdhFUiZed22TDWWVT7zG77/KcPP2hMZ5FMw7DpBV/5kRqdH+F2dOq2f/
	NwEqceWMRe+y9SInajz1qM+RpOFHOq7GFqUzAS9gZVGDCKd8hCb14uMe3gbsk5TbyKM3WfZxfPH0C
	YbzR8LIvDMAsywQve0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohWcr-00FepO-7r; Sun, 09 Oct 2022 13:45:53 +0000
Received: from m12-16.163.com ([220.181.12.16])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohWcn-00Fenn-8p
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 13:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=y0Va6
	t7IEzPneZZtRuTxgWXS6wlUeWN5JX4PCoeBRrs=; b=XXMM4mRU1nmydeADv4Tpq
	R8j78WlAfg3csIkBDlNUklZ+KXjVHjZJKdujhc2V9QI/82ab+Px4bdlrwV0GmiDi
	MYyg2C8LPCJVyzXAxcv+PUJ4qHKTHpIAchqkXz1ty9J9VngaJ2Vaf4H36INHo1c0
	TNK8HIMTeLQcvsmmVZd2ys=
Received: from whoami-VirtualBox.. (unknown [223.72.43.15])
	by smtp12 (Coremail) with SMTP id EMCowAD3G8Rh0EJjxxnCCw--.433S2;
	Sun, 09 Oct 2022 21:45:08 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Conor.Dooley@microchip.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexandre.ghiti@canonical.com,
	guoren@kernel.org,
	akpm@linux-foundation.org,
	tongtiangen@huawei.com,
	panqinglin2020@iscas.ac.cn,
	maobibo@loongson.cn
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	falcon@tinylab.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v3] riscv: support update_mmu_tlb()
Date: Sun,  9 Oct 2022 21:45:03 +0800
Message-Id: <20221009134503.18783-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CM-TRANSID: EMCowAD3G8Rh0EJjxxnCCw--.433S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trW7Cw17AFWkAr4fCr1UGFg_yoW8KFWfpF
	ZrCF1kGrZrKw1IkFWxAw17ur48X3ykKa4Utryayr98CanFgr1vyFZ5Ka95Zr18CFZag3Wx
	uFWYgr15u398Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUwTm3UUUUU=
X-Originating-IP: [223.72.43.15]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiZQuVeF8ZU3hMLwABsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_064549_788910_631CA318 
X-CRM114-Status: GOOD (  11.49  )
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

Add macro definition to support update_mmu_tlb() for riscv,
this function is from commit:7df676974359 ("mm/memory.c:Update
local TLB if PTE entry exists").

update_mmu_tlb() is used when a thread notice that other cpu thread
has handled the fault and changed the PTE. For MIPS, it's worth to
do that,this cpu thread will trap in tlb fault again otherwise.

For RISCV, it's also better to flush local tlb than do nothing in
update_mmu_tlb(). There are two kinds of page fault that have
update_mmu_tlb() inside:

1.page fault which PTE is NOT none, only protection check error,
like write protection fault. If updata_mmu_tlb() is empty, after
finsh page fault this time and re-execute, cpu will find address
but protection checked error in tlb again. So this will cause
another page fault. PTE in memory is good now,so update_mmu_cache()
in handle_pte_fault() will be executed. If updata_mmu_tlb() is not
empty flush local tlb, cpu won't find this address in tlb next time,
and get entry in physical memory, so it won't cause another page
fault.

2.page fault which PTE is none or swapped.
For this case, this cpu thread won't cause another page fault,cpu
will have tlb miss when re-execute, and get entry in memory
directly. But "set pte in phycial memory and flush local tlb" is
pratice in Linux, it's better to flush local tlb if it find entry
in phycial memory has changed.

Maybe it's same for other ARCH which can't detect PTE changed and
update it in local tlb automatically.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
v2 -> v3:
Explain why it should do this.Thanks for Conor Dooley's Advice.

v1 -> v2:
Change the format with the help from Andrew Jones and Conor Dooley
 
 arch/riscv/include/asm/pgtable.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ec936910a96..c61ae83aadee 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -418,6 +418,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	local_flush_tlb_page(address);
 }
 
+#define __HAVE_ARCH_UPDATE_MMU_TLB
+#define update_mmu_tlb update_mmu_cache
+
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
