Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F723C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 21:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drDec1q4lTqCf8FtxHJov8gmK2FNN31+RwBrLb8A8Zc=; b=dcKb/CgGNG6cNp
	DsDjDGKWy+QlM9xg0ZCqVcqjOBuC3vNs7JVZtB6/jtjLozALhmoosOcSXAUIrRoh6dAmfTzhS3BvN
	mGLYOZJUhdG6AWTJ/h1CgkcOv61BW9LRYF/7D0GQl8O8X9L/GF/Uq47Sj4Q5EP4RElg40SvFIioCr
	pCJQVgNCLq+EqN95xd/uMyX+9bjOSW33MUKkDmNpmBWY+yDbkH70m8ZLZgNRpKKUSuo4wk1k3q92u
	h+G1FdIuu4aFujFSHuRFPcXFgV7Lg/to7IZ389ZN8izZ7cpgF0T62jVbSf8H5LlS+IgkD7wOMywk4
	HaFTDBiDngWnMxctV8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzijl-00000004OF8-2jJ9;
	Tue, 01 Apr 2025 21:01:33 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVg-00000004LDC-3HB8
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:02 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso11243423a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540420; x=1744145220; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aA8/rbjSPW3y49ht4xFwJaGU+DA9JsbqwVRp3IHMGug=;
        b=IxThQbzzQrO31IferWsFB+DijlPnW90JzJOs2Bv0j1UXzzv8qyPOMwRL484BsKWBUW
         gBL9A82T2GuOwqxbGnQberWJZe4tRnMUVYRVaAFv+VZl5GHHKWK3HMQ8H479xq8c6ikt
         mGYMntbXv9P9ovx72sU3F87e18R9GV6sHI+03AQLqkmhNu2NrAkRRYCfUII/KS8FIOwS
         Ycc6DwuJ+yoZYMfyoeGaGrxcguk6vLZWyCfnuFSxPza0z/VuX3BP6pGGA9hQGj6T5E7+
         xNuX/TgnuGHhBl3bWERqnDX/V5NuuY9rGpS1LhlIYa5kCroopThXKY2N9FE5a6i2vR1u
         XtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540420; x=1744145220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aA8/rbjSPW3y49ht4xFwJaGU+DA9JsbqwVRp3IHMGug=;
        b=vAlzsMP0SAZcHaGX9HWiQosIyEtcHMrBWUKucv8Lco+zFtd+XJdYydkOFChTc2AzRv
         94jezarwc0oB9bTfUmhkZofKxAoE1Bosq37qywHlUAUDutEW1L98jQFZtAbyoVK+Ze0j
         EtS0nr0EsA4mr1qFzvDJU4kQonk/03FL6Z0z97m5j846jbCKNHkceRo9jsWlatOjWISk
         TeZcHABNr1zLooxH44wqJ0Gv+Vj2BwkMcVS837EynqzW0BqbAgEzFqAPcK3PHMyVplEp
         zqxZvouOXYILAxDnYavyxN0xlqofURHYd2OiwdwpG+p1ZEm0tsiQ9zZYZ1henS89N8Zr
         ks4w==
X-Forwarded-Encrypted: i=1; AJvYcCXIt87e4pOkQZSTqRkQ8BItwVVkzqW4JfcmRusDJ0vTcnesm3PNRSQ3R2ZdKvuv0yPbQDIeIg1p2/lGBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy03WWKQUiPdzu4wlSiVA+W5z0bxYBvjGbO7WQFIEm//Z8I/79L
	502HGGztwybQcy73h94IJyJd8XKTqbSgI9Qkq+0oCc6N4ufCDyvEvWGEphb0qAk7wHV/i8tc5CD
	HpQ==
X-Google-Smtp-Source: AGHT+IGGwFEdDMuZ0xntNe6yk2g8zeyEv/XFu/sxHNOeaskOniT4X4IpuqAn0QXf3B4CSI533+/1l7AS/qA=
X-Received: from pfbby7.prod.google.com ([2002:a05:6a00:4007:b0:737:6066:fee8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9f07:b0:1f5:709d:e0b7
 with SMTP id adf61e73a8af0-2009f5b5002mr26259502637.6.1743540419700; Tue, 01
 Apr 2025 13:46:59 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:19 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-8-seanjc@google.com>
Subject: [PATCH 07/12] KVM: Disallow binding multiple irqfds to an eventfd
 with a priority waiter
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_134700_818091_C20C9202 
X-CRM114-Status: GOOD (  19.59  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Disallow binding an irqfd to an eventfd that already has a priority waiter,
i.e. to an eventfd that already has an attached irqfd.  KVM always
operates in exclusive mode for EPOLL_IN (unconditionally returns '1'),
i.e. only the first waiter will be notified.

KVM already disallows binding multiple irqfds to an eventfd in a single
VM, but doesn't guard against multiple VMs binding to an eventfd.  Adding
the extra protection reduces the pain of a userspace VMM bug, e.g. if
userspace fails to de-assign before re-assigning when transferring state
for intra-host migration, then the migration will explicitly fail as
opposed to dropping IRQs on the destination VM.

Temporarily keep KVM's manual check on irqfds.items, but add a WARN, e.g.
to allow sanity checking the waitqueue enforcement.

Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 54 +++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index a33c10bd042a..25c360ed2e1e 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -291,37 +291,57 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	struct kvm_kernel_irqfd *tmp;
 	struct kvm *kvm = p->kvm;
 
+	/*
+	 * Note, irqfds.lock protects the irqfd's irq_entry, i.e. its routing,
+	 * and irqfds.items.  It does NOT protect registering with the eventfd.
+	 */
 	spin_lock_irq(&kvm->irqfds.lock);
 
-	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
-		if (irqfd->eventfd != tmp->eventfd)
-			continue;
-		/* This fd is used for another irq already. */
-		p->ret = -EBUSY;
-		spin_unlock_irq(&kvm->irqfds.lock);
-		return;
-	}
-
+	/*
+	 * Initialize the routing information prior to adding the irqfd to the
+	 * eventfd's waitqueue, as irqfd_wakeup() can be invoked as soon as the
+	 * irqfd is registered.
+	 */
 	irqfd_update(kvm, irqfd);
 
-	list_add_tail(&irqfd->list, &kvm->irqfds.items);
-
 	/*
 	 * Add the irqfd as a priority waiter on the eventfd, with a custom
 	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
-	 * underlying eventfd is signaled.  Temporarily lie to lockdep about
-	 * holding irqfds.lock to avoid a false positive regarding potential
-	 * deadlock with irqfd_wakeup() (see irqfd_wakeup() for details).
+	 * underlying eventfd is signaled.
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
+	/*
+	 * Temporarily lie to lockdep about holding irqfds.lock to avoid a
+	 * false positive regarding potential deadlock with irqfd_wakeup()
+	 * (see irqfd_wakeup() for details).
+	 *
+	 * Adding to the wait queue will fail if there is already a priority
+	 * waiter, i.e. if the eventfd is associated with another irqfd (in any
+	 * VM).  Note, kvm_irqfd_deassign() waits for all in-flight shutdown
+	 * jobs to complete, i.e. ensures the irqfd has been removed from the
+	 * eventfd's waitqueue before returning to userspace.
+	 */
 	spin_release(&kvm->irqfds.lock.dep_map, _RET_IP_);
-	add_wait_queue_priority(wqh, &irqfd->wait);
+	p->ret = add_wait_queue_priority_exclusive(wqh, &irqfd->wait);
 	spin_acquire(&kvm->irqfds.lock.dep_map, 0, 0, _RET_IP_);
+	if (p->ret)
+		goto out;
 
+	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
+		if (irqfd->eventfd != tmp->eventfd)
+			continue;
+
+		WARN_ON_ONCE(1);
+		/* This fd is used for another irq already. */
+		p->ret = -EBUSY;
+		goto out;
+	}
+
+	list_add_tail(&irqfd->list, &kvm->irqfds.items);
+
+out:
 	spin_unlock_irq(&kvm->irqfds.lock);
-
-	p->ret = 0;
 }
 
 #ifdef CONFIG_HAVE_KVM_IRQ_BYPASS
-- 
2.49.0.504.g3bcea36a83-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
