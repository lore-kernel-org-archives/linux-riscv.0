Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3714CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaE60lYbe6wqexLzWeavEF8Z0W8xrku10qmqnLecF34=; b=ZehUc7n6g5lvZx
	YBreisaLmy36uzA644tLOMVuuxrBDJoldyRze+/tZLV9e+nuRuznjwDh1uZFmvp4jW0HQ0ropFmYv
	SPMUw5uz6Pqge4PIYnm1/ux/61YxWbuCIxLKjvDn0MR2UQrRfV7uWC78nnrYVQqAzeriHsEev9GxK
	jYxHu8K+gGsV3sVgaDxuhr2MLN3tFd/HtZOTbpD0tt1YoGsBnCKE0rjRvAWr+16SlIPcQJGYwTqq5
	lOm/QJJc5jJ/Texvp0rL2G0KFfRmjaisYGQOG6PeSnKEAVT/JXdl2ROVwCdggUiPscn39dRkb8LjW
	9acwgAnFsxoQx/ECDjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvdR-0000000EjK8-2od9;
	Wed, 03 Apr 2024 08:06:17 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvd0-0000000EitY-3I5W
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:54 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e2987e9d67so1071595ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131548; x=1712736348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiceCABnvA1jknfstt9FkxftBmpWokdNdmMlEhNsfyg=;
        b=dqhchlchGWWxja0yyzYQXd/0BPsRbWquZwjgtUMEoa7h1vxD+xj5ic/N2Lav4PoK6N
         98E7JTTXf2CxRdcsh/4wS2hOAzhsMlfrszQv8ugpqvudh1FmyQ0HjbQDRWHTKpVflL5V
         HzH2+W2HvUYX3EBHGmG6J1ZchwJr8ZN4oN8+GnMHQPhgc6Zsmy/jRQaAinaV42A2AhmV
         0dINMVAvetK07KCbmhkzaM+cWVBldZfyJ06eZI8ezNDez4jsJLYL62BZxvXjGTFqlWEe
         DHO0giMZfPwFvTJNmoRuWvHn4adresKq0gvekKSO+efMn+PaGKXKzCZ89k/5mscIHb9J
         el2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131548; x=1712736348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiceCABnvA1jknfstt9FkxftBmpWokdNdmMlEhNsfyg=;
        b=Ts24RmqyHbWPMSemHu3gXA2tp+DUQO1Pbp/MzodShjvUmSVDZlPTKrrNKaCMzXSFSM
         HoDyiNTHkKADOugDFSn3D2fZeSpRLAFAcRfrEhbGQ+z06DTsVO4AIFXTvKEy63lOoZ1w
         AhnuyHU/jwOOzKAZmlQQzHsRVQcvJjOGh38meyBnAYU70ba9tHjEEnSz+41KXIfl5Z1f
         8HZkMNdsFgT18VGD/RipbJbajwx5L5HxsRxQkRxA7a5f+uqz1dh8tv/7itlqrShFSvS5
         4GVFqxRpMjTB/tAEaDyPqtCPPfi3cbddQN1t6vRN0aviK69eVPNMhwVo2/bspQxdGm5Z
         YPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0K4xRjnKXEVa01gVEwj38bxDtuq/LMBnb+U7S5LSbTVv94ryX/x6j8/e5mOtreR+HTbm4dOwNzFWtldZ3tLGowrGGqqZ7IVFk4vhyaZPK
X-Gm-Message-State: AOJu0YxGR+ck0oPUuXWGNKPBd8sJxw5r1RuqEPryVQLzIxON+3ek4HvJ
	Q7SEJwGfsYhKJK+WYEw8UI/AVG/CnMkYHu4sDNs8g2qPpCtrSF8l+IA0QU/pYgU=
X-Google-Smtp-Source: AGHT+IEPeMI0z43MjvlBXsAsUdkQGTsWnPaqF+QUoQ1JhMqwDtA7d+BW/HuEGoVFyjEvifPOaGIfHg==
X-Received: by 2002:a17:903:181:b0:1e0:e85c:72dc with SMTP id z1-20020a170903018100b001e0e85c72dcmr2464037plg.19.1712131548509;
        Wed, 03 Apr 2024 01:05:48 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:46 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 17/22] KVM: riscv: selftests: Add helper functions for extension checks
Date: Wed,  3 Apr 2024 01:04:46 -0700
Message-Id: <20240403080452.1007601-18-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010550_916382_88738343 
X-CRM114-Status: GOOD (  12.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

__vcpu_has_ext can check both SBI and ISA extensions when the first
argument is properly converted to SBI/ISA extension IDs. Introduce
two helper functions to make life easier for developers so they
don't have to worry about the conversions.

Replace the current usages as well with new helpers.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 10 ++++++++++
 tools/testing/selftests/kvm/riscv/arch_timer.c        |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 3b9cb39327ff..5f389166338c 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -50,6 +50,16 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 
 bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext);
 
+static inline bool __vcpu_has_isa_ext(struct kvm_vcpu *vcpu, uint64_t isa_ext)
+{
+	return __vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(isa_ext));
+}
+
+static inline bool __vcpu_has_sbi_ext(struct kvm_vcpu *vcpu, uint64_t sbi_ext)
+{
+	return __vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(sbi_ext));
+}
+
 struct ex_regs {
 	unsigned long ra;
 	unsigned long sp;
diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
index e22848f747c0..6a3e97ead824 100644
--- a/tools/testing/selftests/kvm/riscv/arch_timer.c
+++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
@@ -85,7 +85,7 @@ struct kvm_vm *test_vm_create(void)
 	int nr_vcpus = test_args.nr_vcpus;
 
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
-	__TEST_REQUIRE(__vcpu_has_ext(vcpus[0], RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSTC)),
+	__TEST_REQUIRE(__vcpu_has_isa_ext(vcpus[0], KVM_RISCV_ISA_EXT_SSTC),
 				   "SSTC not available, skipping test\n");
 
 	vm_init_vector_tables(vm);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
