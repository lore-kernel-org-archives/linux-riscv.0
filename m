Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF74DC67837
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 01:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804ED2085B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 01:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dK8RfBmU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="LsSw1vpD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804ED2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9zW8u2vSXn/5LqmMk2TF3HTnzvSmfqZYzktiIpiDdg=; b=dK8RfBmULEZZQK
	0LRM468ctUlWaFsh9Wp3EhU2vjDLR5rb8KTWYQGQdQo169BdehNuEJqO9Kf52wDWGYT2X6YlbFuaY
	hxUyrQbu0kXcZ8G6T291B90W88y4VXMY3gAiE7ZWymo2QU8jIXJop9PwmHnQqiUnX4iyqIuR8/ZbY
	TIg4x+/FVYvIDNmQjdGVW/zLf+L9mrk2IosZeLp5PrtaQjJ5VU7XfUWlZMYL56QZSazeXGPRVDv8H
	4NZLNuaFN2JfYMQ5y0E8/eDXvA9ltEqLhmj1v4Jz24Qn5xU4NgrjX+JslGfjzLTMJ9cDjGaDCAc0t
	BEwWUlfAHd4hhe6koSFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAmPt-0000ob-EZ; Fri, 12 Oct 2018 01:39:01 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAmPY-0000fp-AQ
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 01:38:55 +0000
Received: by mail-pg1-x544.google.com with SMTP id r9-v6so5026322pgv.6
 for <linux-riscv@lists.infradead.org>; Thu, 11 Oct 2018 18:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dggn5B4IBu45Jn7zEl0E2fj69SPqXRDWjnCUm47KypI=;
 b=LsSw1vpD6ikHCDlHIdb32QqvyyD1aufOxX01LgEqyrMGWyOJ1mHdUHyzEzygBR+xLd
 TIxYQJcEPWFIgTQUATKtaHKLczWAinYHDhv011+Gnh/+Qi/LC2TAWAj+854O/MuIi8aC
 BliyIqaNGeI2Aup77gD0CTMF4+r7KrlzECZpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dggn5B4IBu45Jn7zEl0E2fj69SPqXRDWjnCUm47KypI=;
 b=dORzq+EiS396IXiCNitTGogexkjMxKugvHwRKp2B/a84kP5tR4+eeG3GwEwuDjNy9W
 pNzqDvN0eww4aVPoxk9u83Eij0SamMEhgqrIpLTgXhkbb5METsva2YXw9CzwLcheEsi1
 e9t6MgyJWqgJVatXJkJZSeo4P9dvP+yYXZQT/tDZiALGClIdKn1wHDYmMtxUUvcmKJhq
 B/GkERCgIRQqy8gbtiChVZWWcVj0rm9Y1G2+DBoOlwqub6uPEmN+0GTQMwqOoHqz+XtN
 ot9opdW712zX3kk35phpjf6Mvl1buOyP1pRj9sEPu5jPwJkZz5syFl7PJihb94wKUOxl
 OjCA==
X-Gm-Message-State: ABuFfoj+9+5ljG7bKv7zqoJ0bSjKenF6NhDt9QHXDSjN1bqNbdbCJd38
 6WljoXsfW0ekB421vxoBu50K0w==
X-Google-Smtp-Source: ACcGV61tz0/GbKfPpP1c456XQdgBZ23xjLvyfPMWVbzi0nQNQAiYVb14DRNaCNmsX/sYxGkmelY9Fw==
X-Received: by 2002:a63:da57:: with SMTP id
 l23-v6mr3637797pgj.179.1539308309341; 
 Thu, 11 Oct 2018 18:38:29 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com
 ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id a14-v6sm31193393pgi.75.2018.10.11.18.38.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Oct 2018 18:38:28 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Date: Thu, 11 Oct 2018 18:37:56 -0700
Message-Id: <20181012013756.11285-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20181012013756.11285-1-joel@joelfernandes.org>
References: <20181012013756.11285-1-joel@joelfernandes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181011_183840_419820_029E4A96 
X-CRM114-Status: GOOD (  16.27  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 mhocko@kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 kirill@shutemov.name, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, linux-parisc@vger.kernel.org,
 pantin@google.com, Max Filippov <jcmvbkbc@gmail.com>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012013756.4COtL4bmOtESI7bzaE3-ZiaDlWFPcYy6m71Lu6rMyKo@z>

Android needs to mremap large regions of memory during memory management
related operations. The mremap system call can be really slow if THP is
not enabled. The bottleneck is move_page_tables, which is copying each
pte at a time, and can be really slow across a large map. Turning on THP
may not be a viable option, and is not for us. This patch speeds up the
performance for non-THP system by copying at the PMD level when possible.

The speed up is three orders of magnitude. On a 1GB mremap, the mremap
completion times drops from 160-250 millesconds to 380-400 microseconds.

Before:
Total mremap time for 1GB data: 242321014 nanoseconds.
Total mremap time for 1GB data: 196842467 nanoseconds.
Total mremap time for 1GB data: 167051162 nanoseconds.

After:
Total mremap time for 1GB data: 385781 nanoseconds.
Total mremap time for 1GB data: 388959 nanoseconds.
Total mremap time for 1GB data: 402813 nanoseconds.

Incase THP is enabled, the optimization is skipped. I also flush the
tlb every time we do this optimization since I couldn't find a way to
determine if the low-level PTEs are dirty. It is seen that the cost of
doing so is not much compared the improvement, on both x86-64 and arm64.

Cc: minchan@kernel.org
Cc: pantin@google.com
Cc: hughd@google.com
Cc: lokeshgidra@google.com
Cc: dancol@google.com
Cc: mhocko@kernel.org
Cc: kirill@shutemov.name
Cc: akpm@linux-foundation.org
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 mm/mremap.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/mm/mremap.c b/mm/mremap.c
index 9e68a02a52b1..d82c485822ef 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -191,6 +191,54 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		drop_rmap_locks(vma);
 }
 
+static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
+		  unsigned long new_addr, unsigned long old_end,
+		  pmd_t *old_pmd, pmd_t *new_pmd, bool *need_flush)
+{
+	spinlock_t *old_ptl, *new_ptl;
+	struct mm_struct *mm = vma->vm_mm;
+
+	if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
+	    || old_end - old_addr < PMD_SIZE)
+		return false;
+
+	/*
+	 * The destination pmd shouldn't be established, free_pgtables()
+	 * should have release it.
+	 */
+	if (WARN_ON(!pmd_none(*new_pmd)))
+		return false;
+
+	/*
+	 * We don't have to worry about the ordering of src and dst
+	 * ptlocks because exclusive mmap_sem prevents deadlock.
+	 */
+	old_ptl = pmd_lock(vma->vm_mm, old_pmd);
+	if (old_ptl) {
+		pmd_t pmd;
+
+		new_ptl = pmd_lockptr(mm, new_pmd);
+		if (new_ptl != old_ptl)
+			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
+
+		/* Clear the pmd */
+		pmd = *old_pmd;
+		pmd_clear(old_pmd);
+
+		VM_BUG_ON(!pmd_none(*new_pmd));
+
+		/* Set the new pmd */
+		set_pmd_at(mm, new_addr, new_pmd, pmd);
+		if (new_ptl != old_ptl)
+			spin_unlock(new_ptl);
+		spin_unlock(old_ptl);
+
+		*need_flush = true;
+		return true;
+	}
+	return false;
+}
+
 unsigned long move_page_tables(struct vm_area_struct *vma,
 		unsigned long old_addr, struct vm_area_struct *new_vma,
 		unsigned long new_addr, unsigned long len,
@@ -239,7 +287,21 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 			split_huge_pmd(vma, old_pmd, old_addr);
 			if (pmd_trans_unstable(old_pmd))
 				continue;
+		} else if (extent == PMD_SIZE) {
+			bool moved;
+
+			/* See comment in move_ptes() */
+			if (need_rmap_locks)
+				take_rmap_locks(vma);
+			moved = move_normal_pmd(vma, old_addr, new_addr,
+					old_end, old_pmd, new_pmd,
+					&need_flush);
+			if (need_rmap_locks)
+				drop_rmap_locks(vma);
+			if (moved)
+				continue;
 		}
+
 		if (pte_alloc(new_vma->vm_mm, new_pmd))
 			break;
 		next = (new_addr + PMD_SIZE) & PMD_MASK;
-- 
2.19.0.605.g01d371f741-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
