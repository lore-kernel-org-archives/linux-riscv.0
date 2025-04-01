Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AB8C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 21:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOVkQL1Qxqu0EVO3g82xF6d+ld8kIMESJgLqGOQuMh8=; b=210NjYs3PqBGOJ
	e2zL8eQJHfFA4/HVQGOWK0jPyEhlyhfNUtP0FHDFtUMMuXF3m+vQLgtUBWlYV/6mVnS21wazsFM0R
	Lmgj6iuy8UxIemfM70oaQJlZSBndkZqVz//Amaow34bkk/Xdw9K4sDaWszVda/64r7tEVcSvAOStG
	RdbY53V+qamsMToxVDL2ab9aw8LZGId2LOTM+pfEm5Z3oHC+7jKZBUMBwzPOMTr4YHCRfpsVnIjwH
	kb3Wl3wLuhK72660J4aT6XatKQGqba/PbcwpahWgIg4AdfVU7kUXlthe81ocKZHBisMRa8EaKtGhr
	wdfic/ypPR6XbfKUHqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzilX-00000004OWc-3vqn;
	Tue, 01 Apr 2025 21:03:23 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVi-00000004LEU-1xm9
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:03 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff7f9a0b9bso9451851a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540421; x=1744145221; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hAOHDZe9hVA1LcrHBl8ILklpk5SqTyz1Lg9oNtA6EC8=;
        b=qxcBq/uD+EKw9n/JivoIhtgtp6QxhYWjQSJQA9qDRFGmUeZ1kFwGYd5Xt5PbRAlcHK
         r6KzZD9AKah0jKXRfwxoSPoY3w6fkhbytpuC8v/8GtUz0T6PcDYPAg6WJJw0RWbfnels
         jpjQ+C1Bg8xrysvV3ywotNzmUOogd5J11thOMCUVYEJwcHzO7L0RLko+eoyV7g3TAjqR
         5GwyWC2PiEO933E2Ea/Ky5M4fIWjzFyIcB80spXNlnMnAAdHFNyNYxyR1Jb7+L6LQ1qV
         SbXCyBq3gPKjiaKm6cyWVlSkclMM2nZN7rRXLwp0op7PXJ2UdfE1nMasj3aDbM3kqCJK
         kYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540421; x=1744145221;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAOHDZe9hVA1LcrHBl8ILklpk5SqTyz1Lg9oNtA6EC8=;
        b=AuJ2UdnW04U7AL9vhP0V9DsWi1LJfWG7DIfjCbr71R3pVi9FYU3EvyP+c0I3+eEfkl
         DnDPVFnd594L/5YZG0wbxU+Pq4Nec6yFJ2+f1s7fJh/o2j9AVOySY5Opv2sTqsfWVl7G
         Y1aZdv5BJONYgJvSQb1qQnoxK2m3CW1m3PQqJF+y/ENhZZ/pTtvcbAZWNZjRJLByI5t7
         U5N5tw0YjWIN9bUYd+hHf4zPiT4EtQ2g36aNhZpeKywAvRslbe8C/mkHiXIcT5maZCR1
         QYpuJtTXdUdp74dPYRWUW8JMmYt4JDW1jw/GUxe2i5bZ2tipFkoTrpctTOqC+B3mAMMA
         JI6g==
X-Forwarded-Encrypted: i=1; AJvYcCWsjHzg8zsYwHnJHiWMfiYH5axbUZmMLuwpyDOyhhwz97IjLKZxzUQgXb/vmyVIRJVYVDs+lukrltqAFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuEbwBsXEaeZ06lVbU1lqJAP4cRomuKE00/soesyg+oZsjFOZb
	arnJtdGAOAlkAzZM9nHOBi7qr5ZWEVMv76MJQD77aGeD7fF8O9qDnyT11DfJO6oFwXLZjeAxAYk
	h7w==
X-Google-Smtp-Source: AGHT+IHU4ej+9xtm5sDkWeeRPmRGXEXSjICfBn2mdGglMLGC+glAIOtURcbT/pNs0Pm5Q7kEH8DQAnKQF70=
X-Received: from pjbqb11.prod.google.com ([2002:a17:90b:280b:b0:2fe:d556:ec6e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1344:b0:2ff:6788:cc67
 with SMTP id 98e67ed59e1d1-3056096950cmr5544504a91.34.1743540421162; Tue, 01
 Apr 2025 13:47:01 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:20 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-9-seanjc@google.com>
Subject: [PATCH 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
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
X-CRM114-CacheID: sfid-20250401_134702_524796_94418999 
X-CRM114-Status: GOOD (  13.24  )
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

Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() to
differentiate it from add_wait_queue_priority_exclusive().  The one and
only user add_wait_queue_priority(), Xen privcmd's irqfd_wakeup(),
unconditionally returns '0', i.e. doesn't actually operate in exclusive
mode.

Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/sched/wait.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 80d90d1dc24d..2af0fc92e5d3 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -40,7 +40,7 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
 {
 	unsigned long flags;
 
-	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
+	wq_entry->flags |= WQ_FLAG_PRIORITY;
 	spin_lock_irqsave(&wq_head->lock, flags);
 	__add_wait_queue(wq_head, wq_entry);
 	spin_unlock_irqrestore(&wq_head->lock, flags);
@@ -84,7 +84,7 @@ EXPORT_SYMBOL(remove_wait_queue);
  * the non-exclusive tasks. Normally, exclusive tasks will be at the end of
  * the list and any non-exclusive tasks will be woken first. A priority task
  * may be at the head of the list, and can consume the event without any other
- * tasks being woken.
+ * tasks being woken if it's also an exclusive task.
  *
  * There are circumstances in which we can try to wake a task which has already
  * started to run but is not in state TASK_RUNNING. try_to_wake_up() returns
-- 
2.49.0.504.g3bcea36a83-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
