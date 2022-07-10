Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097F5C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqRhqI1SM9q0bmqjDO7/SQvWhoKDusZ+uXWlTrkLYZE=; b=JKDNuk4bdCGvaO
	7/rmGO7vHX9vhJ/Is/0YD8hMNbsZtrjcKmXXah7Pl0IZNwASbY0HjseIX2rA0BdQzEY9wIKSfoiw8
	wL1VVCcNGnkA5xkPvQIs9/KZFRcK+Hl/kgy1J4sJhcVnlIBOvkgSt1VYr13kh0WPvrN7G79HOlzlT
	uPAYWQUJtWXTcuDhk/S+qEjbQCTRO8L9+b+gOjka/g9xnwF+kibXBF9JOkqNAdw7XXzaWA6T3YCb1
	Buobl4b0LXh9Fw7bAsaRDkJ0lIy9rjxbNDlpkrOqxJ6Y0+NDw2dg+Ix3pq6wTxT2a0j4M33IbMcly
	z2r4uInePPhiF1nK35eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oARoT-00B42Q-Tb; Sun, 10 Jul 2022 07:57:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oARoP-00B3zN-Nz
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 07:57:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24B316103E;
	Sun, 10 Jul 2022 07:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64041C3411E;
	Sun, 10 Jul 2022 07:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657439824;
	bh=vk0E5ZJUGxY4hO6kjZ0EdFhdR0BdXENDAOcnnqkgefQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+r0GSHezvk1edyrDoGjjXbv+urrYUBpuZWItnAoABwzyG16lFeWxHd8h8NUmyFfG
	 hPFM/yvuD+j4TV7skOzsArEvh9GbXkz140d0BIkUWtKhYf5++wnByFjaWye5A14XZX
	 9bmpMnV3qpdy5Bfga8vEhyQFvObcl7U9pwMEBVi1nd52wvAFQRcDG8SM0ACIBVmc7Y
	 LJ7poVmOSORxNhBpVWkPn7T+EanJTTKbJdC7CL7K5ar0Wt/NVOU6Jaxn0YW3F72PO1
	 uocToueRRB6uhrOvoArwQYznkGG/kw/0Ppsk5r7dOoJ3gWAJ8y86NuyHs5gQbkIpDx
	 S4S1qwwnMsmvw==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH V2 4/4] riscv: Change rv32p34 to rv32p31 for svpbmt
Date: Sun, 10 Jul 2022 03:56:44 -0400
Message-Id: <20220710075644.738455-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220710075644.738455-1-guoren@kernel.org>
References: <20220710075644.738455-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_005705_850008_EFE4A689 
X-CRM114-Status: GOOD (  12.29  )
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

Decrease rv32 16GB physical address range to 2GB (rv32p34 -> rv32p31)
for svpbmt support. Svpbmt & napot could directly occupy rv32 PPN
highest bits. The patch wouldn't reduce the functionality of rv32-Linux,
because rv32-Linux only supports 1GB direct mapping (0xc0000000 -
0xffffffff). So 2GB physical address range is enough for current
rv32-Linux (1GB for memory, 1GB for IO).

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                  | 2 +-
 arch/riscv/include/asm/pgtable-32.h | 4 ++--
 arch/riscv/include/asm/sparsemem.h  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 32ffef9f6e5b..0dc1509e7e1c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -360,7 +360,7 @@ config RISCV_ISA_C
 
 config RISCV_ISA_SVPBMT
 	bool "SVPBMT extension support"
-	depends on 64BIT && MMU
+	depends on MMU
 	select RISCV_ALTERNATIVE
 	default y
 	help
diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 63b023bd4845..aa94f6487670 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -13,8 +13,8 @@
 #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
 #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
 
-#define MAX_POSSIBLE_PHYSMEM_BITS 34
+#define MAX_POSSIBLE_PHYSMEM_BITS 31
 
-#define _PAGE_PFN_MASK  GENMASK(31, 10)
+#define _PAGE_PFN_MASK  GENMASK(28, 10)
 
 #endif /* _ASM_RISCV_PGTABLE_32_H */
diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
index 63acaecc3374..1fc64bb65996 100644
--- a/arch/riscv/include/asm/sparsemem.h
+++ b/arch/riscv/include/asm/sparsemem.h
@@ -7,7 +7,7 @@
 #ifdef CONFIG_64BIT
 #define MAX_PHYSMEM_BITS	56
 #else
-#define MAX_PHYSMEM_BITS	34
+#define MAX_PHYSMEM_BITS	31
 #endif /* CONFIG_64BIT */
 #define SECTION_SIZE_BITS	27
 #endif /* CONFIG_SPARSEMEM */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
