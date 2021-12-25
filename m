Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607ABC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 04:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wSOrTioDgIaE8idkc4VFGXhcKF8wTLkDI4/gXyRDAs=; b=UlOS3+wUk0sP/F
	DDI6/zLu1gXjD4oTvSvGD+LoCDlxWImkMMXGDY3m+Oz7CL11YqtArJ7FRgIL8N/hwxr0ET5GlSVb3
	0EQULCIh86HKju8NXMX7jjlwoZ7xXasiovOwZ+T3hoEYzL9HsUqrVA7zap0HPQ1mvE4l007zTQLcZ
	uPGPOiIatclb3pQXXTNAiRGjladcP8/+3Q2Wj1kPL+I6sun2RtuvybUIje8K0bOeLlMBQ9MOBf494
	omnN6le1hsJvN0v1IOyURWkZ3omuMMKvwQuh4Lk4q/QRkJgHuFds7Q2ZJQiJvIaTvhQg7UtosXN8C
	iVQIoPTENXUlWxaV/Wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0z6Y-00EdfR-H3; Sat, 25 Dec 2021 04:56:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0z5N-00Ed6q-3s; Sat, 25 Dec 2021 04:55:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0523B80939;
 Sat, 25 Dec 2021 04:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BE3C36AEA;
 Sat, 25 Dec 2021 04:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408110;
 bh=lhZLi2fHARrNEq4LLSfdR+qEsQoJ5dBnyjq9x9/osWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O47U4vTrj3QNxk6GmpLhVdXkGt5KIq0adYPONhPiS9zlmdIF6dLUKm0ctzE/UgxMe
 AOO+ct+kJG9RjRRx17r37NUn60LQ+rja9ygBdLrloP3wt0Bl5PnSmL+VzMw9xQogy2
 jX7VJKQb09vFq2it5MjwIV32f/uONVr7d2xEbZ8u/DwV08SQ/FGn9B4+heWUVT31rU
 hRfkOMfWGSoTbXWqjwcGV2B+YN4kEZ1zNryRBx5lmDeCdiQALPnsWs6AoCf+ksoVYK
 4E7ExCWDluxwuV4SMgi8C0SrGLz7GoJ//7HdRHpqJhZZzVYe71q2yKQWEDIPHvZHOQ
 yx1fmsSGGF6rA==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:26 +0800
Message-Id: <20211225045430.2868608-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_205513_336111_E0F9BE11 
X-CRM114-Status: UNSURE (   8.83  )
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

This macro isn't used in Linux sched, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/task_size_64.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
index c993482237ed..38fdf8041d12 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -44,11 +44,7 @@
  */
 #define TASK_SIZE_USER32 (0x0000000100000000UL - (1 * PAGE_SIZE))
 
-#define TASK_SIZE_OF(tsk)						\
-	(test_tsk_thread_flag(tsk, TIF_32BIT) ? TASK_SIZE_USER32 :	\
-						TASK_SIZE_USER64)
-
-#define TASK_SIZE TASK_SIZE_OF(current)
+#define TASK_SIZE (is_32bit_task() ? TASK_SIZE_USER32 : TASK_SIZE_USER64)
 
 #define TASK_UNMAPPED_BASE_USER32 (PAGE_ALIGN(TASK_SIZE_USER32 / 4))
 #define TASK_UNMAPPED_BASE_USER64 (PAGE_ALIGN(DEFAULT_MAP_WINDOW_USER64 / 4))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
