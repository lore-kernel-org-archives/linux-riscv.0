Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64820CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnhQYmCpW1hFiO8/R6tkQfwt8sTXbOAUpMVf76kwHkQ=; b=vLVPO+uP+Y8VYi
	wHqnyV7JHlwpbHF7tngclAgwvd9x4dGTe8sNjv4QC3KZIXNI1oHJ7SKWPFWcG4N3t8F+pAMs+o/hm
	CdxJ8r+hIrynRD/v8VzWOJ2+92ia1GTTJJ4CoHbroNoxOy2ourzkWpr1JjL+sZ2iPHpCXJYqPPiou
	mzFXdjfzxOmHRJ2DbHCJMcQHIxy+xxwPypmsuf2sIFk0QTjenJuVqKlS7KIrExGmx7HWwvswIyEZY
	/fkXHlx3Ct9AG/8WO2LY8WDjvsoows2972M9LAL+eACEtqAACFT78sv66XQ2rH6X6E93CvNdtiFmI
	aMkZ4vhUOa5xq34D+UNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui22-00000009c0Z-2Uri;
	Thu, 11 Apr 2024 00:11:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0e-00000009ap9-0vUy
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Apr 2024 00:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vBWeKaYtpXhvKjSg+whNN/rWnhjngNSIx7A/W77I8WQ=; b=BatAmDCSYSZ//UoOnbDROAmD7X
	3wDTzxdq+2jildBIu2JjaWQeLH0lDU8YyK8flvm0oRNiU+ukUWSzOrGkaJcq44TTi2UBb/4UKYOmH
	A4lKnZODey37wnALJgN1fOBPthkcrYNzrTVe7AYyayMgeN0dEilByWfIPt1TCn2V7odJgv1upVLcB
	oJMfkt6Fdu41Vz3rXfutxMEvAXWkdSTNLMq0WIByOenkyXEvhLUyOAxQnPLkWyXB1tGchz1CvrFYj
	P3U00L5nxERmmDPi73aX1hewzf1jLPl2HUqFcThHFnygIiFnTMSFeUwWoINt9OJUzj0xbBOlW/sqq
	L9h1sauw==;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0O-00000008JzX-1JJu
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:09:42 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e40042c13eso27810145ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794137; x=1713398937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBWeKaYtpXhvKjSg+whNN/rWnhjngNSIx7A/W77I8WQ=;
        b=GxIT/MyxRA8CIYNTIJiEHhj18HLDxYBshvFZ9OGhdojVhfWFm3B4cikLWEkgioHBmR
         sGo7lrx1/3RGSiS3usXgxQnKYVPYZSbx8ILEYJIogranQb8X5+BTjKYKyepqbxl+0r2h
         Uz1UJLiMq+3/dKYF2vaER+qZx7vwY7fGp26p6r4780KyrWf1xupr1jVvt9yOGrJg26En
         Gy5ARdhT9UCNqmR/uhCsDm3hFxQV7XkN5lkli+yQ7G/Th2hmj1wGwqA50A5nmjxB+cgc
         NsZ/CgOz8rziBwe13b6vcZTXyf7H121KFg0/uKhtGtSpz5lniB7nHZLL900wVjcgHbi1
         YBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794137; x=1713398937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBWeKaYtpXhvKjSg+whNN/rWnhjngNSIx7A/W77I8WQ=;
        b=WdLSVgigv0mYcFMRFpLs9VnknhVM13AJ05ntGbK6J2RoyVEYQYfiwmpbpgqOb4cLgv
         5Rt3DW8bkFaaBWs5cckpqkzP5Coa7A3xFsr/I9KhTlEqPG6DEhnXM74rcSq9NuDoYss5
         K0gXV5N2qg7XbITjy0EcXBRQI4j2p7QgN5T5BWVt2Jurct3srfJDQMevOBJhfYxF2/Nd
         ephH55QUB6VKiQDxslHa8WQWYDXpRkDklR0PXXUxyN92yhEhcnm5Ti9CBUd8C818W/S7
         BO3blhK7jvK9PEM+1+0z/kQQb1ISTJXYi2vl6iuAUVnHgVUcc8vhiprdiaY4ju8PhdZ1
         eo2A==
X-Forwarded-Encrypted: i=1; AJvYcCVJAohPxZTFdW75I+yPOTLpo6TLHqc4dpqqICVe4uSfiAWe7gIppMl6VSze8fLnPHvWTr9fI837KwLNBiOp2GBYnUZ+Sw7vglnxz+XBmLnu
X-Gm-Message-State: AOJu0YzMJ7oQpaAzqgqinshOV7gpbl86jvxR0ZLo9/l0X+N6I+ngTN/m
	a9EI5d1CknGimMX+Jfs4jEQipREWLKCFQ8tqBw0ghkaddwM41z/7cg7GzCMMww8=
X-Google-Smtp-Source: AGHT+IEa3xx8oArN/IoY7wAtC3j2te3RJOs0/oMI1dFP2uB60BXEpobDgtseQKJuD3PiJcXC8QDIAw==
X-Received: by 2002:a17:902:d2c5:b0:1e3:e0a5:4cab with SMTP id n5-20020a170902d2c500b001e3e0a54cabmr5221897plc.63.1712794137419;
        Wed, 10 Apr 2024 17:08:57 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:56 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v6 18/24] KVM: riscv: selftests: Add helper functions for extension checks
Date: Wed, 10 Apr 2024 17:07:46 -0700
Message-Id: <20240411000752.955910-19-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_010930_255498_E53E0E99 
X-CRM114-Status: GOOD (  12.78  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
index 0f9cabd99fd4..735b78569021 100644
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
