Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B78C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7j3Px7kKEhEFrvB/o809rIGo26ATJB/5M+pXxDOGvg=; b=oNic2aaHVtIvzl
	nM3e5PUnekv0dJfHFl4FpAwXXzRR5o/6sdfn+lOQKorBXwp+ylsiRIFdIwlzSvRNsTaExMZ0VCjI8
	8XB+bMR5ZnmkJC7KIsqG+gIEhYAFT1jN6RmUuv3r5hNT767cD1C23Du1Zipjj/L1Lf3H3k2AaDIXS
	SUalalHmFFzq2ayMeF+Ug7iaGYElueEEBfJi1DVZ6vxi7ujgsO5PZkJViYuKjDAjDQytecl1rhAeL
	e2PLWTamYPYfodpP1vEYJAR+ihKiLrseyzGoKaE59HkYA6q1IClOB68yk0qroOAThiMEev/2uklI7
	3L0PFGqG3V6ucSCg7DBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXzd-00000000bvT-2j8Z;
	Thu, 15 May 2025 12:47:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXza-00000000btD-3eQm
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 12:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35AEBA4C7B5;
	Thu, 15 May 2025 12:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF63C4CEEB;
	Thu, 15 May 2025 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313237;
	bh=9LwOHpGDLFZKgszWtNvO5DQHvwl986zoPmxZXPECuAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H3Oo7c4aQqjCA0KblghIzrcJ/6KL1ZnahcRyERc/zXDuFT2ljlqfEEv/ldVmgTY9E
	 r0HEhNxXv2ElHClBjIhqubLRhaDl7I6Vne0bHOe/0f7cLAMKycdBs971+Ksujwczia
	 DiqHS5fnebXHIZmD6Moq+Pq7QJnuD1/XWecHt+ztdaNW/FIdLp5UBPiIs+sZUcy6Dd
	 BHezXDc+vNyWMYIfULQ6rZ6rswutj7DDWc7Wq0NyDwG6SVmlqsIZ2JacvuCYlM74v9
	 PuH/LmG8BzA5IKvcdaSTtvPatnlsWY8Wxg6h6XXso8YetINcAY8U8Xl70vleN61gf8
	 vwXAw0KFqzPeQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 12/15] bugs/riscv: Concatenate 'cond_str' with '__FILE__' in __BUG_FLAGS(), to extend WARN_ON/BUG_ON output
Date: Thu, 15 May 2025 14:46:41 +0200
Message-ID: <20250515124644.2958810-13-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515124644.2958810-1-mingo@kernel.org>
References: <20250515124644.2958810-1-mingo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_054718_972302_705F2AC8 
X-CRM114-Status: GOOD (  10.37  )
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

Extend WARN_ON and BUG_ON style output from:

  WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410

to:

  WARNING: CPU: 0 PID: 0 at [idx < 0 && ptr] kernel/sched/core.c:8511 sched_init+0x20/0x410

Note that the output will be further reorganized later in this series.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/riscv/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index feaf456d465b..da9b8e83934d 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -61,7 +61,7 @@ do {								\
 			".org 2b + %3\n\t"                      \
 			".popsection"				\
 		:						\
-		: "i" (__FILE__), "i" (__LINE__),		\
+		: "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
