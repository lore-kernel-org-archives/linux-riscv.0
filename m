Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD6CC77B60
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5zEoLX61xg0ihGJ+qNaTwq40PiaVpoUso97Lt/kups=; b=YPF+ckdqLr5x5p
	ok/okTkU7tQJsMp+Yja36jwk5kkwN350QzPM0M0KD/VNrLsLpYMXOMKv9eky0q+sU00vKt3x/3jVu
	kupZScXwle4Cs4O0v89bFViUvq7ZxLxmjIsq8k+zC8nEClALu6q8cmS7hiWyFpWe2Vnk67/qHj+R2
	H+kkje/eAGNSxRnZUGExZf44D3EOHwDYHn7NtlWGY48uvrjj9A4uOlk33+7Z8OgyB2a8HzcQIJ9TO
	9G9+XRhygs3UWViVG6NRS1ziqnTBVqcc788pMyxffNrfvnbhf30acnVZnPZ3lSRERX1Zl8ntJRKrg
	UuLBGquoL1O527ToJ0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjih3-0021GI-1O;
	Tue, 04 Apr 2023 15:35:33 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjih0-0021EN-08
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 15:35:32 +0000
Received: by mail-oi1-x22a.google.com with SMTP id bl22so10504236oib.11
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680622528; x=1683214528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8TEjnpfsG0YBkFpXJqRz0n2LVNq8aVMjA0y3Jy/fOE=;
        b=R8GvpSrBlRVtzdy7QE6yC/ZRRvUGif0e60w3klyhPfie6rPyttPKb2XZyWhf9NyVOb
         rr4WUz9BGwCJk8umvaRGdc1VdNTKeYll1CeGoRN92PcoRjBjH/SzMhJUhhLyNkygiX+2
         W6o9vH68YzbNY2AJ2KQZn0CsB5Avgp86aqxgJIr2skgX3Ze6+xX6cM+7g+Y2IsAIpA55
         CooSbuRrrbHDnfw0VPbuuuYDSE4h9pf8TWa3v6OF1N0jTicm1R603IXm6da9F1zb5CVY
         VFKiUI/8WC5XI4Jjzvhd/alRKcU41asb1NvaTcco9k6BHgsz+whY3B3lMWPhM1TlI4U4
         Mc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680622528; x=1683214528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8TEjnpfsG0YBkFpXJqRz0n2LVNq8aVMjA0y3Jy/fOE=;
        b=vagMduL8KBbeWz/6j/gEg1UfrrVsmh/vHyDRJ4kFP29yK2swlfPSjWg3qM2sK/iqGG
         U9lO1PGoeyz9XqvJDcj6R0YgWPdEh7xrPIj59Yv5kIylMRZbp8UH3cMBJJAcUHB9xuZS
         0glXCjZuE6nWybR21o8wntF8b+WQAQUzjwZIDVitFqaLWIZ9apa9/0F5jeo350cJXhMq
         yvcxf567ZKVP4iSqiBBB1Q1wsVCGjFX8f1JF43lCMdSAg6ZT4PPvsY19IK51CWmSGr6J
         TTEGS1txBE/zMnQZW2pyOYUHwnfJDF/Zvd+fR8HOYB1NzU+feY0Tyc+ETIOFVBY4S0Jz
         f9Bg==
X-Gm-Message-State: AAQBX9eaw857ZwbmZhhHq+MD22NrCyCDi/F8adqDG9wJP3T6iT9ygxUY
	X4uQ7rNUlttGEY8PafKajS7cYg==
X-Google-Smtp-Source: AKy350abi9ZPwjKPuTDiT1EXmWzz6cc776r4fwIEXnAScuexVNrJX78mURxtWegNGUjBSuUxFB2qwg==
X-Received: by 2002:aca:d944:0:b0:384:3cc0:9ffd with SMTP id q65-20020acad944000000b003843cc09ffdmr1507886oig.9.1680622528446;
        Tue, 04 Apr 2023 08:35:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w124-20020acadf82000000b00387384dc768sm5325803oig.9.2023.04.04.08.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:35:27 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 3/9] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
Date: Tue,  4 Apr 2023 21:04:46 +0530
Message-Id: <20230404153452.2405681-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_083530_119273_94EEB6F3 
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

The hgatp.VMID mask defines are used before shifting when extracting
VMID value from hgatp CSR value so based on the convention followed
in the other parts of asm/csr.h, the hgatp.VMID mask defines should
not have a _MASK suffix.

While we are here, let's use GENMASK() for hgatp.VMID and hgatp.PPN.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 12 ++++++------
 arch/riscv/kvm/mmu.c         |  3 +--
 arch/riscv/kvm/vmid.c        |  4 ++--
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3c8d68152bce..3176355cf4e9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -131,25 +131,25 @@
 
 #define HGATP32_MODE_SHIFT	31
 #define HGATP32_VMID_SHIFT	22
-#define HGATP32_VMID_MASK	_AC(0x1FC00000, UL)
-#define HGATP32_PPN		_AC(0x003FFFFF, UL)
+#define HGATP32_VMID		GENMASK(28, 22)
+#define HGATP32_PPN		GENMASK(21, 0)
 
 #define HGATP64_MODE_SHIFT	60
 #define HGATP64_VMID_SHIFT	44
-#define HGATP64_VMID_MASK	_AC(0x03FFF00000000000, UL)
-#define HGATP64_PPN		_AC(0x00000FFFFFFFFFFF, UL)
+#define HGATP64_VMID		GENMASK(57, 44)
+#define HGATP64_PPN		GENMASK(43, 0)
 
 #define HGATP_PAGE_SHIFT	12
 
 #ifdef CONFIG_64BIT
 #define HGATP_PPN		HGATP64_PPN
 #define HGATP_VMID_SHIFT	HGATP64_VMID_SHIFT
-#define HGATP_VMID_MASK		HGATP64_VMID_MASK
+#define HGATP_VMID		HGATP64_VMID
 #define HGATP_MODE_SHIFT	HGATP64_MODE_SHIFT
 #else
 #define HGATP_PPN		HGATP32_PPN
 #define HGATP_VMID_SHIFT	HGATP32_VMID_SHIFT
-#define HGATP_VMID_MASK		HGATP32_VMID_MASK
+#define HGATP_VMID		HGATP32_VMID
 #define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
 #endif
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 46d692995830..f2eb47925806 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -755,8 +755,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	unsigned long hgatp = gstage_mode;
 	struct kvm_arch *k = &vcpu->kvm->arch;
 
-	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) &
-		 HGATP_VMID_MASK;
+	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
 	csr_write(CSR_HGATP, hgatp);
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 5246da1c9167..ddc98714ce8e 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -26,9 +26,9 @@ void __init kvm_riscv_gstage_vmid_detect(void)
 
 	/* Figure-out number of VMID bits in HW */
 	old = csr_read(CSR_HGATP);
-	csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
+	csr_write(CSR_HGATP, old | HGATP_VMID);
 	vmid_bits = csr_read(CSR_HGATP);
-	vmid_bits = (vmid_bits & HGATP_VMID_MASK) >> HGATP_VMID_SHIFT;
+	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
 	vmid_bits = fls_long(vmid_bits);
 	csr_write(CSR_HGATP, old);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
