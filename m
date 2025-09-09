Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B099CAC587
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S688Wq0+9049Xn3hukaQQzH5nR/ItTowseLZ3CdBSf8=; b=unIMT3Qi95w4vR
	fOjunKCIrnHRt/5fYvhka517F8CzQC5a5W4X1ZVOx8+YB4TiAw+mDAWvv8vhidrRZhQhu+v8J2SNa
	MxDBzMDY81rDeelZ7f7bXBhpvpRnQDGVyUBa2boUVifGdX8Wf8MZ/9UJQBhBq4/K6B9YR9vvqElnZ
	lfohSMFw2vzl2Yf12RVVOoN3JfIIpywjtaVFW4dn4As33V3iRBKsAKRp70L7nRV6+DXi9rorw6K5o
	9aaW46qHZlCqO9os6LmgIZV4EAk+1keliqnMG/gihlGrrhqPyJTlV+/xqGpoSYKMRN6JaDn2gsUDX
	cOqsw2Yxw2is6PBrAB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuJ6-00000005nnl-23mx;
	Tue, 09 Sep 2025 09:06:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO2-000000051l6-41Gk
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32b92d75eaeso3561339a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401410; x=1758006210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53RW3r37vVd/uOGEJeJ40vwWJphKZpVppDFV/CpDLs4=;
        b=HDfWDUFrNilJc5GwpfNjwrpmCIsOqsmEDJvRdOvypGgeRG3uWyFgPMtWXnjt3uTSOv
         R8cN+sYmk6t2Q6MWZw3jkv41YArhhmU2ly/gbTu/Ne3QezYAy2nIdYs71jiw6fZFqhHV
         ooWC1Nry5dnZ1k+6M43kRA5KYSWKd3rhYCWbBwwDdrGfzfiF8uqgce7zjuF+YREej+ah
         /+a52a6sHdxDF3ta+D5Q9JZMoze8rZ+pMSnROzcVsN/M6+wvt0Z24qeK8f8iktnP9Prf
         TDTC8mj3ffc4WOpryfyYyaprNJsAN2aEal1TAa/dpxWjX2Yc9doIEhPsPwXmSI1cIAjd
         3WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401410; x=1758006210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53RW3r37vVd/uOGEJeJ40vwWJphKZpVppDFV/CpDLs4=;
        b=dWpLdJX/9E+iJuseo1Tv8NS8Sd8SYLclBta13+2GUZMUTPqTq8P+B7XUTuS57G2KRd
         t2PdlUlH9h92duvAjB3rsvpveb03PGgH9lmC1RLq2CUzF7kHVBRk+/VDq6Hpf8M6J3wl
         21kSWVUk3bPMWFmIn+j1IQt/wEtEuO2aeExeQfiiKfPYQWOo4vUNesYp7bM+2guOK/8+
         j1+c0J3E/Yzd2ZTLetAwF08A54I/h9gqtywa1Jb/WTeeIV+gbkbUS2qRZQpuwee6vcfG
         tOKpG4gjqcyYOP7V/8jzIb3UXYZHdxgNgbU/jiFR076rJwuiQXAQwPOLsR3mmUKuUXLb
         qb+A==
X-Gm-Message-State: AOJu0YxE7BDr6mlmfJiPnXzIKZ/F9VAgiNbCkJTCp92ncVsbHHBeJE+c
	LR1zeqgh+AOj2fkgi+G7GBfQAw67vOW9zkKd8yVDLB3PTGF8PVFQhyiCoQNL4mYdjzs=
X-Gm-Gg: ASbGnct7xbphbW0+eCDKaUJI6/d3DT35e84UxYOLbcTiRxR2o2VSmCjiUpKvTi+BzNz
	lFqdRksDSsN6efNlcwWNgxRuBYC47nwphC9kaI5f1nJNI4n0tJtH3p/KqEE46HNAszkeJTvq7F7
	Ss+L7xbL9FUY3tUmaIS6VaXzfUaPs6n8hlo7S92CzW1Lr9ccr6ftRmAnHvPVLxrbUvdsrJ2Bs5p
	4onOy1SkSYZ61K43ycNfPs1pwdXBBXw/ykPS5wOldtKZtjkTTssDeFNyJrdpEYhPQ7PKBLJJtZL
	1PGalHYGv6EdQ3vdC9nNDReymHykIob5PEazwOYD6IQQXWGZc6+fJNzFmO5f4IiLwYY/jEg8sYr
	x0iXypI6GjUF58JoDmNSX8BjhvWi/eZErurbmRaYu4nvgcQ==
X-Google-Smtp-Source: AGHT+IEp7M2YTd5oqLJWntqYzx+W66KU/8IVhi9uG5EgartrnOvK3S6t6vrkn2Q3yP3sdZUpu5Y3+A==
X-Received: by 2002:a17:90b:48c9:b0:32b:96f2:e2c9 with SMTP id 98e67ed59e1d1-32bbe104088mr17623995a91.12.1757401410327;
        Tue, 09 Sep 2025 00:03:30 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:29 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:25 -0700
Subject: [PATCH v6 6/8] RISC-V: KVM: No need of explicit writable slot
 check
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-6-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
 Sean Christopherson <seanjc@google.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000331_012348_99940936 
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

There is not much value in checking if a memslot is writable explicitly
before a write as it may change underneath after the check. Rather, return
invalid address error when write_guest fails as it checks if the slot
is writable anyways.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 11 ++---------
 arch/riscv/kvm/vcpu_sbi_sta.c |  9 ++-------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 15d71a7b75ba..f8514086bd6b 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -409,8 +409,6 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
 	int sbiret = 0;
 	gpa_t saddr;
-	unsigned long hva;
-	bool writable;
 
 	if (!kvpmu || flags) {
 		sbiret = SBI_ERR_INVALID_PARAM;
@@ -432,19 +430,14 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		goto out;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable) {
-		sbiret = SBI_ERR_INVALID_ADDRESS;
-		goto out;
-	}
-
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
 	if (!kvpmu->sdata)
 		return -ENOMEM;
 
+	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
 		kfree(kvpmu->sdata);
-		sbiret = SBI_ERR_FAILURE;
+		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
 
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index cc6cb7c8f0e4..caaa28460ca4 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -85,8 +85,6 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 	unsigned long shmem_phys_hi = cp->a1;
 	u32 flags = cp->a2;
 	struct sbi_sta_struct zero_sta = {0};
-	unsigned long hva;
-	bool writable;
 	gpa_t shmem;
 	int ret;
 
@@ -111,13 +109,10 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 			return SBI_ERR_INVALID_ADDRESS;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable)
-		return SBI_ERR_INVALID_ADDRESS;
-
+	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
 	if (ret)
-		return SBI_ERR_FAILURE;
+		return SBI_ERR_INVALID_ADDRESS;
 
 	vcpu->arch.sta.shmem = shmem;
 	vcpu->arch.sta.last_steal = current->sched_info.run_delay;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
