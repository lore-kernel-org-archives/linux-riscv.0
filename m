Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A64FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsLqsfTy3lXYcrnlz9S/fu+tw27WL48gFxRHRoE0fJc=; b=mIwzSN9d+JypRN
	+osA7migk9+YgIbCEAsvRTWfOqLV5GsRQBR06eqe+Wzf2CnyF4cfDn5lI7xSuCUhfDmxI0t0ba3hn
	Q/KIOdJV5kaB8WSnL1WSd2FBZvf/TTStGPuVUFWPlAKP24ySvVHh5v7BAlphSrsONMIh++0iaiUse
	T7kdLYatVvBX+DfbS1UjC7WNCNVS1FOSDeeJCezEMdiinmh6mMojtZFXeDd6T8K+J2TAqow1WIUKA
	B5SFGm0e6GeA4ZERMNjZObZJNPUyFHO1yuV6gGZJSlUe2xLr2eNMUgzEPHjHnA4+Jz+5jQd6554zn
	MGybtOMklCWHVt4RVizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzicI-007i6p-Kv; Tue, 21 Dec 2021 17:07:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mziVz-007f04-3V; Tue, 21 Dec 2021 17:01:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0F72B817C9;
 Tue, 21 Dec 2021 17:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FDCC36AE9;
 Tue, 21 Dec 2021 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106085;
 bh=C4uY6IDvAgo0GjDDiLqZiUWK++v8kONm1c6xElXqxzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A0qMkaMVdT68wSaWhMCLc29zOalWNaalFSakJlfoA1Yeax4Napww7JdrtDYY/bKQT
 2u/Vhc6ofKWE7Z3UHx4Jv11wgMtgyvxmBm5WcDZPr3gDeyC3ZssTDTqaVG6rVJTlAY
 3d6Snwwk6R1XNV1xjcx24WZ3QO55ab93bXuOmPqSKnq3GZtmvMIhogvRIBbGR2efEy
 4xruHJ6zF5BPdTFUsrA+GU/AOYVXTL05eUSHytp55g4Erzjexd/4pLa76dJmmTVoXK
 kR7LcVChH591TjkxdDyOn5aZUysU0sB9RJtfU3mmaS0yA8Lt9ofHH781poR87gMph/
 Nn9aN3KsR2n+A==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:53 +0800
Message-Id: <20211221170057.2637763-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221170057.2637763-1-guoren@kernel.org>
References: <20211221170057.2637763-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090127_337665_05441ACE 
X-CRM114-Status: UNSURE (   9.24  )
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
---
 arch/powerpc/include/asm/task_size_64.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
index c993482237ed..7e2eca4fac4d 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -44,12 +44,10 @@
  */
 #define TASK_SIZE_USER32 (0x0000000100000000UL - (1 * PAGE_SIZE))
 
-#define TASK_SIZE_OF(tsk)						\
-	(test_tsk_thread_flag(tsk, TIF_32BIT) ? TASK_SIZE_USER32 :	\
+#define TASK_SIZE							\
+	(test_tsk_thread_flag(current, TIF_32BIT) ? TASK_SIZE_USER32 :	\
 						TASK_SIZE_USER64)
 
-#define TASK_SIZE TASK_SIZE_OF(current)
-
 #define TASK_UNMAPPED_BASE_USER32 (PAGE_ALIGN(TASK_SIZE_USER32 / 4))
 #define TASK_UNMAPPED_BASE_USER64 (PAGE_ALIGN(DEFAULT_MAP_WINDOW_USER64 / 4))
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
