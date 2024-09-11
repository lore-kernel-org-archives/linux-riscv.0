Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AE9EE57D7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/HJFzbEiKfkUn40sDJH0WXeO2hhUB4YOXROV8sz8m8=; b=0jOaK1xY6dV8n+
	QCRnRXMJ7mi5bqY9s/1vBIyVxpRRw+jpWFHjwkCv6XdScKF7QAfQw6ogTJhX+J7CR3Ux20CsK/tcG
	jf2eletqbwGCcHtVP1YzVu4j2b5er8YZWG6s4XQSYupfIfB5pjbW2JNxB/SLVYxlhtolS1crr14g0
	0cS+yf3ZfSRtztsL/E4eQVqZMJyCzCdOsIk9ilkFPZxUoI3rJdoZ/EDcjLVG4qg7S2SU3DUGEJSwG
	txmoc6qiM0ffGUmTcvNyUYTnmh99odBbKvcS2oPhq+AS+SWLbWH8MaGRttP6tVqZue1Q4TgsHIjyk
	LImS7qWbfY1BqRQBS0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUML-0000000B0FT-1sc3;
	Wed, 11 Sep 2024 20:54:41 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAm-0000000Ax8Z-2fAz
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:46 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2d8b7c662ccso374008a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087363; x=1726692163; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bmoPUX+JXjpnDZGI5p6xMsNQ8aqKvxbSE8GAbeQD0ic=;
        b=VbVesIFM+0qnPPK/Amd9aZqJ6HWOjyRM9JR8Vnd24RtYRA59IfJzX47ZtNMMkuQdLf
         pNQqCk/xavsKE8De3OajtQjWeYgzDM1nnieb0oo9TMCensWTjlqMAfmjY6MdC3UWiJjr
         WUE1V0Fxed80YFVTHZhVBqkb6SJXvDaa7lHFNfgCb+id8gE5YM71WweTnNeCa6DetVce
         3TxmfvbtRnXdupjEkKvbMOL5pVp726Xq8fmIiyd/0mWb773gQsSsJ3lf9zgtUCdftBim
         l77ngIr/uQLGws4ADd/kmIpoMjU0dpJ1dbUxf+XkWiwiXiLbyP6RqloCC4NEJbEgzh3N
         AqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087363; x=1726692163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmoPUX+JXjpnDZGI5p6xMsNQ8aqKvxbSE8GAbeQD0ic=;
        b=Z3IPsWZeGpYK8uqj09uHlrzPxjEjt/nY+7/psp++UtLu0aA/8PvS9BZQr50w4tIUd9
         sBrSoSnBms5J8DL8/SGksSpr4+WwktI4QCGJCrhsbJQgx+BvCWZdxH3bF4SagzK9RqLF
         r8XZtgymUjcQ9UT1AMqWS4J/3Oiyan0hxXWMysBM/mPU6zkNXFGWzi+PZxtrpPSrZnD6
         KOWE5Y9+gkK/Db4A7P0IGWs102TRH7p+k+I4kC3iJjWqJP0iG+DHm/9Ifp01dB8uo+ci
         r6WKG5sIGEWc/2/a1gBn/HXU0AnkPORj7JfDJdOjYmcjifkHYlnj+aLfEvEKU55zJkrg
         KHfg==
X-Forwarded-Encrypted: i=1; AJvYcCWIaokKX7ohVlkiCNoxonRGnFBfOKK3HdvXzJ4bOFxLAEzAV9PeFocdNW0bLz1aUPswP/PGR8Jd5ffjIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6ifM3hSMWkFAsIAPUPnhxdUS819SMZT2j7bdunL15/3tCMAFE
	9pBUjKcnrfx1853/AXLKTMWPb9+BDR8HB1u1kRXGQVEyTBQrgVxdENXi/lk8Ihjz85HcxmahAFn
	BhQ==
X-Google-Smtp-Source: AGHT+IFejIMeELuVO8txo5UGwYsGrFXhMhJbdLyClaj2asDasqbAOd2Ag+P6eX01VQr2edSnhAi2+MXrYfY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:710:b0:2d8:a9a0:3615 with SMTP id
 98e67ed59e1d1-2dba005b566mr856a91.8.1726087363354; Wed, 11 Sep 2024 13:42:43
 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:56 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-12-seanjc@google.com>
Subject: [PATCH v2 11/13] KVM: selftests: Precisely limit the number of guest
 loops in mmu_stress_test
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
X-CRM114-CacheID: sfid-20240911_134244_706500_656A5CA7 
X-CRM114-Status: GOOD (  11.00  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 80863e8290db..9573ed0e696d 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -19,12 +19,15 @@
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
@@ -51,10 +54,18 @@ static void rendezvous_with_boss(void)
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
@@ -68,7 +79,8 @@ static void *vcpu_worker(void *data)
 
 	rendezvous_with_boss();
 
-	run_vcpu(vcpu);
+	/* Stage 0, write all of guest memory. */
+	run_vcpu(vcpu, 0);
 	rendezvous_with_boss();
 #ifdef __x86_64__
 	vcpu_sregs_get(vcpu, &sregs);
@@ -78,7 +90,8 @@ static void *vcpu_worker(void *data)
 #endif
 	rendezvous_with_boss();
 
-	run_vcpu(vcpu);
+	/* Stage 1, re-write all of guest memory. */
+	run_vcpu(vcpu, 1);
 	rendezvous_with_boss();
 
 	return NULL;
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
