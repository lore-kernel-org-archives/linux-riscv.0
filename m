Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C37C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyajDN0HYSW5WmLS6AvcD8sXDm0uJk8Jfo6nlkCurhw=; b=cLpLzEWzTt4ZTn
	em4gMoBGNLdNEDqqmLr/WX9ay/GWYOq1AZ2PJZIlpXScNNrjq4m20CTJlW+IrN+x99CmMzr+RYb8N
	DeJauAuggzRhXPAhsLVM7GA8RKFHUi8L4y9N/ir+1fDm4RfqR6b4ScIdjpF+naWMm29uZAjROxq7S
	pj+7CAyDZpE5ADbAoNRPEn3rXH52VwgI/Rt2rQiq0MTFgUVycPBLtyiVP0n5Mn3vcyd3YS+DJeWrs
	eWyYeKOpvRSFaa9c7ewpVgkdaEzCoSehlJ7mWDHb3WyuvDtEQqYVDTPZ7kpZj73ZZ9T035cdv9Nqo
	N4iPBW8O0euYGiZGamog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwrq-009Cyg-Bg; Tue, 31 Jan 2023 20:04:34 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwrn-009CxR-W6
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 20:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Bl5iUXqmXEOZR8ifG6HKyF4x1jQ0mIa3D3l9XR4PaTE=; b=T1pWKmZWPHuHO8Jyn7S5P/zto+
	UZfPKBZyRLG27ebQFQOn/fWzfDlIAMxY5HnpFAsDM33oCZ+/Oqy97hkFrd/ty/TtBVplGI9UlZkpc
	fbW++/mewnSYFO9jvmdzRomSgggz4wlhTLgqvJVMyFQJo7JNjGdbYjrvvOCf8fp0gxg7cOp7xtr3r
	ESdWCs27/xj5QzXKLgnJBxqhbIe9xDzRoYllJ//kxI1dcU2VM9HH60bLK1f0Ri53IBKDWu4a9kqmF
	F2PtXGW3wiF+E43i3v0Rvv/Ti4b5qXLpcgoQxKTylUS/49rUu8IB+gb4J12gNq/O4ec6MWulnmUSJ
	YSws+EYw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMwrk-005Ilr-0p;
	Tue, 31 Jan 2023 20:04:28 +0000
Date: Tue, 31 Jan 2023 20:04:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 03/10] ia64: fix livelock in uaccess
Message-ID: <Y9l0TM6HPoS/V/LX@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120432_045249_2E0AB79C 
X-CRM114-Status: GOOD (  13.39  )
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

ia64 equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
to page tables.  In such case we must *not* return to the faulting insn -
that would repeat the entire thing without making any progress; what we need
instead is to treat that as failed (user) memory access.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/ia64/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/ia64/mm/fault.c b/arch/ia64/mm/fault.c
index ef78c2d66cdd..85c4d9ac8686 100644
--- a/arch/ia64/mm/fault.c
+++ b/arch/ia64/mm/fault.c
@@ -136,8 +136,11 @@ ia64_do_page_fault (unsigned long address, unsigned long isr, struct pt_regs *re
 	 */
 	fault = handle_mm_fault(vma, address, flags, regs);
 
-	if (fault_signal_pending(fault, regs))
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			goto no_context;
 		return;
+	}
 
 	/* The fault is fully completed (including releasing mmap lock) */
 	if (fault & VM_FAULT_COMPLETED)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
