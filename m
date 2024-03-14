Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCB4C54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTO5+qwElBpLw37dVEPC53ufk54ixlv2S39EsZiGzS8=; b=qsRoWb1A+OfcCb
	qJFenPoSaAaf3brRHaZiIgnFzVMkaMzVuqA3UZkQ4I7ZeIOIsOWa7UlS7Asq0TT8mzJr77BVZRkUj
	qTR5OEFqlO99TqPc8CNyBJmKkzBSe2d+5AfAjRGn4r1ZQGSA1EMiru6AQc54uICrL9zshHANBeq8K
	9FBrXS2bK9zrm5QcsOBZjXFyIL/zerjRza19T044mViFwokad5xQ4Y9h6QwABm49NcpOkqGW2HSv4
	CRhzt/q6eJhfCuZ2ipaybtnc6aawOh9o6Dt7C8teIp0xXfa0C/xEuG8hvQ8m8vS3zwBmsFDMo7MO8
	qY1P9yDLHKvyZOd7+v3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuVC-0000000G1Ig-3NCn;
	Thu, 14 Mar 2024 23:28:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTP-0000000G02c-3oJ9
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Mar 2024 23:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k1ceQ+0+7x0dggVxu3pfjgACx/CpWN/VJ25BN1jj24Q=; b=fMbvKtvXHQa25gx5SCMT09szHP
	TMvmOO7UvKOqik8uxhBQsCSjm/z3TpENigfhvqFCh5wy2GaBj531ar8hLg2cZB6vDydhk/peCxAJF
	TDhsfYfdttqi4X1E7HsgcvIlquvtt6XqsUBoF1mjRHBwuSxbtkVDOhYrNjj9bP5Jit7DTfGkr2Pmt
	lhcP0jEq/Ycz3SxWE+dVnfRlkftSN2XEr8byWvogBEp8UJwVn96CdcvrIGe6bWqO0kPjwNIQ+ToVC
	oBe8dUSMH3GyEOuiwPhxMOd/YI9JRJXr7iDe0KCB8Irbcm6pR7fqdx8LggQULc1mLDU1gsUhd6XRS
	dqjivUbg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTL-0000000Aiqo-0U79
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:26:54 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6e6b63a34baso1501263b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458809; x=1711063609; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=k1ceQ+0+7x0dggVxu3pfjgACx/CpWN/VJ25BN1jj24Q=;
        b=IpSUgOvzJWye6SQ9pFtYNjOkuiejuc7kprSGnpJAp/6o7RP45KXQJlLhQanLnVktlf
         oX8gIGzccHodZ6Q7SiJbXv4i44/izEZ17MLPt4xglZgNZMXEY5YKKMZzGoSYdHTMfW45
         Qui686llwee8xnhNshkvT2jGGMhjxU/ERDai02eCpsskC+k6aSvlXXrIyJrGLnHuEnmp
         GAWaWmloOEVl+wrzwZYIk21hAZIqHzhtJueRq//uNpwr47kqzKQ10NRYG7kxiuYSB1qh
         344JUjQmAyvsiFShQJo04Nt4Iz1Ik9B9FAiCrB+RMBeEI11uy5xIShdocKvy/MEbRU8A
         Tiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458809; x=1711063609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1ceQ+0+7x0dggVxu3pfjgACx/CpWN/VJ25BN1jj24Q=;
        b=T5v3DTVIF5xlmr0mlg0qzs46JefW7zlXKCchXc85MR+o5G5aeUbh4PnIAyZRn6pTaj
         iuTjZ99aGjLYZpWuxfAa3Ylch0bfNUntiLILIuKwAN/UfTjRJJsels/rAnqufTIehfnH
         TmiYyMdPovMa8RJM/xQK+lF4cNmgiNDEc7u1mE8eoDgp3JgqkBxKjdkz42ttSC+x9jxI
         CqL7SATthrpGC34PgneqL/ETa6RvLbCytdoWSfaPqsn+URvLvRAAmEP35j4OzdEmgs4w
         HhBmDXaCYL/qRHo3NZ47aHB4gDjshPvIHSBi9cxBXXxhlUveyGW7QPw26jXtbNJJ1/uS
         Feug==
X-Forwarded-Encrypted: i=1; AJvYcCVPD0Qm1rBHntVBXU2EZj1A0P92mX7clPSx8Q9GBxSZ1zmFB/2wABI//p+McGP+Mhy4sztEJe1B6q9tSsv2QZB8ZTlIbq0k0ZCkszBNOECW
X-Gm-Message-State: AOJu0YxLY7mKKHg+LQRI54XMyNsf9rBeeAxdttihTukW3Zo+IK5925oE
	H0bk9nysPF3D9ykvpHpv10V8XUSIcDDqzbhdpdrm+YrdaFUKt4YDtbxXq6SV7Qo9EgwXiUtcVAg
	7sw==
X-Google-Smtp-Source: AGHT+IFa6Xo5alB77JWBKkmfaT2866W5+uuYd+R94MhsO58PTc0FssqvQ3Br5ekzS9Hb9uDd/sllma8cTz8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:23c6:b0:6e6:c374:f104 with SMTP id
 g6-20020a056a0023c600b006e6c374f104mr152102pfc.0.1710458808854; Thu, 14 Mar
 2024 16:26:48 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:24 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-6-seanjc@google.com>
Subject: [PATCH 05/18] KVM: selftests: Move platform_info_test's main assert
 into guest code
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_232651_752272_A82C8248 
X-CRM114-Status: UNSURE (   8.88  )
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

As a first step toward gracefully handling the expected #GP on RDMSR in
platform_info_test, move the test's assert on the non-faulting RDMSR
result into the guest itself.  This will allow using a unified flow for
the host userspace side of things.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86_64/platform_info_test.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/platform_info_test.c b/tools/testing/selftests/kvm/x86_64/platform_info_test.c
index 87011965dc41..cdad7e2124c8 100644
--- a/tools/testing/selftests/kvm/x86_64/platform_info_test.c
+++ b/tools/testing/selftests/kvm/x86_64/platform_info_test.c
@@ -29,7 +29,9 @@ static void guest_code(void)
 
 	for (;;) {
 		msr_platform_info = rdmsr(MSR_PLATFORM_INFO);
-		GUEST_SYNC(msr_platform_info);
+		GUEST_ASSERT_EQ(msr_platform_info & MSR_PLATFORM_INFO_MAX_TURBO_RATIO,
+				MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
+		GUEST_SYNC(0);
 		asm volatile ("inc %r11");
 	}
 }
@@ -42,13 +44,15 @@ static void test_msr_platform_info_enabled(struct kvm_vcpu *vcpu)
 	vcpu_run(vcpu);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
 
-	get_ucall(vcpu, &uc);
-	TEST_ASSERT(uc.cmd == UCALL_SYNC,
-			"Received ucall other than UCALL_SYNC: %lu", uc.cmd);
-	TEST_ASSERT((uc.args[1] & MSR_PLATFORM_INFO_MAX_TURBO_RATIO) ==
-		MSR_PLATFORM_INFO_MAX_TURBO_RATIO,
-		"Expected MSR_PLATFORM_INFO to have max turbo ratio mask: %i.",
-		MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_SYNC:
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+	default:
+		TEST_FAIL("Unexpected ucall %lu", uc.cmd);
+		break;
+	}
 }
 
 static void test_msr_platform_info_disabled(struct kvm_vcpu *vcpu)
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
