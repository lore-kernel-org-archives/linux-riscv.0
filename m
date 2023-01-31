Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48F9C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfJ8j/NpqbQ0m3FNESr2oSVlhZ4YV0q37GGMDivrmWY=; b=VhpBLDGjV/AvrT
	vwIHWU4LdV8J4qlapcw0x1j1SJYeAwXkyJyujOOoP9Ir+L+jKSytJ77PBh4v/E75AEByHC+s5SXd0
	MyN9CNdFc6936ihHj9JlLJllnD+hCy6xX0VI5jzf1kWaOF7FybWTz9dtl87hE0C7W2OY94kGo0gPR
	yA/rY/y4CbOIlbqVNtASX+vgAEHjoIhZOVKnL1J9DfZvyRqz3VyZry5+amMmnfMztms/UyMlsiroQ
	3LYr6O+6aubcebWRxAo4UgToSwPBWMrqTr/uMQp/o/EbvpG0fSqOlSWecMRQENoxclINg0vF5BXsN
	lNkVhCsUqYkrE6rpoUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwua-009DzA-8c; Tue, 31 Jan 2023 20:07:24 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwuY-009DyK-A7
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 20:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fkGQb+Z+Q8nqxAsgBkwiDlyCIx3ldW4LiysiQRChEQY=; b=uiRdXlLmPVjFhiEbdNWx2iBg/L
	ukT6759SKWvD4VTcf7s8Zrnsy20tZQIyfGpDAYQMZK4Vr2bXIoZfz9SOM1xMKM3izRzmQrCiw1f59
	7UEFhjpIZP09LO6b7yhwL8PNq1KyjxUHtjTU7yoIPqR36F37H94mx0pWJ3RipDcr8xYjM1AAKeQ3J
	xKdN74J8AHWk6MLBfur4EYMpaBLeXd7YgHATaE32CWS+oS9CqUV91B1jzUXKjV+MrSoHKbtmYhCoh
	8etJOX4tJer3i70iBmbcFo15uIh3SC5WE7al3VG5ojYolEtBMrtuCEO4yPEAB5yxFlJ8pp4muojCB
	NT+qnH5Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMwuT-005Ioa-1X;
	Tue, 31 Jan 2023 20:07:17 +0000
Date: Tue, 31 Jan 2023 20:07:17 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 10/10] sparc: fix livelock in uaccess
Message-ID: <Y9l09ZE7q0POyBC3@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120722_364676_600C0D05 
X-CRM114-Status: GOOD (  13.61  )
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

sparc equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
to page tables.  In such case we must *not* return to the faulting insn -
that would repeat the entire thing without making any progress; what we need
instead is to treat that as failed (user) memory access.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/sparc/mm/fault_32.c | 5 ++++-
 arch/sparc/mm/fault_64.c | 7 ++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
index 91259f291c54..179295b14664 100644
--- a/arch/sparc/mm/fault_32.c
+++ b/arch/sparc/mm/fault_32.c
@@ -187,8 +187,11 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	 */
 	fault = handle_mm_fault(vma, address, flags, regs);
 
-	if (fault_signal_pending(fault, regs))
+	if (fault_signal_pending(fault, regs)) {
+		if (!from_user)
+			goto no_context;
 		return;
+	}
 
 	/* The fault is fully completed (including releasing mmap lock) */
 	if (fault & VM_FAULT_COMPLETED)
diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index 4acc12eafbf5..d91305de694c 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -424,8 +424,13 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 
 	fault = handle_mm_fault(vma, address, flags, regs);
 
-	if (fault_signal_pending(fault, regs))
+	if (fault_signal_pending(fault, regs)) {
+		if (regs->tstate & TSTATE_PRIV) {
+			insn = get_fault_insn(regs, insn);
+			goto handle_kernel_fault;
+		}
 		goto exit_exception;
+	}
 
 	/* The fault is fully completed (including releasing mmap lock) */
 	if (fault & VM_FAULT_COMPLETED)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
