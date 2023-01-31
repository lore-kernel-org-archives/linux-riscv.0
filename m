Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93BAC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 20:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNKbn9DDyn8wPRmdaRtAGV/aCLU7Qugbn8mr4tnG8Nc=; b=d/dl1HcWEUa3Zr
	SMxvtnvNs3UHytzmjP+BJdJq4rcRuync1JKhicV6mYpPKz8e8UdfwjkpK2BaWs9aFr9Ws54zLk5zo
	lGvtI8y3UsWel7dKZZt7yyY3rsZ7is7myuuKjHJLiFQaozfS2KZDHboScr/9iVCnPPLfFzd2svhyM
	As95Pl14s78H7d5E5wbGpoCuhALDc1UmR0lgbStMF8y15i1a19++ssWlB4SMlLe+inTU6CM0rcbEJ
	NItFqs01fUAQfKLj4mPg9boQvePBjVo5O14xJ5z80aZJJLjB8X/KNn1SrJ1xB+o6bAc9WaWsuEC8Z
	Vz5WRqboIErbwsYGNpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwu6-009Dou-3n; Tue, 31 Jan 2023 20:06:54 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwu3-009DnZ-RW
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 20:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nvc6EOOE6Kc37iQ5tEQ7l2xOJqqEJfVCbXPLSTxaEF4=; b=wdY4q/NUsSzoOzzSH9JWxFXi7s
	Tk1MepTXqcFNQuqsv6PLGLDlWg/ho5Hq7LbS/6/Ozd57SshWTeDBArvFWXDhGFh2BhNX8dBI4LgkO
	LpJmKqpkO4x5vY1+b9CcqUE0aGIpoyS5qStg8iBjcK+HypQyzzYiPNvF/dOM89WyZgG3dUo1oR8AB
	ONYs1wDgkd19QVLeBTvry12xY2pe789ERsnyEmEuQrns462tlSiqhjy4E15CVoyugsuWlzfNMig0b
	a6a88eJ+8ZtJ/kyRgEu6wVtRz1ghz6pXOq3cyUYQcf7ksmGIi6rbK4dPwUT0N6fTylQGUN8noABNX
	qOw7Ui/A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMwu0-005IoI-1G;
	Tue, 31 Jan 2023 20:06:48 +0000
Date: Tue, 31 Jan 2023 20:06:48 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 09/10] riscv: fix livelock in uaccess
Message-ID: <Y9l02DvS6CYThTEG@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120651_903376_27C8E9B6 
X-CRM114-Status: GOOD (  13.79  )
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

riscv equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
to page tables.  In such case we must *not* return to the faulting insn -
that would repeat the entire thing without making any progress; what we need
instead is to treat that as failed (user) memory access.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/riscv/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index d86f7cebd4a7..c91d85349d39 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -324,8 +324,11 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * signal first. We do not need to release the mmap_lock because it
 	 * would already be released in __lock_page_or_retry in mm/filemap.c.
 	 */
-	if (fault_signal_pending(fault, regs))
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			no_context(regs, addr);
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
