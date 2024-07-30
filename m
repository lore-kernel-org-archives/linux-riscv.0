Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC3AC3DA7E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vh3IUe9gQE638wpQhGiG6uB2kqcmU8qcyiBe5tPH1RY=; b=uvNfGQr497mryr
	SES0hW+FFjEArKMdk/wGTJZAw2+liKoWJRIFEsXJkDrJNAGKAh/BtqBaTrAVbe1DxkbKAt4ILTZgD
	Mu7NObr03TssmMm0IGs/uKmyaOD5Lb4YtF+W2XC1P/WrQlyVsEiUzlm6yHPsSHr665irjYZbZRupH
	1Nizg2cADTmD2OplwykG9LEyHt4JBKnsaq9hEvVi4+n3gpyIWoCCRlwzNKSThFzE/LgtoTVH7OEpQ
	gNEKJbNtF6dd/aHEGkKzdN5d+bGR6S4w5Ko+XLDOpNEH3psfBXgelq/rE0d7o4H3cV9pURmAcJOJu
	hSPI3PCX7bsMjawlR+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYp2Q-0000000FhvB-3bUD;
	Tue, 30 Jul 2024 15:45:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYp2N-0000000Fhu9-2aho
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 15:45:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD4B2CE10D7;
	Tue, 30 Jul 2024 15:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA7FC32782;
	Tue, 30 Jul 2024 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722354317;
	bh=nJ11jqt4kbADJb/lh6ehcVySsKlovodsRd6q1QQ61UU=;
	h=From:To:Cc:Subject:Date:From;
	b=Y498xCwB+edKx6vBTJBE4pdVSrC8AgicpE9Gk6/Tr14THpD+ONc6UiOz93KDvt2NO
	 +wouLlUN0PwZcaTOeow+waEgT3Cb7+iMtJesXltyxHGl5s2EY+KCzrRImYJExzJvl2
	 HjXzON4b5vU097XkkTkkHR+poLiMbHZAePzx25reRDnuxGeoY9WYFbsgV5nrUqoE4g
	 h5vzSs5V9i0Tw4VOR7VHpwrrMkcTA7hqJjWcHVrWZUVh1LHSNdxFvu6l3kD45C5qmo
	 bqTA1IuDQJXJY6CB6H0GicwmIKkNAjr0InmOKHMXYZ91fCmNmN6Mh8dUJ3jUc/BNoX
	 Xe7dPlG1FOk+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jiri Olsa <jolsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC] uretprobe: change syscall number, again
Date: Tue, 30 Jul 2024 17:43:36 +0200
Message-Id: <20240730154500.3155437-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_084520_237597_4A2082B0 
X-CRM114-Status: GOOD (  20.32  )
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

Despite multiple attempts to get the syscall number assignment right
for the newly added uretprobe syscall, we ended up with a bit of a mess:

 - The number is defined as 467 based on the assumption that the
   xattrat family of syscalls would use 463 through 466, but those
   did not make it into 6.11.

 - The include/uapi/asm-generic/unistd.h file still lists the number
   463, but the new scripts/syscall.tbl that was supposed to have the
   same data lists 467 instead as the number for arc, arm64, csky,
   hexagon, loongarch, nios2, openrisc and riscv. None of these
   architectures actually provide a uretprobe syscall.

 - All the other architectures (powerpc, arm, mips, ...) don't list
   this syscall at all.

There are two ways to make it consistent again: either list it with
the same syscall number on all architectures, or only list it on x86
but not in scripts/syscall.tbl and asm-generic/unistd.h.

Based on the most recent discussion, it seems like we won't need it
anywhere else, so just remove the inconsistent assignment and instead
move the x86 number to the next available one in the architecture
specific range, which is 335.

Fixes: 5c28424e9a34 ("syscalls: Fix to add sys_uretprobe to syscall.tbl")
Fixes: 190fec72df4a ("uprobe: Wire up uretprobe system call")
Fixes: 63ded110979b ("uprobe: Change uretprobe syscall scope and number")
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I think we should fix this as soon as possible. Please let me know if
you agree on this approach, or prefer one of the alternatives.

I've queued up this version in the asm-generic tree so I can send a
pull request in the next few days, but I'm fine with doing this a
differently if someone has a stronger opinion on what numbers to
assign for it on earch architecture.

 arch/x86/entry/syscalls/syscall_64.tbl | 2 +-
 include/uapi/asm-generic/unistd.h      | 5 +----
 scripts/syscall.tbl                    | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index 83073fa3c989..7093ee21c0d1 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -344,6 +344,7 @@
 332	common	statx			sys_statx
 333	common	io_pgetevents		sys_io_pgetevents
 334	common	rseq			sys_rseq
+335	common	uretprobe		sys_uretprobe
 # don't use numbers 387 through 423, add new calls after the last
 # 'common' entry
 424	common	pidfd_send_signal	sys_pidfd_send_signal
@@ -385,7 +386,6 @@
 460	common	lsm_set_self_attr	sys_lsm_set_self_attr
 461	common	lsm_list_modules	sys_lsm_list_modules
 462 	common  mseal			sys_mseal
-467	common	uretprobe		sys_uretprobe
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 985a262d0f9e..5bf6148cac2b 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -841,11 +841,8 @@ __SYSCALL(__NR_lsm_list_modules, sys_lsm_list_modules)
 #define __NR_mseal 462
 __SYSCALL(__NR_mseal, sys_mseal)
 
-#define __NR_uretprobe 463
-__SYSCALL(__NR_uretprobe, sys_uretprobe)
-
 #undef __NR_syscalls
-#define __NR_syscalls 464
+#define __NR_syscalls 463
 
 /*
  * 32 bit systems traditionally used different
diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 591d85e8ca7e..797e20ea99a2 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -402,4 +402,3 @@
 460	common	lsm_set_self_attr		sys_lsm_set_self_attr
 461	common	lsm_list_modules		sys_lsm_list_modules
 462	common	mseal				sys_mseal
-467	common	uretprobe			sys_uretprobe
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
