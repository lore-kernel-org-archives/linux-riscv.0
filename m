Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECDDC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 20:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ioh4fLYCT+ZmxqqxQDOT4iUaPNME/xxMsYb6rZb0TnA=; b=zDxiO9Nv6IZYf3
	e84KPgDzqtnyMtcG46DvVfQGWdamv7H5dL8QLPrlFGYMD2bj88gHIO9nCuPYUziXXc2WPvXYXIeUc
	kWxsjYf+3DNIKXAt3S7o5qCMFc0iD3dZkETrOb+qT081PUDFxMdUTKtCAN9WoJcvhQbowYU4+ksif
	u5XavW/dg+TCFg1GP4tVAQ7aTl1WHnvqagvbTFFNsjfte0uMO3t790JscqfzWAP6hJJF8Z51lcUmf
	VtNaXy0nti30rbC63YemyN/+34jKtiZSchm3Y41GSsmpPQISZ48CAQMgyuz+5zfp6llWAIvggxlbb
	OWQtavqFD04NtoMpbATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwsJ-009D7h-2X; Tue, 31 Jan 2023 20:05:03 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwsG-009D5v-Kr
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 20:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6IKigZkqFBsGpbA9ajZ2Iw9VszpR27B7CG3/bEQJDxY=; b=eqmvDT91wCunq2V0AGR+ix+Vs+
	YV3cRNHbq+Oy47qp3ylEH4Hx8wSoOkaEB/q4RsfIimm+3zp2sK8JZ5/AkCaGprUFjL3LaVBMyP2wb
	ctSr4iPJXbxHiVykZr70RsmiAkRaZ3BbjqgAuai0uhpcmiS5vwLi62m3UYSrqalvn/nZqUk37rCq4
	hoDGKkp6jhvk9o+s3m9EWdmlljeMqELxaKTo/d3KRlTgwkcfslaVe+qAu9wCEu9cF6JTtjDYu7z4P
	gffgyZDBbqPaD23gHSwlTUZ72eJwvSErKw+PO7gny0NokmaAPqBpro/zvO2bxOQO4z0uezIuymel6
	sGcFpM0Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMwsC-005In0-1J;
	Tue, 31 Jan 2023 20:04:56 +0000
Date: Tue, 31 Jan 2023 20:04:56 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 04/10] m68k: fix livelock in uaccess
Message-ID: <Y9l0aBPUEpf1bci9@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120500_699056_39054637 
X-CRM114-Status: GOOD (  13.60  )
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

m68k equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
to page tables.  In such case we must *not* return to the faulting insn -
that would repeat the entire thing without making any progress; what we need
instead is to treat that as failed (user) memory access.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/m68k/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index 4d2837eb3e2a..228128e45c67 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -138,8 +138,11 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 	fault = handle_mm_fault(vma, address, flags, regs);
 	pr_debug("handle_mm_fault returns %x\n", fault);
 
-	if (fault_signal_pending(fault, regs))
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			goto no_context;
 		return 0;
+	}
 
 	/* The fault is fully completed (including releasing mmap lock) */
 	if (fault & VM_FAULT_COMPLETED)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
