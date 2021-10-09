Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E496BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:21:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EA560FD9
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1EA560FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkfCExK9/U5GzSk2aP0DZexdMiA2irhKSYEaQS9oigk=; b=YCz6SG3w3FQJc/
	+iJ4FuYbCSFb1PtmSbykVjXEY9IysWWs4B/wAjL114Chb5RSnFbkk/MVpTRZ31WWKLqDbaXPcwZXc
	gQ4cXQ1Hyx/JFJaV84Ph7Z2+EDuUDWpuaAMGvzQlI6YDV+sSfmnFLV2juhVRjYu6TXxTijeO6WSYn
	wJovbyeLjZBwqTh+uqFsIPWLQeu4QZoGaPWAl0GMVFMbkQAhfpdx6Tb9ICfD8oOrhzcZRjbtSqZGD
	88S6KPPwdFmghwOGITqXDpEyEd8SdHhlxkXji7oTWaZnHEmIOOV1QEkqbjwLB4arclyco4S4JGN6p
	XdPLkLgarefMHROC251Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1zT-004YLV-N1; Sat, 09 Oct 2021 02:21:35 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rK-004Tzf-FD
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:12 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 b5-20020a251b05000000b005b575f23711so15169208ybb.4
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=crdXztg9++vBF99WovoTawrTDZAMlepONlGnGeI4yW0=;
 b=poNGQMstvhEww3j/q+Ew2K+kNGbRr43AknFTBRh6WmHfINYVTEZ8xwMCg3y/Oe0NTr
 JtR7XEPh6F0hNfpa7j0f0RwTpV2urRBu3LMP+OKFGJcSZrESErjqFnLHWoSw1ikwE0o1
 UkxXXzg8yn/8yoLlIGTWwkwNWIU3bDlweiuiVGKXvNbXpeSJbXUFTmJ78JXoB8GBPJw2
 Mxj9q9UdsBWYyWx2wIwXfPBkBDNwtFvcrIvOy5n8ZO7r3niACNa+V6HpFHN56wIysh/P
 Cwz5E66bxfbW3Pz3Ruv8j5UfmgJXe5yN635GAZ7qZZ8Qx3Cc9Yvo9ZcfDICQydkTtIEI
 6A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=crdXztg9++vBF99WovoTawrTDZAMlepONlGnGeI4yW0=;
 b=TH0enl7oBc+520buEFVMGosLdlZjRzomlIYP5EZpBnI/ehwWLPqPM0b5XAi4jOEfhN
 iPEnAI8gtdtOlOo9JebgvP+JAsVnEgxBYZMBMu1Thws/vEKtPTQ8CvLgMxEQD+oP6tAn
 3UuJ/Gju+k9nirbeXJ4mGbTXtP9fo9dk6P2dXfo38B3xpMWY1zno88SriWU/tT0wZPS+
 +f8lHHeLVCYpCjMx1dXicKvfwxDyX0DQgbIroOXZkU/93l4fDE+T5/5MS3MvNIjg/uNW
 WYiVaLQfpylFiZURBCpz0HfUGYmA7b67HSkPo9epkE+aMhhvunMQcmmkrbSNEJ6GugAi
 3yRQ==
X-Gm-Message-State: AOAM532f9iu6gar6cY+EK3xmGP09iAM2uJ2Alevn94jXWGOhf46bgwV4
 GAF2nIQHlccLYCxjwXnoVpsZYwl4LAA=
X-Google-Smtp-Source: ABdhPJzcfIZ1Zv0b5dqnBIvzfvXq4ARXDnmY1mzl0GCln9fUNJg9VNZGpZvCwHJXJWz2rm5XencR2U5y0mk=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a05:6902:100f:: with SMTP id
 w15mr7392080ybt.259.1633745589050; Fri, 08 Oct 2021 19:13:09 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:04 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-12-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191310_528438_D45D00A4 
X-CRM114-Status: GOOD (  14.38  )
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

Invoke the arch hooks for block+unblock if and only if KVM actually
attempts to block the vCPU.  The only non-nop implementation is on x86,
specifically SVM's AVIC, and there is no need to put the AVIC prior to
halt-polling as KVM x86's kvm_vcpu_has_events() will scour the full vIRR
to find pending IRQs regardless of whether the AVIC is loaded/"running".

The primary motivation is to allow future cleanup to split out "block"
from "halt", but this is also likely a small performance boost on x86 SVM
when halt-polling is successful.

Adjust the post-block path to update "cur" after unblocking, i.e. include
AVIC load time in halt_wait_ns and halt_wait_hist, so that the behavior
is consistent.  Moving just the pre-block arch hook would result in only
the AVIC put latency being included in the halt_wait stats.  There is no
obvious evidence that one way or the other is correct, so just ensure KVM
is consistent.

Note, x86 has two separate paths for handling APICv with respect to vCPU
blocking.  VMX uses hooks in x86's vcpu_block(), while SVM uses the arch
hooks in kvm_vcpu_block().  Prior to this path, the two paths were more
or less functionally identical.  That is very much not the case after
this patch, as the hooks used by VMX _must_ fire before halt-polling.
x86's entire mess will be cleaned up in future patches.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f90b3ed05628..227f6bbe0716 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3235,8 +3235,6 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	bool waited = false;
 	u64 block_ns;
 
-	kvm_arch_vcpu_blocking(vcpu);
-
 	start = cur = poll_end = ktime_get();
 	if (do_halt_poll) {
 		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
@@ -3253,6 +3251,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 		} while (kvm_vcpu_can_poll(cur, stop));
 	}
 
+	kvm_arch_vcpu_blocking(vcpu);
 
 	prepare_to_rcuwait(wait);
 	for (;;) {
@@ -3265,6 +3264,9 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 		schedule();
 	}
 	finish_rcuwait(wait);
+
+	kvm_arch_vcpu_unblocking(vcpu);
+
 	cur = ktime_get();
 	if (waited) {
 		vcpu->stat.generic.halt_wait_ns +=
@@ -3273,7 +3275,6 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 				ktime_to_ns(cur) - ktime_to_ns(poll_end));
 	}
 out:
-	kvm_arch_vcpu_unblocking(vcpu);
 	block_ns = ktime_to_ns(cur) - ktime_to_ns(start);
 
 	/*
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
