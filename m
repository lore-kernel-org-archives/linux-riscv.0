Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E51D6D255
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 02:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+xXyORlSHMmsznBHLj555eJTxM4jM+BlnTZ4N+mKTg=; b=N3ugWHk9V/8Lp2
	bL0iyqU08QoLBOjNXuS95IY2df5ahIu7aX8aE1rK9A8cKTf+3X5P0ndKn16tsiYjrQKqVSP1ya+ym
	xHQ8of3YStoXtt+Ewi3Cs0cs9Gfabz6gK1zuun5EqoLCme/atqhIyuVneWUO05TLqO1Ykk2uO0hpR
	2C5ZuAFFeULAdD1l/1tTDoM1Pq6Mu6mr8Zj0I922OrWyZmIi+jTvufH1ZMd0yqD7Jg3zbwMIzIhn4
	0UBOFecyw1fQH7KvcGOKFm9nXRi7vkDcmPauvYCJ6d21eRGLfZ111LR1o39qFmdDfpgHZQfhf7ssE
	wYcMQODLbhNkQQdUFeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGUAK-0000000EWjF-0zFh;
	Thu, 28 Nov 2024 02:22:00 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSpG-0000000ELyA-1nKm
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:11 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7fbcfe197d1so205312a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 16:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755369; x=1733360169; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/mFf9b1jkbcIPk1lRuUSamWoSedpUsq+XjDpJ8wT6fg=;
        b=BLiPHMx0mRejGHJO6NyYdSSJwGK/ElJElj+pdp4V4xQJTLLX3oI3aPHmgxJvQw81rL
         LBzChVQ1vijlWWSNWELGeK3V5plggcgW6vMcKPQNQgnARjl2Ft1QPJpHPe6jzR9HWWow
         0ooMcMKmwGPgMSFyfrfFukQS15V6QMUeZX07bsmASfIK0L9FPhvdjncDT0j989ofBPYy
         LzHeF6D9StjXnP39TnoMa8Cqg9b+3It/yYfnnCulswgMxn+WmXCFwlzwPNUOg3MO9Mlb
         qFtGI7dz4xfO8O5yWmR6Agg0QmaUubTprAhgSb93lpjxusAOBX3UQkSEDErA1e69xnRN
         CiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755369; x=1733360169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mFf9b1jkbcIPk1lRuUSamWoSedpUsq+XjDpJ8wT6fg=;
        b=Hc1NADxkA8LaoTB6jKebG1V++dVNu4FgG2kck78tdLQSK+Dv7K44D1vozVKLKrSYrX
         uS4ONI52YRro16KILQCQn39rtBzPZ68gkHoUnpkms3ISVAwREH9DKtD3GgQlwCX7cijQ
         iAn1t5IX4VE5rZOtBRPJOnIQyDZ9dczbaE3oVCGQrGapbhTXDBY9Iyhh7G8+blq+JepE
         GX6wPJw5oKdf9AgDp7sNU+WDwBA/bw00Ovz04za+JGkuzek7nQeMHjfPZF6vmMDC+zzu
         y765j2SAN5Dl8kNMh3OeK8HSSyO0EuCCHYRlM1cdJKIW10dNMIGsKYLRG8Y13kTUWExN
         otqw==
X-Forwarded-Encrypted: i=1; AJvYcCUL9jcfZ8DCYK0eqGYrrezvzGxFRRHI90RU8Umi1KWI4hSx0p1w1zcX9Nk3lVyk8Vu6iAe70QW5QOcSTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFM8fXzUXsp+pTaEUGhma2rg2IL6SfOQSv7FAXv5MuPjYyuLow
	5WnbOzrt/+94Toxbp+ytbpAEGSPajOn+CbOiz7VCgAW0j0dNDX8Vr6MhsNiV7etHVnmZT3AVHmK
	66Q==
X-Google-Smtp-Source: AGHT+IH5HVAxwH71e8ybYbHuEKxtEP3yXlkNICJu49WhynVenqzqkDMIejgXVsQlKc9eCbp1lS1lKkfrLgg=
X-Received: from pjbsc10.prod.google.com ([2002:a17:90b:510a:b0:2ea:d2de:f7ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a28:b0:1db:eecb:f7a1
 with SMTP id adf61e73a8af0-1e0e0b4f376mr8089233637.17.1732755368992; Wed, 27
 Nov 2024 16:56:08 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:42 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-12-seanjc@google.com>
Subject: [PATCH v4 11/16] KVM: selftests: Precisely limit the number of guest
 loops in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165610_457330_99DD9B58 
X-CRM114-Status: GOOD (  10.24  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
