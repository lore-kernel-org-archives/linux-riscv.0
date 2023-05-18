Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30BAC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gef1TLl0WxblO+7q5RpEOb/dbA2JXMNCc5o6TtHVNL0=; b=s0Ekpnc/KGYRR1
	ZxPcQNrDEetGIvUo7fcQgwuXtl3+80Qh17X9l2uT+IBUZyvluCS877yVx4Ebi8ubhPTm2GFvf4upf
	WeE8sNiM2KpDt2w6YKtEhJ8Xg1AapAHLPvYrJEQddEcisP/c+gEylg+MSczTp9xQJ8AQ7ZnSRrvkP
	iEQn/wcU6jwvQlpkwSmeInGRxHCi7plc24WJxwed9vDAwj5o+FfKYyKP9NtNlnw6upuHLRycmWyKf
	U2l0TKdvMgSI8vOfPHAoVR+GeNwz6KsMqlXV0fTE4bs7nky0DRfLz/qEW8ws2Vvh0+vphOGvs0BTM
	yOZxLJm7dtEw6bBfJurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhjk-00DiLx-1k;
	Thu, 18 May 2023 17:48:24 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhjh-00DiKg-18
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 17:48:23 +0000
X-QQ-mid: bizesmtp91t1684432062t3f7up07
Received: from linux-lab-host.localdomain ( [119.123.131.162])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 May 2023 01:47:40 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: XpydsqguK0W8J3BwefvbSRz2HTakJtlvWI9QQUAP/PMwKNhPSD/Yq17ZjHvnY
	ffYqfD8BFuM5h3iKmX5fKkortM0uXw1IfyTmy48kIGQ6Sww2HRw/3NAl1idHpEqTOcnn8GD
	s2qkntz1CRAlyQFhYxufqinmNSEuF2Yt2XZ/1qIXU7XVAB3fP6XNyMcoCBMSN/bSAu2LLVM
	bOu7DIon9FdPtQYB4psnhsdTwSAypN5vHwgOxIjiC7a6wXXxu9euD8Ms6iVQJ+FwedgbUWA
	9Nx0angx31WEDjQDjHvImuyun4G8mc9y5zEkWtLJt/eDpde8TKJimoAILTsuvvoUripq8UE
	hwjhfRUWIgDvJcJgVV6KbpWM5IXlAsXm1xU+6tMMcaO3VCOa3Zu74zHSEVKMw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9383674391080887119
From: Zhangjin Wu <falcon@tinylab.org>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [RFC PATCH 0/1] riscv: Allow disable vdso support
Date: Fri, 19 May 2023 01:47:39 +0800
Message-Id: <cover.1684430522.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_104821_685321_9BC1F286 
X-CRM114-Status: UNSURE (   9.78  )
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

This is part of my tinylinux work for RISC-V, see related patchsets:

* RISC-V: Enable dead code elimination, v3 [1]
* tools/nolibc: riscv: Fix up compile error for rv32, v1 [2]
* Add dead syscalls elimination support, RFC [3]

This patch allows to remove the whole vdso support out of the kernel
binary and shrink 4KB for compat vdso and shrink another 8KB for vdso.

Unfortunately, just found there is a big vdso framework change from the
just sent-out RFC patchset from Guoren:

    * riscv: s64ilp32: Running 32-bit Linux kernel on 64-bit supervisor mode [4]

That patchset unifies vdso32 & compat_vdso into vdso/Makefile, so, it is
possible to rebase our work on that patchset or simply let VDSO64 and
VDSO32 configurable in that patchset.

Best Regards,
Zhangjin Wu
---

[1]: https://lore.kernel.org/linux-riscv/20230517084134.37892-1-falcon@tinylab.org/T/#t
[2]: https://lore.kernel.org/linux-riscv/cover.1684425792.git.falcon@tinylab.org/T/#t
[3]: https://lore.kernel.org/linux-riscv/cover.1676594211.git.falcon@tinylab.org/
[4]: https://lore.kernel.org/linux-riscv/mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9/T/#t

Zhangjin Wu (1):
  riscv: add Kconfig.vdso

 arch/riscv/Kconfig                |  6 +-----
 arch/riscv/Kconfig.vdso           | 28 ++++++++++++++++++++++++++++
 arch/riscv/Makefile               |  8 +++++---
 arch/riscv/include/asm/elf.h      |  6 ++++--
 arch/riscv/include/asm/mmu.h      |  2 ++
 arch/riscv/include/asm/vdso.h     |  8 ++++----
 arch/riscv/kernel/Makefile        |  4 ++--
 arch/riscv/kernel/alternative.c   |  2 +-
 arch/riscv/kernel/compat_signal.c |  2 ++
 arch/riscv/kernel/entry.S         |  2 +-
 arch/riscv/kernel/signal.c        |  4 ++--
 arch/riscv/kernel/sys_riscv.c     |  2 +-
 arch/riscv/kernel/vdso.c          | 10 +++++-----
 13 files changed, 58 insertions(+), 26 deletions(-)
 create mode 100644 arch/riscv/Kconfig.vdso

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
