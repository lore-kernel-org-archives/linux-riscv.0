Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40C3EE57D7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfgSSGBVc4bAuFH7c4AO1wmFaJWTorMNm1wrRmJuQDI=; b=gGf1Z8OKmqhIrz
	XbAC9U2RZliR2T3uExtFU4UxKczUIzZAQpEctI3/AnqAKdDhcQzzK7GdxbeXLRKHI8tLeRONQLKCd
	GqSV8PMEgPxQvg3o+VRQ3F5ZYbzUygX+EXDRwlcimCPt+2Sx3B5Nf0tFE7N4erS2gTwLS3VK1GRn8
	x8E9771YJAJsapBT9ZAIXtOkpiI1vu3Uhs7Y8ag9i9xkWkd/D3KlX9R/c/LSUd8t15OHL5CdOjK72
	CMdb/i1dV+H1KaQjaKRF8m1YTk/jpXfYRyXG2StB38TmPfcDqKac/3g5C919zg9qfYOdUJK+RfBvw
	R9IT+wpoFO1ucZk5Ua0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUJB-0000000AzYB-0mIt;
	Wed, 11 Sep 2024 20:51:25 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAf-0000000Ax2p-2xnQ
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:39 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1d351c9fb5so949638276.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087355; x=1726692155; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mDeUl+tBis0dtonBgnOqcF+rjd+/029ZvfofLpY6Be0=;
        b=qoZhFCfEOsf/3vXB8k+u3PPE3MsiCggMd77u4Xmpfjjzb+vRBg3CylZGmImL0NGJwn
         tOlnMZHaYM/K2IGmk0kK0JvB0RgGQ/RqnAi5E6fr0Whzd21xfaO/8WFE4e8jpNRV0ylv
         qJ1dYO4qQBQ3qTHx0aoZ/J/rilEXaA9iUdJYJqcIjxpoESa4wBwpJFMp5o1bFGdaKNlh
         TnjoIFjyLBTsEifWfT+NRMGiNjqBZcskfzPahNtUk7KqS78ooYYCKytT7sWA4250nhCb
         OnlBDSKZZPoOfvG+TO9AYgy0wIQOsKrg7hkdOFFS92auvoOXDCPJAoCLMBajU2mwrZ7F
         E4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087355; x=1726692155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDeUl+tBis0dtonBgnOqcF+rjd+/029ZvfofLpY6Be0=;
        b=h1bhiyBSg+67HGbCQ6d852oPOIvCq4n6gLmP56CChqXo/AioM9l07pmsKzbOkypPLc
         Jk9ty5KwuHxiRyiFA3XEmDIidhnSjEzOzyzeXncnrzhFPwPeV09nmDWOoV937TS7BWOL
         /ZFp/lC4zqgcWvsI1Npp0ZTGDCrIv8y5qZNe4ZLyEMY3ScmlOwdFWB06J3Fan2IHJsZf
         38X6HPOZ/mvizdHmIisQ+MkYUQbSGcuBN48ViwhFDGENfmcUn3p6jYQt1comUNGTobiD
         Zku1Ok5qJA/B0x3LmMe2UrUu4GwYugpGev3mU317Go0jr2JMvLuBurDdOPS5rfUVjxRq
         OZ8w==
X-Forwarded-Encrypted: i=1; AJvYcCWhsvfiNyWtAOZghqa+K9WACLUxqyedoa7lLlX4n/eioJuKjxSzLeul3iqogGk8ky6WaXSbLvw8r+RT3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXEEtFzzFzaeruTo+gT024R1G/hExMztdH/C2XKn0jUTJOlcd/
	uvwgNjhTn3vOWe2tB0anV5WLNXRr8d3UlpmI6rdWXEHRQ7ZBx8rA+KaPGNlp+M4d9/IbxLX/mLF
	GcQ==
X-Google-Smtp-Source: AGHT+IGxqix6H/PLMvvIcFrC3JMaLMXEJXlPHwcg40gW3P6CGrRnyhAhRYR7DkVEhB/fpO0WlA4G6vBj/5E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:9108:0:b0:e16:4e62:8a17 with SMTP id
 3f1490d57ef6-e1d9db9ca04mr3916276.2.1726087355066; Wed, 11 Sep 2024 13:42:35
 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:52 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-8-seanjc@google.com>
Subject: [PATCH v2 07/13] KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_134237_830312_3069CC83 
X-CRM114-Status: UNSURE (   9.98  )
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

Try to get/set SREGS in mmu_stress_test only when running on x86, as the
ioctls are supported only by x86 and PPC, and the latter doesn't yet
support KVM selftests.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 0b9678858b6d..847da23ec1b1 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -59,10 +59,10 @@ static void run_vcpu(struct kvm_vcpu *vcpu)
 
 static void *vcpu_worker(void *data)
 {
+	struct kvm_sregs __maybe_unused sregs;
 	struct vcpu_info *info = data;
 	struct kvm_vcpu *vcpu = info->vcpu;
 	struct kvm_vm *vm = vcpu->vm;
-	struct kvm_sregs sregs;
 
 	vcpu_args_set(vcpu, 3, info->start_gpa, info->end_gpa, vm->page_size);
 
@@ -70,12 +70,12 @@ static void *vcpu_worker(void *data)
 
 	run_vcpu(vcpu);
 	rendezvous_with_boss();
+#ifdef __x86_64__
 	vcpu_sregs_get(vcpu, &sregs);
-#ifdef __x86_64__
 	/* Toggle CR0.WP to trigger a MMU context reset. */
 	sregs.cr0 ^= X86_CR0_WP;
-#endif
 	vcpu_sregs_set(vcpu, &sregs);
+#endif
 	rendezvous_with_boss();
 
 	run_vcpu(vcpu);
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
