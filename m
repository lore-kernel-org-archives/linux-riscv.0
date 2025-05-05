Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CD2C3ABB6
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 00:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wb3HFDQsKpn8ZRgi7zHzPt9muIDiCoGf7MDhyKbHgIc=; b=gwZJoy2qPVXt2P
	el0OihOL8S6Klcr9NgGLMOpm96FbFyPz5UZhPXOB28kdwE+FAMCDwWVpVTamN3Y2kZvkrGujp2k0B
	hCJMCjnwRGmEnp58Nvz69mAdUk8p0iJAtaLYLWFV6H93eJc7QGvfo9z1DNcseGe0/fB0nNLZETMAA
	kuBP8PQDRWhbGdeeXyAaxZe9DWcSnoDX/Jnksu2uEUOvt3HAEqZZ3Yt9pM5xRJAmyYCambtqgWSpA
	HfpnRku5fP/7EUJG7tzMDi2ygTI/mi1H86zu9+U8XAU8bOewQOd0AtOhIjSutNsps04C/mE3OxOMH
	GcHSIKNWq+wQPTzSYlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6PM-00000009LoV-27DA;
	Tue, 06 May 2025 00:43:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Th-00000008pGJ-2pRT
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 22:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54438A4D01C;
	Mon,  5 May 2025 22:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4C2C4CEE4;
	Mon,  5 May 2025 22:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484800;
	bh=e9spjJsqUydfwBBLOte4a0ZYV/GceUeeRW1+zNfmVSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M0S3FeCZMC9jUXm7PHTC8buiS9ZZ/ZmyNI4X0PLITEabqoygCxGV+k7UY3yxYfK/b
	 YRP2b4lVdwRk3jTI8iYUCt5hkCj2BG6it60U73rViLzVV4fkk257rssnr2kcxpYJl9
	 PMf1AZbyKofp3RPDjeWX8VF1lxnWu7CZsUXs42CTkPN4TPQ4vi1U0H+VcLP/MFgUaa
	 dtc6zEj5SoSCavoEMBcuSLeUv52SsxKaooEmU6KGYTDCSNw/Ihi2OXiM1iYiqKNMWe
	 kIsRCJT7EQvOLXf9pPLPohHEkMO5UvHhBZV7MR3U+yAIwZ41qYuxZe3bibvNlg0OaF
	 bF0edC1VWJzPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	arnd@arndb.de,
	namcao@linutronix.de,
	bjorn@rivosinc.com,
	vincenzo.frascino@arm.com,
	stuart.menefy@codasip.com,
	luxu.kernel@bytedance.com,
	david@redhat.com,
	libang.li@antgroup.com,
	abrestic@rivosinc.com,
	anshuman.khandual@arm.com,
	yongxuan.wang@sifive.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 021/486] riscv: Allow NOMMU kernels to access all of RAM
Date: Mon,  5 May 2025 18:31:37 -0400
Message-Id: <20250505223922.2682012-21-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154001_864348_6AEFE573 
X-CRM114-Status: GOOD (  12.54  )
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

From: Samuel Holland <samuel.holland@sifive.com>

[ Upstream commit 2c0391b29b27f315c1b4c29ffde66f50b29fab99 ]

NOMMU kernels currently cannot access memory below the kernel link
address. Remove this restriction by setting PAGE_OFFSET to the actual
start of RAM, as determined from the devicetree. The kernel link address
must be a constant, so keep using CONFIG_PAGE_OFFSET for that purpose.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Jesse Taube <mr.bossman075@gmail.com>
Link: https://lore.kernel.org/r/20241026171441.3047904-3-samuel.holland@sifive.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/page.h    | 12 ++++--------
 arch/riscv/include/asm/pgtable.h |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index febf820d50583..e8beadc2bffda 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -26,12 +26,9 @@
  * When not using MMU this corresponds to the first free page in
  * physical memory (aligned on a page boundary).
  */
-#ifdef CONFIG_64BIT
 #ifdef CONFIG_MMU
+#ifdef CONFIG_64BIT
 #define PAGE_OFFSET		kernel_map.page_offset
-#else
-#define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
-#endif
 /*
  * By default, CONFIG_PAGE_OFFSET value corresponds to SV57 address space so
  * define the PAGE_OFFSET value for SV48 and SV39.
@@ -41,6 +38,9 @@
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
+#else
+#define PAGE_OFFSET		((unsigned long)phys_ram_base)
+#endif /* CONFIG_MMU */
 
 #ifndef __ASSEMBLY__
 
@@ -97,11 +97,7 @@ typedef struct page *pgtable_t;
 #define MIN_MEMBLOCK_ADDR      0
 #endif
 
-#ifdef CONFIG_MMU
 #define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
-#else
-#define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
-#endif /* CONFIG_MMU */
 
 struct kernel_mapping {
 	unsigned long page_offset;
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c0866ada5bbc4..479550cdb440f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -12,7 +12,7 @@
 #include <asm/pgtable-bits.h>
 
 #ifndef CONFIG_MMU
-#define KERNEL_LINK_ADDR	PAGE_OFFSET
+#define KERNEL_LINK_ADDR	_AC(CONFIG_PAGE_OFFSET, UL)
 #define KERN_VIRT_SIZE		(UL(-1))
 #else
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
