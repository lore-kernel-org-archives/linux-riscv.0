Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4C2C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1KpgZN1/7zk6HjL14wvQu4sm3Q3axxGYv4Ttj0Enao=; b=EuKWtGOImaP8fv
	pOOC98+p/Dz2ga2mki7PkogkL0KyPRJtgyPGVFUngiipmLEcaN67a4hW9Qi1j4EioiVwdCyAoXSDF
	KK5GX9PJUmwiUzl46ek05ckbVZXf7YRgVhsQaKojcD/S6g0iFLOnVRBSoLXptGIK8Mb0aiDj9s6H5
	has7W1reucnFyrAeaPbidtn9t5f9eZoOVsx1PKXBKeGHqr0VboiiT+Gi/EdTjV2pCcwSooUpcRbEF
	3llEY/YXykybBIDfZqarW9tiiZjgk1GdMl3F2MgFfS2D6LMDq2uwPJplvTQanT/srcbH4q6RiFgG/
	CEFVTP73/oMhsMDHIfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px8G5-009DHg-0j;
	Thu, 11 May 2023 15:31:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7Ca-00922v-0y
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 14:23:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E428636FC;
	Thu, 11 May 2023 14:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFB6C433EF;
	Thu, 11 May 2023 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683815006;
	bh=EAl7BYyGkHSJ9u4z4v03MJVzoloTTUlxQ/6IkxdvXp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aQAlhdryVtLrijn4plCYeD8GrNC3jkYYQfYYiLdqFuCbLL01xeMxATi5/b0BGkM3s
	 9pL1vpl41G7btsU04qC3KrO87rvLds7PncrgXtCzI0TzlLyAxUfqxe9l6sJ8pXHMhd
	 yhQTtQsY8s1Rz8rB2ADYYC5lq2GjgG6p1lMoJRviovB4jhO0IgiPOanGPdogFRFGKf
	 M8lKdsRm3s25cOtf3C6WMjn6jdc7/xNC+H3pGs4NafKn5ftut5UIqYwf1d8y4dUyr/
	 48sWhQwCzLUjfP7GoO7r/wnUGOitDR2Mu+i737iw2WCUlf+W9v8lzun7HeOBvYMGVS
	 PA6Eg16UdnlTQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 4/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Date: Thu, 11 May 2023 22:12:11 +0800
Message-Id: <20230511141211.2418-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511141211.2418-1-jszhang@kernel.org>
References: <20230511141211.2418-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_072328_380488_5CB9144F 
X-CRM114-Status: GOOD (  12.74  )
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

When trying to run linux with various opensource riscv core on
resource limited FPGA platforms, for example, those FPGAs with less
than 16MB SDRAM, I want to save mem as much as possible. One of the
major technologies is kernel size optimizations, I found that riscv
does not currently support HAVE_LD_DEAD_CODE_DATA_ELIMINATION, which
passes -fdata-sections, -ffunction-sections to CFLAGS and passes the
--gc-sections flag to the linker.

This not only benefits my case on FPGA but also benefits defconfigs.
Here are some notable improvements from enabling this with defconfigs:

nommu_k210_defconfig:
   text    data     bss     dec     hex
1112009  410288   59837 1582134  182436     before
 962838  376656   51285 1390779  1538bb     after

rv32_defconfig:
   text    data     bss     dec     hex
8804455 2816544  290577 11911576 b5c198     before
8692295 2779872  288977 11761144 b375f8     after

defconfig:
   text    data     bss     dec     hex
9438267 3391332  485333 13314932 cb2b74     before
9285914 3350052  483349 13119315 c82f53     after

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig              | 1 +
 arch/riscv/kernel/vmlinux.lds.S | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f0663b52d052..a5feab2c3037 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -110,6 +110,7 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index e5f9f4677bbf..492dd4b8f3d6 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -85,11 +85,11 @@ SECTIONS
 	INIT_DATA_SECTION(16)
 
 	.init.pi : {
-		*(.init.pi*)
+		KEEP(*(.init.pi*))
 	}
 
 	.init.bss : {
-		*(.init.bss)	/* from the EFI stub */
+		KEEP(*(.init.bss*))	/* from the EFI stub */
 	}
 	.exit.data :
 	{
@@ -112,7 +112,7 @@ SECTIONS
 	. = ALIGN(8);
 	.alternative : {
 		__alt_start = .;
-		*(.alternative)
+		KEEP(*(.alternative))
 		__alt_end = .;
 	}
 	__init_end = .;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
