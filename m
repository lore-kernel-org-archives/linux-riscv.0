Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9CDC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tBH2dehnqzYxnKWB+cihxfhLmESLiToK9F4no9qIJuw=; b=CBgrbTRw1KpHd6
	NmpybwySuNMZUAaLwJ0gBUvb42QWn5HT0imFIXQ3GVgbtXK2LtZO/B8p9WIJNTze9cFBqddKazosb
	tRelmbn7x2z2TyzFFG8J6SR3/7beNVrO6Ufm4OlRU3v+WJjEFfSFLvmLYNnWRrXmqA0F7ubdBXUI4
	dcXcvJbROiWe3TEqNotdMb6k2lVNPoWxWFS7G3qedKoCxtIQ4bEjnksyhpHCwy6yxN/bq40BrXjs0
	CcuVK1OvaVnZb8zS/ET1otUir+MIiiThwHBz20D6eoIwHd0JMsyRse5fj60ThQfYn0WZg+jsbJDXd
	MU1nk4rOk9ixv7nOYVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFY65-00Df1X-2p;
	Tue, 19 Dec 2023 11:17:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFY62-00Dezz-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 11:17:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 42803CE1081;
	Tue, 19 Dec 2023 11:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FAAC433C8;
	Tue, 19 Dec 2023 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702984627;
	bh=wJ8SoxQvEXo8YD/Otob+P1IPztgR2u77NuTz+L6AVU4=;
	h=From:To:Cc:Subject:Date:From;
	b=H1WI21FjhrRQqg3E1c+b9XLaLpRQ5UnHHpqgayieRpRt9ZtZquOYuPtjRP86oKQxF
	 QmYVT4SUNPFdKdWfcAwGru47rzFe7efebbzWOM8kfA3uyFYYLvHYi42lKwzyV4BMaX
	 8DMf1hrc2dPsEPN0ETih338m/ZAI1oyIa5mARhVFR1xxSk3DrQ7B4Dq5qiNUk/qD+X
	 1Y5PALy2PRFxmxFY+nzUVwaF9WxzI4CDb9/WJfBdQd0Gtyg0i+HgJ2xOddraG6Ui/K
	 osw9FWJ9Kq620lSDCNPxU1xUPMOmddLjeNuF9JbrOJIs2lcOkDzhu1N6hkAWj50lVU
	 IpO1d51vxt2TA==
From: guoren@kernel.org
To: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	guoren@kernel.org,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: mm: Fixup compat mode boot failure
Date: Tue, 19 Dec 2023 06:17:01 -0500
Message-Id: <20231219111701.1886903-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_031711_018470_ECB617C8 
X-CRM114-Status: UNSURE (   9.29  )
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

From: Guo Ren <guoren@linux.alibaba.com>

In COMPAT mode, the STACK_TOP is 0x80000000, but the TASK_SIZE is
0x7fff000. When the user stack is upon 0x7fff000, it will cause a user
segment fault. Sometimes, it would cause boot failure when the whole
rootfs is rv32.

Freeing unused kernel image (initmem) memory: 2236K
Run /sbin/init as init process
Starting init: /sbin/init exists but couldn't execute it (error -14)
Run /etc/init as init process
...

Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ab00235b018f..d2ec5e6fa331 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -881,7 +881,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
 
 #ifdef CONFIG_COMPAT
-#define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
+#define TASK_SIZE_32	(UL(1) << (MMAP_VA_BITS - 1))
 #define TASK_SIZE	(test_thread_flag(TIF_32BIT) ? \
 			 TASK_SIZE_32 : TASK_SIZE_64)
 #else
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
