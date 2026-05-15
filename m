Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23176CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=78BcHup3A9szODZenSG7GDbvhvfnu7G3e43ZfJPXjrs=; b=VTp1IYGBUk9fk10Evzo2FJOrVk
	sSn1VuME57XHe5wu/PNDD17L45+6HO2nj2+kWSHlcRf8Uw8CjdZrvbIFYwLsppQ0Cr/BFiMY9icwF
	PGvCNr5In5tUEc6Kkbwf1IBXj822wTgwUCisgMMC8OF24MiPhfLTkNkN7yP3qSOofxFYvwR4w3qBN
	wu00LySO2bBZZaa4l/0N0BpFcWecbfKQAGyz7lEf6Y56lurEoRFmnyeHh1yOzJf+rUvdBAdI+tTza
	wEK1SmssN31F8E4VM4UWo2vrLHOHqYK6MJxV3OBrxbIofj56xvQnwQ8NjlKYmZI0lRVW6ZrQV1xG1
	97Ygde5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNswk-00000008UZ1-1z8u;
	Fri, 15 May 2026 13:51:22 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNswh-00000008UXk-3EBe
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 13:51:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so9663027b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 06:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778853078; x=1779457878; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7fxCMimmNsvVLuGM+eq9TJTg+IBO/pqIm0gpoVqUw5E=;
        b=gfIFTo7NsEEhD2zp2aX3khyNgrpSnGct3j6GxlURSiV9OpC7D7WF8ZBAaJHaHyVvR4
         s0zrxOlzyEUNLDxX7xysuhaL/4oUou6lyZIG2XHLIV8l5JtJuLQgp1k4J30TbbnZrm6I
         kki3BMADcDK1FAAyBb/BBGKd6awFuNxCnWEmp5shUJvsDguTPOUkVy94HdK+OymyuSnV
         2G/d3hBjUjVyF6DBXqjEJFGsw/OuV9JoDqUH86hZ8R9RNVLsMcWuELuWnPzGUjvBg+Pg
         EfUU1ZM8sWAf2GMRoa7WEHwxsb25NH6pQAGYLUdXIPI2yUmJe9U6zIJDkrxSH/o4+QYw
         gb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853078; x=1779457878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fxCMimmNsvVLuGM+eq9TJTg+IBO/pqIm0gpoVqUw5E=;
        b=TaUrPLYUdhLSrcGv5diFIpHcMNb1QRaOgSynhx18+YWH8zfHjoP8fRFI+VcvPMH6Z0
         RczRQM6XEhLFPGK/DeDDTqmHWf1nzvUchgfpAc6SHH9DluaLReafbnPiv/d0Ro29Qvvz
         pZpJxnR1R5QzJaV8zX/QS8ciV1CDhLgQ1g7oZnGQd5VNcTylMMpN2Ci8SAVl8L0bBMEL
         Y0+fI+d+e6gN3EWPlQUjDqoCux6iE8xaGAmjkd0CexN7pq4Jc1/VrnbpRYVB56IQgOwu
         gLcdaoNlwdKxXm/j/OQLEgC/MzSDhhbZzn6AAzdGVkjLL07zcd2SLyTa3sIoQlUmmd+V
         3eCA==
X-Forwarded-Encrypted: i=1; AFNElJ/0HAiUWgCTgNY3yaopUcoWfnQnqvfhK2Lwyy/rWPCz7L+iWBxjnQJ5Gz/hqREGNdfIdLvYyh8k2Du2Fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv/yRCVF7eqejJkSpEGJJ6vra+0FhAbbGC/f0KQPzF6MvobGqk
	SO9awFT2taBQHMOud8io5dLMLmPVvCnnAHG4s30VtDHme6VrMei1gwLZpYYKl9W74ROX1zChZNK
	xvStVuA==
X-Received: from pfbem15.prod.google.com ([2002:a05:6a00:374f:b0:83d:3c25:eb8b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8088:b0:839:44c5:c321
 with SMTP id d2e1a72fcca58-83f33f29b57mr4275573b3a.44.1778853078151; Fri, 15
 May 2026 06:51:18 -0700 (PDT)
Date: Fri, 15 May 2026 06:51:17 -0700
In-Reply-To: <f64029bf-1f4c-40a7-860a-eb04fbe5317b@163.com>
Mime-Version: 1.0
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>
 <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn> <agO_0ejKd0x38_-E@google.com>
 <f64029bf-1f4c-40a7-860a-eb04fbe5317b@163.com>
Message-ID: <agck1WqW-TyEqkqd@google.com>
Subject: Re: [PATCH 1/3] KVM: selftests: Add unit to dirty_log_test
From: Sean Christopherson <seanjc@google.com>
To: Wu Fei <atwufei@163.com>
Cc: wu.fei9@sanechips.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, anup@brainfault.org, 
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_065119_814485_61536A73 
X-CRM114-Status: GOOD (  30.46  )
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

On Wed, May 13, 2026, Wu Fei wrote:
> On 5/13/26 08:03, Sean Christopherson wrote:
> > On Mon, May 11, 2026, wu.fei9@sanechips.com.cn wrote:
> > > Currently dirty_log_test hardcodes usleep 1ms in each interval, which
> > > could be too short for guest to write and fault in enough pages, then
> > > there is less chance to test the write protection mechanism, especially
> > > in the case of (log_mode != LOG_MODE_DIRTY_RING).
> > 
> > But when log_mode != LOG_MODE_DIRTY_RING, the individual sleep time is largely
> > meaningless, because the test won't reap the bitmaps for iterations > 0.
> > 
> > 			if (i && host_log_mode != LOG_MODE_DIRTY_RING)
> > 				continue;
> > 
> The first usleep  matters in the case of KVM_DIRTY_LOG_INITIALLY_SET. The
> dirty bitmap is not precise in the first get_dirty_log, all pages are marked
> as dirty but most of them are not populated in page table, this creates the
> situation I mentioned in the cover letter.

I suspect something is messed up in your workflow, because the actual patches
aren't properly threaded with respect to the cover letter.  E.g. patch 1 has

  In-Reply-To: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>

but the cover letter has:

  Message-Id: <202605111108.64BB8RFR010522@mse-db.zte.com.cn>

Copy+pasting the entirety of the cover letter for reference:

 : The current gstage range walker unconditionally advances by 'page_size'
 : when a leaf PTE is not found, e.g. when the range to wp is
 : [0xfffff01fc000, 0xfffff023c000) , if found_leaf of 0xfffff01fc000
 : returns false and page_size is 2MB, it skips the whole range, but it's
 : possible to have valid entries in [0xfffff0200000, 0xfffff023c000), so
 : only [0xfffff01fc000, 0xfffff0200000) can be skipped safely. Both
 : wp/unamp have the same pattern.
 : 
 : dirty_log_test intentionally sets up the unaligned guest physical
 : address, after riscv kvm enabling KVM_DIRTY_LOG_INITIALLY_SET, it's easy
 : to trigger this bug if there is a larger window for guest to write more
 : pages before first collect_dirty_pages.

> "when the range to wp is
> [0xfffff01fc000, 0xfffff023c000) , if found_leaf of 0xfffff01fc000
> returns false and page_size is 2MB, it skips the whole range, but it's
> possible to have valid entries in [0xfffff0200000, 0xfffff023c000), so
> only [0xfffff01fc000, 0xfffff0200000) can be skipped safely."
> 
> > > 
> > > Unit is introduced to replace the default 1ms if specified in command
> > > line. The following test can't trigger failure on my riscv vm:
> > 
> > Failure of what?  And does the failure really not reproduce with a higher interval?
> 
> On riscv, it fails to write protect some pages with valid page table entry
> then loses track of dirty pages. Higher interval doesn't help because only
> the first usleep matters, after the first collect_dirty_pages, all dirty
> pages are tracked precisely then there is no such problem.

Ah, gotcha.  Rather than let (and force) the user to provide a larger sleep time,
what if we instead randomize the delay before the initial reaping of the dirty
bitmap/ring?  That should provide a good balance between coverage, complexity and
user-friendliness.

diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index 12446a4b6e8d..74ca096bf976 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -694,7 +694,17 @@ static void run_test(enum vm_guest_mode mode, void *arg)
        pthread_create(&vcpu_thread, NULL, vcpu_worker, vcpu);
 
        for (iteration = 1; iteration <= p->iterations; iteration++) {
-               unsigned long i;
+               unsigned long i, reap_i;
+
+               /*
+                * Select a random point in the time interval to reap the dirty
+                * bitmap/ring while the guest is running, i.e. randomize how
+                * long the guest gets to initially run and thus how many pages
+                * it can dirty, before collecting the dirty bitmap/ring.  See
+                * the loop below for details.
+                */
+               reap_i = random() % p->interval;
+               printf("Reaping after a %lu ms delay\n", reap_i);
 
                sync_global_to_guest(vm, iteration);
 
@@ -729,13 +739,17 @@ static void run_test(enum vm_guest_mode mode, void *arg)
                         * that's effectively blocked.  Collecting while the
                         * guest is running also verifies KVM doesn't lose any
                         * state.
-                        *
+                        */
+                       if (i < reap_i)
+                               continue;
+
+                       /*
                         * For bitmap modes, KVM overwrites the entire bitmap,
                         * i.e. collecting the bitmaps is destructive.  Collect
-                        * the bitmap only on the first pass, otherwise this
-                        * test would lose track of dirty pages.
+                        * the bitmap while the guest is running only once,
+                        * otherwise this test would lose track of dirty pages.
                         */
-                       if (i && host_log_mode != LOG_MODE_DIRTY_RING)
+                       if (i > reap_i && host_log_mode != LOG_MODE_DIRTY_RING)
                                continue;
 
                        /*
@@ -745,7 +759,7 @@ static void run_test(enum vm_guest_mode mode, void *arg)
                         * the ring on every pass would make it unlikely the
                         * vCPU would ever fill the fing).
                         */
-                       if (i && !READ_ONCE(dirty_ring_vcpu_ring_full))
+                       if (i > reap_i && !READ_ONCE(dirty_ring_vcpu_ring_full))
                                continue;
 
                        log_mode_collect_dirty_pages(vcpu, TEST_MEM_SLOT_INDEX,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
