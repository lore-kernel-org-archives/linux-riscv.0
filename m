Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4397FC83F22
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2AZg09tjQhdLaWDuRTEqufg0cjr9E/9XHZPbyNgkz8g=; b=nEnxgnenc6uj8b
	I6pxaA/gFb4T1MpN0vx3vCsB6jLRJpSmqi5Ox+7s+3DKKeYOqmXj+900ZVV1ybEzVQKwcmiFP2mz4
	D3CO/ugAVe4shUSwoDYq6M/fQLpYClNE75I4huoujoWpSe59f+z8e9AwlLurPunU/vtDbX16Jnrg/
	wYv7X9GTm7IBoIkFeXBIlr6nlFdnICdLxiSUaWRdlmlU2JCxOV3uWXKXns6xgDDwksux/h55dLu9R
	Z7tmcgHUbVCFYuJ9K3SJzLx0vk3jveXwxeUyy2C+4xckliZtTg6lI+MX1W2bYbLJwc+n149b9Tl7f
	E79Q09bf0Djm14WlUQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZscD-0000000CB1Y-1sXR;
	Thu, 10 Jul 2025 14:51:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrMM-0000000Bw4L-2Mx7
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 13:30:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-74b54cead6cso706979b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752154243; x=1752759043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSBRru92EdCdQV6HwNa+ZCQ/jNa0Vw05HCx0FcTUBpY=;
        b=BIYYNSuACOFNhq1xvUpzv9fIfeehvHyWXiRDXAFVsxba/mALlF1BZncsMmEBcvXQWw
         pzLAJFlqVuaja0J3yJ/9UOZURivACGJHlFmxGs4YRLIJfQF8KaRkap4Rms/bXr/eNqP8
         LG4hE2ge6DyKgzLAlYVXfWIBcnnStcAYO04IiKjFUYaaNegX55r6+PlLSonrXBoTmJsI
         LY67WUtYAKGel2d1Q6s+MZ5sy/13sanfWadILfdc7DWJmugBniRKeNzIoIII37Sgu4zZ
         HhKnpsuFHIe2ZcbrRTV4BM3SJ+zssX1/04rBY4/sb6YI7m9rIIBtzi9uP8g6yWGBhs+n
         WdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154243; x=1752759043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSBRru92EdCdQV6HwNa+ZCQ/jNa0Vw05HCx0FcTUBpY=;
        b=BCb2BblJ91A3krYuB/HjWp0hNikOSrcCoJ9NMeqrW0h5ERtOaHgee/iAE4GdFf4hUz
         Ky85tTqQA0hVJ+LEUXZc68CRMG6B9lA1bew9tEiRZ21EsCE8BGwe+e4+6VQ0HK7P/FxB
         R9MjErcLwkx0VoPf5UadO29uPNeySF4ahtjD2RAAcpQCZSZFCEgo1HK1ag2Nx6e7yJkg
         Qv7hmR+owetlW1ZVrUo6pxFtwwnP/+ol6MqEtpZOhaNJRlBuKst5ODnr/AY81JWmAy/E
         xTkfkWyz4slx3jvMI9+xY5aAvKMIA+4NmXvzlztQbPVtm1++e1EH1dcEhkgl9Wltdej8
         s07Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvjJ1oPzWW1MC6RuAMKstWtj4Vb4Br6VoJI4uYZMiaoSD+WDC26fxQydDLpHAVlCRI5JgXyjMdfY44+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwncLL0rlSK+ARUilj4J7OMvf3ZEFlxGEKdnwoYcNLD3WD7qq3b
	9WONzD+ACqaqtnrdOVTACMoWn6kMsO8+4qZvWL15kTK7a4ATmuLmsEfFTfVRp7PfgBc=
X-Gm-Gg: ASbGncu0Vszz/MdXaXDbqDCIBNIc27q3Zf0DLxhM49VnWANeiP8Amb3RrZw/6aSOcfa
	oa/EC02v/J2zLgW2XjRTg7uV19gyhGTRPbpSiw4uLSUQORK2etRMKDX7hhvPdNG1JoOKDqU4nmc
	GhvwzCqD7sTy7zS4bf0zLBLeZjNQQ4gm9yuQ3n5wUzGllAG9t/zBUf50pSkiLp0frtUkVyBhIog
	96E0ms9/DEpCkmDQv6AYzcPu3tbURZkeCd+XFLQfnFH+QEkO8/DcUMxx/dnCvj2U+Lt8VcyJAcb
	roZDU/7T9vSym+blgtiZu8UbzcqymUCbuj4n32h0U3iw1dHMCmMK+kmNVJqOLAdJpl9kv7eb0xP
	iDBU/ZeJiU1RIVuBhZK3wg/FQ8RJbOX7cRCposB6zZ5v0oEDEKQ==
X-Google-Smtp-Source: AGHT+IHzdljx762BgYLfxVy1uhiO6LuhOaahxzDQYVaWG7z0trKJ290Cb4AzI3z+szgHVgerISzuBA==
X-Received: by 2002:a05:6a00:4f8e:b0:749:b9c:1ea7 with SMTP id d2e1a72fcca58-74eb55f4f43mr4292361b3a.17.1752154242363;
        Thu, 10 Jul 2025 06:30:42 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4c9c4sm2334373b3a.126.2025.07.10.06.30.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Jul 2025 06:30:41 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: rkrcmar@ventanamicro.com,
	cleger@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2] RISC-V: KVM: Delegate kvm unhandled faults to VS mode
Date: Thu, 10 Jul 2025 21:30:30 +0800
Message-Id: <20250710133030.88940-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_063046_640516_BDD4F626 
X-CRM114-Status: UNSURE (   9.75  )
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

Delegate faults which are not handled by kvm to VS mode to avoid
unnecessary traps to HS mode. These faults include illegal instruction
fault, instruction access fault, load access fault and store access
fault.

The delegation of illegal instruction fault is particularly important
to guest applications that use vector instructions frequently. In such
cases, an illegal instruction fault will be raised when guest user thread
uses vector instruction the first time and then guest kernel will enable
user thread to execute following vector instructions.

The fw pmu event counters remain undeleted so that guest can still get
these events via sbi call. Guest will only see zero count on these
events and know 'firmware' has delegated these faults.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h |  4 ++++
 arch/riscv/kvm/vcpu_exit.c        | 18 ------------------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..e04851cf0115c 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -44,7 +44,11 @@
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
+					 BIT(EXC_INST_ACCESS)     | \
+					 BIT(EXC_INST_ILLEGAL)    | \
 					 BIT(EXC_BREAKPOINT)      | \
+					 BIT(EXC_LOAD_ACCESS)     | \
+					 BIT(EXC_STORE_ACCESS)    | \
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
 					 BIT(EXC_LOAD_PAGE_FAULT) | \
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c184127956..6e2302c65e193 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -193,11 +193,6 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
-	case EXC_INST_ILLEGAL:
-		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ILLEGAL_INSN);
-		vcpu->stat.instr_illegal_exits++;
-		ret = vcpu_redirect(vcpu, trap);
-		break;
 	case EXC_LOAD_MISALIGNED:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_LOAD);
 		vcpu->stat.load_misaligned_exits++;
@@ -208,19 +203,6 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		vcpu->stat.store_misaligned_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
-	case EXC_LOAD_ACCESS:
-		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_LOAD);
-		vcpu->stat.load_access_exits++;
-		ret = vcpu_redirect(vcpu, trap);
-		break;
-	case EXC_STORE_ACCESS:
-		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_STORE);
-		vcpu->stat.store_access_exits++;
-		ret = vcpu_redirect(vcpu, trap);
-		break;
-	case EXC_INST_ACCESS:
-		ret = vcpu_redirect(vcpu, trap);
-		break;
 	case EXC_VIRTUAL_INST_FAULT:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
