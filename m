Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC26AC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 03:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhDVbb7e4MVnZzyd2Y05Z1l13KEmGeh5FNoxNAWc9KU=; b=ml2YZ2Qb1iSHwP
	TLRwQWQY4+6JMB/LlWCsGUb7rGBxipJsu/wn0V2Ao8Q3ALZiFyjOlL9G5sV1ivla05l0q9uiJGiz9
	EZhn9wrhSUsf7UU84H+6NlGun8yvA99iiRTHebAYRKC6zYu/1ApRTs52pL9agzLsjg9EZGy/e1rj2
	JtKpzqJ7cNFrgNYBjkREbDhASIFJKvgMVJ3RfiAHOtlmHvInuWGbNp4/gvognpwZ9Ds1ACOZhVlxc
	eB0ugrV8j7TjQdZN349TGQwvr3U7zyz+7FDlPNv5QEH7/Osw0hUsLpMd2cFOKijCtFUwPbzjW7vol
	bBGGXzOiWvIE8nCeVrDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DzF-00CeBX-FF; Wed, 30 Nov 2022 03:42:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DzC-00Ce8f-Pd
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 03:42:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C1C86190D;
	Wed, 30 Nov 2022 03:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177F4C433D7;
	Wed, 30 Nov 2022 03:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669779733;
	bh=AP/C01/D0KNzYuTTynHf3ROQXEf+TYW9/7Q2FlSNrt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HMTKrqBxySKjopHM8HEQyXnrWvWdEbM9UP4natqA1Ghzg4AuffA8c+L0ZBD7SCiO7
	 ZREw28AKk4wP/1F6d+RAXnMOCfJK2sk33pQUUE/0eHvP1HzIdDmLn9N8aoyRcZ7WHq
	 Iqu2PDcYqB8k9Xr5B+OKyld9fz8D6T92gCGOM/cfRJuSYTpaVfm0r06+TCJRjjgA68
	 LzyTF0fnAHPat7/BIkWhGzmMv2GwWC3ZT0lH9TBVEBI6UZrvhnJ+yjmMC2h9vkb0/D
	 15TdpMYaUBW0zCdrn2kMd0Mb3JcsTQE4tkZ5sVZKoqnMKOBmRQhOcjbdFmcFxiV9a2
	 +Rpqqiy5+g8bA==
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
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -next V9 03/14] riscv: compat_syscall_table: Fixup compile warning
Date: Tue, 29 Nov 2022 22:40:48 -0500
Message-Id: <20221130034059.826599-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221130034059.826599-1-guoren@kernel.org>
References: <20221130034059.826599-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_194214_873076_022EF79D 
X-CRM114-Status: UNSURE (   8.73  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index db6e4b1294ba..ab333cb792fd 100644
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
