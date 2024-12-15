Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C30E7716A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Dec 2024 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rpO8HV4KwqEpv/rU5k/mAW7uelZ8bEckWwTe4voKGjM=; b=jduw8fKwu7+hY7
	nyt4G+4xlOT0mMLpOAvvJCmhBraud6mXnCdTY+O1H5VxnYGGCVuEe+nTFx0wdFvCxyfRsptVm9PSU
	/UaWL/xTsDoFVdZYXgCOGMzyGcWfybKTkECQg+yJu1Yh1W82FTeHADSlwCLC+7qXoFbMiY/ggO50f
	aFq6zdH+hCIEov8ptr+s/+dUhXqXEo9O++bQxusA6kj77fKitlHTqtOp7mTKZ08+hmAnNb9rv9bPw
	o+KD9LIbN4TajNwOuqjS1KwLWlfFuQmcNPL5A3eaScbSG4PbnDhVKQVqNHecRFjrhhPjU9TupxqXu
	d6BfcmIX88h/b4V+avtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMp3a-00000007zwK-0PF3;
	Sun, 15 Dec 2024 13:53:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMp3X-00000007zvh-3boj
	for linux-riscv@lists.infradead.org;
	Sun, 15 Dec 2024 13:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FA5B5C5A1E;
	Sun, 15 Dec 2024 13:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EFCC4CECE;
	Sun, 15 Dec 2024 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734270790;
	bh=sHhlhj7Xxd2KddBccYbZSVpXC3HqJ/HVF/eJ/ECqUoc=;
	h=From:To:Cc:Subject:Date:From;
	b=oBo4aQJ0DcmTIqmZ39NZ7vRHWJTSngQWNnSxmhiHuBMGLwBii+7OF5Etcv/nyvzTj
	 SsSXvNfmXLaiHD/jkyqCTCcM5xUu0lDgkUWuJB9/DigGTd7SOznuNe6Sd8HWhJAO7O
	 /lHV5dmRHkxXF4VpaxPv8e25IutI0klREht694SzcOAtfZsY5zPG4/TNujMZgvn8d8
	 +bkw6HE1puzZJqtuZCd9myGLnHahKUVmsVPT5yngh2Oxz1MTgUxyg+SHXPyhM49+MC
	 5BlmPgSaCqiKHofwnDELfdaIAMYvKEjmetudbEIAOPk4CS+mUqZYcPzfeGEuqScJuv
	 DMybtQTRHPB4A==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	conor@kernel.org,
	leobras@redhat.com,
	peterz@infradead.org,
	parri.andrea@gmail.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	arnd@arndb.de,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: qspinlock: Fixup _Q_PENDING_LOOPS definition
Date: Sun, 15 Dec 2024 08:52:52 -0500
Message-Id: <20241215135252.201983-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_055311_960925_10BE3AE6 
X-CRM114-Status: UNSURE (   7.19  )
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

When CONFIG_RISCV_QUEUED_SPINLOCKS=y, the _Q_PENDING_LOOPS
definition is missing. Add the _Q_PENDING_LOOPS definition for
pure qspinlock usage.

Fixes: ab83647fadae ("riscv: Add qspinlock support")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/spinlock.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index e5121b89acea..52f11bfd0079 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -3,8 +3,11 @@
 #ifndef __ASM_RISCV_SPINLOCK_H
 #define __ASM_RISCV_SPINLOCK_H
 
-#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
+#ifdef CONFIG_QUEUED_SPINLOCKS
 #define _Q_PENDING_LOOPS	(1 << 9)
+#endif
+
+#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
 
 #define __no_arch_spinlock_redefine
 #include <asm/ticket_spinlock.h>
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
