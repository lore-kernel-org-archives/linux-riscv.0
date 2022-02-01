Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10976C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 08:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0hjarM0NhbrsePZ1CQl2C/blnRT/HmOWxneS31xU64=; b=K3SONS3XQXEtII
	yIltg4xeQPsHfxtaZFtgJVIl2na+qNLO6rEA1fJs9B1JpoFoJ41Sc5CdLw6nnfKL6gjKhkeaoBwEi
	VYiZOptHk5mAZAE5lwabW/MRzCapVtcGMBE+RDWQ96Mk6GDkwDY8zE2j3L2UOR5wfAggYeJZRi05l
	8q9/FSEf5K/tcQQViBUBXhTaNogoqbJWUDO0OlO/k7Kr7j8N0Q3/WTy0wkEmvPG2s6slXi4a97DHx
	YS/J2XpVZyXeUNbZh844wecWyAAWhAwOJd8vD4Y0RVqZTCuCD+W8/twJwrBfOeSQVL+1PlDQpK79K
	yChguxQ78RWYidt7eZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEoSP-00BWHE-Mx; Tue, 01 Feb 2022 08:24:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEoSL-00BWCK-Of
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 08:24:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id jx6so52022293ejb.0
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 00:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l+b47qbaWpdYZN1v9p/s3UrPnbfSBgqc+qjFPZYSPg0=;
 b=QdDeIW90ozVxbtAs28LtZP1SR1njpEwqySsxBFUYrwcKkO/9ik8SD7e63/ORdLuKN6
 HyI3LupM10HaQJNfSiNGnwUgMsJjBe6rmEY71RUCVouSgN2Ww0ih1X5/il7CocKD9jmG
 e5UutqWNP6FOjWmhNqdxTTF5IP65/y2m8Y7DezBkqTOkFj0jP2DTWUAHUNLzCaqt0i7s
 UjBVdk5uVAxkNDd3LrfDYJwUdzSiJbvQ8ICYedqx1BtTCqJrVx2FgSPFfgzmM8UPEfvd
 0QPBGawu4zge1Rk2p7MyHEyooujXJtLlCTeJIQsuvkJSwOX5TavDG/J9JFJUOqdhbPrb
 gLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l+b47qbaWpdYZN1v9p/s3UrPnbfSBgqc+qjFPZYSPg0=;
 b=oJ3uP25HDCdryU2w+Wbygjx/RPlw/vXWbH++ugOS5cAr4cVxgHW6dk3yGtgtRMfTcg
 NW4YzIq0XagVH6UvzRCAWNMI8SVBWLJck1pmX3bB94WYe/BEouudfXggw0vcJrnawH9i
 5wqx0+ekRcwowachIrO09UTMrQLBcDT6tPorBbiSSECnILe6WnrRrvnSGypX837cDNk5
 9qJyem+r2w88NhyhvcoWvj3YQVQF0TxUzwQfWNd287QdeByHxLfmkfERwPbiy0jWL7iX
 7K9xjWmYwiBrZi5DZKigwbM9bygbboU4GbKC22dSkIm7SagW5zwMpyQTxWYOu/wInnG5
 20yg==
X-Gm-Message-State: AOAM532vNdiOlpVshbEfGzXz45duUS5wJhm9efVm8bQ6qqf1JdyXOg/J
 I+AZ+lepYFZL4LD7ovgM7T9yRQ==
X-Google-Smtp-Source: ABdhPJyt0wfNRFp/hPqRprYBU3q50Km0sidGpnOTXlGuTS40cAb2L7ml6sR8ZEkCU0opyyQARlSJ+g==
X-Received: by 2002:a17:907:6293:: with SMTP id
 nd19mr19620284ejc.64.1643703844251; 
 Tue, 01 Feb 2022 00:24:04 -0800 (PST)
Received: from localhost.localdomain ([122.179.76.38])
 by smtp.gmail.com with ESMTPSA id w8sm14312133ejq.220.2022.02.01.00.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:24:03 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/6] RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
Date: Tue,  1 Feb 2022 13:52:26 +0530
Message-Id: <20220201082227.361967-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_002405_851931_8452953E 
X-CRM114-Status: GOOD (  12.27  )
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

The wait for interrupt (WFI) instruction emulation can share the VCPU
halt logic with SBI HSM suspend emulation so this patch adds a common
kvm_riscv_vcpu_wfi() function for this purpose.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  1 +
 arch/riscv/kvm/vcpu_exit.c        | 22 ++++++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 99ef6a120617..78da839657e5 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -228,6 +228,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu);
 
 void __kvm_riscv_unpriv_trap(void);
 
+void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu);
 unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 					 bool read_insn,
 					 unsigned long guest_addr,
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 571f319e995a..aa8af129e4bb 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -144,12 +144,7 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu,
 {
 	if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
 		vcpu->stat.wfi_exit_stat++;
-		if (!kvm_arch_vcpu_runnable(vcpu)) {
-			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
-			kvm_vcpu_halt(vcpu);
-			vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
-			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
-		}
+		kvm_riscv_vcpu_wfi(vcpu);
 		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
 		return 1;
 	}
@@ -453,6 +448,21 @@ static int stage2_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	return 1;
 }
 
+/**
+ * kvm_riscv_vcpu_wfi -- Emulate wait for interrupt (WFI) behaviour
+ *
+ * @vcpu: The VCPU pointer
+ */
+void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
+{
+	if (!kvm_arch_vcpu_runnable(vcpu)) {
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		kvm_vcpu_halt(vcpu);
+		vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+	}
+}
+
 /**
  * kvm_riscv_vcpu_unpriv_read -- Read machine word from Guest memory
  *
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
