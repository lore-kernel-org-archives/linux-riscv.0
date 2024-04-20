Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C5DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnhQYmCpW1hFiO8/R6tkQfwt8sTXbOAUpMVf76kwHkQ=; b=rf5Z1kBPGluoMQ
	+vSLenbdns9mHCuxwAdRNtsLdS5VnFHZK4eeXAqtlBnAKYjMA891pfqOmeENwOw26NwWX24dNMQYH
	5OpvZQ3z+iLjZBTiDigH+cOHnvDdxsfVOoT7LI5rcV7AuU7V0+/ban9kams4dJglhfM0DNmxJoxLY
	mvgH9mdEzMV0onu84RjdHxHSIZxXluVL60zdcRxKyT8fB0XEwgr8ViLqt+PcnJbdwf1oQNBP8hkcq
	6yrPzsJYgzPgCAlnG0SsHmvWt9UgLpaSl+wcDij1nPoouR+rqZO6X6goo6xwC9QavOjhUXY5fXep2
	WR9zD9aY3c8qvyxa7mHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxys-00000007Jq1-2Yth;
	Fri, 19 Apr 2024 23:49:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxq-00000007IxG-177q
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso20508805ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570497; x=1714175297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBWeKaYtpXhvKjSg+whNN/rWnhjngNSIx7A/W77I8WQ=;
        b=T1uKwEGPTMcVzEsn67zoq7UgvBFAWZxrifOc1LznmZyxYGVzW8UO1DZUgitkpSNDR4
         OBhRjW+MGg/XQ9jrcpzTdvCm9PGNbcQCLfwJs9/xN9wmNamzT+q3BJb8kwO7W1hS8hAm
         J7to7aJydYcY9Jd5qWZjVdMvdAKzkWYCe6vPHBoE3XbsHOL6rFtT7WIx3OZJMVvm0ckK
         P+woBoc5AXTL682A4OnPg2+Ngpt0LoRfjISlw0b5WI2A2rKaYhU+N6INYWRbwG3nMLQJ
         +oZ5A9hdPDVUlvg33RnWAKs3gotkw/8zIyg/ZSqguGJ1M52NdoAPoi7rjXVtV1AaeAEa
         pgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570497; x=1714175297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBWeKaYtpXhvKjSg+whNN/rWnhjngNSIx7A/W77I8WQ=;
        b=JKN7cSJsi29D4ePAP9BiJUM0I5AErtU44129+ozaoi4htAuCssvsqwAcSHxgKxRPfh
         cE3AOd9d+6iBCdX2GlGcRW4HjJR01fi7/XlEZd7sfWV60Ab+bXUbGe7z/v9VNQmRWcAn
         8X1U7WjHsNnEIXNAYitFC3N1rVwJe2L85swvyHHKpiFpWPvEBGOkkD+eqcrK40pUQq1j
         JE8Q0BFNgTKalRKJWr3hTfgr7WlCXhCHRnHO4cHMGFeKU+waG6NonszXrhDgLJMxhnFy
         nWUWqXn9idWDbHLOrc2v31zLheINsV8+pwDTyq+MZHaRtANks3addKrc/6otk2AYrXSO
         vROg==
X-Forwarded-Encrypted: i=1; AJvYcCXFL/N/JPicQFhzDtRAf/OJ7+3VlPRTfxG05OLRgnioO9H528oxXtnoH5QmPiwHqkk6USLEZVqW1j6HD5AaEurUtNK7W4h7+WfAf2MGx2xf
X-Gm-Message-State: AOJu0YzB4f2V9xWnqrkiPb4i87dS+KOGXmN/WgbmmhED6XX5IiqPC5mV
	qU2f0rfUANIMxaHXPa/JXp8pFfYBH3V1g2O62qvdTHMV/RdE8jfldL9RaxIRhu0=
X-Google-Smtp-Source: AGHT+IE2mHqGqaemrrX/cDzhjt11McUd9BYci2ip5fvQwZrUnUGPNDdVb8jlSh60g/yN+PhfEpHNag==
X-Received: by 2002:a17:902:da89:b0:1e4:2d13:cf68 with SMTP id j9-20020a170902da8900b001e42d13cf68mr5056407plx.17.1713570497604;
        Fri, 19 Apr 2024 16:48:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	samuel.holland@sifive.com,
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
Subject: [PATCH v8 18/24] KVM: riscv: selftests: Add helper functions for extension checks
Date: Sat, 20 Apr 2024 08:17:34 -0700
Message-Id: <20240420151741.962500-19-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164818_498659_798FC11A 
X-CRM114-Status: GOOD (  12.56  )
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
