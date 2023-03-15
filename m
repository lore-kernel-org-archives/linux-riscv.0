Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03E6C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 04:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uZ0uQkqdMYMHDGYSDqsd0uhVJAbergNBo6+HglH/aM=; b=Kd7NuDK2Ngefc1
	lmTEcVWEeil+so5l5QsHdiFGOSFjhzHXzwbPX1cfmYArviVMqO+hXKbCl2DK60AyWzdlOJXMYWeB+
	FjVt86eBM5IS14dNK4JqoCApoURWMFraICxT/RNdBgkNuwok418vkJ/pLWadwElVzt8lPp2YN6DNc
	KPW6yUHqsNItMV/IbwSas5TsL/YQbP733Q/ofsenLhljUId7umkg1FZAPnezdgzvIou7wz2/q2Zu5
	IRVvrMFN3Yco4aYupVlU4EFgZV7Tv2gCqtFGTAQUKOaTnYFFCU6y5qgmjCrcOVMWtkvyttf+vvna6
	z81UQ09ffOy+Vr+XRZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIYL-00CFmg-34;
	Wed, 15 Mar 2023 04:15:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSD-00C6h1-0t
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:05:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id p20so18607565plw.13
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678849526;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPLiCKdxpc2r5PKNkHmqRCNmdb24wQijBhgYpLkC43U=;
        b=hZOWobSL1PKWIUT7UWS9tniLiB9mdfLQVx/Z/9zPgZaqvjnOteqzCtEB9HjY6uDm5Z
         iih9EdmkZVUeQo0xOfl1VcnfVacdcLCd8AJJAPxhyA2sm6Xke46e1e2rJ7Rh0BSVXkF8
         LPvQJyzonpQFWDXt2SUjjq9ID4+tvuPP8BALY8prYRlpppPYUlsITVn79fdnaiUXQEF1
         deb+t9btxFOPW+9acEXIhNbZp2doaKT5YgC3FtBNm79vfC3LW+6mWJ6+9PBqPIyH0Kic
         Coc17KHtjWazt5MqaHhgFOTwgQhPQ0N0ANZIoSAUsfoul0ONsbg8PSj+Y8JcyFTwqcEL
         HRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849526;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPLiCKdxpc2r5PKNkHmqRCNmdb24wQijBhgYpLkC43U=;
        b=vPqvaUSb9k0hL9lM7PH67APNQRaAE6RiQInbHuA3xTZIvNUIVzfPKhKeEddxARBJBG
         Syg731AEo+fobDZJShAFr0r0ZDWNRp+dxcVaPG2Q0QgDGcSkX0j53rgzAE54aZsoHZ0a
         tfaMRAi+55rfR+luWzrhygOqtBwiwgmKnDSEbKG90wQfHGQ2UsAHV02rRUUxzbsDtmi7
         CHMZcNZ6intOvwkas8wCnkmpjckJUKd5t/6QiSiEt/BSlb5D3dMeZzLoEOri09C9K0TM
         6J3rzIf0eBYuKNsgJFBfNbTzIogPIr/tHKUA3kIC5L4wValPkrBGSXFs5QLnxTYA7A1u
         +biQ==
X-Gm-Message-State: AO0yUKU9/cHqLWT9li2PwBTmAhVnvvZfBrH0YEIW+Bg80+hzjfSPqrj2
	XNgTgsECuJBvIA6pKuo9+gD15Q==
X-Google-Smtp-Source: AK7set9vypcudDyWo/h8khv9E95mQjVI9aZbPGtfY3t0wFWv20PLrTeh2GiFiqI+9gk8Y0mpUagQ+Q==
X-Received: by 2002:a17:902:ec8a:b0:19e:416e:abf5 with SMTP id x10-20020a170902ec8a00b0019e416eabf5mr1078987plg.34.1678849526457;
        Tue, 14 Mar 2023 20:05:26 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s30-20020a63451e000000b0050300a7c8c2sm2194674pga.89.2023.03.14.20.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:05:26 -0700 (PDT)
Subject: [PATCH v2 1/6] riscv/mm/fault: simplify code for do_page_fault()
Date: Tue, 14 Mar 2023 20:03:54 -0700
Message-Id: <20230315030359.14162-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315030359.14162-1-palmer@rivosinc.com>
References: <20230315030359.14162-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Tong Tiangen <tongtiangen@huawei.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_200529_564968_5B3E0AFA 
X-CRM114-Status: GOOD (  18.57  )
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

From: Tong Tiangen <tongtiangen@huawei.com>

To make the code more hierarchical and readable, we fold vma related
judgments into __do_page_fault(). And to simplify the code, move the
tsk->thread.bad_cause's setting into bad_area(). No functional change
intended.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/fault.c | 77 +++++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 460f785f6e09..0a8c9afeee22 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -85,6 +85,8 @@ static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_f
 
 static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code, unsigned long addr)
 {
+	current->thread.bad_cause = regs->cause;
+
 	/*
 	 * Something tried to access memory that isn't in our memory map.
 	 * Fix it, but check if it's kernel or user first.
@@ -200,6 +202,38 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 	return false;
 }
 
+#define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
+#define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
+
+static vm_fault_t __do_page_fault(struct mm_struct *mm, unsigned long addr,
+				unsigned int mm_flags, struct pt_regs *regs)
+{
+	struct vm_area_struct *vma = find_vma(mm, addr);
+
+	if (unlikely(!vma))
+		return VM_FAULT_BADMAP;
+
+	if (unlikely(vma->vm_start > addr)) {
+		if (unlikely(!(vma->vm_flags & VM_GROWSDOWN) ||
+				expand_stack(vma, addr)))
+			return VM_FAULT_BADMAP;
+	}
+
+	/*
+	 * Ok, we have a good vm_area for this memory access, so
+	 * we can handle it.
+	 */
+	if (unlikely(access_error(regs->cause, vma)))
+		return VM_FAULT_BADACCESS;
+
+	/*
+	 * If for any reason at all we could not handle the fault,
+	 * make sure we exit gracefully rather than endlessly redo
+	 * the fault.
+	 */
+	return handle_mm_fault(vma, addr, mm_flags, regs);
+}
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -207,7 +241,6 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 asmlinkage void do_page_fault(struct pt_regs *regs)
 {
 	struct task_struct *tsk;
-	struct vm_area_struct *vma;
 	struct mm_struct *mm;
 	unsigned long addr, cause;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
@@ -282,44 +315,16 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		flags |= FAULT_FLAG_INSTRUCTION;
 retry:
 	mmap_read_lock(mm);
-	vma = find_vma(mm, addr);
-	if (unlikely(!vma)) {
-		tsk->thread.bad_cause = cause;
-		bad_area(regs, mm, code, addr);
-		return;
-	}
-	if (likely(vma->vm_start <= addr))
-		goto good_area;
-	if (unlikely(!(vma->vm_flags & VM_GROWSDOWN))) {
-		tsk->thread.bad_cause = cause;
-		bad_area(regs, mm, code, addr);
-		return;
-	}
-	if (unlikely(expand_stack(vma, addr))) {
-		tsk->thread.bad_cause = cause;
-		bad_area(regs, mm, code, addr);
-		return;
-	}
 
-	/*
-	 * Ok, we have a good vm_area for this memory access, so
-	 * we can handle it.
-	 */
-good_area:
-	code = SEGV_ACCERR;
+	fault = __do_page_fault(mm, addr, flags, regs);
 
-	if (unlikely(access_error(cause, vma))) {
-		tsk->thread.bad_cause = cause;
-		bad_area(regs, mm, code, addr);
-		return;
-	}
+	if (unlikely(fault & VM_FAULT_BADMAP))
+		return bad_area(regs, mm, code, addr);
 
-	/*
-	 * If for any reason at all we could not handle the fault,
-	 * make sure we exit gracefully rather than endlessly redo
-	 * the fault.
-	 */
-	fault = handle_mm_fault(vma, addr, flags, regs);
+	if (unlikely(fault & VM_FAULT_BADACCESS)) {
+		code = SEGV_ACCERR;
+		return bad_area(regs, mm, code, addr);
+	}
 
 	/*
 	 * If we need to retry but a fatal signal is pending, handle the
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
