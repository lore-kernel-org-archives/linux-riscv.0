Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A21C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvbxxmkUW7ORm/WMUoNPUopyazfa4pjPPrBocH8VN/U=; b=cQSwqeWe2thDQj
	Sti/a/Z0bTHTU73NCY0PUiWxGukPOX5u6FfYKVEj0yoqzfXoI3Hf6xf66laXyQwnnFgUiJTl7BmnM
	C435KW5NAa7Zezf4LQg+8Rw+0StyqhFKPP8h8WK4nJJ/W+o19brl4+vseurP96itE7hTACen3xFwq
	+G5hBu21cH67pYBNu68oxsmS9gEXZBlQmipNunCW/7bMwM8mxs1J0rGWWI8mx8BSNEgPZQ3ofQaDZ
	793tt5yO4mNYkwKj8M2q0hpzKPinq/cSzBSKuuUuRioSNxcE8890er6+bvRktnXvkZK9NMyD/Tpj5
	TdN8hwRGs7FkGX1y5pSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8JC-0000000CnIt-0ree;
	Wed, 15 Jan 2025 18:40:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AS-0000000ClGC-0Dlv
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21669fd5c7cso131362775ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965863; x=1737570663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPQonIfRWz8q533cgyWsgSdgY3t/tGTd1rJqUG9L59Y=;
        b=Fsm/ZpOAS5KuspMftZT5V0A9ai3TZIsKl6kjutZ3y3JLZEilW+kAGCUWojzXvbr3It
         6KsGdSfWUJmTHfqm/yQi8Dn/GtzKOg0j6B4NNWmLCrDTp0b6j+OZrmw20Hhvqj0VLvUh
         0SflRrZTgQNb1JYngWYKhXMf9VVdZ+OLzDHLyUrYKv3hsaMw48iLFhuKpiQG68eat/Wd
         KLARQZyxgTD/ZXSBkKmScihH4kHD8cmka/DHa0B8ohl6WvBidfcFZL+eI4kB2gK0LyLk
         bW8LHq8BwONK0gW96OxKj6lEbgOuvlufpseS2Rchq9vWFpfTvhlGohX8nWTEKUidPmNg
         Briw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965863; x=1737570663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPQonIfRWz8q533cgyWsgSdgY3t/tGTd1rJqUG9L59Y=;
        b=ubaaG1oXCNV1FAzRs4DoYy635Wbs6nJM0urERFu87lgSSsqzejHk10b+AY/zZgNkB0
         JsGLRCrNSklyDzHPqSbo5YkNRB87Mm2mSfpqsygOfSPuhgela+d8EYsz20U4hs8aTyC9
         yMSi/sz7DiyJ+F8pVWFa7snkqOKjgDy8EtGRywISbHtms2LmqjBOu39tqqdg7DGbX0iT
         TpESVPPwCaHpab4dGUpBmOUz438tf18MC3Mhack8qp9GqaHwdJ9/zhSNRGPnpMa6NPmh
         qFp13MoKR02TB3Gmw2la1rUCn0WuSDWAQL+kIsl8zc/qbaAAIsHUbrs/xw5F+IsCfOfQ
         HLEw==
X-Gm-Message-State: AOJu0YzM/+cu07nxgvMAZpp80+JShLZTUMmul96orCFZBL+wxsjcBUPf
	hf1cUbhEL0XS6gWZXs5S1KaBpzeX4wOA72fk/yW5xSu4lZmnokhyl1yb7uOWsAc=
X-Gm-Gg: ASbGncvFDMiQCIwg4W/Mo57djG0O2NPpvEcIdvMeF97wn2NiW9JwS940y44pn/bXSLt
	o4gP2OWzIzlwtvhHj+fwZ0PLR0nZ+mxYRBgRwNR3Age8LSWEuQ1WIHlaG8fkhMfT18v+PI8jWRn
	2D7+LX58eOLGPqPNRHQd5J8PhxahL1inM4Ucf7C1QXNLAsjrqaZeoVYN3rWlh4MMbPli7QsO6N5
	ARXo0GppNUagVVqWaep8tWfozCmxKEhoUkJuzlb31hyO1EMPunjpL5rXjvQ4gRkV7qRoQ==
X-Google-Smtp-Source: AGHT+IHrlKrKdeucl7zMxkF/5l3NHVR4wNF51oJC9P55Fo2f9FtCoIn3BV0XWsDAU93AJPqz/FttjQ==
X-Received: by 2002:a17:902:ebc4:b0:21b:d105:26b9 with SMTP id d9443c01a7336-21bd10529e9mr125689755ad.16.1736965863474;
        Wed, 15 Jan 2025 10:31:03 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:03 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:47 -0800
Subject: [PATCH v2 7/9] RISC-V: KVM: Use the new gpa range validate helper
 function
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-7-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103104_123214_EE778D11 
X-CRM114-Status: GOOD (  11.63  )
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

Remove the duplicate code and use the new helper function to validate
the shared memory gpa address.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 5 +----
 arch/riscv/kvm/vcpu_sbi_sta.c | 6 ++----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index efd66835c2b8..ca23427edfaa 100644
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
@@ -432,8 +430,7 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		goto out;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable) {
+	if (kvm_vcpu_validate_gpa_range(vcpu, saddr, PAGE_SIZE, true)) {
 		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 5f35427114c1..67dfb613df6a 100644
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
 
@@ -111,8 +109,8 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 			return SBI_ERR_INVALID_ADDRESS;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable)
+	/* The spec requires the shmem to be 64-byte aligned. */
+	if (kvm_vcpu_validate_gpa_range(vcpu, shmem, 64, true))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
