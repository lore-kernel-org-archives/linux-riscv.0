Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCAEC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 20:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6cRZpvCyqir0T860hshVhXNrBKe2FIcdCH6S4ZBwbw=; b=jE1d1QvTEaFWU1
	K4KDh0TkIEssbdJhtuPzTDJVuh9pxgi7aMTIchnnzKuVdkjfEuqEY36R3nZ9V8PrZDE0GyH0owHUT
	nqA/DMz5eGvdQH/jKXsLdnIglPAhItXl3hymzlZ06zv1soQv9Vb+iMckbs7VzeIwKTTNRQ1HH2k95
	93mR0pgTZvIF8eU3cMufRFppHeHRrZtiiA4Mf40uvyXuCbNNrF2i4Z9X3mP6m4XDpYjAbosoAZQu1
	+IRTWP4kBNIPpUFW99svNT6haPLFCuWcnB9OUcbo148j1hJcEcJFVFVIdiiAwiik8L2y5VoqKwa5Z
	WCaBffoDLszPTSA7ig6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwtP-009DYB-S1; Tue, 31 Jan 2023 20:06:11 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwtM-009DWZ-SS
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 20:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VASyJZSBEquFV0KDKoogdy4OX3OzJhAh5o0jO+QEP/8=; b=HB3AztPi+msrmE3oE5yxiRYHVr
	ykikKMa5v2Yo/giiWWzK4KJyD5/Ga89pUwCA5QwIcEFZBjT6oE1RFuEVpeMiy76e/ZXx+0nL5crYs
	8IK4nTQuAawNWyAZkdVLhCPSzC1A/uzuiGDGdxxpBOFsX7lUljEbBv6ahdNY643XjTRayt1YFEoJx
	2sQZ3b5XcI1+dhT9RX453RW2gqZWp14s31ix2dzgEhP3KVyyOxoPEN9O1p0Xp124Si6XBthNYbFUh
	lczTWd+6ntJSifvArW39txP0ZNkdkGGYFRV1xXxHbQIvUoxSo7pon5BnAUMC8WjMHKxggfzsDaq8a
	E+6hb8kg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMwtJ-005Inr-0r;
	Tue, 31 Jan 2023 20:06:05 +0000
Date: Tue, 31 Jan 2023 20:06:05 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 07/10] openrisc: fix livelock in uaccess
Message-ID: <Y9l0rfNESGOhIf9E@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120608_945800_1D853AB3 
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

openrisc equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
to page tables.  In such case we must *not* return to the faulting insn -
that would repeat the entire thing without making any progress; what we need
instead is to treat that as failed (user) memory access.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/openrisc/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/openrisc/mm/fault.c b/arch/openrisc/mm/fault.c
index b4762d66e9ef..6734fee3134f 100644
--- a/arch/openrisc/mm/fault.c
+++ b/arch/openrisc/mm/fault.c
@@ -162,8 +162,11 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long address,
 
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
