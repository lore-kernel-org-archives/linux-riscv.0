Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18792C54F54
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPKAOzivGZwOfYDVFy2wWCjYvfpmYTXfPiBD5AjMRHY=; b=mX/8cUQpXP13jt
	nB677t5d/8oFc6Oorq4FIozHkjAFCfM6HiXUEPuUQh25s90vA8sMI0gkcyXDkKbI8kNw5wxnrulo2
	iGUOia+7Dryg/pkzJhDZmMxe5c1HGeQp3kPwawoik1L848SbgvnC0nnvUp7nvpZKOfojn6qZ1oqkV
	Fz5+DcDGGC50TXZVDOVa7qJDYIjNeDVSsvDCvSTSp6JDwWr8EHJMMcljSWWr3bu6KcZxFP2SILyof
	/7Ujg+Sfopzq8zYIq6rRaaBOrdu2cH4W4E2ygbI4MV+MwORKd4GsG5coN6lTE9i0nuNW6Rr56BdOO
	v46AnacheBhEN3gftumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqDF-0000000D9YE-3gZu;
	Fri, 31 Jul 2026 16:35:57 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqDD-0000000D9X1-3osV
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 16:35:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84847482584so765967b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jul 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785515755; x=1786120555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU2QgWWmiwDOTc97tpYJfn2gTZC2cyR2MioCmCqpMNY=;
        b=N93DYTU93s3rTeg3xaiUsCN3SZn4TR8grNCzgM+kd8knnuZ4c+MUlntHgkGLB814Z7
         9lzbA+LSF2xmMTn9ZkJxlB7ywnGvlYBIVbYogYkroza2Y3qhgPfk4dSVLzXIs4TPwd3I
         zU1olDgZ/WGshQvUT8nAnYLXBvFWaFe7Tb/SiCIYHStJZGXmKZfU4BDaBZ5gKI6LsZmH
         TziSA6W8SbxAHIZ4PuqzbCxP2TXX76Ua8vzRMYAOg+f0OAYXlz0Pk3nxa8ZKMuNmLRvG
         556QGYR0uYmEX7QUBfnJXFiT7s7y3RkoCvXgQXy9I0fkKRhzT2f8Xw7KT0tHBfiKPhny
         RRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515755; x=1786120555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rU2QgWWmiwDOTc97tpYJfn2gTZC2cyR2MioCmCqpMNY=;
        b=pasuxzEHv7rZeRH/LHgWgZMzggas2beEZEugZR2mOHw4LdiNMzjgYDhglmSLVGkCt6
         sscPBaXoO2vg+pBklVpQIEd+vI8c/0ESYYNBwm2J5QCPWz79Mvh3/Sgt3COpV+AGDIsq
         JczGdwm85rTLe1RdWMNBTbJXQkWpNnAnnt+lSKverLjQSb9xG9kMoORcDwy+Bo6ApCm4
         EE+uLE5e37/2Vom+g1KeZYgqZa1sDqUV4MwLe8zyZtepzPbemo3A4RDf2ufKFwwizVKc
         f1Y5tnvL+W6QCLUR76wySFKjwi/8dWhVGbkaTFScQbKp5sofpUSv/OdAbpMbYKuEYiyD
         j+xg==
X-Forwarded-Encrypted: i=1; AHgh+RoWKoAfZyRwW9FuYcXvZqcfUugxf6vtFJv0zYD26EcnphxvptJSdzXq999mok+oDbVLa2OZYlSzzTlq5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLoXpUkiJ0Zj6X66+2dKcW1qD8ttRSBaGgIUK7M/DuJsDslvCw
	T3jX9spnaUVYZhitJBppLdcqPm8+RkGvsHaQlRwPLiHPuWBWiVMkSl4=
X-Gm-Gg: AR+sD13bHZ++zEMjNK9blfrEr4c0vO5HS6BLbIf6YJvChk3OL0BD8lZQF9D6kWCIaEp
	5YXkMNv/BP/Bpscb4Lix48zO+fAtBw5G8bgPimJxj42WDCbXVGHVTspLCY5yc8DNXbt279QDZtm
	LceNnQFM8JLTtNQTGDw/2HLeNaAipaaw0U1TGnvlNHZxy2QXElP2Od3UYT6iH42KzDdooGeeTSA
	0UCuuxxKOI4QognCVf2UMgvJ02fRqrUOX/ZUkluWfBDYuIgwGyiibJ8eRIB7wOY/utAoiYdUSH0
	gfJ3Og7UMxbl0WH4Y4x7j5L+wDcAU/sHMiotfhdQNp/DJ1pauaNIUUVFM7ZJGLYgv8JLaGNOJEx
	J7YL8Z3c14OrJsvWASoU5AzrbfPCbV2Iw7MZt59Az0OoqYalYS8DtXM8OtHKQw9mubM/qVzFR40
	ipp5CXmOYILEWjok+71104Qw1nhc2SiEoZyJrLIM0CO8hl69HbQaAmWyUZMBhCljpxNEbcBt/On
	dPfEbUJAz+FS4uhQCuziRX+7UaplOITfMkEB7sAFMi0S1BGZBWLaiUAGAP0NbwSIQ8kvhRBQSDj
	7gP6DaueXrygArWWjcZGa04=
X-Received: by 2002:a05:6a00:14cd:b0:848:40f5:ff5e with SMTP id d2e1a72fcca58-84ed7517231mr2195457b3a.37.1785515754707;
        Fri, 31 Jul 2026 09:35:54 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc422ff9sm674942b3a.54.2026.07.31.09.35.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 09:35:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v2] RISC-V: KVM: Synchronize hrtimer callback during teardown
Date: Sat,  1 Aug 2026 01:35:50 +0900
Message-ID: <20260731163550.46991-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
References: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_093555_950500_78F5C8E2 
X-CRM114-Status: GOOD (  13.85  )
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

The non-Sstc hrtimer callback clears next_set before its final uses of
the enclosing vCPU.  If teardown observes next_set as false while the
callback is still running, kvm_riscv_vcpu_timer_cancel() skips
hrtimer_cancel() and kvm_destroy_vcpus() can free the vCPU before the
callback enters kvm_riscv_vcpu_set_interrupt().

A guest can arm the timer with SBI TIME and request shutdown with SBI
legacy shutdown or SRST.  A VMM that honors KVM_EXIT_SYSTEM_EVENT and
destroys the VM supplies the teardown side of the race; no post-launch
host ioctl is needed to arm or request teardown.

On upstream master 62cc90241548, generic KASAN reported:

  BUG: KASAN: slab-use-after-free in do_raw_spin_lock
  Write of size 4 at addr ff60000005e58898

  kvm_riscv_vcpu_set_interrupt
  kvm_riscv_vcpu_hrtimer_expired
  __hrtimer_run_queues
  hrtimer_interrupt

The object was allocated by KVM_CREATE_VCPU and freed concurrently by:

  kvm_destroy_vcpus
  kvm_arch_destroy_vm
  kvm_destroy_vm
  __fput

For deterministic validation, I added mdelay(1000) immediately after
the existing next_set = false assignment.  This only widens the
existing post-clear callback window.  A no-delay trace build naturally
reached the callback-after-teardown-start/before-deinit ordering in 12
of 200 runs, but 1,500 stock-kernel stress iterations did not produce a
KASAN report, so natural reproduction is timing-sensitive.

Always invoke hrtimer_cancel() for an initialized timer.  Preserve the
existing -EINVAL result when the timer is no longer set, but only after
synchronizing with a running callback.

With this patch, hrtimer_cancel() blocked for the full widened callback
window before vCPU destruction.  KASAN reported no error in 100
fixed-and-widened runs or 200 fix-only timing-sweep runs.

Fixes: 3a9f66cb25e1 ("RISC-V: KVM: Add timer functionality")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Add the required Assisted-by trailer.
- Drop security@kernel.org from the recipients.

 arch/riscv/kvm/vcpu_timer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

AI disclosure: I used AI assistance during the audit and am treating the
issue as public as required by Documentation/process/security-bugs.rst.
The reproducer and full KASAN trace have not been posted publicly and
are available on request.

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ae53133c7ab0..a2cd277a4059 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -61,10 +61,13 @@ kvm_riscv_vcpu_hrtimer_expired(struct hrtimer *h)
 
 static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 {
-	if (!t->init_done || !t->next_set)
+	if (!t->init_done)
 		return -EINVAL;
 
 	hrtimer_cancel(&t->hrt);
+
+	if (!t->next_set)
+		return -EINVAL;
 	t->next_set = false;
 
 	return 0;
--
2.47.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
