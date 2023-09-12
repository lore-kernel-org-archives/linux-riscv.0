Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC63CA0ECF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDROQFZ1CvsDcoaInpjsLxGbzJeR8OFEL5KaMld2qog=; b=H05ZWG4cXTOqWt
	XIjXhWijuo11gI3uUyCIs/AyQkWIdwhKDIQs0Xh35LqiGs6wSU2IM4wSuviYCqnlkEW4GnAas+J69
	h2t8Mz9VIvYW4lvLlQz4W+jNcMDqK3Yv+2TTr0wQpKPgGRMU6z7HChToYNfJcLZP4IeZ+Ej7N9Qwf
	rIloPyTXRCT0hTihdhoasmcVp9s0n6t5GmxCjXO5+bOZFE17VIvu4F+hoOtmEG8q52PodJhETArMR
	AJo4PNkJje74sZybkTdbJu8qFpjHSNH6bhW/uCQ99tVeeMluJdvG2hogJCMwdJFOQHYIOK+/IM72c
	px5FikaZgS6ETUipQzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxsi-002PGF-1n;
	Tue, 12 Sep 2023 07:32:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxsf-002PEn-2F
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:32:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1968E615CE;
	Tue, 12 Sep 2023 07:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EA6C433C8;
	Tue, 12 Sep 2023 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694503936;
	bh=LVkhyWFH59zqNCV7QiwAO5x1uYMJKWUxGuvv3jXu/IQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aHhhtPBV+49U1o/r/CM1Znsy1im0RnVGuv+yP6AeptLwXw+lvr/lhnlUccKnXlFza
	 CxEAXhnH8pc8T94zdnvctdmtyVQtYbVkveTHcQ/0W4T/hAyXENARO14ni3pqj/yTbq
	 hqGY1FVIM78CX8gH7hQSR4vMDLOj4f0ag7rE/LHveaIEzJPws+iZ2dZg5hlAskdD9B
	 Scm6tv7vyPmLHmgJVNN5Jhsb/5WxilSJr+cLda46qfqDuVnkHsTDUEXGp1zG/8JysC
	 mdO0kLM+J+gwzJQpXmq/5H5BxIWp5rrynf9cN1Dp5FNkOeD80HSRR4Yltjl9BuFFYP
	 1X5TKbkKrh+eg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [RESEND PATCH 3/3] riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr
Date: Tue, 12 Sep 2023 15:20:15 +0800
Message-Id: <20230912072015.2424-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230912072015.2424-1-jszhang@kernel.org>
References: <20230912072015.2424-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_003217_774253_9781A05F 
X-CRM114-Status: GOOD (  12.02  )
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

I believe the hardcoded 0x800 and related comments come from the long
history VDSO_TEXT_OFFSET in x86 vdso code, but commit 5b9304933730
("x86 vDSO: generate vdso-syms.lds") and commit f6b46ebf904f ("x86
vDSO: new layout") removes the comment and hard coding for x86.

Similar as x86 and other arch, riscv doesn't need the rigid layout
using VDSO_TEXT_OFFSET since it "no longer matters to the kernel".
so we could remove the hard coding now, and removing it brings a
small vdso.so and aligns with other architectures.

Also, having enough separation between data and text is important for
I-cache, so similar as x86, move .note, .eh_frame_hdr, and .eh_frame
between .rodata and .text.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 671aa21769bc..cbe2a179331d 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -23,12 +23,8 @@ SECTIONS
 	.gnu.version_d	: { *(.gnu.version_d) }
 	.gnu.version_r	: { *(.gnu.version_r) }
 
-	.note		: { *(.note.*) }		:text	:note
 	.dynamic	: { *(.dynamic) }		:text	:dynamic
 
-	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
-	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
-
 	.rodata		: {
 		*(.rodata .rodata.* .gnu.linkonce.r.*)
 		*(.got.plt) *(.got)
@@ -37,13 +33,16 @@ SECTIONS
 		*(.bss .bss.* .gnu.linkonce.b.*)
 	}
 
+	.note		: { *(.note.*) }		:text	:note
+
+	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
+	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
+
 	/*
-	 * This linker script is used both with -r and with -shared.
-	 * For the layouts to match, we need to skip more than enough
-	 * space for the dynamic symbol table, etc. If this amount is
-	 * insufficient, ld -shared will error; simply increase it here.
+	 * Text is well-separated from actual data: there's plenty of
+	 * stuff that isn't used at runtime in between.
 	 */
-	. = 0x800;
+	. = ALIGN(16);
 	.text		: { *(.text .text.*) }		:text
 
 	. = ALIGN(4);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
