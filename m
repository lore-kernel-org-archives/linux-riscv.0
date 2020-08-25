Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0F0C433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8F02071E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qK3pUhJw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMs4wCLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8F02071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2LclrAxC7WvqCBknbI8TR2A+YtLzr0FQ6dR4CUDeQdg=; b=qK3pUhJwlsL89dh+bw9gLTkc+
	w7WohKpq16XbkIE96dKDVTm/pX5+7n424YgQNYKp9PFRrkhODl3vdzK1o7LmlLewte3d81qdzq977
	0YvMaZp2MlPWusiTINr2N+F7MnZm9IWiU3mMo/InuLCtlgfgCPOps14xBeB8NXMRjnS+Q8GpjLky5
	7kWFNv9n5E6f9hTsZcumWxf8/nxN5oOiPjQfccEVacXaEg9pE/9s9se+qQVCA3KALrjrsoAKbdFik
	zG1jdJW4iHuQoOw/sz9JeW0+s4lda5B/gz/8HrKHS7hwCLcttpjBikqyP8V16C+BAeJxGfpagMWNl
	gbsZYpoHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdqy-00009q-1p; Tue, 25 Aug 2020 18:39:28 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdqv-00007q-F4
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:26 +0000
Received: by mail-lj1-x242.google.com with SMTP id t23so15013692ljc.3
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gk3JCJkGhLXPwijrQ795i2IvwNTBU8EMGdCc1RDLDCU=;
 b=AMs4wCLV+KjYM4/VjyPCsCtNoAxt1HxNvkpIqVTrbun0HubfgOhSliULITZcJH5c3n
 enH/WEMNRR6wtDC8vDJmnF7+E8Zs/m5gcG6vszXdwyq22xu9aOJtyS2dPphlj7YekSrW
 Hc0K3rsTmfiK2qRk1RVh40RhyJpu/Yy+o7dEDDnLghE0X2l51hU+XIQcLbMMf7KF9vVi
 oxyBXGuzeRiAsvhIro+OE7rJ7lNWUQtOXDFYy8K9BRWAE+PG7PGfk2SLwK/lPu1Xb3y3
 +fx0Z72pP3AfnwPIHVBcfpc1cUzYiNNmrwFwMj5IGKhfH2kiKJuOAMHu5siC2aCTouBm
 uLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gk3JCJkGhLXPwijrQ795i2IvwNTBU8EMGdCc1RDLDCU=;
 b=RPuaSX4WMuH5j5Y4177X+G2PPLKd4kBAsNerXUoGThLYaQwaUfcmu2xSESLfDTG7P6
 anHyAI5KVblMu6UKjznngKxwyIYGekuf5iS7LTU4sH4cDY3LU39OPW9N5xZYWcGhsoDb
 r2yX8lbsW+DGqG9eBvcmc5OIOWQAkzv9AVUWIygvrj5rZmjM0U1SmOXEnAXuTZAFekTS
 CEkVHC5swuqlfR3BcCWu+nDw3nU+JRkWNjs7NXLlCC7GnNTAxfcO3E5+huIoUgzt0t9m
 g6RqZ6f1j9I1hIchq4vmYjYFo/Vt81Bv6Bfw3AZbjTnnFILUlgsFNFDM0UO+L1aOrLV3
 4h6Q==
X-Gm-Message-State: AOAM53015QlAwG5S4y+LcJXi8Clgs2mJ7sitGCcTA5ZHgICCQXoQL2QQ
 a1xI5/Va5kWzt1ZNcx3EcZMABfynkllMXg==
X-Google-Smtp-Source: ABdhPJzh593rFLlH7n1CFAEu9ZDAeHjHMMdub5BI4jW1Nb5AtcBg3uxu73NWPS/mwALukUTlssCpEA==
X-Received: by 2002:a2e:b546:: with SMTP id a6mr5687836ljn.284.1598380763615; 
 Tue, 25 Aug 2020 11:39:23 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:23 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 2/8] riscv/mm/fault: Move bad area handling to bad_area()
Date: Tue, 25 Aug 2020 21:39:01 +0300
Message-Id: <20200825183907.275950-3-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
References: <20200825183907.275950-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143925_615176_5713DAFE 
X-CRM114-Status: GOOD (  15.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

This patch moves the bad area handling in do_page_fault() to bad_area()
function and converts gotos to calls to the new function.
---
 arch/riscv/mm/fault.c | 67 ++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 1612552478c5..ac9a99255365 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -37,6 +37,22 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
 	do_exit(SIGKILL);
 }
 
+static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code, unsigned long addr)
+{
+	/*
+	 * Something tried to access memory that isn't in our memory map.
+	 * Fix it, but check if it's kernel or user first.
+	 */
+	mmap_read_unlock(mm);
+	/* User mode accesses just cause a SIGSEGV */
+	if (user_mode(regs)) {
+		do_trap(regs, SIGSEGV, code, addr);
+		return;
+	}
+
+	no_context(regs, addr);
+}
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -90,14 +106,20 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 retry:
 	mmap_read_lock(mm);
 	vma = find_vma(mm, addr);
-	if (unlikely(!vma))
-		goto bad_area;
+	if (unlikely(!vma)) {
+		bad_area(regs, mm, code, addr);
+		return;
+	}
 	if (likely(vma->vm_start <= addr))
 		goto good_area;
-	if (unlikely(!(vma->vm_flags & VM_GROWSDOWN)))
-		goto bad_area;
-	if (unlikely(expand_stack(vma, addr)))
-		goto bad_area;
+	if (unlikely(!(vma->vm_flags & VM_GROWSDOWN))) {
+		bad_area(regs, mm, code, addr);
+		return;
+	}
+	if (unlikely(expand_stack(vma, addr))) {
+		bad_area(regs, mm, code, addr);
+		return;
+	}
 
 	/*
 	 * Ok, we have a good vm_area for this memory access, so
@@ -108,16 +130,22 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 
 	switch (cause) {
 	case EXC_INST_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_EXEC))
-			goto bad_area;
+		if (!(vma->vm_flags & VM_EXEC)) {
+			bad_area(regs, mm, code, addr);
+			return;
+		}
 		break;
 	case EXC_LOAD_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_READ))
-			goto bad_area;
+		if (!(vma->vm_flags & VM_READ)) {
+			bad_area(regs, mm, code, addr);
+			return;
+		}
 		break;
 	case EXC_STORE_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_WRITE))
-			goto bad_area;
+		if (!(vma->vm_flags & VM_WRITE)) {
+			bad_area(regs, mm, code, addr);
+			return;
+		}
 		flags |= FAULT_FLAG_WRITE;
 		break;
 	default:
@@ -161,21 +189,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	mmap_read_unlock(mm);
 	return;
 
-	/*
-	 * Something tried to access memory that isn't in our memory map.
-	 * Fix it, but check if it's kernel or user first.
-	 */
-bad_area:
-	mmap_read_unlock(mm);
-	/* User mode accesses just cause a SIGSEGV */
-	if (user_mode(regs)) {
-		do_trap(regs, SIGSEGV, code, addr);
-		return;
-	}
-
-	no_context(regs, addr);
-	return;
-
 	/*
 	 * We ran out of memory, call the OOM killer, and return the userspace
 	 * (which will retry the fault, or kill us if we got oom-killed).
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
