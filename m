Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF91C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TODCmb1aJAVNhLvfoqAtXu9eHMRFC4RLhml3Z59tlko=; b=amU0UFGX4+6oAM
	tlfTTwMK9yc8CTEnfpnvdOavMDMV8Ret635Mo7sWR/W5ZNvD08YPrWzwjU3EYR7tnMIqUepwdCYPR
	zScFJbHWM3YHdYh/20KpDwkBpkkddxyoYENzLv/fWASvSxASEbNyM5joEE/d++KpdCMEA9nbwvOgD
	PZeDRcbjbiZVVwoyjZngsFl2ymnMJhaMKoQRo7HiBkhLXYl35imnYN/tSJiSkV+7N+zB5ret0MiJ2
	54VeIy0U6/elS25YrvwzXTI0roiPiwZvUB43gpR4yee69TEOPW5DGBLu3o5Y++igHs3+Teoq28KrG
	7qbgczQi796wgGWUsCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBQu-000000020Ev-49cG;
	Thu, 22 May 2025 19:18:24 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCp-00000001wRR-2m9W
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23035b3edf1so69334885ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940631; x=1748545431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=;
        b=wfiLjGnv7axN+6eoujhMPT+XM84q4ugt20Cr0pewl6dq9M+tcGSzMaiCL6u6+Xi3M3
         mvMWZlcRJnvA+XXSkg5wnvZhK6HzT27XzOSeDHrMbmDmf9qbkCKdawXTxCVc1mUM7Xk4
         4uSXPzWjMYO1vXqyTfjBGlo4e6QovcmnTyp8nCDTGj5TuHeEAqmuy0+HCtNg4R3tfo+Z
         ldbU65oh9vfTFa4GRGMUvMGMThYV0btNRH28bUrbI8lBon2qef9wSUy6a928LUJtokJo
         q7AvvC0/OKjyx7x5mTkNhwVCjxpwHxNFMJbeVoQe3W6T99V+T49X5vfcphfA7pWLKl8m
         hr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940631; x=1748545431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=;
        b=cY3fMc5cjgKt0GCJXhiVWoE2jNrmvLLeWG2IFoqTbpxjzS4jxR9VcszfUTjWg+b0JI
         bCRhHdInllQ8QLNSoFUvfYJEkZFak3pSr7gO/ir61lvnhs+y3XRjgQpGKBEe71JYdI0+
         Lnx25cxKf+GmAZxUPmaIXPLYOq3JImIwf/IYcbtxH6l54wSeYqymhnFmOjQgo3Pur+S+
         e75kyPioeGpSoXx4kRd/70QBCb9ndJFp951i225+ryGgaI7nPlL80/Oai5BBAMI6ixFd
         ZUykAqctqhUBlmwgz5bubCmY+Lp4tHxE8XEBQTgxeesZC5bEuTgL+aElWKDZS/J23ObN
         JzOQ==
X-Gm-Message-State: AOJu0Yy8bFp8rqeXwyRlW4A1fly1iNFY6TCFAcIy4KF9mxPcu2pge/nK
	dFPJLkqhQQK0rndmnPjcnXToWGtGeUHjQ4Lf4Ip5K+UQrec5VEEixpiI+g8t3EY4ZAs=
X-Gm-Gg: ASbGncvClBqFNxpSuK0JXNENX6RmjjR5IQZO5mJYSt3eDg9Z9avstEo4yPXsGUFCm+K
	rKURgcfq1n8AAVcgQchVkNZ73LOS4FBKmfscM4O250OrjF4NzNHZRsTbMq+Ypq2QcosF5Ul678n
	91Guoemvss3VYhcRPld8chLaP/4LKvfDYkUwz18NFrvy8yENN7HSM7Cg1LHrUtHkehaqdZIQMTC
	J9IcQ/Cnof8PdnFGblapQ4PJUWsu4T8njG4rTN2oxDQRKdSXOTG652gHPez9ezZWnLyMyHR8wjQ
	R4/oOYHSfoznavnHsQnSAIcgriEMUTwrHJ2YRifgTFg3X5R04UiMWUCq8WOqoQ2A
X-Google-Smtp-Source: AGHT+IEr79nTwwFBEJoxFRK5RNwqD1jq2SDcjYk7D0rQW6WwVVGL0IpJIiwt2oBQtuzcW3AhD+odEw==
X-Received: by 2002:a17:903:94f:b0:22c:3609:97ed with SMTP id d9443c01a7336-231d43d9bccmr330946415ad.30.1747940631058;
        Thu, 22 May 2025 12:03:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:40 -0700
Subject: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa
 range
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120351_790018_4FA8F922 
X-CRM114-Status: GOOD (  12.47  )
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

The arch specific code may need to validate a gpa range if it is a shared
memory between the host and the guest. Currently, there are few places
where it is used in RISC-V implementation. Given the nature of the function
it may be used for other architectures. Hence, a common helper function
is added.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291d49b9bf05..adda61cc4072 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1383,6 +1383,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e85b33a92624..3f52f5571fa6 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3301,6 +3301,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
 
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access)
+{
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	int seg;
+	int offset = offset_in_page(gpa);
+	bool writable = false;
+	unsigned long hva;
+
+	while ((seg = next_segment(len, offset)) != 0) {
+		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, gfn, &writable);
+		if (kvm_is_error_hva(hva) || (writable ^ write_access))
+			return -EPERM;
+		offset = 0;
+		len -= seg;
+		++gfn;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_vcpu_validate_gpa_range);
+
 static int __kvm_gfn_to_hva_cache_init(struct kvm_memslots *slots,
 				       struct gfn_to_hva_cache *ghc,
 				       gpa_t gpa, unsigned long len)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
