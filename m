Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFB6C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u82Sb6kFtschOPYioNon/IqBEADJW+NUf5557pdeAG8=; b=qwvfaMQF5RK3ug
	n0/6ggIJR0Z1b3iF5TwVxiiSmDBQw5kx6MUv5ihMdqZIMiZMLo83vtcBi5SDeZycGbaoTL1MXXiW6
	ANHNDOcKTUZg0NmY7tDXaodRJtxhaaA2lq8wfb581GOirYOUuqz8KZufn51VrjZf+gtDIA5ekZa71
	QS+iM26SVpBmzpDTAn8aLVuyArbVr/uaD5SYUvP3JzPp8z+fiKlkFwCzaxN55vW5zyVOHPit+GZ4r
	9gP27bruwmskDISxbRMPO2ZK6CfxusP81rMalOzDDQ2cfIFC/PAmvfiWiONJMEcVzL5TdInYgfjEF
	7JivpJAnRvFbxpq/92/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiWb-00BCUK-2I;
	Wed, 26 Jul 2023 17:42:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiWU-00BCQT-26
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 17:42:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CDBF861C0A;
	Wed, 26 Jul 2023 17:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90F2C433C7;
	Wed, 26 Jul 2023 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690393325;
	bh=FoAwbwQLJJvL1URKvVipUOgohpgmWIsUn9uEVNXhbv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hwi9cpkOp5qyxCKXnFW+26Vq/LNWYfZRyi9CI0m8x6q9gKxP0xKNHmKHxiN3khZdO
	 VQKVo3IQ0913QtAp52fnxpEKeegDd7NI2ubQ9fxgGDHIUfy94gjD0Z2IV8hGPgxpVb
	 YQaY1vexRV7F9vL3/dCQMUvaSMPUXkX/uW6+7HXBep4yEXbNYkBcaOQc5DvM5MdOrV
	 3WJ00MF0BwFzViuZaXZPd6dDbHSZbSOCnTwivlK/bIE6ojgjAz3rET4r2/VKhdF0E3
	 S/uMori21qVJjlBqjHW6hAccFsvwY0+ASlLx50f9Qt9LE811HW23GU769K4alyTT2i
	 7MGwzfvVI3bbQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr
Date: Thu, 27 Jul 2023 01:30:24 +0800
Message-Id: <20230726173024.3684-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230726173024.3684-1-jszhang@kernel.org>
References: <20230726173024.3684-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_104206_731330_8E5631E0 
X-CRM114-Status: GOOD (  12.37  )
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
