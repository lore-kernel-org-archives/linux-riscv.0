Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C465EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 06:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvpRvP11lgWLf/iETnEgYfpSMn02ZpIGwG9el7HxsdM=; b=xJsfbNG263ErQD
	WnyIzgvgmSpZ0AoNZ1HgfqXJ6sul0AjW4jsRsiRmrQutNg+jCu5yp0uXxvmkuVlQ7/bAFyR1P9faE
	k5FH+oL57Rvwc6zWPA9TyEr3IOS/U1uGffFDzOK92ZyaWNf7ZhSNzEpZZe8t1oHvLXfTDun36Owjc
	l+0RuwG/MAO0KNqDYUr1V32lufMtxNyiwladzU4K012147mPaQUlC/SMTrt5BWbvyMutjR3hlaIZa
	21XRNI0bJK4MjePp65M13zfwsj54bp8k2Xgnk3bhGCj642TZ4zkXp70IEHDq9cc4XevUJ8kfZguiR
	lZiTqGaAGfYHQ1jDWp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN614-00FwEG-32;
	Sat, 22 Jul 2023 06:22:58 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154] helo=mail-sender-0.a4lg.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN612-00FwDL-2c
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 06:22:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id E883C30008A;
	Sat, 22 Jul 2023 06:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
	s=2017s01; t=1690006972;
	bh=jOimJ+uhwtZJqtYNpHbNQgJj473Q2wQ5SRnU84yRFNI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Transfer-Encoding;
	b=rGebVGm4PVpjo8y6kXP7+6ruyIuz6m7T5u1ADo/1MyHtbQIg29RwXxI5BLLZxZ1rF
	 oYbDz9tRrceCtOkN1mFp5uxzMkQSFvuNjOX4M51wRSk93g4hzC/jbwFFzI5/AnnJRN
	 0SaVdbiVCMHUs5HN+l+pzDXvrinrlkXnQAWk+248=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] RISC-V: make ISA string workaround case-insensitive
Date: Sat, 22 Jul 2023 06:22:37 +0000
Message-Id: <74ef735a676c3f21cbd8c2ee19d4a577a920f23e.1690006695.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1690006695.git.research_trasio@irq.a4lg.com>
References: <cover.1690006695.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_232256_972431_E053A32E 
X-CRM114-Status: GOOD (  10.26  )
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

This is a follow-up for commit 255b34d799dd ("riscv: allow case-insensitive
ISA string parsing").

Although the QEMU workaround in the ISA string parser works well with
lowercase-only handling ('s' followed by 'u' and not preceded by '_'),
case-sensitive handling in the case-insensitive parser can be confusing.

This commit makes the QEMU workaround case-insensitive and gives more
robustness (against manually crafted Device Tree blobs) and less confusion
to kernel developers.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a8f66c015229..63277cdc1ea5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -168,19 +168,19 @@ void __init riscv_fill_hwcap(void)
 
 			switch (*ext) {
 			case 's':
+			case 'S':
 				/*
 				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
 				 * No need to set the bit in riscv_isa as 's' & 'u' are
 				 * not valid ISA extensions. It works until multi-letter
 				 * extension starting with "Su" appears.
 				 */
-				if (ext[-1] != '_' && ext[1] == 'u') {
+				if (ext[-1] != '_' && tolower(ext[1]) == 'u') {
 					++isa;
 					ext_err = true;
 					break;
 				}
 				fallthrough;
-			case 'S':
 			case 'x':
 			case 'X':
 			case 'z':
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
