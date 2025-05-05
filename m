Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C4BC3ABBF
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCsUYs60jr1Cf6GPhoszmzxMaS1ksThls3YuSyFR31E=; b=fVtdm0zcPCPLMV
	PQTZRWCk1EBG+r1oFS8BKZgT2pN/3YSjsrWgL2TQ6oF8ufiEqp3Bv/qBC9Nv7b0QAtg5+RhyGj1gX
	ABCLL0mGACuyHgDRPL0MO4JuWm3xk01ri+cPV8sKxu7aflA1Tq2KRTtwXicieHXQEfkWCWUzeyu3g
	DBazl12Ld56/WsWgMaZ2Pv0WlHV05WI5ZVPbvu/rEW/5mBujzW+m49QZ7mAy+QVrgmJlG2uovP6HN
	OkhhMz/udzlEqEOsLD5q3hMgumYx+PPAWoLqTLBaEpJhSrmsFmlOn0CbrAi1yHyLRVqrEYEomifpD
	+cNV2QjCl8zTG7RaK5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Yv-00000008dnG-19yQ;
	Mon, 05 May 2025 21:41:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3XG-00000008dKK-3IBo
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:39:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22e15aea506so41898735ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481178; x=1747085978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrOpef+mqFExNdYyOI2IIHYIr3RNpPTOkYkLVHjm6Us=;
        b=CsmX6/7bQzns5iKNGx5MJ5PkjWiFfnx4kfUmmg0Ko/wFhVEVOieV9rrA5HQv7ba+f8
         sJwS6QFKGpOBTQJCmepFUMHFaZUEKw2PyxKEwoKFSVb6XQ5Qs1mlp/nT/wTD8WK5nfgQ
         iqdNtKSrpWR1sBmqoP4j3IWE8lZuHFTBo69QHV8cg2akLXyeQ6ncFWjprj+ngBW9AjdJ
         06JzKjFuIS7v1YjDXmdliQbfz4ZQBwNmwv6v/B5oQ6wjRo/DvMPE6sV7HSzlyBuwvIsc
         y5PC5fk1voYu25nOfysAepQloDog11KOXDRRI5gzWna9kNo7F1NBUrf6a0YbsWoixfO7
         gQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481178; x=1747085978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrOpef+mqFExNdYyOI2IIHYIr3RNpPTOkYkLVHjm6Us=;
        b=CT1qcURpbXk0RR6ML8YrdI2stHIIiEMdO/9G6mNuvu8OKdeOWAAcLHWCAtPDGfMFIm
         NK3IVl+NcdAGmzIR5RIdz1NTBJzqUWWiTux1cW8EGy/2f6WK55cwcWzp+RQqrkAWOaC5
         qPR8kxmoM3O1FmlEKhkJUOGLNwDriJsxb2xSlMYueCdBXFa4gUviQewfKpQs7TLCRlbV
         ZRpceVIMEWnx3XaCEdG9e+WWYUbN5iNR+cY5NW5Xo35++dliRLS+c9QRc28tugGMHREl
         1mY2Alm+q3vX72YBKTad76px3Jo2A8xrk+jB06RPRwncl6b8mVsBVR3tIsgFbPxQIqW9
         jChg==
X-Forwarded-Encrypted: i=1; AJvYcCXEATC2jeImfBGP8FhgzyJR+qgwrP+LXUt1CDHPf0sg/TIw5QE1lY6hG6v5XAqM4Rxyoee2AFUuFWtuZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvwlj44X1UU9s78rlYIfzKL5oxThrKktrAixTUW2Wsv1GeGYL
	Ukzutu5X79G5saefXKqTjnYs1PHm4JSDPUWBb/NHMEYcOMLxXGtL51XnouXkVvg=
X-Gm-Gg: ASbGncs6M4Y9DRcQ8Bz40CGcjEy/4QXAmz0lmxlBLeXb39hyCd+ienaxW4tXKG554P8
	rCZytn8RXBj0tp3D03HqNIM5clAVAy0N0bz7mREzsYMlumEFjDVhTCVtbPmQvYO2QJ3GJ4hCi0C
	iraLzYoAJOIXqau5GEYhrZ4FdiPVqmRbsJAz4Zz/45NmcTwM8jOEEveVunwHm3G40Jxx4Sz1IDN
	s1hV116gHSd7nT1TE81MAMNLAXXsCISpauFw8iwnFvwI0ve+n+eoy4YI8WMxpbPeUOFewrZcf+S
	VYb+rzXexjN59YGN0j90ayM1mn/nZy3Uw2FHIbA+dblx+MeMzzdYTA==
X-Google-Smtp-Source: AGHT+IFfWbZJOYWgohE6peHPOXmV8Bx9l1eOyThbAl9PHsbsWLwC5zSC5Wu3EefTf6bWH77K42NMRQ==
X-Received: by 2002:a17:902:e80e:b0:224:13a4:d61e with SMTP id d9443c01a7336-22e1eb0a454mr122010005ad.51.1746481178148;
        Mon, 05 May 2025 14:39:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:27 -0700
Subject: [PATCH 2/5] RISC-V: KVM: Add a hstateen lazy enabler helper
 function
MIME-Version: 1.0
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-2-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_143938_832656_6E8DE3F1 
X-CRM114-Status: GOOD (  12.86  )
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

Hstateen has different bits that can be enabled lazily at runtime.
Most of them have similar functionality where the hstateen bit must
be enabled if not enabled already. The correpsonding config bit in
vcpu must be enabled as well so that hstateen CSR is updated correctly
during the next vcpu load. In absesnce of Smstateen extension, exit
to the userspace in the trap because CSR access control exists
architecturally only if Smstateen extension is available.

Add a common helper function to achieve the above said objective.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  4 ++++
 arch/riscv/kvm/vcpu_insn.c             | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 350011c83581..1125f3f1c8c4 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -6,6 +6,8 @@
 #ifndef __KVM_VCPU_RISCV_INSN_H
 #define __KVM_VCPU_RISCV_INSN_H
 
+#include <linux/kvm_types.h>
+
 struct kvm_vcpu;
 struct kvm_run;
 struct kvm_cpu_trap;
@@ -44,5 +46,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      unsigned long fault_addr,
 			      unsigned long htinst);
 int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_num,
+					uint64_t hstateen_feature_bit_mask);
 
 #endif
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e6989..3bc39572b79d 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -235,6 +235,27 @@ static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	return KVM_INSN_EXIT_TO_USER_SPACE;
 }
 
+int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_num,
+					uint64_t hstateen_feature_bit_mask)
+{
+	/* Access from VS shouldn't trap if smstaeen is not present */
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	/* Enable the bit in hstateen0 lazily upon first access */
+	if (!(vcpu->arch.cfg.hstateen0 & hstateen_feature_bit_mask)) {
+		vcpu->arch.cfg.hstateen0 |= hstateen_feature_bit_mask;
+		csr_set(CSR_HSTATEEN0, hstateen_feature_bit_mask);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_set(CSR_HSTATEEN0H, hstateen_feature_bit_mask >> 32);
+	} else {
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+	}
+
+	/* Let the guest retry the instruction read after hstateen0 is modified */
+	return KVM_INSN_CONTINUE_SAME_SEPC;
+}
+
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
