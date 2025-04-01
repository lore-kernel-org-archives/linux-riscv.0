Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96914C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 20:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2lOV/ZU0YSxWSJ8NiGzBXvkvyww87lZ5TbWC8CcbHc=; b=05ep/DZ74Zb64Z
	5JyPrLTqsrD2Ph1n/UfyYDH3rZ5btxMyI5q9zteMzrYADeFDMVVsjRES4P0LnN0fzeYJrpVz5dbWa
	bNhxa/Iol3ABIgxYcYLw9vYr9VyrtggV1NcSxksfwW3+NUEun/fdUqV0i+5m0JQNGmhbJvBzI9SRw
	NQt0yjiIk1Z5VCQmFJyUwv3YfKbl2ALVxTfGjn3lpBrVqrfvV2wkRA5ng129ycSIv/jtQAmyyDu3/
	3eXv+Y5rbuTDqXFQ8x+IJ4Y2scc3JJPXkfwk5VEPovvtIhQEugK1Fz/67mx2/rxUChjBVWk0OtI7q
	rHQv/Cu5XVTDcROptv4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziav-00000004MhA-2JWO;
	Tue, 01 Apr 2025 20:52:25 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVa-00000004L7M-0QGo
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 20:46:55 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff78bd3026so10394803a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540413; x=1744145213; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HjN0v0W9m0IvqgYola2hOx5XLKml5O0udJOiHGE/eik=;
        b=B3/IF0NZJ9VcdtdfeswZukDj/OJatRxfHDMoiKn2ViMxHRb1QkVhyllZpPnj/T9SMQ
         uZQzlQXuPpvy7t+l9UMlnLh/ca/ohGLB3dC3nrbQ6HAewjWY2h/+IczFcg24tCw8lWxV
         Wxk1CnxXTwtOwC5ff8YJKy8TEpOC3xMBafeP9Jss/pg17mO6bJFanTNjC+LzfjEbYy7I
         LIBLPwjR32IMyG3qloDiPTMx1OGIKSYPfWpFmLbGBprKQBEtkFMKtTNd/jxDUQBguL6y
         v9xiV5uzcR386GU0twzxAzegQo4qp8K8ZIKD83rhCUcLLhQipbiNIV89iRZygjaY7vLT
         7jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540413; x=1744145213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjN0v0W9m0IvqgYola2hOx5XLKml5O0udJOiHGE/eik=;
        b=nLU9pHJc/T+92N4WuXKuSIZ770CzzTwaOplnTjlkW2aJ09FRuay1P7fiRKHXYB9K6W
         rJdpBlwOsMNcr91mODzDaZF8Q1PsbQxalDhjsc0T49DlQyNN937vq7GoyLcXmlFTlIiv
         RBhdRrPvDFLj92+NHt6Q5MhFYW2eLgcRG5/GvY33spCgltBBym9ACTWiPM7deLEE1TtI
         pmAKQeD/7ribQ3pzT8M+ZDKGmvTf/I5daWUkBMj8xlKmh8X4NrvLN82kDXcRIsLGE5YN
         4u8g+7dFICrltpY6DPF9F0uX0zsvyhwYYy4afGnQhtqGxU3A5btKhxZsHh9Qc/RNd4Yi
         Hr/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQCnQETskr/LVC81/jiuxls/UuUYe0t68FIU9N17PpNK6tK/UTZgx8oDIiDxbAqLNcQgTS85qtYGtcOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJV+8fDERIH+PYINIju/kYxAHjWSbZ58LT/cNPuLqSAVSaYht8
	wDJNOxd7gW/KEAKcW9EB0elPrwePGxG2ZvOxJ8mFzRUuuVgZtVe8SgcF4zIukeUNsJhOKcklTMZ
	SRg==
X-Google-Smtp-Source: AGHT+IHcYPdS+ntkX0QFkx6mSIlTj1AO51n1TbjklGmZnx1XnyN+enbKGYXER1TOaq4aVQk11+wCSyWBHf8=
X-Received: from pjbsw3.prod.google.com ([2002:a17:90b:2c83:b0:2f9:c349:2f84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dcc:b0:2fa:157e:c790
 with SMTP id 98e67ed59e1d1-3056ee181a6mr177513a91.5.1743540413076; Tue, 01
 Apr 2025 13:46:53 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:15 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-4-seanjc@google.com>
Subject: [PATCH 03/12] KVM: Initialize irqfd waitqueue callback when adding to
 the queue
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
X-CRM114-CacheID: sfid-20250401_134654_168331_6B650746 
X-CRM114-Status: GOOD (  14.59  )
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

Initialize the irqfd waitqueue callback immediately prior to inserting the
irqfd into the eventfd's waitqueue.  Pre-initializing the state in a
completely different context is all kinds of confusing, and incorrectly
suggests that the waitqueue function needs to be initialize prior to
vfs_poll().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index e47b7b6df94f..69bf2881635e 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -256,6 +256,13 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
 	struct kvm_kernel_irqfd *irqfd = p->irqfd;
 
+	/*
+	 * Add the irqfd as a priority waiter on the eventfd, with a custom
+	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
+	 * underlying eventfd is signaled.
+	 */
+	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
+
 	add_wait_queue_priority(wqh, &irqfd->wait);
 }
 
@@ -395,12 +402,6 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 		mutex_unlock(&kvm->irqfds.resampler_lock);
 	}
 
-	/*
-	 * Install our own custom wake-up handling so we are notified via
-	 * a callback whenever someone signals the underlying eventfd
-	 */
-	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-
 	/*
 	 * Set the irqfd routing and add it to KVM's list before registering
 	 * the irqfd with the eventfd, so that the routing information is valid
-- 
2.49.0.504.g3bcea36a83-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
