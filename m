Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64806C19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WaOSei8n8OqypeafSjAmJZNjImfCo2aPmHMgx04b1J0=; b=Hn57wX/vOzwq7d
	JJtmRvB3j3dyLB2vx+kKR0MrrAZmTZTy9wqQIRr8ako9+j5jdgFkOyu2Zr1RyfzWdWN4x2pIahl2C
	5V3WDY8EB+bmm1rpoicTeTP23nR6nRlaiJOrF0caak7EJp1thMK4pMKY1yPOD+PPHdjErvTxoLICJ
	EEjoZLE8cilUxO09rMBCaEVvQAaVh5rdY3u1JzGbh/8HZp7XaIYgV/S/ndkbjOk1pOkfpTIEpfJX+
	lCPPItu9XkXWbgRpFxvR3xipp5Z4DaFpCW1JWu2qU2QNeYTSm+goe4S+CuTwAA9LNSOHBhpsUqSPW
	2oOwFIZHc5RTzZPZ5gkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKk5J-000pbn-90; Sun, 07 Aug 2022 17:29:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKk5H-000pYh-F0; Sun, 07 Aug 2022 17:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=tMRPcSMjjbccZSrtFDCivTz/DFBFKj1Hj0OrpfCNU18=; b=RsUnPXn+b5CGYQfXWgONPsik0O
	NtaqPRVCaqPMFSeFpsTutpK7KwacMT0+/AP7t6RSuCaly0eDiFpT9fWZ3KtTDCdxVJiRFPUyLXflF
	QvyGdX9xY5S4jCKIGqVuY2O1+v/SQ1pM7xUGTe8Y1DAq5bI4pLa4gxp7ZGQSzFADhKXAuvD+YsPzT
	dsQp3tAAd3MibNz0h20NdZ8yrJv09+l2Pg8K/SFx/jM9Zjne1mnSszY4kMFs7P/Rtc2K3TilXeqYN
	+3c3ttQA2BNe9/hODzpwcTzw4tiBOro/+IRt73cYcZ1ORB/g15on7jnOxtZpwAomfeYhlTCdbt/Ol
	xwED+Sdw==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKk5E-00DB4U-MS; Sun, 07 Aug 2022 17:29:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH] asm-generic: unistd.h: make 'compat_sys_fadvise64_64' conditional
Date: Sun,  7 Aug 2022 10:28:54 -0700
Message-Id: <20220807172854.12971-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
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

Don't require 'compat_sys_fadvise64_64' when
__ARCH_WANT_COMPAT_FADVISE64_64 is not set.

Fixes this build error when CONFIG_ADVISE_SYSCALLS is not set:

include/uapi/asm-generic/unistd.h:649:49: error: 'compat_sys_fadvise64_64' undeclared here (not in a function); did you mean 'ksys_fadvise64_64'?
  649 | __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)
arch/riscv/kernel/compat_syscall_table.c:12:42: note: in definition of macro '__SYSCALL'
   12 | #define __SYSCALL(nr, call)      [nr] = (call),
include/uapi/asm-generic/unistd.h:649:1: note: in expansion of macro '__SC_COMP'
  649 | __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
 include/uapi/asm-generic/unistd.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -645,8 +645,10 @@ __SC_COMP(__NR_execve, sys_execve, compa
 #define __NR3264_mmap 222
 __SC_3264(__NR3264_mmap, sys_mmap2, sys_mmap)
 /* mm/fadvise.c */
+#ifdef __ARCH_WANT_COMPAT_FADVISE64_64
 #define __NR3264_fadvise64 223
 __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)
+#endif
 
 /* mm/, CONFIG_MMU only */
 #ifndef __ARCH_NOMMU

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
