Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9213C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lJXi+fFg46kUd5yZR3H3CDJkiVLf5sueVSc2syn89o=; b=Aa3TsIxPzF6HSv
	EmQCI/O+j4zUpfL18xLTwNVtyySOv8pFpvDYviUtFF3ULIPFHGG08+4Whu9KNZzyeuPq03QHUM4GJ
	zcDapMC52ZonSbD+iyqAi78wnWXhw8VDAFXF1pjyoJCYe2Ba70KMvMKodLXMDBM9BJz86BdmBIheK
	BKCF6yG2v3jqrXcML8aoblqQcXLAdDdcF/KFVGLBLYyMpZinubKWO/2dsHAJmQAWhtIPMlKzR4hUD
	uz2vbnWYIKeJ739xkXlatGuu8BroGeUosfxZgOQm4yAXJQUBa81Sv3fCSjJURC8/QPEdyNFUCC1PV
	nuQy0KpDBm8Sw8epZAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmb-002j8a-KX; Mon, 28 Nov 2022 16:15:01 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmV-002ivK-Qn
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:14:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id g10so10607199plo.11
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vvqUKmjIlo2M+VXNYk9fymWjR9KRElpX3u4BLE4jMI=;
        b=liRaBUEKu2MYafBpndLUswBx84/iGkUeSpwIkM1ayLv71FbHHAdoSwYsy8RFoOuVg0
         NVRR46SYjlR4McTk73LTvT7Vn+S0o0JxILW2NqjxMbYb5cDH3rmtRFM/mxmM7KOECHBv
         EwvJRiMLiC+aVVzG5UblNwd9Lf7PVDCnGirQJ87Supl0JpY5MCxal8Nk2kVibfnt6pFG
         79/qA0AyZXTyFBy4upYyciVHZHY8H0+xFpdUBvqwsd4j3xtReMeRCmaDNnggFEmmSRJo
         gqv5IBRmUjCuS6yjsCwh7rGPsCaGO0w09rhCjkXWuucdTO5Nqwwh/gTAhKkuZ5w4Rmg0
         t5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vvqUKmjIlo2M+VXNYk9fymWjR9KRElpX3u4BLE4jMI=;
        b=uh37IfTC2FigA7RPwbwpSgafP2SNU0wN0MDRvzkWuXltLnyLNCjOqHCvN16Rm722mT
         t36v8LXJDJl/QkzrIJoYmCRu4icceHEMlTIok/Sypv0O5RZgCCJ6Ky5+a60I9tQ8ess2
         7vZMdn8L4Gv0turdayUj9ESVn5miMsyyupnHJ9YkcLMyBKgxV6RLzC8v4cWzGkOXYQeb
         QwGqE2lv/dPDOx13OYCyBKXI77pKsxcG+anF0zIYU4LdAcN8iA9uDAOuNv4PZbkOg7Ws
         HMy/HbZ4EulBGDJKvVbT9QCnPbPHyc0T62YCC/MV3z/0j5Jz0RhNwwozgYwuNimovhfs
         hahg==
X-Gm-Message-State: ANoB5pmH0s/cPo6C4BqjFkipt9qkvWV7KDypcm0YegJATiPlt073i1Z1
	2oy0FEAyBk8c4PBu8IWRdHK9gIkmcLdohw==
X-Google-Smtp-Source: AA0mqf5Xb59cW1JF8tw86FD9XA9POLw2LsXSD66lgcwv1aWXWX4IUtipw364kc5dpdR93c/3Gwh/bQ==
X-Received: by 2002:a17:90a:4302:b0:20a:e469:dc7d with SMTP id q2-20020a17090a430200b0020ae469dc7dmr53155068pjg.97.1669652095403;
        Mon, 28 Nov 2022 08:14:55 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:14:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/9] RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
Date: Mon, 28 Nov 2022 21:44:20 +0530
Message-Id: <20221128161424.608889-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081455_889061_BFB25C88 
X-CRM114-Status: GOOD (  11.25  )
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

Just like asm/kvm_vcpu_timer.h, we should have all sbi related struct
and functions in asm/kvm_vcpu_sbi.h.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h     | 10 ++--------
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 ++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 6502f9099965..91c74b09a970 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -16,6 +16,7 @@
 #include <asm/hwcap.h>
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
+#include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_timer.h>
 
 #define KVM_MAX_VCPUS			1024
@@ -94,10 +95,6 @@ struct kvm_arch {
 	struct kvm_guest_timer timer;
 };
 
-struct kvm_sbi_context {
-	int return_handled;
-};
-
 struct kvm_cpu_trap {
 	unsigned long sepc;
 	unsigned long scause;
@@ -216,7 +213,7 @@ struct kvm_vcpu_arch {
 	struct kvm_csr_decode csr_decode;
 
 	/* SBI context */
-	struct kvm_sbi_context sbi_context;
+	struct kvm_vcpu_sbi_context sbi_context;
 
 	/* Cache pages needed to program page tables with spinlock held */
 	struct kvm_mmu_memory_cache mmu_page_cache;
@@ -326,7 +323,4 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 
-int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
-int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
-
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index d4e3e600beef..f79478a85d2d 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -14,6 +14,10 @@
 #define KVM_SBI_VERSION_MAJOR 1
 #define KVM_SBI_VERSION_MINOR 0
 
+struct kvm_vcpu_sbi_context {
+	int return_handled;
+};
+
 struct kvm_vcpu_sbi_extension {
 	unsigned long extid_start;
 	unsigned long extid_end;
@@ -31,7 +35,9 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 				     struct kvm_run *run,
 				     u32 type, u64 flags);
+int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
+int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
