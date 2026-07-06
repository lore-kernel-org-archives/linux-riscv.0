Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A876C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Mime-Version:Subject:Cc:Message-Id
	:Date:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3nAwtpSFiFPE3XDk6wrcZecko5+MckyKNOZ63GvGd3g=; b=Jo7fP2VmwvF34u
	3inzc64vWOtMpe2AgWgtyIbtko1cJEhczPoWRTOpLm3kCBDmfh67dO4dKv+bGyRYdcSUbwyBdWlgY
	jLtOL0uPNDY3ie9kCHLoN2O4ZHcCJH0FiHS28sIRhtd4/mV6r4VgZCYHxVcBVRn+MEjXGc1C7Zr+/
	5E5Mi7w665Y6ijPE9L6A0v0SDLcJPhldjwMMRfUM2ft+Syyp76Lnoa8VuuCkDEFjXy5CH/U/b3khN
	gdIg78bPuv+Rnu+oXsiCHwPp0urGLv3QxaBIDjE0eyVr6nl/b+oCqkMnmyVgU85ILMr+5fYOPTXp4
	1tZM7andyT/8FtPS6YWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiYk-0000000CULj-1EAz;
	Mon, 06 Jul 2026 12:36:26 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiYg-0000000CUKc-3STr
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 12:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1783341370; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=BQ/HUFk88w9Hw/0H2O7JanH4HOFyPcr4jmVMK/jTRIo=;
 b=lx1IfXdIa+GjabASoRaQ5UOQzhq2z/7McrY3Q3zBmPY2YqjVtF6r1SZlLxBQLkcCGMulyU
 izmF1628wy39cO/XO1XOKds4LvaCGJpYNeGauIm14Ufzz3jTNPuaQk8vD6Wsf7s0qDHl4m
 0KCzTspPl2RPJZsij6lgsDDLdQCG4AzYYBKutbwT6symIuRq30TMOKgZtqHHd9V8M76UER
 HeEvaSTRenoXJVCUfCC0aZfdsMZMFqrPPWW5NTM24XPaZJjwNttex8rviLCz6OXjc/ad7R
 rESr5Ea6v5+xCxgvwMrR5Icg7wWqkIr/yVh2L/+C5+BOz8MV1gcGi57bXiE18w==
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>
Date: Mon,  6 Jul 2026 20:35:54 +0800
Message-Id: <20260706123554.455065-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Cc: "Rui Qi" <qirui.001@bytedance.com>, <stable@vger.kernel.org>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Andy Chiu" <andybnac@gmail.com>, 
	"Puranjay Mohan" <puranjay@kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list" <linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv: ftrace: only use pre-function NOPs with call ops
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
From: "Rui Qi" <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a4ba139+519b09+lists.infradead.org+qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_053622_929550_25106B33 
X-CRM114-Status: UNSURE (   8.58  )
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

Commit c217157bcd1d ("riscv: Implement
HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS") changed CC_FLAGS_FTRACE to use
-fpatchable-function-entry=8,4 or -fpatchable-function-entry=4,2
for all dynamic ftrace builds. That layout makes the compiler place an
8-byte area before the function entry, which is used as the per-callsite
ftrace_ops literal when CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS is enabled.

RISC-V can still build with CONFIG_DYNAMIC_FTRACE=y and
CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS=n, for example when
CONFIG_CFI_CLANG is enabled because HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
is selected only when !CFI_CLANG. In that configuration
ftrace_call_adjust() does not skip the pre-function literal area and
only returns addr + MCOUNT_AUIPC_SIZE. With the pre-function layout,
that points into the pre-entry padding instead of the callsite jalr, so
dynamic ftrace records the wrong patch address.

Use the pre-function literal layout only when call ops are enabled.
Otherwise keep the previous patchable-function-entry counts so the
recorded address matches ftrace_call_adjust() non-call-ops path.

Fixes: c217157bcd1d ("riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")
Cc: stable@vger.kernel.org
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3070c3874305..235730a243aa 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -14,11 +14,19 @@ endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux += --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
+ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS),y)
 ifeq ($(CONFIG_RISCV_ISA_C),y)
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=8,4
 else
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=4,2
 endif
+else
+ifeq ($(CONFIG_RISCV_ISA_C),y)
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=4
+else
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=2
+endif
+endif
 endif
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
