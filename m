Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C214C004C0
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/ftt2RJESj0DBWOr2gxHDaXAMmmCs92dmrKEPzMSQo=; b=rMbVAwI8OngtmH
	6jOIktqf3PpzYl9WLo66dcXlAGeBygLuaGahKcfXSDrEYy6errL1emFVQ87fC7NbG3UXHIgUmVTVr
	eto87hY6I7VZB0rGRAO14mt+F0bYuObVEg2zCTXH92XUGjiV1d8Uj0pT4I1Uh0YEkbC+wQ6lYj/6o
	HExHEB0srlnLLw76hcgQ2fWEMJGi2XIuSUJJFPk4c4RTcYWx/j2NZp0IoSZm10kElBvyMD8Sq8AQM
	b75owCCUbOVqmdx1tO9VwYQKhOcWMjtp3epuOWWPkl0XhuL7NvTJAyANfyU+nHHKi3Nk2zTOD+Gfu
	T5T56ZSx6t9sYP520Skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpk-001QCC-2u;
	Fri, 20 Oct 2023 07:22:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpi-001Q8n-14
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:22:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6bd96cfb99cso456078b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786528; x=1698391328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO8QQxSKIIq22xFRYvu7Gu8eaqjv2hPcSOTMD/z9e94=;
        b=hRSKNmYKELDJPapfGv8UIYaSsl5Vh5ToB8Ee7fFLY5+iJ5zHcOWztKVkuXZlTojVp7
         /vsrRWk4Qpr6vg5xuwfMFhMkuo20bcz5GdBaeVGA2Huk310aGT4LcpNNJJcZkdzMMMia
         gc8zLmb7xD6sVYpHdVASVKbObkZ2881MWBFjmFK20Irbf2/9HrLfZN/5yrZpovjD+MZ1
         N+7PpDCr5z7ZlG+G9Jm/Jcp8SArAaiRNzkdONnWaEQ8U5bGgsIDpKIfsv3euOr+gmI9U
         GH+jEi1RJgkALI8EhULH+l2c7i5D+7z5TBeOh+8PXFDlnxAJ1J/6QLBQQV14JGIwgSaR
         F7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786528; x=1698391328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO8QQxSKIIq22xFRYvu7Gu8eaqjv2hPcSOTMD/z9e94=;
        b=QIlzDmw8KAgvhClIDctl8gigLJUVER0l45dPe5Yl17VmuNLFlFdIPMAxF1A507vmKk
         LevzV2uS+454u+7LiL3qQ5ntUTTU0fwXtxBdqCaGJv5DNmmzQo3D4FPGsywB+JbmDsDp
         M+nGCgQhJ4wW4BkNxNSByv6mvLnrbUmjg0yUJ4N7zMZKwrDqRDRO9GRobVJdyn2QxJb/
         nWtWE+kKUAidesEkYFgTaGG5bt390MLOoNXw2gRoUsQEpiREboTX+1tSNHch5DpVsUfQ
         qnQdCedetYUCUAOInuqeS7nHZD0Km8rk+sXaQNl4eYJEXDOEuvccoKzbwdBBuHKj/20f
         1vzg==
X-Gm-Message-State: AOJu0Ywbf50ufp1AKqEnedlE5jbqIKdPvNobBr4xeFY1Xjepg402gac0
	mO2kU7txLKnbV81dc96k9tu8EQ==
X-Google-Smtp-Source: AGHT+IEkj9caZAnNIJ+YKQHJFuBSd9R4KVCbXPxdNGw5YMPQO4SC5tQtDdGdQxSt48V7VnxE9x8JkQ==
X-Received: by 2002:aa7:9622:0:b0:68e:42c9:74e0 with SMTP id r2-20020aa79622000000b0068e42c974e0mr952140pfg.3.1697786528093;
        Fri, 20 Oct 2023 00:22:08 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:07 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 4/9] RISC-V: KVM: Forward SBI DBCN extension to user-space
Date: Fri, 20 Oct 2023 12:51:35 +0530
Message-Id: <20231020072140.900967-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002210_388570_A7377BCB 
X-CRM114-Status: GOOD (  13.85  )
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

The frozen SBI v2.0 specification defines the SBI debug console
(DBCN) extension which replaces the legacy SBI v0.1 console
functions namely sbi_console_getchar() and sbi_console_putchar().

The SBI DBCN extension needs to be emulated in the KVM user-space
(i.e. QEMU-KVM or KVMTOOL) so we forward SBI DBCN calls from KVM
guest to the KVM user-space which can then redirect the console
input/output to wherever it wants (e.g. telnet, file, stdio, etc).

The SBI debug console is simply a early console available to KVM
guest for early prints and it does not intend to replace the proper
console devices such as 8250, VirtIO console, etc.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  4 ++++
 arch/riscv/kvm/vcpu_sbi_replace.c     | 32 +++++++++++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index c02bda5559d7..6a453f7f8b56 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -73,6 +73,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 917d8cc2489e..60d3b21dead7 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -156,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_PMU,
 	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_RISCV_SBI_EXT_VENDOR,
+	KVM_RISCV_SBI_EXT_DBCN,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index bda8b0b33343..a04ff98085d9 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -66,6 +66,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.ext_idx = KVM_RISCV_SBI_EXT_PMU,
 		.ext_ptr = &vcpu_sbi_ext_pmu,
 	},
+	{
+		.ext_idx = KVM_RISCV_SBI_EXT_DBCN,
+		.ext_ptr = &vcpu_sbi_ext_dbcn,
+	},
 	{
 		.ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 		.ext_ptr = &vcpu_sbi_ext_experimental,
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 7c4d5d38a339..23b57c931b15 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -175,3 +175,35 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
 	.extid_end = SBI_EXT_SRST,
 	.handler = kvm_sbi_ext_srst_handler,
 };
+
+static int kvm_sbi_ext_dbcn_handler(struct kvm_vcpu *vcpu,
+				    struct kvm_run *run,
+				    struct kvm_vcpu_sbi_return *retdata)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long funcid = cp->a6;
+
+	switch (funcid) {
+	case SBI_EXT_DBCN_CONSOLE_WRITE:
+	case SBI_EXT_DBCN_CONSOLE_READ:
+	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
+		/*
+		 * The SBI debug console functions are unconditionally
+		 * forwarded to the userspace.
+		 */
+		kvm_riscv_vcpu_sbi_forward(vcpu, run);
+		retdata->uexit = true;
+		break;
+	default:
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
+	}
+
+	return 0;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn = {
+	.extid_start = SBI_EXT_DBCN,
+	.extid_end = SBI_EXT_DBCN,
+	.default_unavail = true,
+	.handler = kvm_sbi_ext_dbcn_handler,
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
