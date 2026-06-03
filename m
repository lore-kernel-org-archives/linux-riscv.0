Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F0BCD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:References:In-Reply-To:
	Mime-Version:Subject:Cc:Date:Message-Id:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rVoWMHoKGlE7nZYradATr9GaNwUWDNTGffX6/Dvx3Ac=; b=z80TVXSt9FJoIuhOocBnLnzSiB
	vwJ3qfRNAyvzoR7U7y/CbGqJk34tuqGqQadCLgw9X+pHJorbg/JbecMkm3BS/ZmQ+XgNSIyD0e5lq
	F8bPuX84WNUenNodcxZ7pZLWlBDc3NDDiZfBj9g9HPAELZDBd+wq2L2B4KF3aCTevv5Z9bXZamtbi
	2GWDYzTwrEnPDWue5iyOGRrco1t9s9FCpKIGfmL2gTj+SxO61cDYdo0X8Y/9rk1xb0HLFBwOiteza
	C6CS7NKpnqY3FKWpn1v3mYtlGZOdcaao+ywi9u3AnY6Zpfh6+1zrrYp17iru6KRl47JQNu0K8M11T
	0Jq80muQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkAj-0000000EzRA-3i9y;
	Wed, 03 Jun 2026 11:54:09 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkAh-0000000EzPI-2PvA
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 11:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780487642; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=BP6MKTedQDfeKoLFnuCL3wxv2kHIK4oguFbN4oqvk/8=;
 b=mF5qV1B63u0J5WypTntOfCE60mNqAj4uJ38fTE35DqrjL3fHJkcM1fwFgJdKKrlRz9thwt
 UI3xyJ2iQBP/3ftTHeL9+hDMcTBvTpEAhBH85papDBwimOsV4L6VqpKr4Fy0kngbp5o20n
 g0wcKXnYxMj+7a1cSa7jTL+giMDPbgHEVDC35uTh9OyuwG8oAmKPFha9evHnO64T/qXG5n
 S/bRPGaULqvwokG5/nKdB7SbFYlaSpwNfjVntevEcFQts/6ZACotnEhjYadOe8eBLq7MKw
 tpynu4M33T21gB9XUgO0HicIf12mMQn0TFGJumTE3xdGUuZ2JKuu7miRAWExVg==
X-Mailer: git-send-email 2.20.1
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a2015d8+dd4b1f+lists.infradead.org+qirui.001@bytedance.com>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20260603115329.791603-3-qirui.001@bytedance.com>
Date: Wed,  3 Jun 2026 19:53:29 +0800
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v1 2/2] riscv: stacktrace: Use %pB for backtrace display
Mime-Version: 1.0
In-Reply-To: <20260603115329.791603-1-qirui.001@bytedance.com>
References: <20260603115329.791603-1-qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_045407_684330_EE0681DB 
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

The print_trace_address callback uses print_ip_sym which formats
addresses with %pS. This does not adjust the address before symbol
lookup, so when a noreturn function (e.g. panic, do_exit) is the last
call in a function, the saved return address can point to the start of
the next function, and kallsyms resolves it to the wrong symbol.

The kernel provides %pB (sprint_backtrace) specifically for this
purpose: it subtracts 1 from the address before symbol lookup, which
is sufficient to fall back into the calling function range. x86 uses
%pB in its printk_stack_address for the same reason.

Replace print_ip_sym with a direct printk using %pB, matching the
pattern used by x86.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..f4eb65bf53ef 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -139,7 +139,7 @@ static bool print_trace_address(void *arg, unsigned long pc)
 {
 	const char *loglvl = arg;
 
-	print_ip_sym(loglvl, pc);
+	printk("%s[<%px>] %pB\n", loglvl, (void *)pc, (void *)pc);
 	return true;
 }
 
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
