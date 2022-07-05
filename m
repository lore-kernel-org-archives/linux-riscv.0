Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66746C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyfIg5zWb/4Am034/Vniy6CKNuFJ+NxZKdBomaxe7Mo=; b=tDOhxkKWN/cbJn
	c1Qhu8qK6rqI452BFIDsDww6uWpdR9d8GZ9kueXI6FiGgP+aKmyApsdUFSSISpsYpXYxmLlkUD2OY
	SDUxoaEHNzm7XePjC7CUJi7zKQBPeiOkO86LRBa7W6GGIKZ/RIACELrOgbSlJkMySFJckVyiVfLGO
	KsGJK6gyLzo8Nj7KptkNsTBXC6RlqRgvTu1arBSygLd8idBl3mS0MCLwIFucGi/IA96prue98qdy1
	k+o2pEIaDM3rg8vRj7qDeAJZKG0CXd0mpqGUGpc846t6TUketi96OlsctUxiAZL1MXywuC6fRFujT
	Fl+QMt6qusRi6WAWwhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fRA-00H4HF-5X; Tue, 05 Jul 2022 10:05:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fR5-00H4Eh-5E
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 10:05:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D159BB8172A;
	Tue,  5 Jul 2022 10:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F4BC341CD;
	Tue,  5 Jul 2022 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657015536;
	bh=wb44Cd6ezLkiUGRZJpLoADEPqh9n9q++I5VOzuY01mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQ4zrWA06emusCpTakVGwEP2dRnZzfScevNQTCluh/llaGIHxgGyLPTdna4+ESEJy
	 m/9DUyhq/rwVZWkoIoKjllYKIi6QxF4dkc1eAxQ+QCAB00uMK1iBfLm0vbxWV8LDFp
	 kdCWYJS1HRNpgw5SsoxUdQ/sGKoUWPhXL7W7Mknd7/vSNzreQW7LivCm0Sx5mVRf8k
	 T7wG8yR+WliazLTSq/dGE8D7tPxEx+cyipzgTWXZhz+y4uZZ5AnWmCu6QNlD5thf8e
	 yBTIjzENTljr5UAx/xTsgd+f5Gu7rKPdSPk+N6IKbLMydjaRIvENOKHUwmbXXZ+4dy
	 jcKvKlmgBplfQ==
From: guoren@kernel.org
To: palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH 4/4] riscv: Change rv32p34 to rv32p31 for svpbmt
Date: Tue,  5 Jul 2022 06:05:23 -0400
Message-Id: <20220705100523.1204595-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705100523.1204595-1-guoren@kernel.org>
References: <20220705100523.1204595-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_030539_391735_4A222FFB 
X-CRM114-Status: GOOD (  12.62  )
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
 2 files changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
