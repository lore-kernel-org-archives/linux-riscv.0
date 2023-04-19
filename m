Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D71BC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2e3yKCmmXyJVMLmHisDMBSAbwu0P1wv8JD2X6/XQ2M=; b=YEfPujtNi/jDmK
	tKYIjPnwoDTiG34kOBRrbZr9SWricHEuRXgvwC3XQpTFpCXgebG3HSdOVhHMluMgtPrz3hgzAd4+x
	zt/rbHEbb7ct6jj2f9K7DoZN3wfFef2p48/eSpkYEfPvD85LCM4oT9+lrhkp0ZcEH6Ng9PBd5Ua3Q
	ARi9CwOKImxKuSogYBIyLpKcMaP9Zdo8mTX7llJBPocnZzMHyM+ysSDmd5478ojgJtxBBw+SKa8+H
	Eggzdi8Jlo50zB3Go1OkpHjcaYgdUO3Lk1GBkqHilxa2Awcpug5w+OYWz/KoTkvH7V+w9pQ2wRSk8
	ieyIqx6bONXPTNVUkf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7w-006T3T-1x;
	Wed, 19 Apr 2023 22:18:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7t-006SnP-1I
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a69f686345so4527095ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942689; x=1684534689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbUa6ryrerMYndbR89JSXBoBIycYIOI5MWjMv8QTenY=;
        b=EpHc5rfijGiS9cvhe3gxGYJxsSuAlVbG/pIJOuFJNosZx/VFQeVfm0eSrlDMuReSFj
         7ypZdw3QjuxdW55Zh8SHxl8sc3yXVSNROJW2fjaa+26b7equVpWpnxFDYreqHSbXDwun
         vUfn3kQvN844BJ2Z55UTjnK33zctXOKmEJb38uE3yoQBIsr74T/OcqMWb3KweGfTU4Yi
         yYPd+HV7CeU/AvlBhTKuqFAlbX3z2KwharbhJqAcrRnAlg1XHGRRtMmnLgMuCDk8ejGu
         HvdE2AEcRzhomKSg5akQJMWerijQ4tiFWsNpofhgVRA19F6Cu15/PaXEiC7xDxP0NCRj
         VY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942689; x=1684534689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbUa6ryrerMYndbR89JSXBoBIycYIOI5MWjMv8QTenY=;
        b=e6VeLPyOFjRUzknzf5PQMk5rpxLhwHljNt0FcFLfvPdZzYGu5t2SRqzyq/KC1TIoLP
         mcjjnw1LYtWZDcJ1YN9vvgcDGFfnivh8XAwB6R9cWUbdQ2exK2UuRkryG53ylbFbKew8
         pnjTp4ziAEw/RaxynBsCPsMGOjLhvnNBdozu9mkCVFSU8fEixjx1EliqR6KmdyvScWXN
         exI1YGqK53FSXR8fj9K6Nv+apK5GVR3d658ZE7sOB/j/5tdN5g3L6UetZpl8zjwNJLb6
         vxpesDHO8GL26Vb2EG6Tu+Vqw1jR6ArjwXytqGUdYO9YMYJA81LO/zjDl7bAszBfH+fi
         qPcg==
X-Gm-Message-State: AAQBX9e0HXNuQdF4qd06vEW332lPj49u8/uHHHaEYFXy8jkOgiqy8Zc0
	y+kXPaN+4ZQogIVaotzQwtPllQ==
X-Google-Smtp-Source: AKy350bOrY/ltn4aOC/irJe3I2c3DHWQXEGnacE0hKIRD44viSqKcVds6P+5HuawRV2gn0DMpSc7nw==
X-Received: by 2002:a17:902:e80c:b0:1a8:32e:3256 with SMTP id u12-20020a170902e80c00b001a8032e3256mr6684314plg.35.1681942689090;
        Wed, 19 Apr 2023 15:18:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:08 -0700 (PDT)
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
Subject: [RFC 18/48] RISC-V: KVM: Skip TLB management for TVMs
Date: Wed, 19 Apr 2023 15:16:46 -0700
Message-Id: <20230419221716.3603068-19-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151809_437911_F3272319 
X-CRM114-Status: GOOD (  13.76  )
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

TSM manages the tlb entries for the TVMs. Thus, host can ignore
all the hfence requests or tlb updates for confidential guests.
Most of the hfence requests happen through vcpu requests which
are skipped for TVMs. Thus, we just need to take care of the
invocation from tlb management here.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/tlb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index dff37b57..b007c02 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -15,6 +15,7 @@
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 #include <asm/kvm_nacl.h>
+#include <asm/kvm_cove.h>
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
@@ -72,6 +73,14 @@ void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
 
 void kvm_riscv_local_hfence_gvma_all(void)
 {
+	/* For TVMs, TSM will take care of hfence.
+	 * TODO: We can't skip unconditionally if cove is enabled
+	 * as the host may be running in HS-mode and need to issue hfence
+	 * for legacy VMs.
+	 */
+	if (kvm_riscv_cove_enabled())
+		return;
+
 	asm volatile(HFENCE_GVMA(zero, zero) : : : "memory");
 }
 
@@ -160,7 +169,7 @@ void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
 {
 	unsigned long vmid;
 
-	if (!kvm_riscv_gstage_vmid_bits() ||
+	if (is_cove_vcpu(vcpu) || !kvm_riscv_gstage_vmid_bits() ||
 	    vcpu->arch.last_exit_cpu == vcpu->cpu)
 		return;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
