Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3601AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88vxlI8BBaBQkq6VwRZbfzE4Qe44SnaBD/9BXgo/yms=; b=AkcoDyCfNRZ3cT
	ZpNbjPHCLZWmCkE1DvQIsHEOjHaiur803KjmrFco9tmK/gXrQGNeb1tBlSGWiqny3eOiexwbSw+NC
	XjVshMWuGANzZoZAC3czq6qhsmWP4exjep49+TV4csvjUr6jt2+BVd/rbjm870cgpGNZgHeugFlj2
	1bJ7iJ8zZMWt2Y46QsxEa6iy2VtguLeNGRlH234Zb/e+xqdFtT5sHwheNUfgZWr80QeDEjw6JPHmi
	IfYH3ft1RNFa7cGlvXovd42NqUo7T7WqLO0fnJa6PFB3Uy/H1WUjIWmTGRtNYO5upfRRHud22tecQ
	X25ck7MZEKcnsMfBWsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9St5-00GdUx-QM; Thu, 07 Jul 2022 14:53:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssu-00Gd9Q-Po
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:53:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id j3so7237169pfb.6
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 07:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WpHsot62A1gxRtl/GwHVpqtU/9pvy/riu/S/EvqjSyI=;
        b=Tr+JEW+ZEJKGKjheUXFYk1x2N+wl+60t3vWoFftJlnngVr5Fn8nG/d/DAFcSbs43W2
         /VG1G2R+hotACgnJtCU8uZizBmJnDagJkQgQHnuXttm8t+3FxEBK4+yF49vDQCNID/t4
         Wy8b36vc1qtdBmA/pC8w6AQJmap0P0ga50OlDxZ/ENzSCraCmR9qdFJBA5g4HspWcZ08
         Wq3e+F+hW28ezbmPPzcUMbku6kijzfLAArAV2XmwQaJ8/kubSOKHefcYtXzHJ4ncvLfF
         NN8ydnb6UQg87FrvYETD0a7THG40DVM0N3yfyrxxK9reogFpPAlJ603vcK3KnQruxwiX
         ouZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WpHsot62A1gxRtl/GwHVpqtU/9pvy/riu/S/EvqjSyI=;
        b=lyxJqRCeQTEI2wzh7Pxh+6w6CU0cg1CNnpd+/nxuw306Aj8K14rvyjj1bkwND/JlrS
         dx+4UDCqM97uTARTsVOXBci4FyB6vivo3GAktIyvJZUV5ssDMzsFN4AAtIwokzIg7xwS
         VLWyUrHTC+5jCXe4MPYQ/m0fuML/rKVbx9pv/2wc8AinWcOR6hCP/v815Y5lyIZtBVD1
         1z/WyocG75UaP7Yy/d3iW47mAzcqPhJJP7n5VzZWT1JCER3p0hvQoXVhNtdbq9YF4Tqc
         n0iqgfRfx0yyVSyTEYAobt6cMWat/LZz90tcFXZmozdMhhnH7WMr8hmOGs/aEm041pRN
         gezg==
X-Gm-Message-State: AJIora9v5jLjjMjZpnvkZ41X/3GYYLUz64MFqZh1GZIBkKTia/rQ+5vv
	9o5hWxFSe3oXbKDUbyHBwHworQ==
X-Google-Smtp-Source: AGRyM1udvP3EHnOxHavdQ9dg0S+DvvpOEeaXRNKFmeLh8kDulADIUcXvLlMeJora4NRhq2LMa6dnug==
X-Received: by 2002:aa7:9a11:0:b0:525:2412:920a with SMTP id w17-20020aa79a11000000b005252412920amr54805086pfj.66.1657205620353;
        Thu, 07 Jul 2022 07:53:40 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([223.226.40.162])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7951a000000b0052535e7c489sm27144231pfp.114.2022.07.07.07.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:53:39 -0700 (PDT)
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
Subject: [PATCH 5/5] RISC-V: KVM: Add support for Svpbmt inside Guest/VM
Date: Thu,  7 Jul 2022 20:22:48 +0530
Message-Id: <20220707145248.458771-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707145248.458771-1-apatel@ventanamicro.com>
References: <20220707145248.458771-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075340_857729_0DD33EFF 
X-CRM114-Status: GOOD (  12.64  )
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

The Guest/VM can use Svpbmt in VS-stage page tables when allowed by the
Hypervisor using the henvcfg.PBMTE bit.

We add Svpbmt support for the KVM Guest/VM which can be enabled/disabled
by the KVM user-space (QEMU/KVMTOOL) using the ISA extension ONE_REG
interface.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h      | 16 ++++++++++++++++
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6d85655e7edf..17516afc389a 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -156,6 +156,18 @@
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
 				 (_AC(1, UL) << IRQ_S_EXT))
 
+/* xENVCFG flags */
+#define ENVCFG_STCE			(_AC(1, ULL) << 63)
+#define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_CBZE			(_AC(1, UL) << 7)
+#define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_CBIE_SHIFT		4
+#define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
+#define ENVCFG_CBIE_ILL			_AC(0x0, UL)
+#define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
+#define ENVCFG_CBIE_INV			_AC(0x3, UL)
+#define ENVCFG_FIOM			_AC(0x1, UL)
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
@@ -252,7 +264,9 @@
 #define CSR_HTIMEDELTA		0x605
 #define CSR_HCOUNTEREN		0x606
 #define CSR_HGEIE		0x607
+#define CSR_HENVCFG		0x60a
 #define CSR_HTIMEDELTAH		0x615
+#define CSR_HENVCFGH		0x61a
 #define CSR_HTVAL		0x643
 #define CSR_HIP			0x644
 #define CSR_HVIP		0x645
@@ -264,6 +278,8 @@
 #define CSR_MISA		0x301
 #define CSR_MIE			0x304
 #define CSR_MTVEC		0x305
+#define CSR_MENVCFG		0x30a
+#define CSR_MENVCFGH		0x31a
 #define CSR_MSCRATCH		0x340
 #define CSR_MEPC		0x341
 #define CSR_MCAUSE		0x342
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 6119368ba6d5..24b2a6e27698 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_H,
 	KVM_RISCV_ISA_EXT_I,
 	KVM_RISCV_ISA_EXT_M,
+	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6dd9cf729614..b7a433c54d0f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -51,6 +51,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_h,
 	RISCV_ISA_EXT_i,
 	RISCV_ISA_EXT_m,
+	RISCV_ISA_EXT_SVPBMT,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -777,6 +778,19 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 	return -EINVAL;
 }
 
+static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
+{
+	u64 henvcfg = 0;
+
+	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
+		henvcfg |= ENVCFG_PBMTE;
+
+	csr_write(CSR_HENVCFG, henvcfg);
+#ifdef CONFIG_32BIT
+	csr_write(CSR_HENVCFGH, henvcfg >> 32);
+#endif
+}
+
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
@@ -791,6 +805,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	csr_write(CSR_HVIP, csr->hvip);
 	csr_write(CSR_VSATP, csr->vsatp);
 
+	kvm_riscv_vcpu_update_config(vcpu->arch.isa);
+
 	kvm_riscv_gstage_update_hgatp(vcpu);
 
 	kvm_riscv_vcpu_timer_restore(vcpu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
