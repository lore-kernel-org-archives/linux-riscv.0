Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2405C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdDnhe3FyyU06MXSVLSkF0+evRlHV3uGualW/k2e7Cw=; b=nnozy+dH67G2IV
	SBIfpXwio4s31XtrVZJSCLF1/qFYYKiXIIpDNUzIGQPz3KoNvu3QLbCYM+KC7ogiKdPnVHHfHgaem
	hhE1o8sHVfYZ1hg4qRDUR4YJ4tN3cuatAHYhKiG7x9oK4EhJLzfPba3CFhEUh8dvomrXXkG86sdos
	k3cKAXACTD4qiSVXtxO/c3fqqyJW7iSePtZtkDHPY3EVWu7PuyBQ+AqeF3v0qxb0a3n6DELPbi8Oo
	9DXq5EgkJ5Ap/LZpELxNeScesoFrvyT/BdMrek3wCoJ5sCEXuqGMijwHTf37kkPsARp4LYRpiTDkq
	WLyqu8zt4Jn02/2BH6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG86-006T9r-1d;
	Wed, 19 Apr 2023 22:18:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG80-006T5q-0S
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a66911f5faso4694715ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942695; x=1684534695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVskLFhSfykEs4eltGnJpzQVboIqM++EFU/NG1sE5NQ=;
        b=SO8VMn/gX3e5vrOk29Jpp+EW3CH0aS36Ddf+WvlYfYdV2qV/sEQkL249EYwnIbGQPP
         IbrgDiUX6yusY5G6N+gv2DqO2gsWL/6qr3Vjo5vnbGXNSTABlKc+Z5vspap8SEcOKeLU
         So7lcKbcoaSAhkenmIqQER+vNAwXBWV2IvUOGT4NehU2jVE3eYLDxu3zsV9yLUqbsLR7
         v7+u/wK5FHf0rE8XEaPscHq9ay3O7yJVyu0alqyYfsf0oZDQ04UuLg/LxXgaBLNutCRN
         t5gGEdgbWRMkTDfoaMJlc0lkYq+/3m6Gj+9+DtkEoQY+7pVpM5Wn8qS8u2Y8SjuI+hhP
         lcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942695; x=1684534695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVskLFhSfykEs4eltGnJpzQVboIqM++EFU/NG1sE5NQ=;
        b=VsxjVOwvgBDpCFhaaeUaoirqd6BhAOpf7b995n1vd7M0CthYinGdQhpxVIBDhmC/WT
         aPHp3jwTSyqRmHaN34W8WxSp3Zti6E9VG8WXOCdgKOQqMZbsfZKl0Z0QBWrvUDFO3fmu
         kJcDTiK9zBIH6FvZP8VAg4ca/akPv7anVtdciQPdxDqRvak9Lhzbp33OczePoVG0eHM/
         xgy1AwsbZLBTOSRuL0vBIzsfXsHli4fvdCuJBwftY6UvZiSrqhlP2ZJCJOss9g1XZ802
         AVaobbvVOgHzU+iXKALkGXhfUIo9hoeXt1Wjl5+0WGxQhjkb2zzJddW8a1K9vzPRpLdf
         txsQ==
X-Gm-Message-State: AAQBX9fskSoxkswcSQlRpH/gaSE2xGZXs3tcbwvzZVKBBouIEZw3/h+e
	tMP3gtR1fBxDyogT78084kaN2g==
X-Google-Smtp-Source: AKy350YJdtE76oL4JZlI/rCsVg2p4hVlt1BCJyTIcyC6OmWTTvtKZe676vtO5k8no3TozALhiDYlgQ==
X-Received: by 2002:a17:902:b489:b0:19d:297:f30b with SMTP id y9-20020a170902b48900b0019d0297f30bmr6180769plr.19.1681942695581;
        Wed, 19 Apr 2023 15:18:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 21/48] RISC-V: KVM: Handle SBI call forward from the TSM
Date: Wed, 19 Apr 2023 15:16:49 -0700
Message-Id: <20230419221716.3603068-22-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151816_181799_BF10E0D3 
X-CRM114-Status: GOOD (  21.03  )
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

TSM may forward the some SBI calls to the host as the host
is the best place to handle these calls. Any calls related to hart
state management or console or guest side interface (COVG) falls under
this category.

Add a cove specific ecall handler to take appropriate actions upon
receiving these SBI calls.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h |  5 +++
 arch/riscv/kvm/cove.c             | 54 +++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_exit.c        |  6 +++-
 arch/riscv/kvm/vcpu_sbi.c         |  2 ++
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
index fc8633d..b63682f 100644
--- a/arch/riscv/include/asm/kvm_cove.h
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -126,6 +126,7 @@ int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap);
+int kvm_riscv_cove_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 
 int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr);
 int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size);
@@ -148,6 +149,10 @@ static inline int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu) {return -1; }
 static inline void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap) {}
+static inline int kvm_riscv_cove_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	return -1;
+}
 static inline int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa,
 					       unsigned long size) {return -1; }
 static inline int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm,
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 44095f6..87fa04b 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -147,6 +147,60 @@ void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu)
 	/* TODO */
 }
 
+int kvm_riscv_cove_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	void *nshmem;
+	const struct kvm_vcpu_sbi_extension *sbi_ext;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm_cpu_trap utrap = { 0 };
+	struct kvm_vcpu_sbi_return sbi_ret = {
+		.out_val = 0,
+		.err_val = 0,
+		.utrap = &utrap,
+	};
+	bool ext_is_01 = false;
+	int ret = 1;
+
+	nshmem = nacl_shmem();
+	cp->a0 = nacl_shmem_gpr_read_cove(nshmem, KVM_ARCH_GUEST_A0);
+	cp->a1 = nacl_shmem_gpr_read_cove(nshmem, KVM_ARCH_GUEST_A1);
+	cp->a6 = nacl_shmem_gpr_read_cove(nshmem, KVM_ARCH_GUEST_A6);
+	cp->a7 = nacl_shmem_gpr_read_cove(nshmem, KVM_ARCH_GUEST_A7);
+
+	/* TSM will only forward legacy console to the host */
+#ifdef CONFIG_RISCV_SBI_V01
+	if (cp->a7 == SBI_EXT_0_1_CONSOLE_PUTCHAR)
+		ext_is_01 = true;
+#endif
+
+	sbi_ext = kvm_vcpu_sbi_find_ext(vcpu, cp->a7);
+	if ((sbi_ext && sbi_ext->handler) && ((cp->a7 == SBI_EXT_DBCN) ||
+	    (cp->a7 == SBI_EXT_HSM) || (cp->a7 == SBI_EXT_SRST) || ext_is_01)) {
+		ret = sbi_ext->handler(vcpu, run, &sbi_ret);
+	} else {
+		kvm_err("%s: SBI EXT %lx not supported for TVM\n", __func__, cp->a7);
+		/* Return error for unsupported SBI calls */
+		sbi_ret.err_val = SBI_ERR_NOT_SUPPORTED;
+		goto ecall_done;
+	}
+
+	if (ret < 0)
+		goto ecall_done;
+
+	ret = (sbi_ret.uexit) ? 0 : 1;
+
+ecall_done:
+	/*
+	 * No need to update the sepc as TSM will take care of SEPC increment
+	 * for ECALLS that won't be forwarded to the user space (e.g. console)
+	 */
+	nacl_shmem_gpr_write_cove(nshmem, KVM_ARCH_GUEST_A0, sbi_ret.err_val);
+	if (!ext_is_01)
+		nacl_shmem_gpr_write_cove(nshmem, KVM_ARCH_GUEST_A1, sbi_ret.out_val);
+
+	return ret;
+}
+
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva)
 {
 	struct kvm_riscv_cove_page *tpage;
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index d00b9ee5..8944e29 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -207,11 +207,15 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case EXC_INST_GUEST_PAGE_FAULT:
 	case EXC_LOAD_GUEST_PAGE_FAULT:
 	case EXC_STORE_GUEST_PAGE_FAULT:
+		//TODO: If the host runs in HS mode, this won't work as we don't
+		//read hstatus from the shared memory yet
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = gstage_page_fault(vcpu, run, trap);
 		break;
 	case EXC_SUPERVISOR_SYSCALL:
-		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
+		if (is_cove_vcpu(vcpu))
+			ret = kvm_riscv_cove_vcpu_sbi_ecall(vcpu, run);
+		else if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_sbi_ecall(vcpu, run);
 		break;
 	default:
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 047ba10..d2f43bc 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -10,6 +10,8 @@
 #include <linux/err.h>
 #include <linux/kvm_host.h>
 #include <asm/sbi.h>
+#include <asm/kvm_nacl.h>
+#include <asm/kvm_cove_sbi.h>
 #include <asm/kvm_vcpu_sbi.h>
 
 #ifndef CONFIG_RISCV_SBI_V01
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
