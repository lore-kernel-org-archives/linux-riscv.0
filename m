Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A0BC19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U80aow5Fh3XSO9cm3PDXY8gRtvVLT0fEvtV/HawXpoQ=; b=eBspuPyZ7pEvGx
	1RpJk5/T1EVYJJDYTxhE2zy6YPomkETXFpBesMxfjjyM9ZUNS6TbtX/mP9HEJX4GNoJ2LavNNYSJj
	5bJQAj9GDMsETeD53AF4iVLH0UDyjj+Ie0KRV0RnKRWLWM1O5scxwHrdkuTIeCehaKNEr7JF75U7D
	iGs+kSeRMpQ7xw9CqGB5A1eR8tX1dLmWX51Ht63W/Q3gz9y06KTRWcQtebmTKe32nxl97uYjCK7M1
	YBcgHjRKhcyhF7LH9/Wf39Y/9EtMwHFvxmd+DRXdvy3NQfdP0HO9R19jwb/PaMsJydAi/SQrRwQiK
	GDQXQCviyQH/fHHfaMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKk53-000pTk-0u; Sun, 07 Aug 2022 17:28:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKk51-000pSh-JK; Sun, 07 Aug 2022 17:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OQ6HIEzvGhUBHIBVK/MMVvqDNtQvuWyey2ZBasDPQw8=; b=qWiaI30ZKgT7wPXCto/BonchEx
	ImXG1XAqUDBZ/9lA+h2rUk1iTg4dbXp/b5PwQwoHKZiKhLm66BuWm2pbiYi5ToBrxSsmNVLgfKWmd
	KdMY+X7jnjPqVyzAIrFvR+UVDE5+o9LskBdVDdoRwmMXt/TFw9NW4hsEs804QqdYNrCKTaYbhPnyn
	SZuwHVzM6dylK2g/TfOYdOBvQDXZlbrAbh9Hn8ohLn5kReIOL174+qFzZPf1WBXi5MBM4P0nUyrr6
	REYLVqUayELkiW0Kc15JSydrvWFE0Ef1yNu/UsJ/nQMGbBVhBT4Ek3mgK75z84CvczxOMi2Ka30Km
	yIInvvuQ==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKk4y-00DB4C-Gb; Sun, 07 Aug 2022 17:28:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] riscv: compat: make __ARCH_WANT_COMPAT_FADVISE64_64 conditional
Date: Sun,  7 Aug 2022 10:28:39 -0700
Message-Id: <20220807172839.12359-1-rdunlap@infradead.org>
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

When CONFIG_ADVISE_SYSCALLS is not set/enabled and CONFIG_COMPAT is
set/enabled, the riscv compat_syscall_table references
'compat_sys_fadvise64_64', which is not defined:

riscv64-linux-ld: arch/riscv/kernel/compat_syscall_table.o:(.rodata+0x6f8):
undefined reference to `compat_sys_fadvise64_64'

Only set __ARCH_WANT_COMPAT_FADVISE64_64 when CONFIG_ADVISE_SYSCALLS
is set.

Fixes: 59c10c52f573 ("riscv: compat: syscall: Add compat_sys_call_table implementation")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/unistd.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -18,8 +18,10 @@
 #define __ARCH_WANT_COMPAT_PWRITE64
 #define __ARCH_WANT_COMPAT_SYNC_FILE_RANGE
 #define __ARCH_WANT_COMPAT_READAHEAD
+#ifdef CONFIG_ADVISE_SYSCALLS
 #define __ARCH_WANT_COMPAT_FADVISE64_64
 #endif
+#endif
 
 #include <uapi/asm/unistd.h>
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
