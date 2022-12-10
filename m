Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7396C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2Debn3b0sMOT2hmhU9r3yn0CCLAh/glzDU5FtPyTa0=; b=J+vNd8FaypnOIv
	+g/JkwndAu/iihoW6yDC+OECBseNtR4gzqTWzAt069qnEQk7NoigzYN+5GuCkmfB2Wej9exLaVh4Y
	xrZoWjXHeoYPFzj7tWz7DS1hGhAbUcQv++rd+IpBxZJKt9+Sslup75mZzlrLH+JHb2kQ3yZrP3Tv+
	jfNEgNzvpP07NL3C6ERlzqAswowGUKeuI/sLsYpEqNIkMos8HCQI5FHlOgeIgMxSV7b/iSieqaQAw
	jx0hRFDNpqULMScUTLUMVweHfwaADcCC+U/HW3kmVllclgZDuiSIlSNj8ZHpGZAfdtbkIN9gvSSbg
	DYgelzY7OIu8Y+m8y5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p43P3-00325q-LP; Sat, 10 Dec 2022 17:12:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p43Oz-0031yB-Pf
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 17:12:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 24E9BB808C7;
	Sat, 10 Dec 2022 17:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E732C43396;
	Sat, 10 Dec 2022 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670692357;
	bh=1to8Eya97xsCd5dpg3aZEbjSh8C5DhuW3JXbIva7/JI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WcSN0R5KTFMTuh4feBb46yNzhgAbOwPAhNJawqOQ4DpfS7GvrMAjtrntpeTcrsFyZ
	 vOsPGSCK9uiGV3Q5fs9qtaWI9/HUOUsq47mqqnpwUKsQKLWZHywFXJn8YA7rR7R0Tf
	 I/oFox92QgjgfUgkcW/QYVg3dqQfbogbuB4viOY/iSCvShxzaiyzWS8d7WeSDw+TzY
	 6w4qLbHMCMLBLNrYoSCB+fl+LU5rUizoccvFToLDtiRdwtClNjZJlEGk8qe4nmJrL+
	 R5B/D6BW2BCWin5n1uV4QSEh4ZJaer4e9lFrblKEc7Bc+XmWYN8qUlFfwYV3RJ7oDx
	 Sxt3vn1i3YcMA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH -next V11 2/7] riscv: ptrace: Remove duplicate operation
Date: Sat, 10 Dec 2022 12:11:36 -0500
Message-Id: <20221210171141.1120123-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221210171141.1120123-1-guoren@kernel.org>
References: <20221210171141.1120123-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_091242_050052_16B65910 
X-CRM114-Status: UNSURE (   8.00  )
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

The TIF_SYSCALL_TRACE is controlled by a common code, see
kernel/ptrace.c and include/linux/thread_info.h.

clear_task_syscall_work(child, SYSCALL_TRACE);

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/riscv/kernel/ptrace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2ae8280ae475..44f4b1ca315d 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -212,7 +212,6 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
 
 void ptrace_disable(struct task_struct *child)
 {
-	clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
 }
 
 long arch_ptrace(struct task_struct *child, long request,
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
