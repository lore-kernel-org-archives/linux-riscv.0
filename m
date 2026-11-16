Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0D4606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 02:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HI/VQOOS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FuG0hEyyeK7H0068QkM8NcswOXdW3WbqMOfafgxjcvM=; b=HI/VQOOSVM05CKO5x+jp3EOGd9
	t/N5b+Ka1JiJJWGh16tvwudkcugJpoVnI2iho9T1NMeDg/YpPPjDLTu4tBufshp83xY+sZazAPl4Y
	zUmy4wTUbUNhj52W89QcNEjINuoDWbHI20FyXkf6/XUiZAIf5qI2lhZlm7IGt2JGeD1ZPaHAqcBVY
	jjbQIoBg+lG+1vsxwAYis2nX60OLlT6Ui+EGwMFh5YngMkNfb4oBLq3UDvOrRnk/ud1egde21svq1
	89OrjooFyiiVGyFvLS6etqBEU/MK7S2RO2VeegH2dBGS/M0SlwsPbyYYqmEtQnjhztcSXzTHQXl3s
	Aaw6LypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmOf-00000000vwH-3qzU;
	Mon, 16 Nov 2026 02:24:41 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmOd-00000000vvY-1H09
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 02:24:40 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmOX-004BHZ-Ne;
	Sun, 15 Nov 2026 21:24:33 -0500
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Waterman <andrew@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2] riscv: mm: Skip the icache flush for special PTEs
Date: Sun, 15 Nov 2026 21:24:33 -0500
Message-ID: <20261116022433.49952-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_182439_342363_C1B76179 
X-CRM114-Status: GOOD (  13.52  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An executable mmap() of memory outside RAM through remap_pfn_range() or
vmf_insert_pfn(), such as /dev/mem or a PCI BAR's sysfs resource file,
oopses in flush_icache_pte() with the page table lock held, and the task
never exits. With FLATMEM the kernel instead sets a bit in whatever
memory lies past mem_map.

__set_pte_at() calls flush_icache_pte() for every present executable
PTE, and flush_icache_pte() records the flush in the folio of
pte_page(). A special PTE may have no struct page behind it.

Skip the flush for special PTEs, as arm64 does since
commit 71fdb6bf61bf ("arm64: Do not synchronise I and D caches for
special ptes").

Reproduced on QEMU virt with the riscv64 defconfig by mapping the PCIe
ECAM window from /dev/mem with PROT_EXEC; the patched kernel maps it.

Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Changes in v2:
    - Reworded the source comment as suggested by Jisheng Zhang.
    - Shortened the commit message.
    - Rebased on v7.4-rc3.
    
    v1: https://lore.kernel.org/all/20261017013634.792220-1-nickolai@csail.mit.edu/
    
    This patch was prepared with the help of an AI coding assistant.
    
    Reproducer (QEMU virt, riscv64 defconfig, run as /init with /dev/mem
    c 1 1 in the initramfs; 0x30000000 is the PCIe ECAM window, any non-RAM
    range does):
    
      riscv64-linux-gnu-gcc -O2 -static -o test exec_mmio_mmap.c
      qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic \
          -kernel Image -initrd initramfs.cpio -append "console=ttyS0 rdinit=/init"
    
      unpatched: Unable to handle kernel paging request at virtual address
                 ff1c000000c00008, epc : flush_icache_pte+0x5c/0xa2,
                 ra : do_remap_pfn_range+0x284/0x3e6; the task never exits
      patched:   mapped at 0x7fff8418b000, first word 0x00081b36
    
      #include <fcntl.h>
      #include <stdint.h>
      #include <stdio.h>
      #include <stdlib.h>
      #include <sys/mman.h>
      #include <unistd.h>
    
      int main(int argc, char **argv)
      {
      	unsigned long phys = argc > 1 ? strtoul(argv[1], NULL, 0) : 0x30000000UL;
      	volatile uint32_t *p;
      	int fd;
    
      	fd = open("/dev/mem", O_RDONLY | O_SYNC);
      	if (fd < 0) {
      		perror("open /dev/mem");
      		return 2;
      	}
      	printf("mmap(/dev/mem, phys 0x%lx, PROT_READ|PROT_EXEC, MAP_SHARED)\n", phys);
      	fflush(stdout);
      	p = mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_SHARED, fd, phys);
      	if (p == MAP_FAILED) {
      		perror("mmap");
      		return 2;
      	}
      	printf("mapped at %p, first word 0x%08x\n", p, p[0]);
      	return 0;
      }

 arch/riscv/include/asm/pgtable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2ebd5fa5adc5..48eeeac1019b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -624,7 +624,11 @@ void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
 static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 {
-	if (pte_present(pteval) && pte_exec(pteval))
+	/*
+	 * Special PTE mappings are not intended to be executable and may not
+	 * even have an associated struct page.
+	 */
+	if (pte_present(pteval) && pte_exec(pteval) && !pte_special(pteval))
 		flush_icache_pte(mm, pteval);
 
 	set_pte(ptep, pteval);

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
