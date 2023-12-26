Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A7AC46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 21:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yEGXLnwxlmnborE81TAxgiSE5exKSpMZXiQSsjE+4aM=; b=Agz
	aABZRr1Yl6U1W89g5kueKO1tbv62BIsLjjMAF9962v8VtxZtjnWPZ4yB+5yNNEopABhq/R/VQkbvF
	guo71i+cxiD1HM8Y1F6lAc3LIxeDLl/6JQmmFYdv/0eiOeN0Ma8bmy5xzFU+SMEnkV2PoeGKhtMf1
	BWILnJQgzgtBGflYbeLIUQIdP+WInWZ1UK1BjMI8frfIUEgv8XNRsLfxamgMUfKJxEvgEkzLnpT8E
	XlX3KiTlSyi4z0QAvbkvHGTqp+YE357cIKG8v8w3j1JkwWjafC4RAOmlLFt8muDoLUV3IWmbyCv+P
	HL9RYcZ4MThPxHwcQTEg7Roa0C06keQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIFFk-00DZTL-1r;
	Tue, 26 Dec 2023 21:46:20 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIFFg-00DZS8-2J
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 21:46:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5e9074bb7c5so59869337b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Dec 2023 13:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703627174; x=1704231974; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mMjOi6FiRyRmKbg6dFlezaHitoPpTFUdgOKhuK4Mldc=;
        b=mqIg1vt6qdaG47jJojRopwRj15bcpS9BJjOeDa8qFV/WjQqzYGmEsvX+oh9fQSFuxK
         05G6P+xZv1lcBBKJi5f5j57JUuPAeQlhXIAEdNagHmMbgBbPw6pXjx+Hlq4wsU/o3wvz
         DjeCtzMLH+nvT3yTvRsNVwNy59wqK+2JOydyFNKHPq7Nm2D8m6Ne99ea0LYfPk9S5JyK
         QK0UJV+56T0kc+pLx4g7EQWpM6SP2YCh60q4tbTWW8fUFrNjKKD8wxwXYzeSXdUl7M+E
         W0Zn7C1wBca2FqvHoPM0JGZ3+AE0M10m0/MhUgf9ERaju5jRNsx+KaITVOf5D8igtniV
         DC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703627174; x=1704231974;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMjOi6FiRyRmKbg6dFlezaHitoPpTFUdgOKhuK4Mldc=;
        b=FupX+ba/2oTdaaFzrfrZfUFr/ne+6nvlSzygigxsgOptl/Wx+kVkGOwCuuL9CfpI6N
         xnvlbpOBD96/Oq5+G5suEhY/34ZhSQ3KyL0WaDyXm7eaX77L0S8zc1Cmi02oSvIeXFlW
         Qg1ldyp/x6soryaJyaQwe60KzO8KKl3/ccKZWZ5s5DJRQ2sLE9ahTRvpKR7yFoaFD//3
         4ri11FggFf7NhqvUXN2+H6FT3m9ir//WIisOKftQ1UyIBeCralN2QUTt6Eo4nFapY9wi
         qyzFvty6WPboAGbFN+Aa/Ku8qZI66rDq6XM9MrkMbY/LBxTYmzpOzJu8/syjQEdSAN4B
         lRJQ==
X-Gm-Message-State: AOJu0YwsUN0uUqa2LduC3bap3ycXDGF8BN+CJFdur0nLtuMSXTUhTk4A
	YSgJbRBYoAb5tOLCMBCB4zxscGbVn4KigbhV8g==
X-Google-Smtp-Source: AGHT+IEwN5ZopzHJIGGQGpit5mUuOLFU32rRNfgvV8zD7G1zJhrTDdVwgrA0i89ppBRhVWOedmhks73ZIg4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:158e:a76f:5745:9194])
 (user=surenb job=sendgmr) by 2002:a05:690c:d1e:b0:5e7:12cc:a60f with SMTP id
 cn30-20020a05690c0d1e00b005e712cca60fmr3151383ywb.6.1703627174107; Tue, 26
 Dec 2023 13:46:14 -0800 (PST)
Date: Tue, 26 Dec 2023 13:46:10 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231226214610.109282-1-surenb@google.com>
Subject: [PATCH 1/1] arch/mm/fault: fix major fault accounting when retrying
 under per-VMA lock
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, will@kernel.org, catalin.marinas@arm.com, 
	palmer@dabbelt.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu, 
	agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	surenb@google.com, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_134616_772950_BF2FDF75 
X-CRM114-Status: GOOD (  12.63  )
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

A test [1] in Android test suite started failing after [2] was merged.
It turns out that after handling a major fault under per-VMA lock, the
process major fault counter does not register that fault as major.
Before [2] read faults would be done under mmap_lock, in which case
FAULT_FLAG_TRIED flag is set before retrying. That in turn causes
mm_account_fault() to account the fault as major once retry completes.
With per-VMA locks we often retry because a fault can't be handled
without locking the whole mm using mmap_lock. Therefore such retries
do not set FAULT_FLAG_TRIED flag. This logic does not work after [2]
because we can now handle read major faults under per-VMA lock and
upon retry the fact there was a major fault gets lost. Fix this by
setting FAULT_FLAG_TRIED after retrying under per-VMA lock if
VM_FAULT_MAJOR was returned. Ideally we would use an additional
VM_FAULT bit to indicate the reason for the retry (could not handle
under per-VMA lock vs other reason) but this simpler solution seems
to work, so keeping it simple.

[1] https://cs.android.com/android/platform/superproject/+/master:test/vts-testcase/kernel/api/drop_caches_prop/drop_caches_test.cpp
[2] https://lore.kernel.org/all/20231006195318.4087158-6-willy@infradead.org/

Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/arm64/mm/fault.c   | 2 ++
 arch/powerpc/mm/fault.c | 2 ++
 arch/riscv/mm/fault.c   | 2 ++
 arch/s390/mm/fault.c    | 3 +++
 arch/x86/mm/fault.c     | 2 ++
 5 files changed, 11 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 460d799e1296..55f6455a8284 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -607,6 +607,8 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		mm_flags |= FAULT_FLAG_TRIED;
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 9e49ede2bc1c..53335ae21a40 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -497,6 +497,8 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
 
 	if (fault_signal_pending(fault, regs))
 		return user_mode(regs) ? 0 : SIGBUS;
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 90d4ba36d1d0..081339ddf47e 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -304,6 +304,8 @@ void handle_page_fault(struct pt_regs *regs)
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
 
 	if (fault_signal_pending(fault, regs)) {
 		if (!user_mode(regs))
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index 249aefcf7c4e..ab4098886e56 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -337,6 +337,9 @@ static void do_exception(struct pt_regs *regs, int access)
 		return;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
+
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
 		if (!user_mode(regs))
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index ab778eac1952..679b09cfe241 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1370,6 +1370,8 @@ void do_user_addr_fault(struct pt_regs *regs,
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
-- 
2.43.0.472.g3155946c3a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
