Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370E2C47073
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wb16NT90hrcZ08k8RwDvusIjd6nWdMeq+prlvDyU318=; b=3Nwh8bCQ5ltKoy
	s8+fj6YK1dPEEklE88xjXYo18yyI3pUwqi/xvXkUf36dsBaH9bfMsiVhv++1Yz2d5C0ol7g/seiNb
	MF2IE4/GlEs8FY4ET8QlRZgcfubdpTdX7dRAj2obPRDgvzfYZek3dhxVVE0ytDM7yGN9dpOs2u8jV
	cqtx8h6MmsnsPYeRijhvpHa6MuxK2xww8ftiEJYPeFP1qmoAY0rP8lD1qX4wj8iTrxjOtI0oaCqcq
	pS0b41qrL1vpZaGsOlRSEvd0qQUTwWDw0MRZim0DBxFn+CawxKjC3SClEivG8XBiKuDRbpWJLhanR
	Epg+IQgfdzi6xKL9r7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNB0e-008CZh-1g;
	Tue, 09 Jan 2024 12:15:08 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNB0b-008CXi-0Q;
	Tue, 09 Jan 2024 12:15:06 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4T8VHN1DB7z9v5M;
	Tue,  9 Jan 2024 13:14:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3UZY3QTji_ou; Tue,  9 Jan 2024 13:14:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4T8VHN0Hfvz9v2V;
	Tue,  9 Jan 2024 13:14:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 003308B77D;
	Tue,  9 Jan 2024 13:14:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HBR04NexVvw3; Tue,  9 Jan 2024 13:14:55 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.126])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6EFF18B774;
	Tue,  9 Jan 2024 13:14:54 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linux-hardening@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-mm@kvack.org,
	steven.price@arm.com,
	Phong Tran <tranmanphong@gmail.com>,
	mark.rutland@arm.com,
	Greg KH <greg@kroah.com>
Subject: [PATCH 0/4] Refactor CONFIG_DEBUG_WX and check_wx_pages debugfs attribute
Date: Tue,  9 Jan 2024 13:14:34 +0100
Message-ID: <cover.1704800524.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704802473; l=2144; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Rosrc8SJ5lP3rVnXrjZMc3fjClOukQO/LV2fzgZVpQs=; b=s3Okt6I7tVLtHH9cIsW0wOp8leAGxF9lRsidic0YqOYcxb/GPUWk/wsLaGOrOrDVlBeQJRl4d A3TZyNi11uFDTOsNtgCv9Dd/0t2LrUpaUdzKjfrAy93UgJ/oTqyg9E5
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_041505_359853_5291023C 
X-CRM114-Status: GOOD (  13.09  )
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

Refer old discussion at https://lore.kernel.org/lkml/20200422152656.GF676@willie-the-truck/T/#m802eaf33efd6f8d575939d157301b35ac0d4a64f
And https://github.com/KSPP/linux/issues/35

This series refactors CONFIG_DEBUG_WX for the 5 architectures
implementing CONFIG_GENERIC_PTDUMP

First rename stuff in ARM which uses similar names while not
implementing CONFIG_GENERIC_PTDUMP.

Then define a generic version of debug_checkwx() that calls
ptdump_check_wx() when CONFIG_DEBUG_WX is set. Call it immediately
after calling mark_rodata_ro() instead of calling it at the end of
every mark_rodata_ro().

Then implement a debugfs attribute that can be used to trigger
a W^X test at anytime and regardless of CONFIG_DEBUG_WX

Christophe Leroy (4):
  arm: ptdump: Rename CONFIG_DEBUG_WX to CONFIG_ARM_DEBUG_WX
  arm64, powerpc, riscv, s390, x86: Refactor CONFIG_DEBUG_WX
  powerpc,s390: Define ptdump_check_wx() regardless of CONFIG_DEBUG_WX
  ptdump: add check_wx_pages debugfs attribute

 arch/arm/Kconfig.debug          |  2 +-
 arch/arm/include/asm/ptdump.h   |  6 +++---
 arch/arm64/include/asm/ptdump.h |  7 -------
 arch/arm64/mm/mmu.c             |  2 --
 arch/powerpc/mm/mmu_decl.h      |  6 ------
 arch/powerpc/mm/pgtable_32.c    |  4 ----
 arch/powerpc/mm/pgtable_64.c    |  3 ---
 arch/powerpc/mm/ptdump/ptdump.c | 10 ++++++----
 arch/riscv/include/asm/ptdump.h | 22 ----------------------
 arch/riscv/mm/init.c            |  3 ---
 arch/riscv/mm/ptdump.c          |  1 -
 arch/s390/include/asm/ptdump.h  | 14 --------------
 arch/s390/mm/dump_pagetables.c  |  8 ++------
 arch/s390/mm/init.c             |  2 --
 arch/x86/include/asm/pgtable.h  |  3 +--
 arch/x86/mm/dump_pagetables.c   |  3 +++
 arch/x86/mm/init_32.c           |  2 --
 arch/x86/mm/init_64.c           |  2 --
 include/linux/ptdump.h          |  7 +++++++
 init/main.c                     |  2 ++
 mm/ptdump.c                     | 19 +++++++++++++++++++
 21 files changed, 44 insertions(+), 84 deletions(-)
 delete mode 100644 arch/riscv/include/asm/ptdump.h
 delete mode 100644 arch/s390/include/asm/ptdump.h

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
