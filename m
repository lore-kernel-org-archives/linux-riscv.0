Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D652BC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gqd5lvUZdtJ0Is1R8CvY34mncczuQrxZzTUGlZ3Y03M=; b=yActSTdEQu3+p9
	gXgjHDcB6kwF1n8xs3eytdM4+7ZnMV2J0pzF+WCPN/bIU+HFd9iW9vdiyErJXqFIYMYhwrLQ96HQ7
	crpJS8kQJyyNKyTLscjM0K422d9ASJFiICgE9drQfOY/9xke4o6h3OIirAyvKa3fdyh6VtOcPSgoM
	182QpmNO0XJV2EG1FHndHB5yK0tqTKM1dLNpidcZp0UtQU86cD5Z737IuhbfTpKYKCHfRJJZW7QXE
	bBQg3XIXqEFidNQ15gcDrgDduQSXl2c8rrz1uJ7ioUkRlDj7+pE6whVNdH70LolquXljBJwk47alV
	nuKyciBtDZbfAUSjESEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdRY-00D2mS-36;
	Thu, 18 May 2023 13:13:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdRV-00D2ke-1a
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:13:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AD3064F36;
	Thu, 18 May 2023 13:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA3FC4339B;
	Thu, 18 May 2023 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415596;
	bh=it/txvlY5/L57R5itWfhNoNKfONs7t6egYUyVObkMZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fu30wSyFsEk4AzAWQrWkefaN5GBStqjKJ+S3xJm90Aj9gpTam01WCSkm9IRyy3BeU
	 irjDzBzWYaP/ZaTR+BOle+q9IC1eZEe4KkuJGTFwao++OZpA53GT9++zVzUKGxYRzL
	 zlFgocF4KScOb7vkpUKs/keoHoihtjDWB2KZ3DL6Arauk6NJfUAtiDM+tk9Anb680x
	 PdThj9dHO3hw/y+j+J+YofQk9cU40VP3vHXSB8JoP7Xqf3yn6z56kO/AVyGmVVCY9c
	 sTXbVULljhjm63Bq21tX80E+oQaInLrpwCtOin5JGfYI/Nl7MUMUqpyWjETf7jBV/k
	 VZdzOywzG2uAw==
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
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 13/22] riscv: s64ilp32: Add ARCH RV64 ILP32 compiling framework
Date: Thu, 18 May 2023 09:10:04 -0400
Message-Id: <20230518131013.3366406-14-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061317_576013_ACDE53A1 
X-CRM114-Status: GOOD (  10.93  )
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

Just the same as ARCH_RV64I & ARCH_RV32I, add ARCH_RV64ILP32 config
for s64ilp32 and turn on the s64ilp32 compile switch in the
arch/riscv/Makefile.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig  | 6 ++++++
 arch/riscv/Makefile | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4d4fac81390f..d824fcf3cc1c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -300,6 +300,12 @@ config ARCH_RV64I
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select SWIOTLB if MMU
 
+config ARCH_RV64ILP32
+	bool "RV64ILP32"
+	depends on NONPORTABLE
+	select 32BIT
+	select MMU
+
 endchoice
 
 # We must be able to map all physical memory into the kernel, but the compiler
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index dafe958c4217..d47ba6b09b41 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -57,6 +57,7 @@ endif
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
+riscv-march-$(CONFIG_ARCH_RV64ILP32)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 
@@ -107,7 +108,11 @@ stack_protector_prepare: prepare0
 endif
 
 # arch specific predefines for sparse
+ifeq ($(CONFIG_ARCH_RV64ILP32),y)
+CHECKFLAGS += -D__riscv
+else
 CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
+endif
 
 # Default target when executing plain make
 boot		:= arch/riscv/boot
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
