Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACCAD3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=027Tx8+P+eQDAGhC7cEEIr+QJy55Kprc6RMqzhhdZK4=; b=JE1GC5cG0P0fiJ
	cDoQZSNMESRAVn8yQuu78/oDRiY1Tt5ga64p7lO6bR1rbRjWtZEp4KcjfSNZt4lWwQh7m8Uateiy+
	IEmI0V1BcgT7fx/hDf5Ul8mJTTEWJSZ0tM3M7x3JU/eAvF1pzU960StcBDSQpNQV3yKyM9LSw/xms
	tvk+O1Ffkuv1F2y1XM/aCQWYuklvlwkT4hFn8YenVwYhvj0XAPiezij7+iKG/CJk/gMJNjcC01nFp
	GGgJ7B0qvmc/0eE43F+tyVObXvuG+hAHYV+afDVbjTLuRxAXfX49Wty9JS6dO/1iDwWiJV9HiNB/y
	KIOvU7hiD2nrCYqMWSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bug-00000005NCd-1hpr;
	Sun, 20 Oct 2024 19:48:30 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buF-00000005Mqc-2zDI
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:48:09 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso2730649a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453683; x=1730058483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOSHWqnsb0W3cOOf6DyqEOJr3wAY0C67ufwSo4h3/A8=;
        b=l4LueblC9cl48xIHb1RI/FPTmINrDEqUmB8Oc3bhA4aCkuupT/+F06TLZ6YXn6zj/Y
         EeeWdkFKMdIcykflFMR1ubU1VEvxBeqg0VLNk8bK1Sq0rRolBp2b0iuSYkKYfbtXkOvu
         ct4/VrcfRinnZHk18GE9Pj9L+XW4fnb86C6lpfJOEt29cJKWP0MBj+gU55BFNfuWorg0
         CZ7UKeZaWo0fJABbMpTYhy1JIe47npGty9c+ktVI8x/WLjWzqr6slVLNtqSoeGZPDn51
         OkZ1+ZeMb1cagyz+DeZRqFwDtwlGsY740x7N9F14Cr5Bpq7544l28v1kG1GJjwuaoD5u
         7EbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453683; x=1730058483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOSHWqnsb0W3cOOf6DyqEOJr3wAY0C67ufwSo4h3/A8=;
        b=TjYpi1XGymU2BhGkaIGAeT5CaRcI0uNvUNKsClDkWvsV8rNyiiTIm9UZu2PoeSXP2k
         nL1Rltyh9TPLGj/AzSkb7Q44Hsh934CsaZP7/d2w8W4rZasE/hE5cavgzQwrZZrxvxT7
         JwABQIohtIRHfRq3v5gaxrzb8WcB3vEahezFhxBk9kqLD6kvR50fOQl2eHl2auZHFjAt
         /zLpGc3puVPfmSTY2wGE6e18JhUB7gLDtdzXGGpeG5bdAZ3qFCG42pulRQmtmzrgmhIw
         mupHVsJKk8jaIqijobmDyynOMfu0RLRkF+E5235wR49A1LSJ7VZThI+b1ef8u+d4tWVO
         SVWw==
X-Forwarded-Encrypted: i=1; AJvYcCW6hJlx9hyrjoef/7P2V3iPbC12lcnH/i4QvpYEt6TlopKNMm6ygsrac+vFP9Lip2OtirTyQODFEqEQGA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2eZv03OVJLLld2TdNvMiwKTqq7CL8er7w8iMNipQtMNZiwyay
	rFvKbV6O47OFaYlimW9WSHlPxH14YjQjuuOV7L8alluzbbltIJuK8UM1ryue7k0=
X-Google-Smtp-Source: AGHT+IGGt5JhB4IG8+i0HAXwMX0R3ki791FJ5Pz6hTqm+U8OcKSwC7G5E4tWlwhk9qK0fqoTXOXa+A==
X-Received: by 2002:a17:90b:20a:b0:2e2:af52:a7b7 with SMTP id 98e67ed59e1d1-2e561a008ebmr11046511a91.34.1729453682889;
        Sun, 20 Oct 2024 12:48:02 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:48:02 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 10/13] RISC-V: KVM: Use nacl_csr_xyz() for accessing AIA CSRs
Date: Mon, 21 Oct 2024 01:17:31 +0530
Message-ID: <20241020194734.58686-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124803_904930_82518428 
X-CRM114-Status: GOOD (  12.50  )
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

When running under some other hypervisor, prefer nacl_csr_xyz()
for accessing AIA CSRs in the run-loop. This makes CSR access
faster whenever SBI nested acceleration is available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/aia.c | 97 ++++++++++++++++++++++++++++----------------
 1 file changed, 63 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 8ffae0330c89..dcced4db7fe8 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -16,6 +16,7 @@
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/cpufeature.h>
+#include <asm/kvm_nacl.h>
 
 struct aia_hgei_control {
 	raw_spinlock_t lock;
@@ -88,7 +89,7 @@ void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
 	if (kvm_riscv_aia_available())
-		csr->vsieh = csr_read(CSR_VSIEH);
+		csr->vsieh = ncsr_read(CSR_VSIEH);
 }
 #endif
 
@@ -115,7 +116,7 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 
 	hgei = aia_find_hgei(vcpu);
 	if (hgei > 0)
-		return !!(csr_read(CSR_HGEIP) & BIT(hgei));
+		return !!(ncsr_read(CSR_HGEIP) & BIT(hgei));
 
 	return false;
 }
@@ -128,45 +129,73 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
 		return;
 
 #ifdef CONFIG_32BIT
-	csr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
+	ncsr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
 #endif
-	csr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
+	ncsr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
 }
 
 void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+	void *nsh;
 
 	if (!kvm_riscv_aia_available())
 		return;
 
-	csr_write(CSR_VSISELECT, csr->vsiselect);
-	csr_write(CSR_HVIPRIO1, csr->hviprio1);
-	csr_write(CSR_HVIPRIO2, csr->hviprio2);
+	if (kvm_riscv_nacl_sync_csr_available()) {
+		nsh = nacl_shmem();
+		nacl_csr_write(nsh, CSR_VSISELECT, csr->vsiselect);
+		nacl_csr_write(nsh, CSR_HVIPRIO1, csr->hviprio1);
+		nacl_csr_write(nsh, CSR_HVIPRIO2, csr->hviprio2);
+#ifdef CONFIG_32BIT
+		nacl_csr_write(nsh, CSR_VSIEH, csr->vsieh);
+		nacl_csr_write(nsh, CSR_HVIPH, csr->hviph);
+		nacl_csr_write(nsh, CSR_HVIPRIO1H, csr->hviprio1h);
+		nacl_csr_write(nsh, CSR_HVIPRIO2H, csr->hviprio2h);
+#endif
+	} else {
+		csr_write(CSR_VSISELECT, csr->vsiselect);
+		csr_write(CSR_HVIPRIO1, csr->hviprio1);
+		csr_write(CSR_HVIPRIO2, csr->hviprio2);
 #ifdef CONFIG_32BIT
-	csr_write(CSR_VSIEH, csr->vsieh);
-	csr_write(CSR_HVIPH, csr->hviph);
-	csr_write(CSR_HVIPRIO1H, csr->hviprio1h);
-	csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
+		csr_write(CSR_VSIEH, csr->vsieh);
+		csr_write(CSR_HVIPH, csr->hviph);
+		csr_write(CSR_HVIPRIO1H, csr->hviprio1h);
+		csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
 #endif
+	}
 }
 
 void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+	void *nsh;
 
 	if (!kvm_riscv_aia_available())
 		return;
 
-	csr->vsiselect = csr_read(CSR_VSISELECT);
-	csr->hviprio1 = csr_read(CSR_HVIPRIO1);
-	csr->hviprio2 = csr_read(CSR_HVIPRIO2);
+	if (kvm_riscv_nacl_available()) {
+		nsh = nacl_shmem();
+		csr->vsiselect = nacl_csr_read(nsh, CSR_VSISELECT);
+		csr->hviprio1 = nacl_csr_read(nsh, CSR_HVIPRIO1);
+		csr->hviprio2 = nacl_csr_read(nsh, CSR_HVIPRIO2);
 #ifdef CONFIG_32BIT
-	csr->vsieh = csr_read(CSR_VSIEH);
-	csr->hviph = csr_read(CSR_HVIPH);
-	csr->hviprio1h = csr_read(CSR_HVIPRIO1H);
-	csr->hviprio2h = csr_read(CSR_HVIPRIO2H);
+		csr->vsieh = nacl_csr_read(nsh, CSR_VSIEH);
+		csr->hviph = nacl_csr_read(nsh, CSR_HVIPH);
+		csr->hviprio1h = nacl_csr_read(nsh, CSR_HVIPRIO1H);
+		csr->hviprio2h = nacl_csr_read(nsh, CSR_HVIPRIO2H);
 #endif
+	} else {
+		csr->vsiselect = csr_read(CSR_VSISELECT);
+		csr->hviprio1 = csr_read(CSR_HVIPRIO1);
+		csr->hviprio2 = csr_read(CSR_HVIPRIO2);
+#ifdef CONFIG_32BIT
+		csr->vsieh = csr_read(CSR_VSIEH);
+		csr->hviph = csr_read(CSR_HVIPH);
+		csr->hviprio1h = csr_read(CSR_HVIPRIO1H);
+		csr->hviprio2h = csr_read(CSR_HVIPRIO2H);
+#endif
+	}
 }
 
 int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
@@ -250,20 +279,20 @@ static u8 aia_get_iprio8(struct kvm_vcpu *vcpu, unsigned int irq)
 
 	switch (bitpos / BITS_PER_LONG) {
 	case 0:
-		hviprio = csr_read(CSR_HVIPRIO1);
+		hviprio = ncsr_read(CSR_HVIPRIO1);
 		break;
 	case 1:
 #ifndef CONFIG_32BIT
-		hviprio = csr_read(CSR_HVIPRIO2);
+		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
 #else
-		hviprio = csr_read(CSR_HVIPRIO1H);
+		hviprio = ncsr_read(CSR_HVIPRIO1H);
 		break;
 	case 2:
-		hviprio = csr_read(CSR_HVIPRIO2);
+		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
 	case 3:
-		hviprio = csr_read(CSR_HVIPRIO2H);
+		hviprio = ncsr_read(CSR_HVIPRIO2H);
 		break;
 #endif
 	default:
@@ -283,20 +312,20 @@ static void aia_set_iprio8(struct kvm_vcpu *vcpu, unsigned int irq, u8 prio)
 
 	switch (bitpos / BITS_PER_LONG) {
 	case 0:
-		hviprio = csr_read(CSR_HVIPRIO1);
+		hviprio = ncsr_read(CSR_HVIPRIO1);
 		break;
 	case 1:
 #ifndef CONFIG_32BIT
-		hviprio = csr_read(CSR_HVIPRIO2);
+		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
 #else
-		hviprio = csr_read(CSR_HVIPRIO1H);
+		hviprio = ncsr_read(CSR_HVIPRIO1H);
 		break;
 	case 2:
-		hviprio = csr_read(CSR_HVIPRIO2);
+		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
 	case 3:
-		hviprio = csr_read(CSR_HVIPRIO2H);
+		hviprio = ncsr_read(CSR_HVIPRIO2H);
 		break;
 #endif
 	default:
@@ -308,20 +337,20 @@ static void aia_set_iprio8(struct kvm_vcpu *vcpu, unsigned int irq, u8 prio)
 
 	switch (bitpos / BITS_PER_LONG) {
 	case 0:
-		csr_write(CSR_HVIPRIO1, hviprio);
+		ncsr_write(CSR_HVIPRIO1, hviprio);
 		break;
 	case 1:
 #ifndef CONFIG_32BIT
-		csr_write(CSR_HVIPRIO2, hviprio);
+		ncsr_write(CSR_HVIPRIO2, hviprio);
 		break;
 #else
-		csr_write(CSR_HVIPRIO1H, hviprio);
+		ncsr_write(CSR_HVIPRIO1H, hviprio);
 		break;
 	case 2:
-		csr_write(CSR_HVIPRIO2, hviprio);
+		ncsr_write(CSR_HVIPRIO2, hviprio);
 		break;
 	case 3:
-		csr_write(CSR_HVIPRIO2H, hviprio);
+		ncsr_write(CSR_HVIPRIO2H, hviprio);
 		break;
 #endif
 	default:
@@ -377,7 +406,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 		return KVM_INSN_ILLEGAL_TRAP;
 
 	/* First try to emulate in kernel space */
-	isel = csr_read(CSR_VSISELECT) & ISELECT_MASK;
+	isel = ncsr_read(CSR_VSISELECT) & ISELECT_MASK;
 	if (isel >= ISELECT_IPRIO0 && isel <= ISELECT_IPRIO15)
 		return aia_rmw_iprio(vcpu, isel, val, new_val, wr_mask);
 	else if (isel >= IMSIC_FIRST && isel <= IMSIC_LAST &&
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
