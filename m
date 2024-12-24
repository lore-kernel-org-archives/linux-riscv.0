Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDE0E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IwadVr4r86+6N+gM/sFAuFMfyVKH+5+xVeaholYTqL8=; b=0Fm9zEc/9ZCBE1
	/TUak6+6s9dAojWcN24Dzx8cqF9tineyBNhdlzJLNGfChlPWTzwzvxzhDE8QBxQTWYdlQfIXAw5MA
	0aSrbAh+rss8m06NOneuM8YCAEpnygAbAx5tfckVwt9Tabqn23VPAX9G7trXqLqMSTWjLdas5DZvu
	DYCWbet/zQZr+jo97pFy2EOaKjSH32LYj/dbM8ZjgXRLuqhGaKULMM17GOMgR25patKnh7nd+pul4
	FTUKUvt9TFi9RglzeCpnPohmOABHKwXMKleUngNRYGZK34aN89IhmCCw9G0fitNTQ3jEhUTsHegLq
	p6nfoS+dAftrbOloFI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5T-0000000CnW7-03Wd;
	Tue, 24 Dec 2024 21:05:07 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5O-0000000CnSo-01JE
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 21:05:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2161eb95317so59176545ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 13:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735074301; x=1735679101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlUmPcZY4TN/RdMqQ8PaLtNf3W/Wbsw1dLdhHB5EEeA=;
        b=KfFx8+6s7fI83WfpMit9MuGEgauR0YLvLZBKkK/EzFI79Ut7pYtYFr6aWo56QKOh2f
         lNQg9CM8tM4jJe332GeSuMJ84KXysf2Jv/rRU01ALw/6U4Zi4sM+3YfVXKrcBFc0ZKDD
         dD+JD0CKTY49VGdpPwncFhK3t/N+fRnTg//Pz+TwW+NxGOVhm5x+6bwaH0vtX4A9wPhK
         n/rl/63t/z8/H4eWEXrS7FmxoBGX6CjlXwDeTLtdh1IbLPqtyh6OgscGKWRMBsPjQ29U
         Pq0uXEh8N+LYaw1wtyDqYhhcjEXlcz2wfISdsM1bOnvsCYZ5tAlj2PBsK9BjFHuIobbY
         NeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735074301; x=1735679101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlUmPcZY4TN/RdMqQ8PaLtNf3W/Wbsw1dLdhHB5EEeA=;
        b=E/yyfKJGDDrRpohDmp/t6lwbWiSUiXZid4nh6KitadyeJqTjmdvHB6z0+A/v7CX6Ow
         mvqWtoluyW+ijBA4Re6Oh4MxaTJkpDJYCHuLLjUsSTyC2QSx2CzhSP05TUBzxgpIr3KA
         6JesHFJg3aYC4PYnWTt6YYwiPO6BLAFEO5Sk0YxNpEzWdP9Xbv5JW9aIZAneKDqvwR1D
         71Ud4VEykq3SqD30y6E/2a/CSLK+WATw0fxLwq10QfriNj5jGJzlVkFFkF1mVXY7/xJK
         LGg6xcDYC46RDqVgud/3gWyO1f/LIKvAzSgBZIlV6xShHAFGVSUzUe9OWzudHbcVKwqn
         aBfg==
X-Forwarded-Encrypted: i=1; AJvYcCXmGKMHB7NXGWMurkDRnF/BNOz3qZhB9fr5ebKDh3QlRIlvk4G3h9CtyYppL3bOVOSbEjWLgoEFAsb+5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFGHRwP3Ad3/56fWnd64UXCmBT4gPwHcge5xDvWERLzr23G8Np
	TqJ3eTyPmjnkCwMtEWWlhsXD177uG5IWhDr+W2go8VwbEOE+pEjGd1TbR+Lw0Cg=
X-Gm-Gg: ASbGncsFeZ2r9xC9HjfL02kK2YNzfDSW+Vlwqax+EHrNFrvpJayxByaWr0GdqDx69Pl
	4+rXvOQscF7jer/JMyOh+sNifJsL/8s+eBtnwyOrcCufCRDhCgdQwi0RaXv7gcAAPXFqRnBAtDN
	r/WRDoE2RascamyyQazQkGXwvaENhRIL8RDRLnhK0FapQaTrQZ7V+gdmGWQ8oVANbQLhL0MzI9V
	+OcAV5qf5gKdOjGUffzKKHTC0HR8FioWecsQaLYx+/vljkuxliXJGXp0LWL+0Fn7BDdFg==
X-Google-Smtp-Source: AGHT+IFkAvBUy0y2QznmiDw5xGryBuSrbox2rOO+r9dXtaG1Z1Twj1tRDQZutMEwjnEXldms1wIZJA==
X-Received: by 2002:a05:6a20:a121:b0:1db:ebf4:2cb8 with SMTP id adf61e73a8af0-1e5e081c839mr30524444637.38.1735074301156;
        Tue, 24 Dec 2024 13:05:01 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c344sm10445925b3a.186.2024.12.24.13.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 13:05:00 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 24 Dec 2024 13:04:55 -0800
Subject: [PATCH v2 3/3] RISC-V: KVM: Add new exit statstics for redirected
 traps
MIME-Version: 1.0
Message-Id: <20241224-kvm_guest_stat-v2-3-08a77ac36b02@rivosinc.com>
References: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
In-Reply-To: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_130502_057137_B2ABCE8E 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, kvm doesn't delegate the few traps such as misaligned
load/store, illegal instruction and load/store access faults because it
is not expected to occur in the guest very frequently. Thus, kvm gets a
chance to act upon it or collect statistics about it before redirecting
the traps to the guest.

Collect both guest and host visible statistics during the traps.
Enable them so that both guest and host can collect the stats about
them if required.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h | 5 +++++
 arch/riscv/kvm/vcpu.c             | 7 ++++++-
 arch/riscv/kvm/vcpu_exit.c        | 5 +++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 35eab6e0f4ae..cc33e35cd628 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -87,6 +87,11 @@ struct kvm_vcpu_stat {
 	u64 csr_exit_kernel;
 	u64 signal_exits;
 	u64 exits;
+	u64 instr_illegal_exits;
+	u64 load_misaligned_exits;
+	u64 store_misaligned_exits;
+	u64 load_access_exits;
+	u64 store_access_exits;
 };
 
 struct kvm_arch_memory_slot {
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e048dcc6e65e..60d684c76c58 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -34,7 +34,12 @@ const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	STATS_DESC_COUNTER(VCPU, csr_exit_user),
 	STATS_DESC_COUNTER(VCPU, csr_exit_kernel),
 	STATS_DESC_COUNTER(VCPU, signal_exits),
-	STATS_DESC_COUNTER(VCPU, exits)
+	STATS_DESC_COUNTER(VCPU, exits),
+	STATS_DESC_COUNTER(VCPU, instr_illegal_exits),
+	STATS_DESC_COUNTER(VCPU, load_misaligned_exits),
+	STATS_DESC_COUNTER(VCPU, store_misaligned_exits),
+	STATS_DESC_COUNTER(VCPU, load_access_exits),
+	STATS_DESC_COUNTER(VCPU, store_access_exits),
 };
 
 const struct kvm_stats_header kvm_vcpu_stats_header = {
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index acdcd619797e..6e0c18412795 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -195,22 +195,27 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	switch (trap->scause) {
 	case EXC_INST_ILLEGAL:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ILLEGAL_INSN);
+		vcpu->stat.instr_illegal_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_LOAD_MISALIGNED:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_LOAD);
+		vcpu->stat.load_misaligned_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_STORE_MISALIGNED:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_STORE);
+		vcpu->stat.store_misaligned_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_LOAD_ACCESS:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_LOAD);
+		vcpu->stat.load_access_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_STORE_ACCESS:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_STORE);
+		vcpu->stat.store_access_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_INST_ACCESS:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
