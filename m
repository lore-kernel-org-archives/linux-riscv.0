Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A233FC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oj/NenxL+hQ9A+cTBhIxnNlmiIrOGLUHYPp5YHf0VvA=; b=HRVKbpSkZAM+xi
	RxkgbS2nEZye0yBGnSn+G6csKC+EfaW1rg/gdBYoV9hne541533tAvIsRqaJWvlLLMCPxrXKdgwUw
	cCrvMkh+zupdGxQZBc7nDwdQ0Q8Eo7zOKAp1Y/yMWJ7C88wweuK2tlLjsxoY1sDlxkHNEJDHAFESg
	uGXDwt101LmanuJH4MEJHpQ7Mvw8pC7NBtcWpNZuIBy2M8z1U6M0adpuz9DIowAo70fC59tRVt990
	AT7XD6tuFBkEOKAerkvO0nTHBDEYxDpbkZTqMOXn14b8dR9FEpaMicXvcH9YMPYZWTkjrxM2a6D6m
	G/Pdffstrd+6r75RSbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwR-009u4q-17;
	Wed, 17 May 2023 13:11:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwN-009u3B-3B;
	Wed, 17 May 2023 13:11:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4780D646FA;
	Wed, 17 May 2023 13:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A30C433EF;
	Wed, 17 May 2023 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329098;
	bh=Kl24PXPpp3YYxyqhSLbqSf3q6HFW4Damtq3CSDCskSI=;
	h=From:To:Cc:Subject:Date:From;
	b=ZvzxaL6miwnra1zIxCrPjbAaZ1S77jiTGPi+TWHY99GZHeuIe7t1zDn5PBjrO3aCc
	 +d603Lljcw85VawWja8nf6gaVWqRpl9Nj7tZzRXkzY5DkbE/NOQHT5JDlBFMhSRcbN
	 awDudFpa43agxm5K7LEfe328a3TXgVCRPNgQPIxdX1MMxEhTwcwBzOmH304yaQOTEA
	 LAQ8CsSDBiyW+7ihNfrrYmE6bhtk+vaAzUlnNGRodoqU+/ltoPSxqzWVfnBSDhDAve
	 m3pzvoi4G5qi9TF3RdkL/eQ12VTNlGpm/zby+dxVvfvof+Jx9Ig7iudo7tccKBreR5
	 3KVJ0fYIn0zfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	audit@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 00/14] mm/init/kernel: missing-prototypes warnings
Date: Wed, 17 May 2023 15:10:48 +0200
Message-Id: <20230517131102.934196-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061140_151898_3D4718C3 
X-CRM114-Status: GOOD (  17.21  )
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

From: Arnd Bergmann <arnd@arndb.de>

These are patches addressing -Wmissing-prototypes warnings in common
kernel code and memory management code files that usually get merged
through the -mm tree.

Andrew, can you pick these up in the -mm tree?

     Arnd

Arnd Bergmann (14):
  mm: percpu: unhide pcpu_embed_first_chunk prototype
  mm: page_poison: always declare __kernel_map_pages() function
  mm: sparse: mark populate_section_memmap() static
  audit: avoid missing-prototype warnings
  lib: devmem_is_allowed: include linux/io.h
  locking: add lockevent_read() prototype
  panic: hide unused global functions
  panic: make function declarations visible
  kunit: include debugfs header file
  suspend: add a arch_resume_nosmt() prototype
  init: consolidate prototypes in linux/init.h
  init: move cifs_root_data() prototype into linux/mount.h
  thread_info: move function declarations to linux/thread_info.h
  time_namespace: always provide arch_get_vdso_data() prototype for vdso

 arch/arm/include/asm/irq.h           |  1 -
 arch/arm64/include/asm/thread_info.h |  4 ----
 arch/microblaze/include/asm/setup.h  |  2 --
 arch/mips/include/asm/irq.h          |  1 -
 arch/parisc/kernel/smp.c             |  1 -
 arch/powerpc/include/asm/irq.h       |  1 -
 arch/riscv/include/asm/irq.h         |  2 --
 arch/riscv/include/asm/timex.h       |  2 --
 arch/s390/include/asm/thread_info.h  |  3 ---
 arch/s390/kernel/entry.h             |  2 --
 arch/sh/include/asm/irq.h            |  1 -
 arch/sh/include/asm/rtc.h            |  2 --
 arch/sh/include/asm/thread_info.h    |  3 ---
 arch/sparc/include/asm/irq_32.h      |  1 -
 arch/sparc/include/asm/irq_64.h      |  1 -
 arch/sparc/include/asm/timer_64.h    |  1 -
 arch/sparc/kernel/kernel.h           |  4 ----
 arch/x86/include/asm/irq.h           |  2 --
 arch/x86/include/asm/mem_encrypt.h   |  3 ---
 arch/x86/include/asm/thread_info.h   |  3 ---
 arch/x86/include/asm/time.h          |  1 -
 arch/x86/include/asm/tsc.h           |  1 -
 include/asm-generic/bug.h            |  5 +++--
 include/linux/acpi.h                 |  3 ++-
 include/linux/audit.h                |  2 --
 include/linux/audit_arch.h           |  2 ++
 include/linux/delay.h                |  1 +
 include/linux/init.h                 | 20 ++++++++++++++++++++
 include/linux/mm.h                   |  3 +--
 include/linux/mount.h                |  2 ++
 include/linux/panic.h                |  3 +++
 include/linux/percpu.h               |  2 --
 include/linux/suspend.h              |  2 ++
 include/linux/thread_info.h          |  5 +++++
 include/linux/time_namespace.h       |  3 ++-
 init/do_mounts.c                     |  2 --
 init/main.c                          | 18 ------------------
 kernel/audit.h                       |  2 +-
 kernel/locking/lock_events.h         |  4 ++++
 kernel/panic.c                       |  3 +--
 lib/devmem_is_allowed.c              |  1 +
 lib/kunit/debugfs.c                  |  1 +
 mm/sparse.c                          |  2 +-
 43 files changed, 52 insertions(+), 76 deletions(-)

-- 
2.39.2


Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: audit@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: kunit-dev@googlegroups.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
