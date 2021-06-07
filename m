Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40947C48BCF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 16:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14F206143B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 16:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14F206143B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jg3gNG8aapxadpljCYhhQDCRb7WayCcdmqpU4mc+LVg=; b=3PU7hm3a64YGTl
	Prf4rgF0KqUnZfsNN4cwZsDRhz6txqN97S1Wkxtof+ZTF9Pppjg9NtABAOr+XjnhkB/8U2NFrUKRf
	idcCf/1dqfDUbJfVHU6oIq5kKCFUGSxWAtgSc4FH1gKnJSak/DqsXtPDhQr4zai1QimT21g8OgXUo
	VhqJc8M9GCEmDX7Lq+B0Vi+yFdjVMjHZKREcINf4LUm3YD4rjRY9woHKKqzfNI+ECLIR1JYWx+YKP
	yiQL5bf/q1ZEsi8ud5lbo7wpDdOS1+s7p7Fr1cbcdaLOJlFJ+gIJAZilLn1WV+0rL10JQ7wge/zeY
	U90ZMe/Cf9a1EdKuUFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqHyW-004SD4-80; Mon, 07 Jun 2021 16:19:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqHtT-004PQB-MT
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 16:14:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9060C6141E;
 Mon,  7 Jun 2021 16:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082467;
 bh=JR1LwqcnZRsn5yGfC33MX1dYZ/aFmq2fPUHqT3SXwyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sqF445ZSaU5YFqP2ZenCtJDto75thT4wdzdALh91ouKmX2z6DUMIg2SMBC0aBDEF6
 x9gg46gZZ0R8a1qmB9blWQCsolugy7ozaYVf23WScLEwnfgw6YvnpFNZOTN4ukgxdd
 6ojQ/X/gR5XYMsvx7kcxL+ttjmHIMpnhmJP6QagoTr9wPe5gQ2hgjaB2bG7Zle8xcm
 Hf6ryra4E6b1twNh3CLtF9nUKoEYpkqf35rnx9qa7xriygEsVM+xkZAksxkStIgfi9
 OsV3dT07IwrAK6lJObEUCmQ+KOtYE1RzOXMBd6QrJj2jlYUX4Y7eW3L29yjgBY4sqL
 OqeqAOt0DEJsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Khem Raj <raj.khem@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 13/29] riscv: Use -mno-relax when using lld linker
Date: Mon,  7 Jun 2021 12:13:54 -0400
Message-Id: <20210607161410.3584036-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607161410.3584036-1-sashal@kernel.org>
References: <20210607161410.3584036-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_091427_844333_C47D3A12 
X-CRM114-Status: UNSURE (   7.71  )
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

From: Khem Raj <raj.khem@gmail.com>

[ Upstream commit ec3a5cb61146c91f0f7dcec8b7e7157a4879a9ee ]

lld does not implement the RISCV relaxation optimizations like GNU ld
therefore disable it when building with lld, Also pass it to
assembler when using external GNU assembler ( LLVM_IAS != 1 ), this
ensures that relevant assembler option is also enabled along. if these
options are not used then we see following relocations in objects

0000000000000000 R_RISCV_ALIGN     *ABS*+0x0000000000000002

These are then rejected by lld
ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index f5e914210245..1cbe0ad78b0f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -34,6 +34,15 @@ else
 	KBUILD_LDFLAGS += -melf32lriscv
 endif
 
+ifeq ($(CONFIG_LD_IS_LLD),y)
+	KBUILD_CFLAGS += -mno-relax
+	KBUILD_AFLAGS += -mno-relax
+ifneq ($(LLVM_IAS),1)
+	KBUILD_CFLAGS += -Wa,-mno-relax
+	KBUILD_AFLAGS += -Wa,-mno-relax
+endif
+endif
+
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
