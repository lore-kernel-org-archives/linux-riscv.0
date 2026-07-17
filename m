Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7287C44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v6LjAHXqadcoylHDmbUbz68IMUGpFjtl7nEy83c63NU=; b=IwTN20M7hAUpl+
	HUY435PPeFPR9aUAqbC1feTt6HyqfzHV17A7UJkJgVST4FysUdp8bD2rqATLu5XcnlTgiYgO8P+tg
	Yr9C94yq5m+4S4El4jKGkRSyqU2Cxq/SFVwOX5v0HrUOnXAZRlqJHM7OEs/P+S1N/nShcHb0jv2Z4
	7hDRpjT9m9dUE33iZ/XGi8l9J+pmIR06dPT3IkhvhmqkFDLVtJhOYFePRNKi5TpKuyZ4fAgokpvae
	0eUVK8OdL9+KgQ17/h2pelXibL406bI0lg+4+XAVBx3Cu6ffIejrQmBF6WYdGONl/vXecno1+ieAv
	EGWzeUzNSvdbMCR7ziHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdb0-00000001Z33-0fuI;
	Fri, 17 Jul 2026 08:06:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdav-00000001Z00-3KxR
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 08:06:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784275607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2IXv/auCQMOhlYTdD7CsRZfqNYTIs41d1Ye7bpHKjwA=;
	b=vMe+mOG83SvgEtWLYjE3csuliX4kB/W/lvZ0+s5RRQgB9zwSc23LynJ3NliSmHGv/tDPsz
	8S0kR4N1U5uXGcyoJ86Fjlsj459w9XCzda63PRm2rsZ109ZvjxdjSfMBUlpTYvPZ5WDf8R
	GdbajTODBfOMdtbPtLQXUtUHfk40oOmDESCC4IbOsAEjabkRBx6SV/9Iz0qaMhvbEZZmOM
	o5f0/7/xTyVIE1VgZOdkz9+civLWb4ngIDq1ciXzsMcNPxaOcys/jkI8lcZGHpp50lbi7h
	hneQRHEJowPA2OMcJOCDE2/uwEzoQ4Upj3oEdHOm2+7yqITQQrqHeCPdrWbleg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784275607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2IXv/auCQMOhlYTdD7CsRZfqNYTIs41d1Ye7bpHKjwA=;
	b=3T2ZNlAws//NKt9Qti7hKJErNcdK1lkkVJxGOOtKgRGcCZwDGLuO5kSr5/knGpZC+oeN0k
	u268y9kauXrlHICg==
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
Subject: [PATCH v3 0/5] riscv: vdso: Implement __vdso_futex_robust_try_unlock()
Date: Fri, 17 Jul 2026 10:06:33 +0200
Message-ID: <cover.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_010653_983569_3BCF77CE 
X-CRM114-Status: UNSURE (   8.29  )
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

This series adds new vdso futex entries, allowing user to address the
robust futex race condition regarding clearing the
robust_list_head::list_op_pending pointer.

Thomas wrote a summary of the problem:
https://lore.kernel.org/lkml/20260602084648.462672743@kernel.org/

The core infrastructure has been implemented along with x86 support. This
series adds RISC-V support.

The first 4 patches prepare compat vdso Makefile. The final patch is the
main show.

v3:
  - add missing include guard
  - switch to if/else for compare-and-exchange vs load-reserved/store-conditional

v2:
  - address Sashiko's comments

Nam Cao (5):
  riscv: compat_vdso: switch to standard kbuild rule
  riscv: compat_vdso: Allow *.c source files
  riscv: compat_vdso: Introduce COMPAT_MARCH variable
  riscv: compat_vdso: Build with zacas if available
  riscv: vdso: Implement __vdso_futex_robust_try_unlock()

 arch/riscv/Kconfig                         |  1 +
 arch/riscv/include/asm/cpufeature-macros.h |  2 +
 arch/riscv/include/asm/futex_robust.h      | 16 +++++
 arch/riscv/include/asm/vdso/futex.h        | 14 ++++
 arch/riscv/kernel/compat_vdso/Makefile     | 27 ++++---
 arch/riscv/kernel/compat_vdso/futex.c      |  3 +
 arch/riscv/kernel/vdso.c                   | 61 ++++++++++++++++
 arch/riscv/kernel/vdso/Makefile            | 14 +++-
 arch/riscv/kernel/vdso/futex.c             | 84 ++++++++++++++++++++++
 arch/riscv/kernel/vdso/vdso.lds.S          |  8 +++
 10 files changed, 219 insertions(+), 11 deletions(-)
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
