Return-Path: <SRS0=MzJO=NO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D341C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 04:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DB6C20833
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 04:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="npqS+3UC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="O1VPs1At"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DB6C20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMh6QQIWfpcKAd44dwB5+0qpcnyYBm3OrLJzXuZ3Aho=; b=npqS+3UCuyWNvV
	NFeOFxPWuCdX6QEQDtcN4e/ZJ3RJWBwrDt4X7MGk8cWSpwA0pIa+b3W2OrwIk2AbdGqkVqrAziI5V
	7Jx7NBKE/ijtZMFjXK2UZJyJgJAmv17zcZaMS/I/oVDNwwArb4iprEB9tbtCECGPt6ssWb6ZmsDkk
	48AH6lJmGwAT86i5gq8Gui5n7RPGSnrFIx88CAixAVuk+OL7JTRbPcSz/dA2/+VQTJEDn2aEEGMS+
	i9aBH7OxHbufzrYCZH7HCHbdgMpgHLmWwJwT8Ulql6/A/lBsniZSEe/+y1tRLByii89D85WXmwmSv
	si6LthL8n9oRIusMa94g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIn7X-0006Oz-FM; Sat, 03 Nov 2018 04:01:11 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIn7N-00065S-VL
 for linux-riscv@lists.infradead.org; Sat, 03 Nov 2018 04:01:07 +0000
Received: by mail-pg1-x543.google.com with SMTP id r9-v6so1793024pgv.6
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 21:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Vdpt8w1x7+88qZlyVHMbUtXp7FQV7eYUa8pKh7HFuc=;
 b=O1VPs1AtCZe5Y4roHrhBhPmhNvdBh1rEO59rcRL8r952aGTqKq44fR14hT1hHaTQsN
 S0hH4ManKu+OM/M5WYY9nB6b+WItjdGWZuecDtTyvAmIaGP+B+/ydbpYtqXO7hI3VrgG
 vrkwLyMhAHVAIbpx1Yzq3cXw4ZnGQElDBkL2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Vdpt8w1x7+88qZlyVHMbUtXp7FQV7eYUa8pKh7HFuc=;
 b=D4ycGBJVak108Cc/z+KVZl9W6QJ57dkN5jwBZbIVpJG9sWJZidfnoHNFOFM1a4w9lG
 Hmj8wvk07HpW+WqAgfHP5g5dsGSseW8fHOYr4Qe/A/YUe6uUnQsZS8xvMKscNvLYUQrI
 Ki9gHxFoyTcKF6ck71rcNdK6kjDcrsk3UPZWEzaOrUEBP1ETDdGk+dA/8WcbLWFVH/7T
 FKIqm20+PjxIXQRhXhwsDLux3YcMizuCOC7OL6Cg98+lQCaD7xeG3tI/GYuDzJxK9y1H
 7nGcLOGU8cbE2KQAPaQLG/oAzZt1PXq/KY6G0xUMGJMXm4/d59Zj2rDQAHFh3Z+OMZ6j
 DYug==
X-Gm-Message-State: AGRZ1gJH5miPFBTkm1ghfxCK+13WANIiYg/0htnlJ6kj1r73kxqhD3mZ
 ntOGd13OtDwa+T4A6hNLtK94zQ==
X-Google-Smtp-Source: AJdET5d0fZtXdJgYGItC/ky/qG/5i8cxsZTf4nF4g/lWwHUYac4MhmIcJHJpC72tKDWuxoW2htzcZQ==
X-Received: by 2002:a63:f547:: with SMTP id e7mr13392017pgk.182.1541217653491; 
 Fri, 02 Nov 2018 21:00:53 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com
 ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id x36-v6sm35836232pgl.43.2018.11.02.21.00.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Nov 2018 21:00:52 -0700 (PDT)
From: Joel Fernandes <joel@joelfernandes.org>
X-Google-Original-From: Joel Fernandes <joelaf@google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next 2/3] mm: speed up mremap by 20x on large regions (v4)
Date: Fri,  2 Nov 2018 21:00:40 -0700
Message-Id: <20181103040041.7085-3-joelaf@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <20181103040041.7085-1-joelaf@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_210102_307526_4C47DAE5 
X-CRM114-Status: GOOD (  17.48  )
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
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, kvmarm@lists.cs.columbia.edu,
 dancol@google.com, Yoshinori Sato <ysato@users.sourceforge.jp>,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, anton.ivanov@kot-begemot.co.uk,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-s390@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, pantin@google.com, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181103040040.Vk8vS2_6-y2DLIDXY9uU8B7PNLcHisobTW8SHv7-1SQ@z>

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

Android needs to mremap large regions of memory during memory management
related operations. The mremap system call can be really slow if THP is
not enabled. The bottleneck is move_page_tables, which is copying each
pte at a time, and can be really slow across a large map. Turning on THP
may not be a viable option, and is not for us. This patch speeds up the
performance for non-THP system by copying at the PMD level when possible.

The speed up is an order of magnitude on x86 (~20x). On a 1GB mremap,
the mremap completion times drops from 3.4-3.6 milliseconds to 144-160
microseconds.

Before:
Total mremap time for 1GB data: 3521942 nanoseconds.
Total mremap time for 1GB data: 3449229 nanoseconds.
Total mremap time for 1GB data: 3488230 nanoseconds.

After:
Total mremap time for 1GB data: 150279 nanoseconds.
Total mremap time for 1GB data: 144665 nanoseconds.
Total mremap time for 1GB data: 158708 nanoseconds.

Incase THP is enabled, the optimization is mostly skipped except in
certain situations.

Acked-by: Kirill A. Shutemov <kirill@shutemov.name>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---

Note that since the bug fix in [1], we now have to flush the TLB every
PMD move. The above numbers were obtained on x86 with a flush done every
move. For arm64, I previously encountered performance issues doing a
flush everytime we move, however Will Deacon says [2] the performance
should be better now with recent release. Until we can evaluate arm64, I
am dropping the HAVE_MOVE_PMD config enable patch for ARM64 for now. It
can be added back once we finish the performance evaluation. Also of
note is that the speed up on arm64 with this patch but without the TLB
flush every PMD move is around 500x.

[1] https://bugs.chromium.org/p/project-zero/issues/detail?id=1695
[2] https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg140837.html

 arch/Kconfig |  5 +++++
 mm/mremap.c  | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index e1e540ffa979..b70c952ac838 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -535,6 +535,11 @@ config HAVE_IRQ_TIME_ACCOUNTING
 	  Archs need to ensure they use a high enough resolution clock to
 	  support irq time accounting and then call enable_sched_clock_irqtime().
 
+config HAVE_MOVE_PMD
+	bool
+	help
+	  Archs that select this are able to move page tables at the PMD level.
+
 config HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	bool
 
diff --git a/mm/mremap.c b/mm/mremap.c
index 7c9ab747f19d..7cf6b0943090 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -191,6 +191,50 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		drop_rmap_locks(vma);
 }
 
+static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
+		  unsigned long new_addr, unsigned long old_end,
+		  pmd_t *old_pmd, pmd_t *new_pmd)
+{
+	spinlock_t *old_ptl, *new_ptl;
+	struct mm_struct *mm = vma->vm_mm;
+	pmd_t pmd;
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
+	new_ptl = pmd_lockptr(mm, new_pmd);
+	if (new_ptl != old_ptl)
+		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
+
+	/* Clear the pmd */
+	pmd = *old_pmd;
+	pmd_clear(old_pmd);
+
+	VM_BUG_ON(!pmd_none(*new_pmd));
+
+	/* Set the new pmd */
+	set_pmd_at(mm, new_addr, new_pmd, pmd);
+	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
+	if (new_ptl != old_ptl)
+		spin_unlock(new_ptl);
+	spin_unlock(old_ptl);
+
+	return true;
+}
+
 unsigned long move_page_tables(struct vm_area_struct *vma,
 		unsigned long old_addr, struct vm_area_struct *new_vma,
 		unsigned long new_addr, unsigned long len,
@@ -237,7 +281,23 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 			split_huge_pmd(vma, old_pmd, old_addr);
 			if (pmd_trans_unstable(old_pmd))
 				continue;
+		} else if (extent == PMD_SIZE && IS_ENABLED(CONFIG_HAVE_MOVE_PMD)) {
+			/*
+			 * If the extent is PMD-sized, try to speed the move by
+			 * moving at the PMD level if possible.
+			 */
+			bool moved;
+
+			if (need_rmap_locks)
+				take_rmap_locks(vma);
+			moved = move_normal_pmd(vma, old_addr, new_addr,
+					old_end, old_pmd, new_pmd);
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
2.19.1.930.g4563a0d9d0-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
