Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9FEC54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wTZK4nNPt0zcPsWWggPDlkGBDSv1b/gNDZzPTUmv6A=; b=f4X2+1vnAvn9QB
	PaMRQEBbfM2UtHQDlYPMdmclM6lRFnB4a/C9MHoQj1+48Yj5FCTcgiOA27g1jzsomUKLR/1EAhpqZ
	vgTQn0JfAYQEbjEcctecPI0L/DrcQan9g8ozWRbtxT1p+O/NBUAt6vNKJOdQFR4HGh6TildWYhsSb
	JGpyniU0oFJoSuo50yRoGn1aOgR0z+gsCe8DQVMMTS9DPGT71hLU3HAfjJwccobWfbU5NbTdCLRJt
	vgMS+3HS8Qv7+/o8dQ/QouQJ6pebCBqNLUxJrHVTW3nFMMoVrioOiy6ZJrsphNg14jn0Is+kEUMu9
	XZA6IJ3htnTpQBDrTCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nM-00000000M94-3ban;
	Fri, 15 Mar 2024 13:40:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nG-00000000M3B-0ln3
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 13:40:19 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a4675aaa2e8so211858766b.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710510016; x=1711114816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7Wus7+04U367SmPRgLRcagyxip4bNtqJZUWzPYUkwc=;
        b=iOYP8dMLRZW7wctfd4MiCVfkwxjFma0sZJmt4fU56LnQHcF3Z4T0c2YOQVypYsNxng
         0D4TpB3T4U4pNG89bf4F1IDqZDhIH5mWJhOEijuUFHDRSJsv+NJ04RJAZr5/vUCbqLD1
         858N+goKW0oQ9Pa80WM8EETXxAZ9gj38jL/SR7sGzLsXX0OghjPhkFOUeQfk9DBa2gPk
         CIjoWAp7RVaFev0+uGH/4mf0TfKOhDwvyF5CdnnFIFHPYrSUmkhAIFvOqil9e+l22WY4
         cJ887auZVZLIH6pu5F3aCwBSX3/RZ9NrjoMPL1yqjnGygFHo9RhdpNSA4kOIjBw5x5ED
         c+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710510016; x=1711114816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7Wus7+04U367SmPRgLRcagyxip4bNtqJZUWzPYUkwc=;
        b=mPLrbqhkccfWzqgVRNlMdreuSt0SIWpfCMWMtBIp5r4XMDeGc53X6juPFB0H1lQiz/
         OA1vdbKRYmovQIP2iO7wJJSivR1rizFWxO84AgjUbdjBBWnnve/bnMxwyg5M9qsZ6rCK
         D6/GPKJR1YbKzYoksw1sqDSSmGFi20gxOEU5mX8dWgAt5Fb1lnx51L5DsJ51XDU7s7ji
         1EyLZZg3rzUh2HhCVHY8leA+fEyt4X0Rrr0bNwFDEcPFHw+k5fY2qifPCXcDM1YPCFK5
         xyR53R+uvSKJYpFrLOzTWV4agSZIlwva9+SjZScxS0v53tq/goPGV8rOOVqni55nGvf5
         BheQ==
X-Gm-Message-State: AOJu0YxTJqDDb8/ITrCqhtWDmOdMUIqxvuOAq3WuPDlWyIFnDALpGB3J
	2xK5Ns+u9DVE27XumiP4I/EO3Ewdjg1tVOtct0qqhMqwhbFxyE6UcJNgtqSg3z3k1fiqLZOsw5O
	Q
X-Google-Smtp-Source: AGHT+IHAaBFSbtjHzrizPCnwWKoriLNfRsf6rY+3J8WfkiXqsXCGf6XeclFGKGcIH1GMKFAxpLi1BA==
X-Received: by 2002:a17:906:d8ac:b0:a46:4c8e:18a8 with SMTP id qc12-20020a170906d8ac00b00a464c8e18a8mr2329020ejb.51.1710510016531;
        Fri, 15 Mar 2024 06:40:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ly2-20020a170906af4200b00a466fccbe96sm1694651ejb.122.2024.03.15.06.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 06:40:16 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM
Subject: [PATCH 4/5] KVM: riscv: Support guest wrs.nto
Date: Fri, 15 Mar 2024 14:40:14 +0100
Message-ID: <20240315134009.580167-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315134009.580167-7-ajones@ventanamicro.com>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_064018_328339_84394FB3 
X-CRM114-Status: GOOD (  11.32  )
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

When a guest traps on wrs.nto, call kvm_vcpu_on_spin() to attempt
to yield to the lock holding VCPU. Also extend the KVM ISA extension
ONE_REG interface to allow KVM userspace to detect and enable the
Zawrs extension for the Guest/VM.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  1 +
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu.c             |  1 +
 arch/riscv/kvm/vcpu_insn.c        | 15 +++++++++++++++
 arch/riscv/kvm/vcpu_onereg.c      |  2 ++
 5 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 484d04a92fa6..e27c56e44783 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -69,6 +69,7 @@ struct kvm_vcpu_stat {
 	struct kvm_vcpu_stat_generic generic;
 	u64 ecall_exit_stat;
 	u64 wfi_exit_stat;
+	u64 wrs_exit_stat;
 	u64 mmio_exit_user;
 	u64 mmio_exit_kernel;
 	u64 csr_exit_user;
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b1c503c2959c..89ea06bd07c2 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZFA,
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
+	KVM_RISCV_ISA_EXT_ZAWRS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..abcdc78671e0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -25,6 +25,7 @@ const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
 	STATS_DESC_COUNTER(VCPU, wfi_exit_stat),
+	STATS_DESC_COUNTER(VCPU, wrs_exit_stat),
 	STATS_DESC_COUNTER(VCPU, mmio_exit_user),
 	STATS_DESC_COUNTER(VCPU, mmio_exit_kernel),
 	STATS_DESC_COUNTER(VCPU, csr_exit_user),
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index ee7215f4071f..97dec18e6989 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -16,6 +16,9 @@
 #define INSN_MASK_WFI		0xffffffff
 #define INSN_MATCH_WFI		0x10500073
 
+#define INSN_MASK_WRS		0xffffffff
+#define INSN_MATCH_WRS		0x00d00073
+
 #define INSN_MATCH_CSRRW	0x1073
 #define INSN_MASK_CSRRW		0x707f
 #define INSN_MATCH_CSRRS	0x2073
@@ -203,6 +206,13 @@ static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 	return KVM_INSN_CONTINUE_NEXT_SEPC;
 }
 
+static int wrs_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
+{
+	vcpu->stat.wrs_exit_stat++;
+	kvm_vcpu_on_spin(vcpu, vcpu->arch.guest_context.sstatus & SR_SPP);
+	return KVM_INSN_CONTINUE_NEXT_SEPC;
+}
+
 struct csr_func {
 	unsigned int base;
 	unsigned int count;
@@ -378,6 +388,11 @@ static const struct insn_func system_opcode_funcs[] = {
 		.match = INSN_MATCH_WFI,
 		.func  = wfi_insn,
 	},
+	{
+		.mask  = INSN_MASK_WRS,
+		.match = INSN_MATCH_WRS,
+		.func  = wrs_insn,
+	},
 };
 
 static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f4a6124d25c9..67c5794af3b6 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -41,6 +41,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(ZACAS),
+	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZBC),
@@ -120,6 +121,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBC:
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
