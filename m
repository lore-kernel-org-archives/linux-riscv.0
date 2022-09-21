Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB63C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f82ocxmgQdED9b5zv3fvA0ldzYiahJsFmGv0OXiFQng=; b=nnzVBv+qcrOuU8
	DE04kMjJc+OW4cgMSxhKT6Ab/RKpON2haCFdDqdBvy14fSKfk3UpVIYiE23AgL1Kay9VREBYLR2UH
	mFQPH8kwgaxQC8co5Xi0LfAETkArJGqEa8gAwwilTRNBjOu9yv3m318LUZrWOwf31XfiimrXOkZqG
	SH4ERD7cqfpXjy1bhst7pyCmHrOyy/X058gHU4A1NIy1LaIXTqwqrjwqpaZvUqC0b994WrrM6x+R6
	k6wu18L5aoX8B2s2emyUzc+vRUVK57HGb9WFyCIx4ycFVecyA6oI8bpi5+tqJ9oPhyNk4eAFi7aDD
	CXlusKERDml5uDjj1rGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oangk-007iTu-FR; Wed, 21 Sep 2022 00:34:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfm-007hw3-Kp
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 00:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=efA5iJVbRrRgyy7qejkmxwve22ULxnh+arH50++PU/o=; b=jp0/MLG0kql7By1V/BE9JKjRmT
	qic/Xdkmhtk7g+A3o0cQ8/Ma5oro+7aB2kVqo5JQYAGEAZdvDMvPXuv+mCdJxP9R/kbvMezeFYpDe
	1DeQsjefF3II4QQgseTDSQL5tJ4iO2nqF3E07Z8tpqGyYS7NEPpon3uFmFb2Z3QE7FBAkqIU6mMsH
	ESu+UhiLa/vOsNqy5uoNJVS8mvpus6/XgbqgCucDG54TpOfN7AoI3TlKxO9fURCrkluDXQu8tCyDS
	G9XpcDU6brTfD+Vxm35kg5ybHPhgHzsccxEgd3L8Q76nG3qm7FavKNqQZEe+il1VZX83rYpGsLnlJ
	kbPp33oQ==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfe-00ET5q-Ms
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:33:01 +0000
Received: by mail-pg1-x54a.google.com with SMTP id e187-20020a6369c4000000b0041c8dfb8447so2532581pgc.23
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=efA5iJVbRrRgyy7qejkmxwve22ULxnh+arH50++PU/o=;
        b=LKQ43lhsEV6qkmBZlofrSrdl8EJ6mizwyIEMQYN4yuGNXkQj4E20I0hn2n1os/W8rc
         FBABKu95Qjg91h2stXYOQw+qADMR7XZ6aWiaoE4AtE31UgVml4CNZ7U+iemEDcQM7Qu4
         t9Z+X0wLCYzA/PywBX4R2TbwY4IqErPsq7pWjccSbHgqlIcJodfmwDsORX1S0hnpHOqL
         beWZAka2S0YLzR5F93gSfrPtpqFy0vHNPuMIF2SvlDmkv6DmDFSXlrSQYeY1mlT0WWNb
         xuXG79A1mSLbxXjRXjfR/KkQ6hWyNCiYg0/oAhyTPT5fIKU53548mJXGWrhfghBolN1K
         JXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=efA5iJVbRrRgyy7qejkmxwve22ULxnh+arH50++PU/o=;
        b=JBz21PPv7jDbVAjnejGJdQT8kot+jcc8zYipkOvACbiXXP/qJUTwH1hjxjU6orjb8b
         HwsODKDK7QnT1DVpQ6gjxWlIr0Pms+p4xwc8/zt5YQeXeaBEioYRx5NQVmvVGLC/sgIT
         kCl5fQZfL9o063jtaBkLRBmCWi9VukNRjmajujIRsYzcVtAffvl6d6tr1s1lfKdVvyjz
         l8h8CWt5YiZKejByKR0lrxdFad7AdpuKnaA8YTxiZEo1wXLjSUkFWEIgzJbZHo4Zl3Gq
         mHJBdviWl87INW9gcV6SibsOIDxpZKhQdUxeJ7cAWlwbvwsUi4jlDCrr51ZBlB4D+T8H
         EE3A==
X-Gm-Message-State: ACrzQf2dDo++rhlCVSmHA68ILwtBl7mE8A+uvV4iUp9JytmLCSs/HBA4
	M1+Vr1gucaSAhNICDdYxHIgDdZGVpf4=
X-Google-Smtp-Source: AMsMyM4y6HKockrgOW/pRtDhYoSBz/Hgk7Jbboq2yxWPlcCYVwqDxT8mse4oLg7p1D+UQZFuX9F/d/ndT2k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:be03:b0:178:6f5d:e979 with SMTP id
 r3-20020a170902be0300b001786f5de979mr2126922pls.163.1663720376093; Tue, 20
 Sep 2022 17:32:56 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:54 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-6-seanjc@google.com>
Subject: [PATCH v4 05/12] KVM: x86: lapic does not have to process INIT if it
 is blocked
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_013259_099574_6E5AEE69 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Paolo Bonzini <pbonzini@redhat.com>

Do not return true from kvm_vcpu_has_events() if the vCPU isn' going to
immediately process a pending INIT/SIPI.  INIT/SIPI shouldn't be treated
as wake events if they are blocked.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[sean: rebase onto refactored INIT/SIPI helpers, massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 16a24dd28f26..dcc675d4e44b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12765,7 +12765,8 @@ static inline bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 	if (!list_empty_careful(&vcpu->async_pf.done))
 		return true;
 
-	if (kvm_apic_has_pending_init_or_sipi(vcpu))
+	if (kvm_apic_has_pending_init_or_sipi(vcpu) &&
+	    kvm_apic_init_sipi_allowed(vcpu))
 		return true;
 
 	if (vcpu->arch.pv.pv_unhalted)
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
