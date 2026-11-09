Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9AE606A339
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JK2Z9idf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d5joyA3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jEXf6KvZFOu8OWLWVglk/TchE2xeOFKNj0inMm+bOVM=; b=JK2Z9idfzQM5n9UCaj+cnzTVyW
	mihI8YoyZiRN9gcBfullVf/3ySE8q6oQ1uFnL9+a7qnsKXcy2HEu32u9MmD/pzFUXw0MIERyyCxkk
	sK9lB3kj5G7sfbd9gZTOWF0tP7HkW0qF3/tm0kxHBo7BPnuF4fisE6OJIzvwosaLNjYDsEw/lCgCa
	c9pAftUCQMWbmB+Dc0p/4uFcW7p2/9e6DGvsaL/OV4ZCpEfaCUy5eegNUYWTaAS0TgCiDAk4a03nr
	VCUfIDAiNgHYzpx9Tb6ySjOribLcDJt4xfNGaYqVYJ8Xr1qfWyzkTtSDr/+8qMrdQjP27OmZDcXie
	FA20BTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO3F-00000000b6l-3p5a;
	Mon, 09 Nov 2026 12:00:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO3D-00000000b6f-31yv
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:00:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1009144DBD;
	Mon,  9 Nov 2026 12:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720F41F008A2;
	Mon,  9 Nov 2026 12:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225638;
	bh=w6KU+2nxKMRbJR0uTDw4kUaYedkzj4mNAS4FtcU724c=;
	h=From:To:Cc:Subject:Date;
	b=d5joyA3zJ7YTrS8RpNR9nj3mGeWioDJiuhrvbmLVKeX4o/O8McL78UthECH+WbY9F
	 EMST5hPFE85ULoVZXUuV4agigLph3puPuVRnebs5hzqP2TwdWdUnMPhQqo+m7OPBxE
	 VUfZUWYp/fCCUrCimrviSDdxdnN9f2GcOP5aqkWRTMw43KxvbAx/BuwsIkSdyTAzI/
	 0sm9tkKI+Yb/xBqz+7HmkdQM15ZvQWtFmUqaqO1x3Muk63mGszjss9j55GKFkcqEs6
	 Q5kZjCPT9AkgWUphzz5tYHnEsrGCStD06EBwCptuF0BYwG64IYZmRhPp7Dm/OUGCu5
	 pCwoLxIL0vJ5A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Establish entry state for kernel software-check exceptions
Date: Mon,  9 Nov 2026 19:40:28 +0800
Message-ID: <20261109114028.20225-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The kernel-mode software-check exception path calls die() without
performing the entry bookkeeping used by other kernel trap handlers.
die() invokes diagnostics and notifiers which need the corresponding
RCU and tracing state established.

Wrap the kernel fault handling with irqentry_nmi_enter() and
irqentry_nmi_exit(), following the existing kernel trap paths.

Fixes: 9d42fc28fc17 ("riscv/traps: Introduce software check exception and uprobe handling")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
since v1:
 - add Fixes tag

 arch/riscv/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..f28e03f98af0 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -402,8 +402,11 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
 
 		irqentry_exit_to_user_mode(regs);
 	} else {
+		irqentry_state_t state = irqentry_nmi_enter(regs);
+
 		/* sw check exception coming from kernel is a bug in kernel */
 		die(regs, "Kernel BUG");
+		irqentry_nmi_exit(regs, state);
 	}
 }
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
