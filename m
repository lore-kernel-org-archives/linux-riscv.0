Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=227LzL+gE9LPjXBnr0bB1+jy+1jXq4yuT1sgeTEiX80=; b=OI3v0ovFTM4SdG
	gBWkvf2BQPAyTmMxxR7PYARTQVD2HvV4ixJ+R58vyCcC+SFqW/XHX8fv1s6PnEhAxF0OANrZ695uG
	3ZASPnN2Br2rndTbgUY21+63j1BSMRBcZvZytvlZEQ+F9Ovok012TM7Af4jD4x1TKVJudjWYzE4f/
	csPDc1y35xcc8vSr3dzqGs8gy+OwUGj4XbCw+6GrdNPSzFB/Rd013rs4BHrKuzFXOZFeY5aHZZ55b
	L+RGiph/9dAh3E3P6Q2syACNGQJIGTb6kfDT9T+yVk4Z6YUNeV01l0+1zx99sI1aEeRdE91RChC65
	INhJRMZldZyMeDbwcklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAS8v-009QuY-Th; Thu, 20 Jan 2022 07:46:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAS3V-009O8s-MK; Thu, 20 Jan 2022 07:40:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A81F616EB;
 Thu, 20 Jan 2022 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91272C340E7;
 Thu, 20 Jan 2022 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642664423;
 bh=+foGi24mAAkXv8HxHMW+tCVoz4WSBNmzOsAdyp+IN6s=;
 h=From:To:Cc:Subject:Date:From;
 b=lom4qx8Te+fvkiYhBhSctO4VuKi6tI0DbDmkHwpzmV//j2i2ErVO3t7aDskslPgRk
 LXTRb5IbUV0LggS3rARH7FiiY0sWWAT9q10+8hsW1WjRumx52fSr5qZJKdbQfdUUS7
 kAQvkC0DVHon+jSt2vPO8VA514PVFxa+kNydggWhJNkc43VoOnglGKDpg5szAiFQur
 prLryGZqMuK0lxnZOklFZOwDE8CIEOpqR8J1HPksfNnG6dbefol4ArvNWMQMcXHeyO
 Yxw7TwdmL7JKjLzKI8rr/xbpzXgy8JvrhlnHCqbqMlk/yMvPXvVNEF2wZN8MMCH0DO
 cEGKyYdX/LGLg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Date: Thu, 20 Jan 2022 15:39:00 +0800
Message-Id: <20220120073911.99857-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_234025_851427_CF167A66 
X-CRM114-Status: GOOD (  11.24  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Make TASK_SIZE from const to dynamic detect TIF_32BIT flag
function. Refer to arm64 to implement DEFAULT_MAP_WINDOW_64 for
efi-stub.

Limit 32-bit compatible process in 0-2GB virtual address range
(which is enough for real scenarios), because it could avoid
address sign extend problem when 32-bit enter 64-bit and ease
software design.

The standard 32-bit TASK_SIZE is 0x9dc00000:FIXADDR_START, and
compared to a compatible 32-bit, it increases 476MB for the
application's virtual address.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/pgtable.h        | 11 ++++++++++-
 arch/riscv/include/asm/processor.h      |  6 ++++++
 drivers/firmware/efi/libstub/efi-stub.c |  2 +-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 67f687aee673..e0add598e66a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -669,7 +669,16 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
  */
 #ifdef CONFIG_64BIT
-#define TASK_SIZE (PGDIR_SIZE * PTRS_PER_PGD / 2)
+#define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
+
+#ifdef CONFIG_COMPAT
+#define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
+#define TASK_SIZE	(test_thread_flag(TIF_32BIT) ? \
+			 TASK_SIZE_32 : TASK_SIZE_64)
+#else
+#define TASK_SIZE	TASK_SIZE_64
+#endif
+
 #else
 #define TASK_SIZE FIXADDR_START
 #endif
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0749924d9e55..8649436b8fcf 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -61,6 +61,12 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 extern void start_thread(struct pt_regs *regs,
 			unsigned long pc, unsigned long sp);
 
+#ifdef CONFIG_COMPAT
+#define DEFAULT_MAP_WINDOW_64 TASK_SIZE_64
+#else
+#define DEFAULT_MAP_WINDOW_64 TASK_SIZE
+#endif
+
 /* Free all resources held by a thread. */
 static inline void release_thread(struct task_struct *dead_task)
 {
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index e87e7f1b1a33..f57f85646a45 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -38,7 +38,7 @@
 #define EFI_RT_VIRTUAL_BASE	SZ_512M
 #define EFI_RT_VIRTUAL_SIZE	SZ_512M
 
-#ifdef CONFIG_ARM64
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 # define EFI_RT_VIRTUAL_LIMIT	DEFAULT_MAP_WINDOW_64
 #else
 # define EFI_RT_VIRTUAL_LIMIT	TASK_SIZE
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
