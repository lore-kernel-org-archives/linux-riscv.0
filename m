Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986B4C52D54
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N3GOYIrBCGVzE3SX6Le4RQT7P0v1anop5WGdSLh90dw=; b=FlQkRqZ1+UqC9T
	OMPY9r28JnOasLHQxpWrvSJLoUb1+jyfQmG6DSJeo2e//miyiK3cyO7eav0n873FBMsmCTUtS0/op
	LKObDJPerIvJ6AWjs7r+hUOOlIKS6LwfeiXiGyeSrRt9DTVp3DMi8WHr0Zm79TP1REli6oJGSCVlN
	UKaM+B1xEaARjagDbMmKYeL14XXCRqRQcgwQSMMLnrW8iGh4DypYVOB7CELxE+cuItjYRKQ0WObFb
	CMtibuGHfsSOfnjjK2Fu/xPwpCp2QqGWS4TRIuhqA+AFqTBGZlM6JeG6wmd0cR7TvrMAYDyZ+CVRz
	LsosZG8/FbRthTylR3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZV0G-00000005DXG-2BVd;
	Thu, 01 Aug 2024 12:33:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZUzf-00000005DF2-12kz;
	Thu, 01 Aug 2024 12:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41F5962853;
	Thu,  1 Aug 2024 12:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A281FC32786;
	Thu,  1 Aug 2024 12:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722515597;
	bh=4aOsClOUPnAaG9L0WTgcWPLsN20TbGHJxOPzz8LH9jg=;
	h=From:To:Cc:Subject:Date:From;
	b=b6OvicIN5ag2uDECZrMW/7VfkT9HERuTj8qcQQFTP+ojAJ1xLSW9Rl/I6unXUj52n
	 I+kr2gohM/Nz2uGnehivcWGGW6nP0I9vzQOuT4aJoX9XeZPcYGg9VFmnpbqYUfrSfn
	 kL0chkz95j8GFJdvYQMjybRNX1poNzWQZQwnv8ISknQfis+9QYYgZ7IyC1RvqVvnH2
	 ifg4scGA2y9CWR7mAwdvT/OQyLlLEl3YdJR/Guj3s+igv0uix2x2NYAVO0jeZmyPKl
	 L6j6qGuylIr31wKvq/oI+vpB/3J1ktwTLQS5fNTjRY6v0WyCodIKh6EnEWB2eV8irg
	 aEUMT332EEFtA==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andreas Schwab <schwab@suse.de>,
	Florian Weimer <fweimer@redhat.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	WANG Xuerui <kernel@xen0n.name>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] syscalls: fix syscall macros for newfstat/newfstatat
Date: Thu,  1 Aug 2024 14:32:33 +0200
Message-Id: <20240801123305.2392874-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_053319_680565_97CDF342 
X-CRM114-Status: GOOD (  11.87  )
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

The __NR_newfstat and __NR_newfstatat macros accidentally got renamed
in the conversion to the syscall.tbl format, dropping the 'new' portion
of the name.

In an unrelated change, the two syscalls are no longer architecture
specific but are once more defined on all 64-bit architectures, so the
'newstat' ABI keyword can be dropped from the table as a simplification.

Fixes: Fixes: 4fe53bf2ba0a ("syscalls: add generic scripts/syscall.tbl")
Closes: https://lore.kernel.org/lkml/838053e0-b186-4e9f-9668-9a3384a71f23@app.fastmail.com/T/#t
Reported-by: Florian Weimer <fweimer@redhat.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kernel/Makefile.syscalls     | 2 +-
 arch/loongarch/kernel/Makefile.syscalls | 3 ++-
 arch/riscv/kernel/Makefile.syscalls     | 2 +-
 scripts/syscall.tbl                     | 4 ++--
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/Makefile.syscalls b/arch/arm64/kernel/Makefile.syscalls
index 3cfafd003b2d..0542a718871a 100644
--- a/arch/arm64/kernel/Makefile.syscalls
+++ b/arch/arm64/kernel/Makefile.syscalls
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 syscall_abis_32 +=
-syscall_abis_64 += renameat newstat rlimit memfd_secret
+syscall_abis_64 += renameat rlimit memfd_secret
 
 syscalltbl = arch/arm64/tools/syscall_%.tbl
diff --git a/arch/loongarch/kernel/Makefile.syscalls b/arch/loongarch/kernel/Makefile.syscalls
index 523bb411a3bc..ab7d9baa2915 100644
--- a/arch/loongarch/kernel/Makefile.syscalls
+++ b/arch/loongarch/kernel/Makefile.syscalls
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-syscall_abis_64 += newstat
+# No special ABIs on loongarch so far
+syscall_abis_64 +=
diff --git a/arch/riscv/kernel/Makefile.syscalls b/arch/riscv/kernel/Makefile.syscalls
index 52087a023b3d..9668fd1faf60 100644
--- a/arch/riscv/kernel/Makefile.syscalls
+++ b/arch/riscv/kernel/Makefile.syscalls
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 syscall_abis_32 += riscv memfd_secret
-syscall_abis_64 += riscv newstat rlimit memfd_secret
+syscall_abis_64 += riscv rlimit memfd_secret
diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 797e20ea99a2..4586a18dfe9b 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -98,9 +98,9 @@
 77	common	tee				sys_tee
 78	common	readlinkat			sys_readlinkat
 79	stat64	fstatat64			sys_fstatat64
-79	newstat	fstatat				sys_newfstatat
+79	64	newfstatat			sys_newfstatat
 80	stat64	fstat64				sys_fstat64
-80	newstat	fstat				sys_newfstat
+80	64	newfstat			sys_newfstat
 81	common	sync				sys_sync
 82	common	fsync				sys_fsync
 83	common	fdatasync			sys_fdatasync
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
