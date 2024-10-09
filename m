Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FF1CEE32A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9tJQ0gZQEHHpYMWMvaC69K2slDVFjcI5w6Ge0tLa28=; b=hw6uue29UJY+LH
	0707OC1ocEeNkgOvIoUObvm9BtdtcAJIFIp/KWa53XpscPUhg5wah2PCnxXuCY/6gwoRVSrnmJ2Fa
	9zJ9EGEhnJdIcfpEJS459LbAfusQSHWwf3EG/5eawQXEL+Oq5wNMLEQZpZ1nE7QOc4e5AM8Racr3H
	AHoq3MVetCnn7LohvuPq4XD0rT+HTiJYVD5nacAODvuT8qY1GqBYyGA1wQHr94x1liNYcZqUCdKAe
	alU/5TbnH145AEuouB2z/Ye1xokRZvN3wPMqXZaU+gLDuDiWcp+snuDzXVnvFLOr3gUiq5aZylwJc
	HDT0bOQIDC3/QiApx3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZGN-00000009sza-0jkg;
	Wed, 09 Oct 2024 16:10:11 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYxC-00000009oEO-01xu
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:23 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3231725c9so103857b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489020; x=1729093820; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HIeWF4AKDrrEZVf143SgWaofUVl00+qhbF3Z20PXTUE=;
        b=mNQZhTT/nIcpqDSE6yF1oaMMlUClm8MURuk7DtsQnYdRlW6UDYRDs7KgE29Ors4XVe
         ssjLr06ATxKTPe0keijiTMwbtvlBQkl9++wLiIOekcXceifScc3sea4DETyd7FU51Cso
         evzAfNpyyeCnDZh6bQkwiG/jo4+J7D63f98gWbnp7q48xu3lR55vVI0S5It2AvVAg12b
         PdzJZ5PR4iC908H90CZV3WZuFH8AorasLKOPhYavma8fZSexiu2BhF0Ipyhd5KUcdiL9
         M2Pz4g9AFazB12wTkqDnW/LeQW/v6Coq7DV+zH3e48lP8/MWHObtAX0Mt61rBlYIzcqA
         f4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489020; x=1729093820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIeWF4AKDrrEZVf143SgWaofUVl00+qhbF3Z20PXTUE=;
        b=RyAK3vD+kD5WraZkCH0LPgny3X4rgo5gsD4iFkgx1hpQWUhMw1wgxHxnrCVl9xl6g8
         ceSyZ+y9RM62jMyK0IXaMgeJ+rRrjzbiQeNXC7S+3H+uYVMX7Hg5zShXr8p7JME3C9EU
         2WrnQMfAaOdG38hsP5GeXVrYGQVZu4cNI1/CWnHSDo9IyMlPgAxaa7wrm3JvbVQPLlhz
         X55iP8X6sZ+M8sJ7Xim9QKSVFqdNpWYyT4cpialiTxM7AOum/HR2aDbbKbNZ2twXIlgA
         iOtSCVje1iy+dZnkLmCRMtrGZXovP4TplKX2YxAUV6GW8qM2R1eqewrJgR/nbA/hSDOW
         MZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm+QMaL0hou3CfsX8XXOxXvVfcLmFubvqvMEYwkmWbK42hb40MaMHxAhcQ1DPHouQ4DisHqmWc3g1+mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhPE7imVAauHocSx2sGDy336Iu8wcWqmPSOlT5FamYS6Ij2AHJ
	N6bkmr61JBMp/zTOXO+PEdJoC7hwKn06d5r/rDlfuZrQpqtnf/F/0LuLw/505k4piKAL4/lc/VT
	BnQ==
X-Google-Smtp-Source: AGHT+IGckGzXTau4NGP/kAJ156CIPWl2QZt/eqMK5BUWyK8KyKg1g8Tc1FgMI3mqgA8yRsZ3clSiNLLsE+M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2093:b0:6d4:30f0:3a74 with SMTP id
 00721157ae682-6e322171640mr503647b3.6.1728489020502; Wed, 09 Oct 2024
 08:50:20 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:51 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-13-seanjc@google.com>
Subject: [PATCH v3 12/14] KVM: selftests: Precisely limit the number of guest
 loops in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085022_114031_517084C0 
X-CRM114-Status: GOOD (  11.14  )
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

Run the exact number of guest loops required in mmu_stress_test instead
of looping indefinitely in anticipation of adding more stages that run
different code (e.g. reads instead of writes).

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 656a837c7f49..c6bf18cb7c89 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -20,12 +20,15 @@
 static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 {
 	uint64_t gpa;
+	int i;
 
-	for (;;) {
+	for (i = 0; i < 2; i++) {
 		for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
 			vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
-		GUEST_SYNC(0);
+		GUEST_SYNC(i);
 	}
+
+	GUEST_ASSERT(0);
 }
 
 struct vcpu_info {
@@ -52,10 +55,18 @@ static void rendezvous_with_boss(void)
 	}
 }
 
-static void run_vcpu(struct kvm_vcpu *vcpu)
+static void assert_sync_stage(struct kvm_vcpu *vcpu, int stage)
+{
+	struct ucall uc;
+
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+	TEST_ASSERT_EQ(uc.args[1], stage);
+}
+
+static void run_vcpu(struct kvm_vcpu *vcpu, int stage)
 {
 	vcpu_run(vcpu);
-	TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_SYNC);
+	assert_sync_stage(vcpu, stage);
 }
 
 static void *vcpu_worker(void *data)
@@ -69,7 +80,8 @@ static void *vcpu_worker(void *data)
 
 	rendezvous_with_boss();
 
-	run_vcpu(vcpu);
+	/* Stage 0, write all of guest memory. */
+	run_vcpu(vcpu, 0);
 	rendezvous_with_boss();
 #ifdef __x86_64__
 	vcpu_sregs_get(vcpu, &sregs);
@@ -79,7 +91,8 @@ static void *vcpu_worker(void *data)
 #endif
 	rendezvous_with_boss();
 
-	run_vcpu(vcpu);
+	/* Stage 1, re-write all of guest memory. */
+	run_vcpu(vcpu, 1);
 	rendezvous_with_boss();
 
 	return NULL;
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
