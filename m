Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D048C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeIh27JZGNzAEdL49duZ0LdbHS+Th+7LVg+92kk1D84=; b=YvJcSUD2sqmiv0
	3e7eN/uO8YRvp1k3+74YVZiLLQjZmiQBPAxC586vMy+GRFIJNPvD6oW9HgaveLXCZFbBRPUboJ+lg
	wX5C9DvZyUM0QCo/ccTehEpIUmJaCTA2awBO6fhsog5XbqlHWZcfqATwud+kZEGnhtKT/PFuqDkwM
	xSs85nVuFIKuSPQotjhscAxFlOdA9+WeSz/tOylPHRGxEI6HuGS0YpHeXNYi5g7Jmc06L+7/gmlKk
	4fvL7otLgbpBhH0oP628tNEkoP/MX4+sfAJdc5JY3EjYjL+8Jy40s9h7wl5ZZ23j2haRwz3AclXVv
	OUHoLeyYOBTArPMy3rng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxzo-00000007Kdy-3HX1;
	Fri, 19 Apr 2024 23:50:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxzj-00000007KZl-3Dd2
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Apr 2024 23:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=; b=DZgWnzl97sXjO9dVMAcnFDQdp2
	in3S2Q6bU6JI7x9Y1043vHjBofzOSkOrUwCyyUv5o7Fc+pVJQjjUTuZWIkAbIV2avZER+UvTUHHRR
	EhzB3hY/LdOBNzts0bn2ildFxrhI3nl+ycERdbNF11EJj5nsDZ+vYiVH69+flrQMoRhrwOkvVBPK0
	cYR/ouGaWjPM8DYBwgc4TSpvO8bIeDSjaxXwG+dGUsMx9tstF7J4nBYoZBlOOTUIVRNBaUvxF8Ns9
	BmduUf/6vQe86J/dqKM5+B/RZzicXfphM2uz1zIsrSde0wiLKnRkCG0ri0h8ltNm/L6uLgITc+syS
	PaKbf6Lw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxzg-00000008nWy-3Fms
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:50:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so18678605ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570487; x=1714175287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=;
        b=RY/XOubieuDd3KPmiRdw+1ub3pxTvPeaMwcTSs2vXDkCtNpadURAXCdAo28ljGOBfj
         TjjP/5c0BfWXJT1b8SHwsm8Dv4enO6IBPXBbg2EEqYsuSGDrnPlGPLJ68udZJN1T08+1
         2Wpynl5Rv9getyHYP7gt+VNjHVfYNYuR0BI/yihrDfzQsUK0bdF5qx3Qr5klULTfNNFU
         5X6YViXp4TIjHHGBAypnzJ/xbol8sIaIhjMzYyVyR72aI3rWtRItU4gptZI98c/Cd4HF
         rzhJBjTkbNOS1e8oL7hFQCrSjjB1eaXT5Mbvbm+oWjWmQV8mj6e/lzC5f91cjR1KvoEq
         OkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570487; x=1714175287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=;
        b=v9rD9+Z3vDcTHIRStHMAwRsqS0fyFIUePcV4VHw7yMNDOQd/ZBhUNubqf5CTCspBaa
         itAgIPMU22IxPX7a+vvgYCqWpoE0uNliBdLlPT9P6zlczWbNKVfgV3ZNMfMTRKO/mZHA
         PBIez2FIjytGKujztMKe/kVrUQeE+d6MWsywMgkr3b6i/wSS21n0JCI8L2sw5FJlJzpJ
         1ddqF3OxHpYMH3bcNr9K7EeCkz3qzSZgUgziO+L5jgJeCI0V6JIasmmjTGPnDMBHhlFO
         IAdG8Ddaa4RSKJX1MOzF+z+xlXib8O8DJcgfHq7UMRexpAKEuCUVc+dq2iPgomZCMZL5
         1OKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDbRa4kUN+xaIMSuZkT9xpfApBflWfmkFlyqdIrtZfvhG3BixRrNEjflp4XNVOKilUCnQe6NiFCieRtY0VjskVpjXbobgXprEdrJYOlNL8
X-Gm-Message-State: AOJu0Yywu49xAk6HOcZKJlZcOn0BLre39XIEP+vXgilVDNItViKUxs/A
	eu5d601IencqePECqJj4bAmWcVek0fltFnO7+DNyiDNDD3KjaG7A7u2uhHBLCn8=
X-Google-Smtp-Source: AGHT+IHqmOgwdzykdLgMc2WJ6EaM228nMawdh3bGDIhVF9FxVvuRHHcpcsw9cNr0lYOB2vXlkqEb3Q==
X-Received: by 2002:a17:902:d481:b0:1e7:d3e3:a927 with SMTP id c1-20020a170902d48100b001e7d3e3a927mr5602995plg.31.1713570486735;
        Fri, 19 Apr 2024 16:48:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:06 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
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
Subject: [PATCH v8 12/24] RISC-V: KVM: No need to exit to the user space if perf event failed
Date: Sat, 20 Apr 2024 08:17:28 -0700
Message-Id: <20240420151741.962500-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_005012_842569_33CCEB5E 
X-CRM114-Status: GOOD (  16.40  )
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

Currently, we return a linux error code if creating a perf event failed
in kvm. That shouldn't be necessary as guest can continue to operate
without perf profiling or profiling with firmware counters.

Return appropriate SBI error code to indicate that PMU configuration
failed. An error message in kvm already describes the reason for failure.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 14 +++++++++-----
 arch/riscv/kvm/vcpu_sbi_pmu.c |  6 +++---
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index b5159ce4592d..2d9929bbc2c8 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -229,8 +229,9 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
 	return 0;
 }
 
-static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
-				     unsigned long flags, unsigned long eidx, unsigned long evtdata)
+static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
+				      unsigned long flags, unsigned long eidx,
+				      unsigned long evtdata)
 {
 	struct perf_event *event;
 
@@ -454,7 +455,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long eidx, u64 evtdata,
 				     struct kvm_vcpu_sbi_return *retdata)
 {
-	int ctr_idx, ret, sbiret = 0;
+	int ctr_idx, sbiret = 0;
+	long ret;
 	bool is_fevent;
 	unsigned long event_code;
 	u32 etype = kvm_pmu_get_perf_event_type(eidx);
@@ -513,8 +515,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 			kvpmu->fw_event[event_code].started = true;
 	} else {
 		ret = kvm_pmu_create_perf_event(pmc, &attr, flags, eidx, evtdata);
-		if (ret)
-			return ret;
+		if (ret) {
+			sbiret = SBI_ERR_NOT_SUPPORTED;
+			goto out;
+		}
 	}
 
 	set_bit(ctr_idx, kvpmu->pmc_in_use);
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index 7eca72df2cbd..e1633606c98b 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #endif
 		/*
 		 * This can fail if perf core framework fails to create an event.
-		 * Forward the error to userspace because it's an error which
-		 * happened within the host kernel. The other option would be
-		 * to convert to an SBI error and forward to the guest.
+		 * No need to forward the error to userspace and exit the guest.
+		 * The operation can continue without profiling. Forward the
+		 * appropriate SBI error to the guest.
 		 */
 		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
 						       cp->a2, cp->a3, temp, retdata);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
