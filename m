Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E432CC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Jul 2022 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OxDFELoSQ3KE0c7/k+u5X6PjY4a9uX/mz9wtrRi2Ns=; b=ID83X9zxtb0LwY
	PT+gbcJnEbAKp/2xGHGi6PNjHCfLgIHO/YduRKHeT+xyDf9XrS+vX5182vF/g6t24NUP7a0flE67R
	XXkLbvqWRDN0Jtqn9kBkIJdNzlTqqWIlWau78v/iek7BruTeXTGgFGPnAOuG2sgoUzOtGM0Ti/tuS
	+8VIrJ4n8EsaDcuEUylmHEd9trOd6tgd0xFAPf1RGZW64+OVmpiWn/A39qTR04tHRRElt03hoBBb1
	JhyLSD3KWWm3FnLYNBalXwPJftSnQzQ17yiSi8KpI28Sj4+g27blCVk63CXdJEUd0q0jnW+brYkKb
	AVMHtyob9LOHRSx+5zXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFagH-0060hy-Mo; Sun, 24 Jul 2022 12:25:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFagF-0060fj-1I
	for linux-riscv@lists.infradead.org; Sun, 24 Jul 2022 12:25:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78DD861046;
	Sun, 24 Jul 2022 12:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED10C3411E;
	Sun, 24 Jul 2022 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658665553;
	bh=CYylZgBgEWXe/AK9bUnLJ70ppNnmLn//vvrYUoL+UXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JVZvlP9Ejw4lMPQy9eEKtpevIxYHCUuAJHNWVftrUiiPbLA6CEvWstyMqgThL2VIM
	 jCzHwe/wyo3ChC2lq5GMdeHceQd+egrOOCvIiN3TKMsUI/9kxpJCm2QpCYg0Se499E
	 xeacO7N5aY+CSiOuS8ppYoGGJQydpb9LFXBi9C6D03umN5R4042EqEOP3haWtDakKt
	 Vqx6jvXQGrfbC34mSfu3db79meraV8ESab4BJ7IJvXW1LdwqLDLc+9Lj4NhiNSSj59
	 jFRq+5yoSzp/FTvGcMAarEZ0sav8r2nOKGM08aglcJuNdF6tjrbQfQneIQB09W8240
	 oMDxTQN27i6CQ==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	mingo@redhat.com,
	philipp.tomsich@vrull.eu,
	cmuellner@linux.com,
	linux-kernel@vger.kernel.org,
	David.Laight@ACULAB.COM
Cc: linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V8 04/10] asm-generic: spinlock: Add queued spinlock support in common header
Date: Sun, 24 Jul 2022 08:25:11 -0400
Message-Id: <20220724122517.1019187-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220724122517.1019187-1-guoren@kernel.org>
References: <20220724122517.1019187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_052555_122372_7AB88BB2 
X-CRM114-Status: UNSURE (   8.75  )
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

Select queued spinlock or ticket lock by CONFIG_QUEUED_SPINLOCKS in
the common header file.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 include/asm-generic/spinlock.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index 970590baf61b..f1c29db9c8b5 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -3,7 +3,11 @@
 #ifndef __ASM_GENERIC_SPINLOCK_H
 #define __ASM_GENERIC_SPINLOCK_H
 
+#ifdef CONFIG_QUEUED_SPINLOCKS
+#include <asm-generic/qspinlock.h>
+#else
 #include <asm-generic/ticket_spinlock.h>
+#endif
 #include <asm/qrwlock.h>
 
 #endif /* __ASM_GENERIC_SPINLOCK_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
