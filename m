Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B45C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:16:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6B16112D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B6B16112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CDFJxuyw8/lvsM+o4xSxPkffefwZPdNz8+ziFwL5rE=; b=xZuM3Iw05SBf7P
	xE44z9D8zp7RzxmekjzkEjhMy26kTI7U1ZYD4YiDg632rTF3/tceEZKj0S1gVreo1kCr2qLjC9gkl
	ae8uSBA9w8Q2avdWzanjA3iDLd76jM6uuwO/3+iAv2oGmv1pGf1kYaRR4Gpy01awfV8h6YA2Dni0/
	Bjujah/Dg83zC5B85xfaZiTOBkIl3GiMzrLEnkITCm1RO2mMG+x8toJ8ixThvKaCdwhN91QDcPV2/
	ZmRB5179+FjF5jKHswAuPwrmSL2+xjrmHXST3QNtSFpK0Mof3iYieUXEJ2gRazb1UrouIvl7g8dE7
	HECH/fMolPLL0ivM9nRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7MO-005bju-Am; Tue, 14 Sep 2021 12:16:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7Hi-005Z69-Ri; Tue, 14 Sep 2021 12:11:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C83CF6113B;
 Tue, 14 Sep 2021 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621494;
 bh=Un8y/D+KQ7QnI5WCuToXds/wfl/En/jtOwh4rNfj9R8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ig+JhbgZYvBpoEkePCkGJri/drWhd/zNQud4qJwR8VAt84t30tIDeaFs97pqovpnU
 WCFrlyeMm6+1wzrVATtgyga9C5qWYHs1yX99yykHrOJ3pCi9FXJKirLieFGvLxzC0K
 Mywhpb0yr9NkpYWBDViktx8s3C+pE5TggWsvKK4IyjcPZc1m8gjUT/JKfmfVm6FX8H
 CX7KnVaCKBdHWEu2l+bHSQiZ1f1aWajC83sfiAJLI1WCxOKfU4PeSC6JVYfKKmXY+Q
 NIiIwTM/plhEKszesgnnR42HGaTtjXF+XLsz785RrqO0IDw4DjfEQpDioB90gj8vwG
 AVBFyfowsQ6nQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [RFC PATCH 8/8] ARM: rely on core code to keep thread_info::cpu
 updated
Date: Tue, 14 Sep 2021 14:10:36 +0200
Message-Id: <20210914121036.3975026-9-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_051134_987983_D0F9F786 
X-CRM114-Status: GOOD (  14.28  )
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

Now that the core code switched back to using thread_info::cpu to keep
a task's CPU number, we no longer need to keep it in sync explicitly. So
just drop the code that does this.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
This patch applies onto [0], which we hope to get merged for v5.16

[0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=arm32-ti-in-task-v5

 arch/arm/include/asm/switch_to.h | 14 --------------
 arch/arm/kernel/smp.c            |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/arch/arm/include/asm/switch_to.h b/arch/arm/include/asm/switch_to.h
index db2be1f6550d..61e4a3c4ca6e 100644
--- a/arch/arm/include/asm/switch_to.h
+++ b/arch/arm/include/asm/switch_to.h
@@ -23,23 +23,9 @@
  */
 extern struct task_struct *__switch_to(struct task_struct *, struct thread_info *, struct thread_info *);
 
-static inline void set_ti_cpu(struct task_struct *p)
-{
-#ifdef CONFIG_THREAD_INFO_IN_TASK
-	/*
-	 * The core code no longer maintains the thread_info::cpu field once
-	 * CONFIG_THREAD_INFO_IN_TASK is in effect, but we rely on it for
-	 * raw_smp_processor_id(), which cannot access struct task_struct*
-	 * directly for reasons of circular #inclusion hell.
-	 */
-	task_thread_info(p)->cpu = p->cpu;
-#endif
-}
-
 #define switch_to(prev,next,last)					\
 do {									\
 	__complete_pending_tlbi();					\
-	set_ti_cpu(next);						\
 	if (IS_ENABLED(CONFIG_CURRENT_POINTER_IN_TPIDRURO))		\
 		__this_cpu_write(__entry_task, next);			\
 	last = __switch_to(prev,task_thread_info(prev), task_thread_info(next));	\
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index cde5b6d8bac5..97ee6b1567e9 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -154,9 +154,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	secondary_data.swapper_pg_dir = get_arch_pgd(swapper_pg_dir);
 #endif
 	secondary_data.task = idle;
-	if (IS_ENABLED(CONFIG_THREAD_INFO_IN_TASK))
-		task_thread_info(idle)->cpu = cpu;
-
 	sync_cache_w(&secondary_data);
 
 	/*
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
