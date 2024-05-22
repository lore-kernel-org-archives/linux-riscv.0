Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0ECC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LHy02nMk8a1HWHiYC7lfnzSv+tqja3hiueE1eJj2yM=; b=KAIdcQPjgqjdGj
	u1w0t9HxewhINCNPZF6swAu/Mp1jr/AQes2M2vxYDl2nNrwN0Nq283U7w0zEoJrOnalUsaizJCDxt
	wu08Ls9Gv3EdU339fiEPQEoKceMVC0FDDixoSW07Pes7tgB9DYp0VTUfHBDRJT1OT5saW5Hb8GwRt
	N3yMaqxVKEa1zcAvb6c607BPdCSzpg3rFKZPQJO7smcYF21BxOPV0mSU5YprL8bvTt09KL2fTrPJS
	gzY8VMhoqqB7BqxltQYt+qFP14alVTDj2WjQZgqcNsnoTeZzSEGI0AIZ9l+XPJYv/4xBj3YDvsb/S
	oz5OVVKk3FhvHNovAzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ayP-00000001f1d-3xwd;
	Wed, 22 May 2024 01:40:58 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9axu-00000001eaz-3snD
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:40:29 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-df4da80ce08so603543276.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342025; x=1716946825; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9/Jh3NT05cAP4Dr5P4AOID5+N71m8JBqExCgFsAlL8M=;
        b=u6h1KlB/GvGreFt/YHQM63RBZuzUrh8ra/vfj0jaGCQzmFSge1pMIJNN6bizO7lxcj
         msbgdj1HGND/dkXd014iU3xdFC8TYi9Ya5kxkDyfSmsZIrBSzJv5hQkfjDzaaT6uo2Bn
         HsXmKJIJtNCkboBe+wlvUH+tcArRv89ufmI0sIqfUE242l0KztXeuaN52Lhe7V167i5F
         KuYY3s8MfPU+OYlhOEiy3ehNr/rEIV2XNdz0+UwU3zIXCCRl3i5jHRqt+oPU2TooJPNl
         dIGRPUP5YBvm0CsBk9OUblskT7AfZdw5cWSKaRduuQbteUtsr0NQ3f+0xT9slVv/l4/9
         0WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342025; x=1716946825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/Jh3NT05cAP4Dr5P4AOID5+N71m8JBqExCgFsAlL8M=;
        b=TGAsXgWZ7veVG2FsYnjfgneEHSLuxBUDNRrnqJrG4xyz2HL96V2g15ryn1mPaDmGIi
         pi9z0VZDALUa9rooloiX1sx+33EtY0EVx0ZIMzM7Uc7uWQJbhvImiiDOoC96n28k00il
         TEpS9kkKBCGdnDpIg1HrOyqnxsapLWU0/QaEsQvzKgLU5cfm5WEAsKqihCIdYVFzmlSZ
         qadsNbEDZi2vrt1KuJS22uExH4kkKkRnlB+imWz26fOzZV+aIk2MYb6/KCQnbO979tXS
         iWtR+nKiDQtY2gpyddoY7riuW6c4yBnYL2joEqGzA2exJRM2P0oNIAmwmnp8bR0vAetO
         oWBw==
X-Forwarded-Encrypted: i=1; AJvYcCVirsZ07J18rhaR3pzaz4bJLB3CEgNYLRid614syFkY5BCALyc8OsGeW31Y5oHVq1ODlDtKptBawS033+0zXeC9Pj51biIVCMYCIhuQiPCM
X-Gm-Message-State: AOJu0YzByf8EntPa8SuQ1BNCJS0Cr2Dki1LxgEvNR7Gswn38BuRSBFol
	TzYfcBQWCtXDcpMAHPimKAGa+HWFncgJVt7uXohV3Jid6VUQlb8VDdIhockVIjsA006T49l0LSD
	aQw==
X-Google-Smtp-Source: AGHT+IFb4ojjFIBjH/g1gqSAZtGdXjScECyPQCKxtonXS1wS1/Q6Sfuh8cMohHl5GHkfuJ7096x7AKNuxdo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:100f:b0:dda:c4ec:7db5 with SMTP id
 3f1490d57ef6-df4e10405f6mr210549276.4.1716342025422; Tue, 21 May 2024
 18:40:25 -0700 (PDT)
Date: Tue, 21 May 2024 18:40:12 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-6-seanjc@google.com>
Subject: [PATCH v2 5/6] KVM: x86: Unconditionally set l1tf_flush_l1d during
 vCPU load
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_184027_049828_8A50A93F 
X-CRM114-Status: GOOD (  10.90  )
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

Always set l1tf_flush_l1d during kvm_arch_vcpu_load() instead of setting
it only when the vCPU is being scheduled back in.  The flag is processed
only when VM-Enter is imminent, and KVM obviously needs to load the vCPU
before VM-Enter, so attempting to precisely set l1tf_flush_l1d provides no
meaningful value.  I.e. the flag _will_ be set either way, it's simply a
matter of when.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 59aa772af755..60fea297f91f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5006,12 +5006,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
-	if (vcpu->scheduled_out) {
-		vcpu->arch.l1tf_flush_l1d = true;
-		if (pmu->version && unlikely(pmu->event_count)) {
-			pmu->need_cleanup = true;
-			kvm_make_request(KVM_REQ_PMU, vcpu);
-		}
+	vcpu->arch.l1tf_flush_l1d = true;
+
+	if (vcpu->scheduled_out && pmu->version && pmu->event_count) {
+		pmu->need_cleanup = true;
+		kvm_make_request(KVM_REQ_PMU, vcpu);
 	}
 
 	/* Address WBINVD may be executed by guest */
-- 
2.45.0.215.g3402c0e53f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
