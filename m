Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D617EC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5AC220656
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eWOLy2hp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5AC220656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1irBsFge92WLkONII81HhAc6QGgoSsMFK0aMnBnQeds=; b=eWOLy2hpLqYp06
	tbAHi1DYImtTSdcrglF7AqIPQOy5au7uzxw79s5QLNwDH4JIa2xCD/owBds1r0w/q+nwyd6VID6tW
	hZz5YODPioIs9kZO875E0PGM/RXaMH/264qVbfdcXTshMLAcqOECr3ofBcqKdiFZqks0Ui2qBQZQZ
	PrpoJEUBJOOu7Ac1dNM4E86LetTlqBBIcAXNXbpRId2A06LUx6P1acoGNlo19QKFdky38RbSUeNYQ
	fvMW2jbEcIsm3iLAlxhxLYoJqJhM6skvMvlX7i1sKp5VGzCQkbMhDQFfLyIdRaakgxxGAQDEZeXKN
	m9M/fWhjJKy5vfcZwrDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxi2-0006Zo-Q8; Mon, 15 Apr 2019 09:15:26 +0000
Received: from 213-225-15-255.nat.highway.a1.net ([213.225.15.255]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxi0-0006WZ-Ol; Mon, 15 Apr 2019 09:15:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 06/11] riscv: simplify the stack pointer setup in head.S
Date: Mon, 15 Apr 2019 11:14:37 +0200
Message-Id: <20190415091442.19945-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415091442.19945-1-hch@lst.de>
References: <20190415091442.19945-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We don't need THREAD_SIZE in asm-offsets.c as we can just calculate
the value of init_thread_union + THREAD_SIZE using cpp, just like
we do a few lines above.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/asm-offsets.c | 3 ---
 arch/riscv/kernel/head.S        | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index dac98348c6a3..578bb5efc085 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -312,9 +312,6 @@ void asm_offsets(void)
 		- offsetof(struct task_struct, thread.fstate.f[0])
 	);
 
-	/* The assembler needs access to THREAD_SIZE as well. */
-	DEFINE(ASM_THREAD_SIZE, THREAD_SIZE);
-
 	/*
 	 * We allocate a pt_regs on the stack when entering the kernel.  This
 	 * ensures the alignment is sane.
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9e3840d84d3e..62d2c9c85433 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -69,10 +69,7 @@ clear_bss_done:
 	/* Restore C environment */
 	la tp, init_task
 	sw zero, TASK_TI_CPU(tp)
-
-	la sp, init_thread_union
-	li a0, ASM_THREAD_SIZE
-	add sp, sp, a0
+	la sp, init_thread_union + THREAD_SIZE
 
 	/* Start the kernel */
 	mv a0, s0
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
