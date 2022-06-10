Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5B0CCA47B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 05:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OghkK5sDrqqYOxqinyrsJocBx4g0JhZXjIlUwXTI8g=; b=KvIudJAsrN14dC
	OJtgZoKD6yl605EBUDI+0Zik/PA7Dydi9gaflOViWLZi6mOe5ZFZTXg61U1OMFayWPvK8YGj8ytsi
	1lQ9IhQyVTs4sxfP4e8y1Ln32sAmsMXcI7vIbbVrZYEh/y+Gn7l+jib40D+F1odK2IxPBrioLZQWv
	+8LS1pe3CZHILWB0toquwXlKO1MOeh05wfa+mU7DlGcEKJMoEQNlLUNFia3++CCq7e/IqOzEjh+/o
	JXcBbZO8RuY2Dt9LbDXle/j8TGQqMUs0SKb224z+WTAAYOMVFnCDncK+9wr8zNm+eIJc19tVWGE6O
	vnDWvSVa+QJ25TUaEA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWqt-005u5k-9z; Fri, 10 Jun 2022 05:06:31 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWqq-005u3N-3o
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 05:06:29 +0000
Received: by mail-pg1-x536.google.com with SMTP id 129so23784992pgc.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 22:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULPEiXMnFU7l6XselUzEmxUGI/TXFOKAnllM+GAyEtM=;
        b=C80BPXGalQYbDk/yHa5kUa+rgnL897bCITP0/Yl1pRCEmHFQ5y7eSiws3uouxLjyhf
         fOAmIidz0WVMC0m4UnivgGbTxLeINhT+qn4SihRoI9EWPvVUXeF36//GzCgYt4wKrK34
         RPjfuMXXtQSLMGv1W22Mb05ZAeW/qRLqvgUK8lwFnrIlSw1QRJsEHPakq8GJAaGI1AEr
         ER2ra1gswhj/rWVgvWfrQ7O+S01pP5MIO1yenDdDR4T6pmB9lG3M8cnr91VFw01uydth
         U2L/eXdLvrwIBGCj1XOkqGRpUo4DxiodnVGJlDK+E+NsmvcpkbEuFKh+k1TDcSaNLbEt
         gvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULPEiXMnFU7l6XselUzEmxUGI/TXFOKAnllM+GAyEtM=;
        b=wEYLaEtRpW6EMSD3sXv5oq999FIRo+eoX+5au/gjDuoOu1t9LeWH9UdbsX5Tmbeb+E
         ph+XLpTSvbTYeX5WWOEEEV3unQUDspuc4vai8ndZHYd93s9X+UivKmg0C+LL8p35CL/T
         56dGqUu67AJQLTI0xx2le8tHhazpnqVekGU7h64dkNlQjUQ/Q8CzAPT3He4Ss+A9OL6H
         HRndGMzskU/iAjBAnhibszreF4dmBbuf4E4fU0YHJoay1X7hGfNLMNKv5pdQsBckPOCd
         vks+6HQ+Gxm8Nb6kX0g9CSN9unKAiVpUFiuRndHgMbX7qXyPatS5iPVJBc9Qgvky0xQM
         KtvA==
X-Gm-Message-State: AOAM531NCKJ4n1alfhPGHViAnBsRCMXQ5QXr1R0/SoejpEeTJjqQuDEX
	E0aOTp72hC9P3u+gZ+hkjRNU8A==
X-Google-Smtp-Source: ABdhPJweOx1PBTSkMvPt8AagCRjsaLxKg4ryVjzg61dVMeRO7qYXQLOZJxei8sbJLYBE7lz2yO1IlA==
X-Received: by 2002:aa7:88cb:0:b0:51c:2627:2c03 with SMTP id k11-20020aa788cb000000b0051c26272c03mr22840484pff.63.1654837586673;
        Thu, 09 Jun 2022 22:06:26 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([106.200.250.139])
        by smtp.gmail.com with ESMTPSA id u7-20020a056a00158700b00519cfca8e30sm12429424pfk.209.2022.06.09.22.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 22:06:26 -0700 (PDT)
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
Subject: [PATCH 2/3] RISC-V: KVM: Add extensible system instruction emulation framework
Date: Fri, 10 Jun 2022 10:35:54 +0530
Message-Id: <20220610050555.288251-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610050555.288251-1-apatel@ventanamicro.com>
References: <20220610050555.288251-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_220628_177182_ADD5C55D 
X-CRM114-Status: GOOD (  15.77  )
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
