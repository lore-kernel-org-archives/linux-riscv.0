Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698CEC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WissQ6ZY5SDp/GjNdciei1HI6T8aIkB9RosbIPm5hlI=; b=VaPt0CQPJsACwX
	Ttf9zIQAYejaiWf/EJonv5OdH75AZoFfjDGS9xvwWSoU6swwQOMDAgD0OrwKrEiLH+IaTG+ihXKqn
	kU+Agtr5YrjMLUA0T+61FBVWdD3BaRedvyk3b89SwpK6MtbkvNlZFi+oOhIMICGvs9oIngnlZmpzH
	LkBbKR3DNZaKAOaoAk4rAKwirF/xWwSd34cIx2zIeg7Chc/Dl1ZL4ceZCQZALum0BrL/mH6/uCPPM
	f9DaPoQrNZFtnVpEnw+Zipf8fcaC7lLGe3BhPVe9mb7tqRBc/UfhVRszbtKq6hvYnojhhUms219xK
	HsKDEUXXOXvHNABvxrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfA42-007twY-P3; Fri, 15 Apr 2022 00:43:54 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfA3y-007ttM-Jz
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 00:43:52 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 78-20020a630651000000b0039d993c3c55so3473354pgg.14
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 17:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=WHJorEYqdPsyoiS8LBeb1G8S4S7kzQkyLWZGD9aUrjs=;
 b=bZwTwRaSjFo3UIyEnG1Se3GCFh+RY6IvOG3VlupdDpfNfI6GX6hkJeLI81eGmOGX6G
 1cHm7fTg8TqH04RjFv10Of5DvAYAHAM8tiEPrQRiuCNBDJRSzCUDQUG0BMRWHtD+LdNa
 OXpZzAre9wRSs/2YHv0GHmqXz+Pqefc9fuZxtMcl8GYafBb9wbzvPCjbT/nzQhtpz2Wn
 fyyyAL63cPcu44vOIB0qfBetcyUX/9l8dZ2b05Q4AfOcPl4SLNf/Fbj41CZv9b/yvg1F
 Aer1piomJTMTT3b0SNhbaUMWvPS5/iUeOlL+Pvad6lLyGugPdHlz8JZmH21Rl+8vgLjA
 mBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=WHJorEYqdPsyoiS8LBeb1G8S4S7kzQkyLWZGD9aUrjs=;
 b=ueDi08y1aUb/N4EVa+aLToODDP2uMBLlSdhgoJ4Qy/fZnmo42jNYEDZ4nUXqM+bCN0
 wpOCePOSCU/Mr9UOKXD5MSw2tUT4P5qWlifIeW2jP+LEGszhirisNoDkygK0MTXZFtlZ
 chaazhQ6vkxAttCkZstfr8cyObuXqD5GRKfUGE6D6a+zqNXe6r2pAKw5zkN7cvsDfWtk
 kNxAQPAqbbxrrLSJpAtb84gId6fOrHxMEbwXOtPBxtg0u9wQDmdnrJI+na831Jrr04bE
 574NXAsVm+HsmcdWhOj0TAhzGaMs0O4WMq8Z3ksZJThtgqwwzoD0t1gXu27NQndZ5x6G
 lwGw==
X-Gm-Message-State: AOAM5308oc8TeDlZD0y3Bke1Yy6M+KlXT3NhGIpjHhc0nN93HlUeV4NC
 dRndXNFxWeuJEh9tflCc/0o+VgVFpIw=
X-Google-Smtp-Source: ABdhPJzt0tscL0kcshOCrjwd8G3ruQcGXCkqq7xMYex2fkXBeIa/R8tC7xq7T2RAxBd1S9ySsMfZwzJ54UU=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4b84:b0:1cb:6cf5:d2ff
 with SMTP id
 lr4-20020a17090b4b8400b001cb6cf5d2ffmr1311935pjb.41.1649983428416; Thu, 14
 Apr 2022 17:43:48 -0700 (PDT)
Date: Fri, 15 Apr 2022 00:43:41 +0000
In-Reply-To: <20220415004343.2203171-1-seanjc@google.com>
Message-Id: <20220415004343.2203171-2-seanjc@google.com>
Mime-Version: 1.0
References: <20220415004343.2203171-1-seanjc@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH 1/3] KVM: x86: Don't re-acquire SRCU lock in
 complete_emulated_io()
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, 
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, 
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_174350_754204_AC4CAF76 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

Don't re-acquire SRCU in complete_emulated_io() now that KVM acquires the
lock in kvm_arch_vcpu_ioctl_run().  More importantly, don't overwrite
vcpu->srcu_idx.  If the index acquired by complete_emulated_io() differs
from the one acquired by kvm_arch_vcpu_ioctl_run(), KVM will effectively
leak a lock and hang if/when synchronize_srcu() is invoked for the
relevant grace period.

Fixes: 8d25b7beca7e ("KVM: x86: pull kvm->srcu read-side to kvm_arch_vcpu_ioctl_run")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ab336f7c82e4..f35fe09de59d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10450,12 +10450,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 
 static inline int complete_emulated_io(struct kvm_vcpu *vcpu)
 {
-	int r;
-
-	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
-	r = kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
-	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
-	return r;
+	return kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
 }
 
 static int complete_emulated_pio(struct kvm_vcpu *vcpu)
-- 
2.36.0.rc0.470.gd361397f0d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
