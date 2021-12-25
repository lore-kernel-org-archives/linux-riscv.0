Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20F2C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 04:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JA/ZSRHxY1vdhPqWWcstZf03lHSutAFZgpUng1Y6+gM=; b=NYU+PhW5qshtwq
	74CNAUhHrMNZ8HgrTpqmtNz5kS0F6t8NHQ7fuBiO1ftShsd89Uylw0fsakqbJYOBEUJrT3/dN2zeW
	+6Ql9fHNNAiAVN83BnwGG+cFsJ1EPrdk6q5UJ4AA0XuflJq9Ar64EmtsFioJfVLRuYp8xXxStV4Zl
	ZZ39HDEZbsnUn3aBcJnUzhOa/KxCiDRMC2cyES+yq/DsQw9DtkJZbOqxlT1Ga8T72o4ZNnQMZGQxj
	TN1/eje4xhdBsLCmbqaqnbJ3lf3Qaok1ukuIpJ8ISMA/9ScrFJYumtXdNorcVCS5G7ZHquSskqnWg
	iNyPVM9TuJzHiprTm9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0z7J-00Ee8e-WB; Sat, 25 Dec 2021 04:57:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0z5W-00EdBX-H5; Sat, 25 Dec 2021 04:55:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3CF77B8072F;
 Sat, 25 Dec 2021 04:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E70C36AE9;
 Sat, 25 Dec 2021 04:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408120;
 bh=/ayHgJ9Axaat4L3UafkBublWKpTSwuiZsiIJQA7SVTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=byeyQgL088RHuUcoteZf8L1ftXXDT+rEgYXOYcA9ZD/xnPU8llyVA9Spx4jNnhKV9
 1j8/b4N4OF5K4MEyDLo4JZrgpgZwCrpCEHf77O5Jt+WgsbQTdRNXrGoWkMdvjwGkS7
 dFf1Q3J4KF8IiCwFlI/tcbUh84kmgSYJcJ8msqLGSwxvsxUXFPExXhLibL0k3780Ws
 9zclAaC1i7ObWRlUadIJl6kQ1V7zUHfbCJ9XnPg/nvmr8Q/ySuM44PsGyR+9KogkJC
 VKJlXkHVlsr39N16scz8vn+zGoeoUF+EpVZN5q3Ch9IfsH/Gtll2/mOjQG84wHdppU
 GLFFv7zo6QtxA==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 6/8] sched: parisc: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:28 +0800
Message-Id: <20211225045430.2868608-7-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_205522_768108_A8496F5A 
X-CRM114-Status: UNSURE (   9.06  )
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
 arch/parisc/include/asm/processor.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index b669f4b9040b..d9c8dc76ee6a 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -23,8 +23,7 @@
 
 #define HAVE_ARCH_PICK_MMAP_LAYOUT
 
-#define TASK_SIZE_OF(tsk)       ((tsk)->thread.task_size)
-#define TASK_SIZE	        TASK_SIZE_OF(current)
+#define TASK_SIZE               (current->thread.task_size)
 #define TASK_UNMAPPED_BASE      (current->thread.map_base)
 
 #define DEFAULT_TASK_SIZE32	(0xFFF00000UL)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
