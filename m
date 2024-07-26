Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017BEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QoU7oDcTW5WVOC/t6HiSIPsmREpQcWqBCjWpPqqGb8=; b=3Pd9NQ8UaocLqy
	yeatuQATsQK0+ZgUTzz3AuTqivkr3KIIL2yia2XFIYst5ss1uiUO5rfXti+flVvSMVoFjd/6cBMul
	YXX6bSEAq+P+G+chPqVxNs6uQsLih6PTjtOxEYXs1XbfgoZ76qSEHxiGbkwyfccc7/rxg8Wr13Ex1
	Ocl59lpdX4zdgQpGnmQX65NLzlAqMi7Uvu5/9Q6Tg75+05IY2pIk1TBV23WJMiDzqIzCNjXOKIEKd
	6m80K8OX8uAjY77aU8NJfTuqkT3i48r0ZkuDWizwSVrAEUfl6gAYYvDU/uCuBcnn20ywXivQF30hZ
	vqUkLEvTRFXP8E7NQ2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUsX-00000005Unn-20lc;
	Sat, 27 Jul 2024 00:01:41 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkV-00000005Pil-3xPM
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:26 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d1c6b7bb4so1137263b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038003; x=1722642803; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nY4qfmLxHYNbNwSwtMKIrsjqMbHvtDgV5qSHM3zuSO0=;
        b=kveJCW1l0mmp/Bgr8Gb2pVY/cyIiAwxSIr8qnm9YSgFkrO7Fzm02WigGZNp32kkCYg
         C/Y56HvNNypArMypHsOJezmPv90cju9lQ/UYZ0SvMvX61hHgjo+0wdhjqeG17cmjrCov
         MZwDAuHNi+65tHsrFMQVhltotRAdUyBNWOS35xQa8cvPzaaH1MgdtajtG3mKcmfTocxv
         jpL2vGtmBR989IDSyt6sZ960OVwbqryeXdEkuaU0sRWCwCSDW5asIKPa9WYlq+0NZmIY
         eYYPq/gIY/XytnsRAv3kgdCJyeRqBl5DZGsKH5+oNQkaHDf5tSk77Aufzr+mOFrzE+K3
         j6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038003; x=1722642803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY4qfmLxHYNbNwSwtMKIrsjqMbHvtDgV5qSHM3zuSO0=;
        b=kMPVEZvv81OuixwmwQflebdVu+mpIDXb2BHfE0b+sIenS16dH7e18gH7tSxoQvPB/I
         Ohe8UmuTBx6j2w+ipe/p4dMUw2M7Ao0iZZqLT9m1konQgq7F5wMihfA5D3jU3x95JCxI
         3HSEDHbCKGZVuaENGnLiH1DGqZy2lycqtqRpzV2QUUJbMLFElrQSWdFz/SXhBegExwLq
         N3thtXCn6/p/b26tLd22J9MQqAID67Uvd8T7S/zwDJZRY60fZkhe5eoZ67uLfbTgwGm1
         rmLja0CV+FnPnC0krUyb6euZVfun+vfPCFc83ldWbHE5t4t53VBvidbQcoDHzIQBJjrX
         UA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbmo5Ua6rkWBVhn2VfnhBsLCawJamn9wtcbSgszibYVQHUUdjmHVxAlwz3Qmq8iJ9zU/TRbCKnHXO8Ga0AyDvsoyKXdre6zcIaiLuQqn/e
X-Gm-Message-State: AOJu0Yx7cGm5BMLCe9Z3jNQU6vAZgcB0v3UWx2e/LYj829pTDm3XZy0b
	t7Z2Q9ox+1Qxg6TSbERqezbhxm9LTEvYS4BT5lIqaIqr9ARMRxvEU5bAZL2zB62sydub26KQ4Ad
	J4w==
X-Google-Smtp-Source: AGHT+IH3GR1gDSsaIiyxz/X29dplakZOpWNN6FppUWgXRDWsCZD6dFhJbJXFL2hO7f6rIpjA8QVwSQZzxjA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f1c:b0:70d:138a:bee8 with SMTP id
 d2e1a72fcca58-70ece533146mr8919b3a.0.1722038002674; Fri, 26 Jul 2024 16:53:22
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:31 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-23-seanjc@google.com>
Subject: [PATCH v12 22/84] KVM: nVMX: Drop pointless msr_bitmap_map field from
 struct nested_vmx
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165324_004726_62B1A9B2 
X-CRM114-Status: GOOD (  12.25  )
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

Remove vcpu_vmx.msr_bitmap_map and instead use an on-stack structure in
the one function that uses the map, nested_vmx_prepare_msr_bitmap().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 8 ++++----
 arch/x86/kvm/vmx/vmx.h    | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index a34b49ea64b5..372d005e09e7 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -621,7 +621,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	int msr;
 	unsigned long *msr_bitmap_l1;
 	unsigned long *msr_bitmap_l0 = vmx->nested.vmcs02.msr_bitmap;
-	struct kvm_host_map *map = &vmx->nested.msr_bitmap_map;
+	struct kvm_host_map msr_bitmap_map;
 
 	/* Nothing to do if the MSR bitmap is not in use.  */
 	if (!cpu_has_vmx_msr_bitmap() ||
@@ -644,10 +644,10 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 			return true;
 	}
 
-	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), map))
+	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), &msr_bitmap_map))
 		return false;
 
-	msr_bitmap_l1 = (unsigned long *)map->hva;
+	msr_bitmap_l1 = (unsigned long *)msr_bitmap_map.hva;
 
 	/*
 	 * To keep the control flow simple, pay eight 8-byte writes (sixteen
@@ -711,7 +711,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
 
-	kvm_vcpu_unmap(vcpu, &vmx->nested.msr_bitmap_map, false);
+	kvm_vcpu_unmap(vcpu, &msr_bitmap_map, false);
 
 	vmx->nested.force_msr_bitmap_recalc = false;
 
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 42498fa63abb..889c6c42ee27 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -204,8 +204,6 @@ struct nested_vmx {
 	struct kvm_host_map virtual_apic_map;
 	struct kvm_host_map pi_desc_map;
 
-	struct kvm_host_map msr_bitmap_map;
-
 	struct pi_desc *pi_desc;
 	bool pi_pending;
 	u16 posted_intr_nv;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
