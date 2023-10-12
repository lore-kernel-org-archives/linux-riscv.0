Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8879ECDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8kfrvOozIUYBpvgLY+hLeKjLt5sjHGzkakJ1KVaKT8=; b=NDQUQVxlX5zOE5
	+i7pa4umyqzhmRe9On8+0ZJhDeWIdMPiWZrBrIAy5f0K8Flfr/adEu5r/Ur8l2/52I6NhGAQo97Nv
	d35XzB5ZEB9kdvvTCp4ijWoTwi/w5gz+pteA0mIczTrUUdiETOg79o67jHJVu5ggSGf7FXT4L25VU
	5stw7+HAxUcY0yOyZAT9EFV1JrSRPY0tgW1YS59aK81FdTnSRNsCSFXD2CjmsEuhJ0RhyH9IH0eoy
	YRzvZA2MMiqHpNvwryjl7AyqEj+BmWhBPH5EPX63XbrBqVlG4NcainyqgvroZxW3hPoD82sas4Tsg
	Ht0hlIf6SDmxT1s0EkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2w-00HRFw-1i;
	Thu, 12 Oct 2023 05:15:42 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2t-00HRCS-2p
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c9d407bb15so5427845ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087737; x=1697692537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F82Co3/cdirw9N8c47oejx7W6gl4Raymf8m/hgF9mg=;
        b=C4kv0uXO4Nfh2B8OoFHYz340A7EdxhMm/NwzGFO0mjcSqAwQm0jmaxrbv06YzHZ3ws
         nUFP1UFyuyg3XNNpYPFNoQxqu9s2Gn2/XYtLGbAmke6F3s6X/Osf4Sqj/h0xnJycnKcf
         UBeW9qJvrabWXqMWQmvIImK3RwuxIP+UZBTqdIJv9ekC+EfP04xI9qw7OlBNXnEbyKGR
         vioSxAc5pLc/oQKekYqjZQJA5L+IFgx8LC3+oV8H0pG4yuxope1IghOxzOXKC3PYiWP7
         80wg/G3Tf4WMrOcXcQjj2Drt2E5eVzJ1YhKJ4dHvq9IxQnpGBxtbpOqTOQgkWBNvC7cj
         eRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087737; x=1697692537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F82Co3/cdirw9N8c47oejx7W6gl4Raymf8m/hgF9mg=;
        b=iFnIFicTr0rST40oc1hQVrsCqf3eBBH/S+5vl4ANIAzK0g3TlIk254MjM5c2CGhNo+
         TLNtsjat2DiWsIZmHl/yC6ZkXBCldhl8IGXbzjM7+zJAV4tdM2jyPa5E3adPxly5Bnx0
         ljxx5z6/eSyJ3cM8/yFeQDTSLLkVUEdu48opnW0NB1nzRUQ++Jt6aZAEFQUSl9dyW7Ou
         vrMGyDfDZYYI2PQmdJaz9e1FxtIQsHtgDpFCNpZKyiNwRWiYDumgIlgM36Ou1+Yg9HLx
         nzDtjA9HJZfvcOp8TBMKovYIkfnTUrbFlD6rjJdPRpAqpYpSzk90WLeg70KaBGYRAUGu
         zXeQ==
X-Gm-Message-State: AOJu0YxKcaFXfhSzvUWeu+A7YG16iURqs8uqvPpbhKrhITfyH60DZxUp
	5FEqvK6pbOcqxRBoC2Q77mf81A==
X-Google-Smtp-Source: AGHT+IFZ9PIs/5Xdz63daF5WgvnqI8HA2E47f1F59gFa33dzVCANlp1ZCJBRk4958EXc+DlXohYaDw==
X-Received: by 2002:a17:902:d48f:b0:1c9:d358:b3c9 with SMTP id c15-20020a170902d48f00b001c9d358b3c9mr2956911plg.19.1697087736652;
        Wed, 11 Oct 2023 22:15:36 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:36 -0700 (PDT)
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
Subject: [PATCH v2 4/8] RISC-V: KVM: Forward SBI DBCN extension to user-space
Date: Thu, 12 Oct 2023 10:45:05 +0530
Message-Id: <20231012051509.738750-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221539_911126_9EB7A0AC 
X-CRM114-Status: GOOD (  14.06  )
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
index 1b1cee86efda..bb76c3cf633f 100644
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
