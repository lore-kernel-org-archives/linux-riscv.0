Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE5DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OghkK5sDrqqYOxqinyrsJocBx4g0JhZXjIlUwXTI8g=; b=oPFjZFkpx0u5nX
	MW5uuBI/EYOiGGv8X+xRM2yZ3wh+l+5mYJcBeVhTyreaHzzKNhc8cbQfpL4Y36rq3bULArcDc+gvU
	UOHcDQU68/i/xWLWVYQpjhYalIbrsFv68BH55gw29v6apk29UFkz4YHX9juTO2KSLHN1CDqUzSeQ3
	+eNuCHiyomACI3uebT98z05cRu0t6c1Ok2IMx4VfN+0kjVF7NtWHXYQbXBfN16IYFqwH6tqz9IC8w
	lMjAVkZoSPLWXElv1XDTGNq2oKFS49PyUuqRN1FujCZz5vP5+mkpn2LCUrFxlOSspY27uovHm8ZUI
	h9tFlfhew8shioir+pMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1QVi-00DvtO-T1; Wed, 15 Jun 2022 10:44:31 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1QSJ-00DuEH-FC
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 10:41:02 +0000
Received: by mail-pf1-x42a.google.com with SMTP id i64so11064313pfc.8
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jun 2022 03:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULPEiXMnFU7l6XselUzEmxUGI/TXFOKAnllM+GAyEtM=;
        b=SCO9c6eNupTDMXqBmsVgSBnI5vCexcatUzQyEiaO7D+Cy6luv9EHoREOlvUgw2PgC1
         9qILIHIoLM0TLI/3I0Dg4mk+asH+8J7zqp4/1xpfvppkq6arLE0D3Y1uuMLToONpK+2p
         /C/tBEVxylJoWPUVaxlKRGMntiZ89iNNZVjloXufDctwjIGgMHfbLKIpijbEveA9PorD
         CCkkLMcGX9hcV9pmGiaE6xK5KDOWulau0MtXYRpHXAxAwdKxIfLD+YygLBUQx6z1Nv4m
         sJ+up+fCnMgXKsZqObbOAO7WWFh6VrWMmCSjdZDjNNgaEJJ5qJbm4zNEEsLbGvwA+Qw0
         FHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULPEiXMnFU7l6XselUzEmxUGI/TXFOKAnllM+GAyEtM=;
        b=Y6KyrRnt0kVup5PNdiDWr5Qdk0JBhsVC91y6/Yxe/egUUpHoLQ4H551CEY9oIVKKW9
         8UXoVkxOFrQC6mur4aeXzGf634Hk4oZC7LONmZ3I4V/tIMNaS/d2v1mcl9QfQMECXhsC
         FZoJZahs9DipJAs7qQ5iYdvcCeCQwuxTvkyf2U/wj4vpNYq+ojtEwN/UuKZsxRkB7NXl
         yGzK4Loznv+ajDwjK29fiyf0NEMXiUcKZ06T0U4SaYZC5LAD2fVthgNW3WlU9Lv5SgLg
         zBdnL5SNH/4q9YKT9jJVqNMKW2MQTJUl2w3YlK6OncD5r/RL873JjB5Un58EIM5otRYL
         SYXQ==
X-Gm-Message-State: AOAM530AVKPCUPG7kNqXmgvc+0jIi83gBGqBeUVE86q6LZPyZAZPx7yi
	TDpJBfWqY9S/VktmsbjoRJvjzQ==
X-Google-Smtp-Source: ABdhPJyV2Y9VrLr09flYGBeoIiNEsjNFYSFdiqdFLEFL6xZu4Ub/CCUDIC3A7PXBg/G2y3XJWhpdjA==
X-Received: by 2002:aa7:99da:0:b0:51b:ed38:c409 with SMTP id v26-20020aa799da000000b0051bed38c409mr9383854pfi.37.1655289656322;
        Wed, 15 Jun 2022 03:40:56 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.104.191])
        by smtp.gmail.com with ESMTPSA id i19-20020a056a00225300b00522c365225csm1427273pfu.3.2022.06.15.03.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 03:40:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/3] RISC-V: KVM: Add extensible system instruction emulation framework
Date: Wed, 15 Jun 2022 16:10:24 +0530
Message-Id: <20220615104025.941382-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615104025.941382-1-apatel@ventanamicro.com>
References: <20220615104025.941382-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_034059_564582_F664FDE7 
X-CRM114-Status: GOOD (  15.97  )
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

We will be emulating more system instructions in near future with
upcoming AIA, PMU, Nested and other virtualization features.

To accommodate above, we add an extensible system instruction emulation
framework in vcpu_insn.c.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  9 +++
 arch/riscv/kvm/vcpu_insn.c             | 82 +++++++++++++++++++++++---
 2 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 4e3ba4e84d0f..3351eb61a251 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -18,6 +18,15 @@ struct kvm_mmio_decode {
 	int return_handled;
 };
 
+/* Return values used by function emulating a particular instruction */
+enum kvm_insn_return {
+	KVM_INSN_EXIT_TO_USER_SPACE = 0,
+	KVM_INSN_CONTINUE_NEXT_SEPC,
+	KVM_INSN_CONTINUE_SAME_SEPC,
+	KVM_INSN_ILLEGAL_TRAP,
+	KVM_INSN_VIRTUAL_TRAP
+};
+
 void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				struct kvm_cpu_trap *trap);
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index be756879c2ee..75ca62a7fba5 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -118,8 +118,24 @@
 				 (s32)(((insn) >> 7) & 0x1f))
 #define MASK_FUNCT3		0x7000
 
-static int truly_illegal_insn(struct kvm_vcpu *vcpu,
-			      struct kvm_run *run,
+struct insn_func {
+	unsigned long mask;
+	unsigned long match;
+	/*
+	 * Possible return values are as follows:
+	 * 1) Returns < 0 for error case
+	 * 2) Returns 0 for exit to user-space
+	 * 3) Returns 1 to continue with next sepc
+	 * 4) Returns 2 to continue with same sepc
+	 * 5) Returns 3 to inject illegal instruction trap and continue
+	 * 6) Returns 4 to inject virtual instruction trap and continue
+	 *
+	 * Use enum kvm_insn_return for return values
+	 */
+	int (*func)(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn);
+};
+
+static int truly_illegal_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      ulong insn)
 {
 	struct kvm_cpu_trap utrap = { 0 };
@@ -128,6 +144,24 @@ static int truly_illegal_insn(struct kvm_vcpu *vcpu,
 	utrap.sepc = vcpu->arch.guest_context.sepc;
 	utrap.scause = EXC_INST_ILLEGAL;
 	utrap.stval = insn;
+	utrap.htval = 0;
+	utrap.htinst = 0;
+	kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+
+	return 1;
+}
+
+static int truly_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
+			      ulong insn)
+{
+	struct kvm_cpu_trap utrap = { 0 };
+
+	/* Redirect trap to Guest VCPU */
+	utrap.sepc = vcpu->arch.guest_context.sepc;
+	utrap.scause = EXC_VIRTUAL_INST_FAULT;
+	utrap.stval = insn;
+	utrap.htval = 0;
+	utrap.htinst = 0;
 	kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
 
 	return 1;
@@ -148,18 +182,48 @@ void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
 	}
 }
 
-static int system_opcode_insn(struct kvm_vcpu *vcpu,
-			      struct kvm_run *run,
+static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
+{
+	vcpu->stat.wfi_exit_stat++;
+	kvm_riscv_vcpu_wfi(vcpu);
+	return KVM_INSN_CONTINUE_NEXT_SEPC;
+}
+
+static const struct insn_func system_opcode_funcs[] = {
+	{
+		.mask  = INSN_MASK_WFI,
+		.match = INSN_MATCH_WFI,
+		.func  = wfi_insn,
+	},
+};
+
+static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      ulong insn)
 {
-	if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
-		vcpu->stat.wfi_exit_stat++;
-		kvm_riscv_vcpu_wfi(vcpu);
+	int i, rc = KVM_INSN_ILLEGAL_TRAP;
+	const struct insn_func *ifn;
+
+	for (i = 0; i < ARRAY_SIZE(system_opcode_funcs); i++) {
+		ifn = &system_opcode_funcs[i];
+		if ((insn & ifn->mask) == ifn->match) {
+			rc = ifn->func(vcpu, run, insn);
+			break;
+		}
+	}
+
+	switch (rc) {
+	case KVM_INSN_ILLEGAL_TRAP:
+		return truly_illegal_insn(vcpu, run, insn);
+	case KVM_INSN_VIRTUAL_TRAP:
+		return truly_virtual_insn(vcpu, run, insn);
+	case KVM_INSN_CONTINUE_NEXT_SEPC:
 		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
-		return 1;
+		break;
+	default:
+		break;
 	}
 
-	return truly_illegal_insn(vcpu, run, insn);
+	return (rc <= 0) ? rc : 1;
 }
 
 /**
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
