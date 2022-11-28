Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A64C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fo24iGEmsZLmSeX3bIxQCiIErBfKDQBVSvbK1o4amOo=; b=O4KCvoJJkYvBzP
	kcC8YwlAzmBj2nvOaII6WjwZeuhZvysLf63wbFitWo751n3cVpX4ZyF5TkNq+aBV3VGI6UyHJpiE/
	Hgg89gOJT+Mwjc8MKvoRJ1qLIxGRqPSmQEJCKikx/pDM5FPp0mdjgkSz+HpyQG74A9pIe1H+f0+xD
	XWMNpkx0xnrwjGSV7gdcwfC0+0foo+mUc6jENghUSuDNzBK4SNQUX33N4GWjZHYW35zoA0qzEJhnJ
	l3YX/kcN4TuEU8tHrKzSQ5dbMe+ntK+fshMcL57yYmSHfdEk9+iHP0MWhfaq2AmdZtPVQD0J0CEbb
	lelDPFAxUp/ZEbCsk5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmi-002jFQ-9c; Mon, 28 Nov 2022 16:15:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgme-002jB7-A1
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:15:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id j12so10616875plj.5
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji6gUrAoWYT3XHk2lFOFtFs8PLEDbbIx9YYSf+S6VSU=;
        b=AjDuDNL8yAH4u64rbRauvAnfDwFYGSkUwRQHNT35gUX2qBC27sLneXYjLxoHThqaMD
         2XKsXAk0kyRCA8MF5ECg+7l/bjOsfAhXTdcnUzQKToxbZCG0Q2GZmXEWxCxO4g2snJLE
         foNXnRy9leX4WRty4LXz7pmeQJLWIQ1A8NVw+F5ctpUmMQ32/SLtKOmvjs1GkJ1qwusW
         lUuvExjF232MPQ4MgVW27YlIZHN8VjhclqVGFcw/FodzbFb00xTqWaAgx20VQEApxtLr
         oLMdXe0Q9PX7jsop2JH5Pb0TXuCxBMNa4l83br5MLpo/XVe6m/rYKBz4/sQHPpIOH9uW
         tAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji6gUrAoWYT3XHk2lFOFtFs8PLEDbbIx9YYSf+S6VSU=;
        b=f+pt3d8asNhr4YYKvDBTI9nctF8R3JTdR4HMsIvvWLoit4w+Fk0k0hwKyaXeO0vLOT
         nzEe5B7OhfWtBdaE2k4lLzfQinh/J28sG3aipRirvoMyaWqHgHFc1rEFd24uD2Htki/h
         rx0nYagcqqYQ57IHuqo6cFpBg6wXA4NyAAy9MS5L1G7c6UbuwEpKcYMc+1s9YV5Lq4Vl
         ZGMYD+TfrMZ/g0xHmx4z9MHrsD3MyVKcmFd5SDs4PaTggPnUNwnZwxWTzDifsORkvER7
         p+GIcXsADBU8fcZPZ+tnhzS2qtAUHNUJaKpqAPH6zdjSJScTf05H8X7Byh/HKSmJkXLd
         EAEg==
X-Gm-Message-State: ANoB5pkS3h5eCqpc7JlNu49b7B2EVh9YQS+gFESy6feWjgj83IDCK44d
	AtoXXCwfYq7/m/Yj4kBLS8wyRA==
X-Google-Smtp-Source: AA0mqf7yAshre1MYiIFD0k1ifqLxcshH2Yv8NLWThlH1BDV1OaAOo4j6oo9TJuEJSkDguwxkCNaAag==
X-Received: by 2002:a17:902:c702:b0:189:4bde:53c1 with SMTP id p2-20020a170902c70200b001894bde53c1mr25593754plp.1.1669652103621;
        Mon, 28 Nov 2022 08:15:03 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:15:03 -0800 (PST)
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
Subject: [PATCH 7/9] RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
Date: Mon, 28 Nov 2022 21:44:22 +0530
Message-Id: <20221128161424.608889-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081504_414433_99E88AFE 
X-CRM114-Status: GOOD (  13.10  )
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

We should save VCPU mvendorid, marchid, and mimpid at the time
of creating VCPU so that we don't have to do host SBI call every
time Guest/VM ask for these details.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  5 +++++
 arch/riscv/kvm/vcpu.c             |  6 ++++++
 arch/riscv/kvm/vcpu_sbi_base.c    | 11 +++++------
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 91c74b09a970..93f43a3e7886 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -165,6 +165,11 @@ struct kvm_vcpu_arch {
 	/* ISA feature bits (similar to MISA) */
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
 
+	/* Vendor, Arch, and Implementation details */
+	unsigned long mvendorid;
+	unsigned long marchid;
+	unsigned long mimpid;
+
 	/* SSCRATCH, STVEC, and SCOUNTEREN of Host */
 	unsigned long host_sscratch;
 	unsigned long host_stvec;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 68c86f632d37..312a8a926867 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -21,6 +21,7 @@
 #include <asm/csr.h>
 #include <asm/cacheflush.h>
 #include <asm/hwcap.h>
+#include <asm/sbi.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -171,6 +172,11 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 			set_bit(host_isa, vcpu->arch.isa);
 	}
 
+	/* Setup vendor, arch, and implementation details */
+	vcpu->arch.mvendorid = sbi_get_mvendorid();
+	vcpu->arch.marchid = sbi_get_marchid();
+	vcpu->arch.mimpid = sbi_get_mimpid();
+
 	/* Setup VCPU hfence queue */
 	spin_lock_init(&vcpu->arch.hfence_lock);
 
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 0c806f61c629..5d65c634d301 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -19,7 +19,6 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
-	struct sbiret ecall_ret;
 
 	switch (cp->a6) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
@@ -48,13 +47,13 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
+		*out_val = vcpu->arch.mvendorid;
+		break;
 	case SBI_EXT_BASE_GET_MARCHID:
+		*out_val = vcpu->arch.marchid;
+		break;
 	case SBI_EXT_BASE_GET_MIMPID:
-		ecall_ret = sbi_ecall(SBI_EXT_BASE, cp->a6, 0, 0, 0, 0, 0, 0);
-		if (!ecall_ret.error)
-			*out_val = ecall_ret.value;
-		/*TODO: We are unnecessarily converting the error twice */
-		ret = sbi_err_map_linux_errno(ecall_ret.error);
+		*out_val = vcpu->arch.mimpid;
 		break;
 	default:
 		ret = -EOPNOTSUPP;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
