Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E56FECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 02:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoldqAY7NzNQMWBbUlNpwxKzMnbd6cwbYodhCzU5nx8=; b=Ft/c1XbIEBTcIG
	s/TZdOk8a1NtQSkihKB0A+GiGJWK8LI+6sGA2pAYyjydrXkgA2MXBdhM2EcUulj4qXgs0OQwtt+l3
	qtijUN3uKjoNFOXWhX4gSdk/Kk/kjNBnGf8cX3mbEyA7SxN00GFT+/mgTkfRLFqFqd+kX8a2+mgRJ
	qOn44iB3LaTSHHGMm4i24A1XO5jZCbzhsJrYG+ibn0HJGGgoHLWhkMrJnbIfVyk1bMBUablPAwLEW
	dXG8Le1C+FSLUhWTcPKqs9jZLQEbNFPeWsxCfTwpcErd462VYBTc4Y4+iXKJJ9whViGewYnEeTuv7
	BgcWLdCDUS2AfApCE8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7EX-00EfCw-7g; Thu, 08 Sep 2022 02:25:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7EU-00EfBf-DB
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 02:25:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0934618C5;
	Thu,  8 Sep 2022 02:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B717C43140;
	Thu,  8 Sep 2022 02:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662603933;
	bh=RGP7CDjbcyHeNMuZLodmYJfbkQkcESukcz8ylbmajf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LUSuHNZ8XyHDvCxyhv+RmimF0ni4tDKodRYv0Wi0RH5YmqYxFLjC2zDXh0ta6E+Tk
	 iCZTGkgTHUbpYu9A/vWbgeN8ntNdOAw9eR2udQeNE3cFYgDZMfhs/qAPQo+0sHK0hO
	 87nG4p/mMYWT/4Gf4rRlaHYoo+gwpr5OJBUgK5/bYHjqMjk6Zw80zthi+cRe3gSXVV
	 yNL8CMOo5eOAJtMsUHlNUHxv6BjBLN6ybw7FpyFCyIKIY6IKKaZOErxJrOOgX3XG1V
	 fLPHz9Vsr0B/AYn0Lzh9lN6mm8CDV8wpul7ZITR+ZTJxeX0Su2AyU8loQnryaBg3BK
	 dVuQvR60MkN+g==
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
	bigeasy@linutronix.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V4 2/8] riscv: compat_syscall_table: Fixup compile warning
Date: Wed,  7 Sep 2022 22:25:00 -0400
Message-Id: <20220908022506.1275799-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220908022506.1275799-1-guoren@kernel.org>
References: <20220908022506.1275799-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_192534_485823_0B6BF073 
X-CRM114-Status: UNSURE (   8.64  )
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
