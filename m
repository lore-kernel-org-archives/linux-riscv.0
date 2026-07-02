Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EE8C43602
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fyKPGE001+HvvGqSL8kvvJZ6EA2zanwz8dUaxsW3fWE=; b=qlOGMfs9p5+0tY
	egneqLNZvuj4O4nQK7uJLjMLOQ+dH/84OedsAFwYaAF05tsBE09XQv6yj+WbOf5M9v+woK6Sh7QfW
	iHJnx5ne3OG10AK78iJMi31mqLSFS+fQsSEfUbYaYodRK6VxS4yto9uxfdtrrqbh0TkYIXyExz74n
	MRvvnv3swBT7mBxTedSTtQxPi2oicIJ/uCuhbDsXZAL2cxcuu71Wx2rZqNpJmeUqpGdDNixq5E9/+
	cBesxg0hzym6r2JCxh4jDjeMk62AzWNyo8LhLc0BgkhZ7xP5E3YuGTmYiaxhpWexBfWYSODUdXYBB
	dDtVWGD3NkEdGFmEC0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZ9-00000004Wuu-2gNg;
	Thu, 02 Jul 2026 13:34:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZ6-00000004WtM-3Xof
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 13:34:54 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782999290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fgaEeE4rkfFa+pYvFYVTAxs9hRvx+lYZqfvMiA1sh6s=;
	b=pKPKhvYQ/yeSjvNaokKeHUWiNygbXfB2aAU/X1st8O//kL7w2bjQrwCm1WhVf1bUdHOUl6
	uE1CPkiM2citGWvPyJsoc7vSAjo45ryHqg3ed7NQsWS3kepmeJweYks0Ipe8X+lQr7Agnr
	KIM9FZkHxB+Oe92Y0aDxn5CokLvTmM7M+pjGzHENHe8pjDe7buJZgHPwbv1JfaHssFagf4
	Nr03p13m9jA2f6UW5MzwPqDf/MEzAr4my0dONnaE3aRZn289VTMIRYzBwEQCc/A/jtpwWW
	+PR7yx4YzOMOM4HVbSzLesch0nOAL9VOsEPO7UHoXdWf4LFTuv7aFVHzFSsJJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782999290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fgaEeE4rkfFa+pYvFYVTAxs9hRvx+lYZqfvMiA1sh6s=;
	b=srcclTVtTal003qWKqa5yZeRxmK8qY+yAU+v3YLnyX75/na2V8rLsOO3NXdK4eg6heUsSO
	80b8y7XqnU/4/8BA==
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
Subject: [PATCH v2 0/5] riscv: vdso: Implement __vdso_futex_robust_try_unlock()
Date: Thu,  2 Jul 2026 15:34:36 +0200
Message-ID: <cover.1782998849.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063453_026658_420F8FBB 
X-CRM114-Status: UNSURE (   8.40  )
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
 arch/riscv/kernel/compat_vdso/Makefile     | 27 ++++---
 arch/riscv/kernel/compat_vdso/futex.c      |  3 +
 arch/riscv/kernel/vdso.c                   | 57 +++++++++++++++
 arch/riscv/kernel/vdso/Makefile            | 14 +++-
 arch/riscv/kernel/vdso/futex.c             | 84 ++++++++++++++++++++++
 arch/riscv/kernel/vdso/vdso.lds.S          |  8 +++
 10 files changed, 210 insertions(+), 11 deletions(-)
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
