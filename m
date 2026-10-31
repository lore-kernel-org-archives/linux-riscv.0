Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C4606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0fddu+KC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4X3LEs4g5fJNUGCPIqs59pxhmWCwHnQIoWjaqYMIJ58=; b=0fddu+KCqltRzJtdNFKyjXuhCx
	Qhsjk8ioKIFOI+JeZtw9lzGcYkrS9c/48h41QQ+VoDQMYiABtibul2tpsFNIdQbEgCSwTgvHObkSv
	nG2JEIreio7bONfSbNiz+ZY4128lY3xW0M3BvnrRnvyasJ8hm94R4/wam/7QWvHZkCkrTtNclXUfw
	vif/gygFNzLBlQu8xF102P6kKqk27/wJIw1Pm+54jd09+iYZTVJc7FMRsbn6W1IX7nLxLZ33T/wyP
	n1WKEmCRlpn1YpKKIUNFKecSLCI/W8fAqSJkQecldtjG7USKUyGKg8EzjJfooVlnS8ije7Z+FbeL1
	mAT7KAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNBmz-0000000DTgO-06Rq;
	Sat, 31 Oct 2026 16:18:41 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNBmu-0000000DTfK-15ro
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 16:18:38 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xNBml-00Eg4I-7z;
	Sat, 31 Oct 2026 12:18:27 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2 1/2] riscv: signal: mark the FP state clean before restoring it from the frame
Date: Sat, 31 Oct 2026 12:18:25 -0400
Message-ID: <20261031161826.858908-2-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031161826.858908-1-nickolai@csail.mit.edu>
References: <20261031161826.858908-1-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_091836_300233_CEA9A135 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

If rt_sigreturn() is preempted or sleeps on a page fault while it copies
the FP registers from the signal frame, the interrupted code resumes
with the signal handler's FP registers instead of its own.

restore_fp_state() copies the frame into current->thread.fstate and then
loads it with fstate_restore(). If the handler used the FPU, FS is still
Dirty during the copy, so a context switch makes fstate_save() store the
live registers, the handler's, over the partly copied image.

Mark the FP state clean before the copy, as commit c27fa53b858b ("riscv:
Fix vector state restore in rt_sigreturn()") did for the vector state.
Preemption is disabled around it because the scheduler also writes
regs->status.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---
 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..11edfc128ac3 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -47,6 +47,13 @@ static long restore_fp_state(struct pt_regs *regs,
 	long err;
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
 
+	/* Discard the handler's FP registers before the copy can sleep */
+	if ((regs->status & SR_FS) != SR_FS_OFF) {
+		preempt_disable();
+		__fstate_clean(regs);
+		preempt_enable();
+	}
+
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
 	if (unlikely(err))
 		return err;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
