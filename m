Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D2C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wTZK4nNPt0zcPsWWggPDlkGBDSv1b/gNDZzPTUmv6A=; b=kOE57sfiGlwO1t
	vQzFmwyQw/k4E+zo3aDB+JVeDHiA3gGjxwUuVKOfrVe/ZKYt14lUvjt2iLjh3I8MFKIj12sbBDPT7
	J0gedEEnAJa4JJ0eXh2p0+yw2UgGdzoEiFM/Ro4kyFvbeEIHxUQNZ7fzu0yRXAYbadqJ2Cekil4LB
	Cu4Yplwgk2aziVPZ/f2yZdApngn2Oqp2iC9xyfofOvCwRWwCsvgzxfCqajJmd5M6V5YHPcP7cAIRP
	JCkLPKyLTI+JL/njDQcQAqAwDJl2az+aM/wU91XG925Qgmx3sdzTCT8iNjNynYbweRf7NDaJGcP8I
	RUDknWc4keBqVbB7obsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogU-00000005pRN-45SR;
	Fri, 19 Apr 2024 13:53:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogH-00000005pEH-1lW2
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 13:53:36 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a526d0b2349so242106766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713534811; x=1714139611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7Wus7+04U367SmPRgLRcagyxip4bNtqJZUWzPYUkwc=;
        b=dUEBOp8LUbJiZGLVk+KADS9F5Qkws32aICICcEubz26jGtaPCqVrIAu5fjvl64r8PX
         Cmm2X0U3l44xDBTFTfZjDVlh6ayuZExPoa0NPYlrj8Vo56z2sNaTpaWRdddkCHNNmE2v
         34Z/UiF3c4i704TNexkIR26K/q0pljz7EXePFqZM3kFa3RhbL6WSv2WLSa8akjmvGnO2
         ZspoayqXS9qL726+/BT7+Ux1YKks1TC/3/aZRGEDkp/qwzBfeak83NW7gV5d4UDHNPaT
         fjwMx3xqiHFAiHtIDrLjTLJI28Umq1R35aWVqsC5Yl05EBi1WXDidhGTzOE88wiwLa61
         n7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713534811; x=1714139611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7Wus7+04U367SmPRgLRcagyxip4bNtqJZUWzPYUkwc=;
        b=ZWU70nWOBbU4WBPGdAlMsESNrN3DgowzCd28XOWL7SMz6agGRAl7dL5rlXLJ2gbFJl
         +UjaNH4wPCauP8iBMWK9Poa9RLgP6KnOKqHgedJyAzGlNJIvgsI4/P3/p4IRZvL27e5Z
         0bJHGZNAuLXMF5rOxcxC10lCol3CnjudjxsMlj4YNvCJDTwJIBAOTR4LVf7uf7kA5f4z
         AxMhajqld0cFopFsM8oaZKwAYi+NNSTYu/b9oSApP3fiTC9ANWXygNTRVJh55P8lDplL
         gn3/+Wrs4zixMcm/Sg10rG/qy/JalXkQItYxDKJsm0zfelvSc109tNo5nxj0KXNXBMeg
         qgZQ==
X-Gm-Message-State: AOJu0YyWAjK4Za3o3F6cL7nuEvNQLbMFJePbJVfOjCVg6mVD5qLNkB/S
	qNBT1fohWqHgqGE1RER8DWxRTDCH3w7J3YFZW43MprI+9tRPx7NKfnbZ11oASh4LBFuER5xIECB
	tu00=
X-Google-Smtp-Source: AGHT+IGW5DMzpQ1s7RJVHZYrIDlcwyg2slIg6T6KVtXyKcpiNBcc1wPNCm7ONf1zgIDtdYgJqAgZAw==
X-Received: by 2002:a17:906:f8c5:b0:a55:5ddd:e5f6 with SMTP id lh5-20020a170906f8c500b00a555ddde5f6mr1513975ejb.28.1713534810779;
        Fri, 19 Apr 2024 06:53:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709063e5600b00a5209dc79c1sm2266768eji.146.2024.04.19.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 06:53:30 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v2 5/6] KVM: riscv: Support guest wrs.nto
Date: Fri, 19 Apr 2024 15:53:27 +0200
Message-ID: <20240419135321.70781-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419135321.70781-8-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_065333_567493_376C1BE4 
X-CRM114-Status: GOOD (  11.67  )
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
