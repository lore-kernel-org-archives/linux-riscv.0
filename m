Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6953CC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Mime-Version:Subject:Message-Id:To
	:Date:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g/K9jLhdHP6cTBc6E0YLIJpwRj24bdSpMK/TZD4CZzU=; b=Y/EhpzKwXx3ISn
	ElKrkJ2oIU0B2+j9yrYSY08aT6iXM1vHHR+3GE19WfgjP2acEh3tv4UNUxcnzdMV4A01L4jH7GQI1
	WLnx4vXU+42NY9zIq+LON5FD1LUD8ugi0fOYfN+st5wU/XTQ9/oZH3gbLlDuovrqEMYJQ36NqMlvd
	c5s3EX/TeWI4w4jwoXM/l7RWEehm8Wz10fM3wmvNorJ76SyDUaBIumOjJy4dKSpw14GaIjOxySWtO
	guI6Jn6AK9sXUyr+GhoGgkG/1e6GRigC2AAu+r+b7+J1OCN5cV2ss4p3xQ5nEKfrgsOBN5LXvE19c
	gKB9ei4dodqGGpyOwEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj0N-0000000CWaf-3vEt;
	Mon, 06 Jul 2026 13:04:59 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj0J-0000000CWa6-1yAX
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 13:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1783343089; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=nbuoORZUkjmgfKRlVIiCVjPWXOELXltGTdfIPWygjPw=;
 b=AvCEvwZq2z1z0lWQOW4rIDD+7UAeHI8n22dio4f1M1opA9Eu8CDC+qt10AEtIwHZmBNQOB
 okKEd84tVzSgkA7evHlQENn0ojvddXjhuHjaO/ZDhVy9ca717ZukTOe5idCPnoWI6JNhWz
 r+FEQzV0HLpxDyGAS1qsyisRFMiP5c5UWiwF+7p5i2/GzjQllTziulRE7ejdjTUSpi9zRv
 IZTu7qjzwLzZLa2URrF6Nf9RuzY8gff/BqbArAyTR/2NWDX8/Dst09TM+1pYSpGiAVC+0q
 QiXqTJqggbYL+p1xEohurMj743vlIj+LY9AFIS3SaFgMhhQp1fLhzmnX3XVXsg==
Cc: "Rui Qi" <qirui.001@bytedance.com>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andy Chiu" <andybnac@gmail.com>, 
	=?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list" <linux-kernel@vger.kernel.org>
Date: Mon,  6 Jul 2026 21:04:14 +0800
X-Original-From: Rui Qi <qirui.001@bytedance.com>
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>
Message-Id: <20260706130415.463682-1-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a4ba7ef+e881d8+lists.infradead.org+qirui.001@bytedance.com>
Subject: [PATCH] riscv: Gate FUNCTION_ALIGNMENT_4B on DYNAMIC_FTRACE
Mime-Version: 1.0
From: "Rui Qi" <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_060455_690281_53BAFF14 
X-CRM114-Status: UNSURE (   9.34  )
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

The FUNCTION_ALIGNMENT_4B select forces the whole kernel to be built
with -fmin-function-alignment=4. This alignment is only needed so the
patchable-function-entry NOPs, which arch/riscv/Makefile emits under
CONFIG_DYNAMIC_FTRACE, can be patched reliably on RISCV_ISA_C=y builds
where compressed instructions otherwise allow 2-byte function
alignment.

The select is currently gated on HAVE_DYNAMIC_FTRACE, a capability bit
that is selected whenever the toolchain supports dynamic ftrace, rather
than on whether tracing is actually enabled. As a result every
RISCV_ISA_C=y build gets 4-byte function alignment across the entire
kernel even when function tracing is disabled, needlessly growing the
kernel image and wasting instruction cache for a feature that is not
in use.

Gate the select on DYNAMIC_FTRACE instead, matching the condition under
which arch/riscv/Makefile emits -fpatchable-function-entry, so the
alignment is only applied when it is actually needed.

Fixes: c41bf4326c7b ("riscv: ftrace: align patchable functions to 4 Byte boundary")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 66638fc9ba43..0c00f6aa715a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -158,7 +158,7 @@ config RISCV
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_DYNAMIC_FTRACE if MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
-	select FUNCTION_ALIGNMENT_4B if HAVE_DYNAMIC_FTRACE && RISCV_ISA_C
+	select FUNCTION_ALIGNMENT_4B if DYNAMIC_FTRACE && RISCV_ISA_C
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS if HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
 	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_WITH_ARGS && !CFI)
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS if HAVE_DYNAMIC_FTRACE
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
