Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7ABC47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 16:13:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F059D613D5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 16:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F059D613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PG95wAjCGKN+MTttj7rqDGv65azDLee/Mh1sKlholk=; b=JtMMpN145QnjMq
	Nj8J3rUKgiuIDqfoxi0EOuoMgt2GO3LIWf8+MqPcXvDeYVK+G2rP9fMifDEYQGupIVrKj7arSDd2o
	vwy/4oATorGe9vSZWU3y4ZGI9zT/d5nZ3ZwatDvJ0lTY1My20F78RI520u5bVuJyjxzKkcQ0BkhaV
	W/G6ztx9F0Q2l4f384D7vfko/qglOq3ePcs21SEIfHEbWlBLUw+RW6iBIWouDp8sXdIAcyhq4Im+v
	rUUyjt6XkwCQqfKWd7p8wovSZDN1GoZxnJwexBUgAJcwnYTQworTEXx560WrKZ7pdW/gtLy6cyVZH
	JFATiX6LHRu8j7+3NEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqHsP-004OW8-HU; Mon, 07 Jun 2021 16:13:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqHrs-004OAV-8Q
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 16:12:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CE496128B;
 Mon,  7 Jun 2021 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082368;
 bh=qdx3A4dL/aV5aO0z1JewHyWSwi8Q7i9bcnqPBVn6azs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6BwxUwzyUQlKGGorK72hZg6g3/0Rjm8/HedVIgBKoPMNzmPZLZoRwGKq56Q9PwXv
 FXR8jF/kQ/bCN5JS9pNMy4XpV47KdtyD4wubBHE8wObv0QzwddyfmHjR3cAt3P/Yk7
 kbSl9I85qv3KlPkxxLTQs8gV/vlzHaM/1RIjHtXaPr1YmE0cBbA68A/KSZmTxhIlWZ
 qRfNE5LzFfF8pgkvkq/H7SvdpL+o2twi49sPnqbL9y2uDwu5LXTgX59ZyuiLBP6EEH
 PSUjnH67yz6wA752G8uCMB5XOWyK0zu+z7t+WbCCktY4VhG6JwaDo2tXih4M66wwpx
 CvN5HpwxnoMEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Khem Raj <raj.khem@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 26/49] riscv: Use -mno-relax when using lld linker
Date: Mon,  7 Jun 2021 12:11:52 -0400
Message-Id: <20210607161215.3583176-26-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607161215.3583176-1-sashal@kernel.org>
References: <20210607161215.3583176-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_091248_335087_99207C59 
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
index 1368d943f1f3..5243bf2327c0 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -38,6 +38,15 @@ else
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
