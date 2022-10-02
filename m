Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DA7C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 01:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoldqAY7NzNQMWBbUlNpwxKzMnbd6cwbYodhCzU5nx8=; b=KUq6qMYhxmzmtm
	qeCGJkQxu1nwE7nmjCoGqB/34moEAFkIINTgpH8ywG8JKolbsxkj9hBSWmznx4gqSupwuaTRAHBrv
	O90CWGS+5R+SEGrKVvajRoKoDDaITHECvcUEoIWTF94JICUzkQQZ3wv21AaymYF/uK9WVtm/niIgk
	bypsQMH5WrIw/194hmpwQ4E3GxsfiBtc1fvkkAkBuBkJ4kSutl1llrb9gqRnK82b6T+Dj4x+WIx+q
	q09vnzbppstK8pH1c9ABFgb7wE+x7CCNjWDaesambpITa4ACaWH9wY8+0CuY3/yk4/O0vWk4ur6jl
	UDR3tX76r9wqJkfbv0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenji-00GrOt-Uk; Sun, 02 Oct 2022 01:25:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjg-00GrNR-Ak
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 01:25:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09A47B808BC;
	Sun,  2 Oct 2022 01:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943CFC4347C;
	Sun,  2 Oct 2022 01:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664673937;
	bh=RGP7CDjbcyHeNMuZLodmYJfbkQkcESukcz8ylbmajf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZMFBLn2G+UvbiLeHepXOfif7F+qyyvu9xqAvdjqn1abuX4vEe4ZrsW900oU2rSOwz
	 k7nMuuwUgyo5NPjtwiKxVf4FX854JRWGWFo9KJJjSqhD2mhkymembN351gedLUaIHd
	 juiQm6XaXgDAU253T8uG74/pMz0HoaVcQVPiaJz5XZfaofKIalSUk1N+B5KYJPdYz+
	 DmqxXUxoG9tVvwGk+6X5xYC7InK9/MpQcq4xltKnHqULcgVuM23HNrcMHENOPPGJ20
	 g/JeWs1dNqH/IUXOKhYYPMWcQ7rWrc0n9rLI3N6J5R6M/scPM9ck0bqunHZ6xyIKvR
	 KDPF9PpIoAJlw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V6 02/11] riscv: compat_syscall_table: Fixup compile warning
Date: Sat,  1 Oct 2022 21:24:42 -0400
Message-Id: <20221002012451.2351127-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221002012451.2351127-1-guoren@kernel.org>
References: <20221002012451.2351127-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_182540_518548_DDDCA5DC 
X-CRM114-Status: UNSURE (   7.52  )
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

From: Guo Ren <guoren@linux.alibaba.com>

../arch/riscv/kernel/compat_syscall_table.c:12:41: warning: initialized
field overwritten [-Woverride-init]
   12 | #define __SYSCALL(nr, call)      [nr] = (call),
      |                                         ^
../include/uapi/asm-generic/unistd.h:567:1: note: in expansion of macro
'__SYSCALL'
  567 | __SYSCALL(__NR_semget, sys_semget)

Fixes: 59c10c52f573 ("riscv: compat: syscall: Add compat_sys_call_table implementation")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/riscv/kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 33bb60a354cd..01da14e21019 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -9,6 +9,7 @@ CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
 endif
 CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
+CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
 
 ifdef CONFIG_KEXEC
 AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
