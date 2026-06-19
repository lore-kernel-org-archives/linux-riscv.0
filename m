Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A77CDB46B
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dy7CLyGyn6/ymim0Bsv1G1Md0WexLmX6zEzyyEkaCkM=; b=XA080FqEOlGdo8
	g+T8DtdA/RP8uB/v4Ul4Isx3RR59nncfTivoHoPBbuv35pJr99muLfIDMkhUUXklEC7LIJ1D4a2HD
	kOb56bauaIyxnZ/hasPc9duNLOlv/hI1dFvaKFI2emZ8J1ASnoVfFlE5z93cR5JuG0EKi1Hz+vFR1
	5bQu7bm+GBnLbBTVLm7xQ/EZysTnmtuzeZV6gksT5Tkb38zGG0+TDYD+QqEQ9u8yZUrnowq8d4jOq
	YH0yAtaXpQ9Qj+gYOvQsWrHzFSmq5sGGcdtFPpplTU0N66xTYCh43vxFGoxIK7FrptQUOv/9Z/A4o
	Kd5idzevbX0+EuT5+ToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwZ-00000002Y87-18AY;
	Fri, 19 Jun 2026 14:11:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwT-00000002Y3m-16lM
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 14:11:36 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781878290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bIkCcr3s/ET6GXkklbPYzwQfPQJ0+2OoEtXusV9PgKc=;
	b=dnqKsWYbwOF6Sr/ovR9wYxFtTKLMrRUtbLObMbW8Ug2tjqxgJJYCzBOt3XrNHTRnJSUPeu
	UwaSENsy7T8xeSLDhYSwBrJbAXaQ57igXnGD63EWeJ9546LpL9alIa0ZWy+laK5bK+Wvd1
	TZm2mA+dXRJzuPAVvTWoG7G0sqGGvai8GPd73mfvEjA9trlNc0ddeMA0aukvzf/pe52yDI
	mUb07+tfwifVvqLfRQ45TwKKGZuRXfkjAK+mllB79oipHjxzM1E1lhSfPGDwD6oFpY1iE5
	l/Bs4DR/KMyTpaZN11zholcGe7xpYIAlZARrOxVMn/5odr3E9sDwCyK4GChl6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781878290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bIkCcr3s/ET6GXkklbPYzwQfPQJ0+2OoEtXusV9PgKc=;
	b=oNRmoxKwXPy7YYIPsPfwddBgExKgxjxoOYBXFZ28/T1lI2Oc9vRthZOD4z8u/9thcR2oMP
	rBjFKKYBk76G4mCA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/5] riscv: vdso: Implement __vdso_futex_robust_try_unlock()
Date: Fri, 19 Jun 2026 16:11:16 +0200
Message-ID: <cover.1781876501.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_071133_452755_DE72E526 
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

This series adds new vdso futex entries, allowing user to address the robust
futex race condition regarding clearing the robust_list_head::list_op_pending
pointer.

Thomas wrote a summary of the problem:
https://lore.kernel.org/lkml/20260602084648.462672743@kernel.org/

The core infrastructure has been implemented along with x86 support. This
series adds RISC-V support.

The first 4 patches prepare compat vdso Makefile. The final patch is the main
show.

Nam Cao (5):
  riscv: compat_vdso: switch to standard kbuild rule
  riscv: compat_vdso: Allow *.c source files
  riscv: compat_vdso: Introduce COMPAT_MARCH variable
  riscv: compat_vdso: Build with zacas if available
  riscv: vdso: Implement __vdso_futex_robust_try_unlock()

 arch/riscv/Kconfig                         |  1 +
 arch/riscv/include/asm/cpufeature-macros.h |  2 +
 arch/riscv/include/asm/futex_robust.h      | 16 +++++
 arch/riscv/include/asm/vdso/futex.h        |  9 +++
 arch/riscv/kernel/compat_vdso/Makefile     | 26 ++++---
 arch/riscv/kernel/compat_vdso/futex.c      |  3 +
 arch/riscv/kernel/vdso.c                   | 56 +++++++++++++++
 arch/riscv/kernel/vdso/Makefile            | 14 +++-
 arch/riscv/kernel/vdso/futex.c             | 84 ++++++++++++++++++++++
 arch/riscv/kernel/vdso/vdso.lds.S          |  8 +++
 10 files changed, 209 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/include/asm/futex_robust.h
 create mode 100644 arch/riscv/include/asm/vdso/futex.h
 create mode 100644 arch/riscv/kernel/compat_vdso/futex.c
 create mode 100644 arch/riscv/kernel/vdso/futex.c

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
