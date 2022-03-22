Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70801C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqqUrkpOmbDPxMeHaK1mSoOm+LzO1kMnlC+Hw0fDzzE=; b=YlCibzmTGLjgHo
	f74/LQtDHoLRwtiezBKB459ugzDd1iBfcg7djl2OWr2JvtZxepLvlZCiHKeDV6luedpFeoucApDu9
	h/giO2o/rPKyLutU9pRInh2aogd3+0pvEiVbEjY1iwyozY4PbF8PRPkXreupaa27q58ohKSj0yADM
	N+LGYyX0bebIL0cp/W3xIkygO3inCypp1u6nunHNN9Mwx4JVu/0jS2RHJeZ48+4Totjcz17+6dAte
	B80moP6hj64lDoD3mKZDqO5PLO90pcSkBFjQtt83jCLLngT1omElLyYG43Yn2XgMGFQA/XgvSZMfF
	EwW5JQskNwaYur+kPWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWflB-00BJkV-LV; Tue, 22 Mar 2022 14:45:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWfh4-00BHAu-Cn; Tue, 22 Mar 2022 14:41:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB1D4B81CFB;
 Tue, 22 Mar 2022 14:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2468C340EC;
 Tue, 22 Mar 2022 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647960062;
 bh=WR+ViwuRqnCNHeWZRXz67/g9MyXNDCz9XQM2h/2HeVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S/VIFryMNJMFV/I8i+eo0QdCeg4pc+VG0av2aVlxvC18mXiiD9qOREEiJV748aNaL
 TmSgxyUXSsLgJTh+wOrNdLsLwFih7pOk83KfL85gUyRxjh7pbVBpkulERfsEE38dnS
 CZeIHv8+xVv19GlvjvkdxvZGBpmtKwXTvsBWUPt3Z5tyeUCzYdBvSHbpoAFeUb0uyU
 OLeY76e7zfN9c4Et9ClcQvVhwCIXx4jN1ScUL6XDLLKCsheoQcQ/Ai/gPbqXk3mHFR
 qdZQ8bJbLG+bj39L4sn2aeA/p2UIJ+49ZJ4D/qXg0lHDTZgvkMvVltV0Lta6S3VF10
 +nwDiWD10hL+g==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V9 07/20] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
Date: Tue, 22 Mar 2022 22:39:50 +0800
Message-Id: <20220322144003.2357128-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322144003.2357128-1-guoren@kernel.org>
References: <20220322144003.2357128-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_074106_735609_97195D01 
X-CRM114-Status: GOOD (  11.48  )
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

Make "uapi asm unistd.h" could be used for architectures' COMPAT
mode. The __SYSCALL_COMPAT is first used in riscv.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 include/uapi/asm-generic/unistd.h       | 4 ++--
 tools/include/uapi/asm-generic/unistd.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 1c48b0ae3ba3..45fa180cc56a 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -383,7 +383,7 @@ __SYSCALL(__NR_syslog, sys_syslog)
 
 /* kernel/ptrace.c */
 #define __NR_ptrace 117
-__SYSCALL(__NR_ptrace, sys_ptrace)
+__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
 
 /* kernel/sched/core.c */
 #define __NR_sched_setparam 118
@@ -779,7 +779,7 @@ __SYSCALL(__NR_rseq, sys_rseq)
 #define __NR_kexec_file_load 294
 __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
 /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
-#if __BITS_PER_LONG == 32
+#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
 #define __NR_clock_gettime64 403
 __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
 #define __NR_clock_settime64 404
diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index 1c48b0ae3ba3..45fa180cc56a 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -383,7 +383,7 @@ __SYSCALL(__NR_syslog, sys_syslog)
 
 /* kernel/ptrace.c */
 #define __NR_ptrace 117
-__SYSCALL(__NR_ptrace, sys_ptrace)
+__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
 
 /* kernel/sched/core.c */
 #define __NR_sched_setparam 118
@@ -779,7 +779,7 @@ __SYSCALL(__NR_rseq, sys_rseq)
 #define __NR_kexec_file_load 294
 __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
 /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
-#if __BITS_PER_LONG == 32
+#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
 #define __NR_clock_gettime64 403
 __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
 #define __NR_clock_settime64 404
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
