Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F1DECAAD3
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HANvT4LAzmHUKR5SdiJW2QC1c6950EdubbcDEALwZ2A=; b=4NHNdaxq6g2GM+
	D7qowBglTZmvJERoTCAD3YUQ2mH8CfdNkl2v8g5qd8dCvLk2pnqHWajgFaPZy8iMVoF4Y5kE/G9i5
	9gma083nfbBnIPoU5t9XHIQldNRgyGNsocUlj5viiAS++u8NH6RZalnaG3dMK/suQNSlSvZvA9VUA
	HcMcryL0f9qn36XGv2MbgfBkNMQiU8kXtLJrUDdmjxzLnS4zab7hEx/YrfRfMs2zUts/5RXIbfwyE
	5ibuk1n4iA/lLVSR7CnCMDeupKFcDEvhaxI9jNEHrp6XBQhJqEeg9cxvSTcHMT/AtZhr3j4xAoJp7
	Sa1n4qWPPwjTgsq1UQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUk2y-00HOZx-RP; Sun, 04 Sep 2022 07:28:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUk2w-00HOY7-Kt
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 07:27:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A2F660F12;
	Sun,  4 Sep 2022 07:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F30AC43140;
	Sun,  4 Sep 2022 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662276477;
	bh=HlGmO9naVkI8h4SOIPifkOi1fhk4xPxIYawDsjdcGL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTCnWkyBFWaHT1oDikcoi4dFsvTvS13kMchJ3n5o6XEbX7Go67pXEg5LG/4hpQas7
	 2ALXMCI8JtOGKVogYUkBpDYRN7vSIalLn5vFbZLI54iGERa1VVOPJku6BgFSkdOENd
	 9g9E41PRnJXmlhtTXVfUmKsWj0hL4SSUaGmg+8MQzc6WV7M9Z6ysDZG4C/R6L/Zj0v
	 6495+6WoSq8al9KmLNmlR87uaZ7sZL6Fot3h6GZk7s7KuhTcfTKjchAVURDIj+b40C
	 RGqvmCl2SE88QborHG7J2FexH65b6/RmYnkkADMXUOJqDaBIp+6HKGBeoetca/WIn3
	 R/KEVgGGqY6sg==
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
	paul.walmsley@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V2 6/6] riscv: compat_syscall_table: Fixup compile warning
Date: Sun,  4 Sep 2022 03:26:37 -0400
Message-Id: <20220904072637.8619-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220904072637.8619-1-guoren@kernel.org>
References: <20220904072637.8619-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_002758_742744_E378620D 
X-CRM114-Status: UNSURE (   8.26  )
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

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
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
