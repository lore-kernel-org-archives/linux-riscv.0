Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A404C44509
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Message-ID
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DqkkBlXEuT1HhQw3m+KGbT7amtFPHH7OKbtBcfANyYE=; b=ID1UT10F20bgAF
	P+nvuzPb4ahAdNXAocGp04ItyJiE7BdgHhGs8SKsQRmkAoBUYvsLy+N36yUHrwSbAIIcaQ6oL+P0u
	4vOgTTTsX6Jc2X+/EW2uMx1hbst+ivXyiHogw5YTo3Ldo1pBaf/ICLHvDce4raMlUFDrhlxOd78Xv
	n8gSwhmWsv7fOWSL98Rp8sj9ap0csKKl/kJHKr2ievBp3oHI9i0BGeWyoldqpw4YHT2BHvg2v5RPL
	fg78HKoyE4nYk3exN0qqMtEfftdBCakLGHewb2QRqDij818D4IG3KvP5OO7xEAiOeqUOgMjcAzDHX
	SiRvGL1S/9Vw2wD/9cug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1fq-00000007mFn-3wfh;
	Sun, 12 Jul 2026 21:25:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1fp-00000007mFh-1XtL
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 21:25:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A67760018;
	Sun, 12 Jul 2026 21:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767DE1F000E9;
	Sun, 12 Jul 2026 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783891516;
	bh=lwBg36/x+UtK8CJqmuUc9WLztI2cbur8/uNJ6nqvy3A=;
	h=Date:From:To:Cc:Subject;
	b=iUihrXXVEGq2SYK9UQGaK/ixJHkvadpYQ4DOH4S/nAejgcD/b7GUWwBZ5jduOfGTp
	 i2GmHCBrjqnQqhqfy4uM2Nm1ZqAGGaYxEbfVavR0WHrnlVlBrqHw8lCXBF+I+H4UYL
	 rp//e3HRjshpQ+bNYw6Guvww3ARF7O7HJsAP1v+ktF8f16Gw0ufg7Kv+IvYnQqmnDd
	 nOouURl3ey8GIdW1RylaSmhjzQZmjZJj0NnC6v8qojx/WotJKtYEUPvgrJhaLKZf29
	 MvSWr2X6GY8DZQ/V7/XPuTag3oQfy5KgCPYjv4bZ3cYiQUKKlTvDFxz1jtaHpcPEp9
	 9manpI38rMBQQ==
Date: Sun, 12 Jul 2026 23:25:12 +0200
Message-ID: <20260712134433.549076055@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 x86@kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Magnus Lindholm <linmag7@gmail.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Radu Rendec <radu@rendec.net>
Subject: [patch 0/4] entry: Rework syscall skip logic
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This are the reworked leftovers of the larger entry logic rework series,
which can be found here:

  https://lore.kernel.org/lkml/20260707181957.433213175@kernel.org

The undisputed part of the series has been merged into:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry

After a fruitless discussion about the most resilent approach, I decided to
give up wasting my time and reworked the series so it caters to the desire
of powerpc and s390 to be special.

That results in almost identical behavior except for the case where
tracing/probe/BPF sets the syscall number to -1 (or any other out of range
value) and also sets the syscall return value to something different than
-ENOSYS.

PowerPC and S390 will overwrite that value with -ENOSYS.

Loongarch, RISC-V and x86 will not overwrite it because those architectures
preset the return value to -ENOSYS and skip out of range syscalls
completely. Loongarch and RISC-V always did the out of range skip. X86
gained that in the already applied rework, which means that the final patch
which splits the skip decision from the syscall number does not longer
change x86 behavior for the above case.

Documentation is also updated and describes the two implementation variants
and the subtle difference in the resulting behavior.

The series applies on top of:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry

and is also available from git:

  git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry/rework

Thanks,

	tglx
---
 Documentation/core-api/entry.rst |   45 +++++++++++++++++++++++-------
 arch/loongarch/kernel/syscall.c  |   14 ++++-----
 arch/powerpc/kernel/syscall.c    |    3 +-
 arch/riscv/kernel/traps.c        |   11 +++----
 arch/s390/kernel/syscall.c       |    7 +++-
 arch/x86/entry/syscall_32.c      |   25 ++++++++--------
 arch/x86/entry/syscall_64.c      |   12 ++++----
 include/linux/entry-common.h     |   58 +++++++++++++++++----------------------
 kernel/entry/syscall-common.c    |   19 ++++++++----
 9 files changed, 110 insertions(+), 84 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
