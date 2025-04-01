Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D159AC36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 21:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZIxP9BKdtUNr8myFK/T/f1CqNBQ3xH2XZkBZeADLII=; b=vVh5k05I09gRrb
	Fv4Z0rPJ8vMgOCZJvokiFVXm+aSCtiJ594zZGk3ZS3O4w6zXcBQCmTiwVcHCbF+Dz1Ei0rwLGi59O
	jg0kBx5jnS1CZbNOUCmBP9YpKeTmVeNcSukhUlbmYyYBXSL9DmRqFSjJWS2MntsdYQT3TDD/aY+1q
	WjoKlRBDzsphvaXKM2bH+Uo4mZeGMGBELnNbQIkD0S6EPuH138gJ20rBLCKlrozOKHu7AWDNlu6Ep
	xSCOySGdFOV6QWUr6T2d6oVVuDB7KMHD49AtNmPvLWeJBQxBNGWxF/n9PYF7bOR3LUKwfqeeEFJoJ
	iTHndnZspQO83DNx/k1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzinJ-00000004OoZ-1DmN;
	Tue, 01 Apr 2025 21:05:13 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVk-00000004LGh-0rM3
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:06 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so10215772a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 13:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540423; x=1744145223; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A5N7R+jpPDsp4box9tDn3nxVfOu1tizhXrLdonpwfcQ=;
        b=OxXZMxcRNTv0AvNHj4lJUGUkbmJpXzubla1QGfJWg760H8z0oEESMTdH9PYxrupi40
         +FOrUgZD2jED3VZ8nrqbOzdZUIaUNaVEp/NkwMvCMlCQHObFq7Af3zwkgKQ11NjTqaEb
         NQou/x9+Iitf23KOkQy8s619Jf4YdctzdtSJydd5NQJdlOkZthpSK8e7TGwcIFrxDShU
         nLZjZMEb9O0LBPLx1nHN8UFwyNeGDKm/2QpM03caQTIEqYbrOtgXKi0Xu4tNcLnQSjg+
         7ygpr3Acqz+yPqelcG+ENDWJJO6WGX30M7vqoCokxnoF4wZIQ3/yvf1lUr5bVRvpsPCT
         1tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540423; x=1744145223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5N7R+jpPDsp4box9tDn3nxVfOu1tizhXrLdonpwfcQ=;
        b=KElJ/Gv7VwbTe42QhPACI7v0ovmKtmxDGZuzghH0A5GDjl2+wuifOtYtQrYe+6kciR
         ZhcGNrrcNkyze1CDmhEf/B00hwL8Z2049hRK49x488Ejc9sA8QIXYLdmiitleOHcREpv
         vkzuhNkPY9lKlzf4z37AJ47WWZXb8Y/Sw4Lc6btDuKmzK8sFrxfKG9na2sv5R/zdwRKW
         wtkeDyGZomvOysbo7gPqkzZOg8kNuCuacdpaPsnOhuihtsmDqe6/eZjIG4abMXpKxhpW
         IL1oCENaoUoXlFM9rkA/vKIGuW7tXzFee6nV0itDVfBfRTBkqHLqszdgeHY+Ye4ip/ec
         JvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/n0e14U+A4R4DfBpShYaD4HqbMxFyqzELMNTuu2ssHyTV5QMESLL49CrXi/aY90XPGGXPUUM2zuVwTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmR5Bv97aPEQLxxEnHafuB+UAso+VpXZuvFLnJdDQaf+1EsbGD
	GrcH3yMvDjMZuKTpbUGc0/EwNZD/kM61Mhh4NBddtNmC55LLvRKHQj/4Rx81oDTReNret7uT8fd
	UlQ==
X-Google-Smtp-Source: AGHT+IFKHrxOrTZORfx3j1Hq3t+F6SZMnVAetLumeoCsiYBPEvhoueJg73+pHzxlFtD9cACElqMRzKov8iQ=
X-Received: from pjbsg16.prod.google.com ([2002:a17:90b:5210:b0:2ef:9b30:69d3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a4b:b0:2f5:747:cbd
 with SMTP id 98e67ed59e1d1-305320af2bfmr23155973a91.18.1743540423264; Tue, 01
 Apr 2025 13:47:03 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:21 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-10-seanjc@google.com>
Subject: [PATCH 09/12] KVM: Drop sanity check that per-VM list of irqfds is unique
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
X-CRM114-CacheID: sfid-20250401_134704_296482_41041414 
X-CRM114-Status: GOOD (  11.19  )
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

Now that the eventfd's waitqueue ensures it has at most one priority
waiter, i.e. prevents KVM from binding multiple irqfds to one eventfd,
drop KVM's sanity check that eventfds are unique for a single VM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 25c360ed2e1e..d21b956e7daa 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -288,7 +288,6 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 {
 	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
 	struct kvm_kernel_irqfd *irqfd = p->irqfd;
-	struct kvm_kernel_irqfd *tmp;
 	struct kvm *kvm = p->kvm;
 
 	/*
@@ -328,16 +327,6 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	if (p->ret)
 		goto out;
 
-	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
-		if (irqfd->eventfd != tmp->eventfd)
-			continue;
-
-		WARN_ON_ONCE(1);
-		/* This fd is used for another irq already. */
-		p->ret = -EBUSY;
-		goto out;
-	}
-
 	list_add_tail(&irqfd->list, &kvm->irqfds.items);
 
 out:
-- 
2.49.0.504.g3bcea36a83-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
