Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C588BC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uodmNwo9d3j+07tOQi7BWojyQJxZ/dgqkTwKmMXgzdc=; b=oMuxAW7EZnPnKY
	+SRXGS5qoHgjY4tL3QGdlKoPbWTffnaSPoZIKBDvIUcotc7t3CQbW/CnHgtt1CywZxO6Lmsknox/Z
	vkZlhONQ/CdH0fkz7aO11EqmVWngb+XCw+zA4WKxYwlv9sZkgwZ10/XeHhVHm6Z1YS6878VWMOLiM
	O78O65UjFQz7wyM3D11zIE8ghx9ChQBLxiNCKu6mjB872imU8+h0S76bDzIF9wuyiBb3hKp6IaS8d
	N09o5Khw2yeZRi8zTkxtYGIVJ4zq6P6cxDr9JgInM9cy/r6WYvP1u4pYKR/elLBoG2SPCbbsZqFke
	gwmeyKs9xjVLyLLcm+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwrO-009Csg-CX; Tue, 31 Jan 2023 20:04:06 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwrL-009CrN-6t
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 20:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NiUEF1IXJzgFv+aygXF4aq+5ipqUNm7thH541I6WfmM=; b=qrX5aIC933LH7FY3NYNDGqcac3
	J4RLy9ITM/ESnjrkRtt+ZQZJOfvq0nIQwfvgMBcOTyfnzTmsJv84XzPORhXETQTOoOLXXWaMPU11g
	wWvVQAG9vO2sKKmMVQG8WX8stYodaZrmsCPGFrGtLUFejEjbL5wY0E4oFziMjX/2m0AbZQSq8/0uo
	hwlfhKenawZVF2SiZJ4iM3vie9sd4lhkhYK7rAPK7z2zUPYejBHQbpjvBB2tcRo3dqkR/nIhuM5/c
	9ssUOIlT1HzcYif+UgzMVS3T5gmkNtW3FdxCDLxJ0wrOJVILV80fadrELvoH7vDx8WyS7SD6axv1Z
	hQer2gQA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMwrH-005Ilf-1l;
	Tue, 31 Jan 2023 20:03:59 +0000
Date: Tue, 31 Jan 2023 20:03:59 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 02/10] hexagon: fix livelock in uaccess
Message-ID: <Y9l0LyAA3zAGeT51@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120403_274529_C5D76CD1 
X-CRM114-Status: GOOD (  13.49  )
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

hexagon equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
to page tables.  In such case we must *not* return to the faulting insn -
that would repeat the entire thing without making any progress; what we need
instead is to treat that as failed (user) memory access.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/hexagon/mm/vm_fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/hexagon/mm/vm_fault.c b/arch/hexagon/mm/vm_fault.c
index f73c7cbfe326..4b578d02fd01 100644
--- a/arch/hexagon/mm/vm_fault.c
+++ b/arch/hexagon/mm/vm_fault.c
@@ -93,8 +93,11 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 
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
