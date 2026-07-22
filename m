Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC37C4453F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ATw6b3lMIKvbbHnO2OYsprFaU5tsWGe8b/ntAyOTSR8=; b=q1fwR1pbeNJtv+
	p2kzxeAbbNZDeVMtfRg/6gZI4SxgcTKbbft1S9O+tvX4AQp5opW+Ju78XcsDTPDJT91mjggzwPTUd
	iQNuiNYSnydZxjm8b667S+skeqlRi7MzL6Xse5WOtwX4fWAK6il6st3ldRrrpfOg2+Hd9FeXAEng0
	3xBS3FJ9YAs/NhJliICRH2LoMGJlTjL9XLSs1plQeqw3ug/JVPZ6R+XLCgD2C/tEi4w/rLvg0tx/2
	2LqksZn2AIAsOuYbxCT7KIn9guSCTzSwPj37jOw8KZ0BF/bHuvN7eQK/8aUTV5cOYElof6n4yJIyz
	hG84RqOWwh7UJpTszIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSvd-0000000BLCL-0ujT;
	Wed, 22 Jul 2026 09:07:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSvY-0000000BL9t-3X34
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 09:07:47 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784711261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MJ6My1kcc2rfpDz6JJvXAoGwCUk24EH1HlDzUbeVWZs=;
	b=FkUeQ+MJN/CV2+gCDEXC5NEoVjHuzRcPy81+10F/y2WHlGazF6iu0cotmcaqooCI8WwqDv
	HeTqXWXSGbhBUtOHI6KHhZ00Ng/Sk0nzzKGq2v9Y/gsyWXV/KmoQ6Wl80dxHMo3DyVt1GA
	J00eQZl3IFNTs+py0aqIlJfdfVrR9ypmnZNbt74OwLJoPtH23v+eZnPH9BgoR0HRbPSROx
	kFCCi769MaFgGufGl4Kf0Frr67I4UWIUh4XUKDKgcDCMcfB0Z5QCreLmpvSZGcwZrWgh55
	ac4AU/7jGW4RnIe7kEBvfNXZXuHrCN51pLLwFZPP2e1PLOVYoOPJNEaNoG48qQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784711261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MJ6My1kcc2rfpDz6JJvXAoGwCUk24EH1HlDzUbeVWZs=;
	b=Vz1RSELRRH9mEkgLR5sQHkoxcUHB2BcKWdZ40rCthSS85yP4pIcJ+/8nmwlvLXXoI7dB2G
	uq9k2RVP9exxHpBA==
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
Subject: [PATCH v4 0/3] riscv: vdso: Implement __vdso_futex_robust_try_unlock()
Date: Wed, 22 Jul 2026 11:06:41 +0200
Message-ID: <cover.1784710768.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020745_023335_5FE19ADF 
X-CRM114-Status: UNSURE (   8.89  )
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

v4:
  - fix minor whitespace issue
  - stop touching -march in Makefile, instead use .option arch

v3:
  - add missing include guard
  - switch to if/else for compare-and-exchange vs load-reserved/store-conditional

v2:
  - address Sashiko's comments


Nam Cao (3):
  riscv: compat_vdso: switch to standard kbuild rule
  riscv: compat_vdso: Allow *.c source files
  riscv: vdso: Implement __vdso_futex_robust_try_unlock()

 arch/riscv/Kconfig                         |  1 +
 arch/riscv/include/asm/cpufeature-macros.h |  2 +
 arch/riscv/include/asm/futex_robust.h      | 16 ++++
 arch/riscv/include/asm/vdso/futex.h        | 14 ++++
 arch/riscv/kernel/compat_vdso/Makefile     | 16 ++--
 arch/riscv/kernel/compat_vdso/futex.c      |  3 +
 arch/riscv/kernel/vdso.c                   | 61 +++++++++++++++
 arch/riscv/kernel/vdso/Makefile            |  7 +-
 arch/riscv/kernel/vdso/futex.c             | 87 ++++++++++++++++++++++
 arch/riscv/kernel/vdso/vdso.lds.S          |  8 ++
 10 files changed, 206 insertions(+), 9 deletions(-)
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
