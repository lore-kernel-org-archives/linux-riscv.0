Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD03C7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgosGhY9xAV79iZHBAJFY0fo2ImjHh3HbXAZZHWoT+s=; b=ipMJ5uXgoBCbzh
	vhzpznlkFc5VLgtugqILXO5HPK47vJgAuABHyQCDhvCxEub/fTEQICbCnND8+N7dCQlbgpN/NO571
	pYLojfKbDul0MsrJEPPCp2sqkWuXNO6OkPeqPPXPRK25juBoqyMhoMlYvofZ9Zo0Bs/TWQqzIpBM4
	LeBjGbaHHjtvJDYpfZ4eNtrvdQYTWNfcvhwDzkkE/iucFLX3Hjo4oTVUvJSVdk2ImUIaQdkUB1tb9
	Y9HSKcgz8e7ayk4J+ZYLzB3iXVelduuXqgloGSTa338Or9NME27pEFoinAxSTMAsIxPwLTRao1PZQ
	4YomF3W1HmE93FmU02Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWl-0000000AEbm-4A6e;
	Wed, 18 Jun 2025 13:08:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5J-00000009xgt-26PY
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-237311f5a54so8225645ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246565; x=1750851365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0APR23xoSpRoPrmHOoIW/fZKPHEwlO7VgBzBq3Nrcg8=;
        b=Ss8s6WmR+NITNwYcAQffC75UUjSv/wkoGPC0XkF4am3prH5F7PePn2RKtQzmOtxRiy
         Cu3USLCoHF9t/bS9NATI/rSbBDhojCBmM93eU+EfG4KwgBt+0GX91mX7ttYQO4YNWbfJ
         7Jge6bqoqPqdxZroRwETBe39MZAdokAx6f/ufctlOSYDtBa1z3U4HUAq+2JCrNDRflr1
         LukWuRFL0HxL/i89ohcJAdlAhJSHi6OFNAva3j/DhpiPqVaC69dib0Q2kKZr9L8/oJ8u
         31gB+0JVBc0rb9K1Ul0NOFq7ANPK1xqf/uA+qxmXd2bVYreLU7sEKLahGwLtXw3dTWr8
         zkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246565; x=1750851365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0APR23xoSpRoPrmHOoIW/fZKPHEwlO7VgBzBq3Nrcg8=;
        b=Fwrca9WqslLHDfIReEugm2m8LAv2lZEYcw9QA8FkMLRe949oo6Z7gGoqHn8gGNw/hz
         YfmA3GGuTx2TXLDd1cb0QYc4IK6UYaAoGJs8+HoHEqXxqfY7u32klO52+aOsosWLD+CT
         pOxQL4Tg+3PtQbuNztor8NfpEOxiJTyowoouojP6ysw2f27Thg4CDUJl9liJNFp7fLZb
         BiBkaNVscQMQRAKVjIPnrMbn0rvNBT/hMqb4M5qyXhiaS75bmj2DhhvPWaiEoVzFiv+O
         B3KwPVd1XKVu0DQOvY3x/vy/o/BO+Uzpw8XEesjhBBDtMPO7pfJyh5H6NJb9JwC2mzlg
         xiKA==
X-Forwarded-Encrypted: i=1; AJvYcCWbqXfLS/I6nfX3wZ130DEp6SIawL5V4NV+eYrNJxxExhtMVVYI4i9Ll8byaQ0G0I6bi0EBqO1d40iIaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuG8ksyuvi5zb4FLg20wXYClz5c7V8P+cxOrZbYkxqi0wuvwyq
	pE14a2RYKSLNIBny6/Eu54ykpvpV4p33/J1LcaBslXPvZ9EaOzuAZjRIwDkfr2uNt3w=
X-Gm-Gg: ASbGnculLikP8+IARttQoAqC3N7mNZQuZw1JFLmMGObln2CbxrquzaFvN6zEZEikYhF
	t/e0aW7H0sPhqI5xhdTUa0iHbPccJQxNu/wlUj7wwKVTfzNJMBuzKtiTbMkWbMtTEH63khMBOHI
	w8n1L9yOrA3ldplnLb2Ah3FRePJgYtjSY9CotxEGeBSBELa+2U8T/0Z7abV9d5I1Eng6d8bd5vu
	C0o+7vihVgR9T1Qb6hPeyWefr7yuEEed+ly0r9sKMguHFfAVVarfw7fvtgHQ7LDt9PAu5qzSlYm
	Ao7n/0g429NzCdZqVozra0A/TbsXw59tbLmzovRIjQjH4I0Tgysz86tnL0iLcgOC7AR5hE0pR0D
	4cONlm00iIQIB1RANVwu2YBJOoznZ
X-Google-Smtp-Source: AGHT+IEI/VNLAuRLYdIAweMxNEdH8gXS8v8LyQf6sVKwZcSZW1oY61MqIeM//ad3SI9TL8TSIJCUlw==
X-Received: by 2002:a17:903:1ac5:b0:234:bc4e:4eb4 with SMTP id d9443c01a7336-2366b3e2ff9mr227196035ad.51.1750246564794;
        Wed, 18 Jun 2025 04:36:04 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:04 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 04/12] RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with KVM_REQ_TLB_FLUSH
Date: Wed, 18 Jun 2025 17:05:24 +0530
Message-ID: <20250618113532.471448-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043605_537926_6A733D02 
X-CRM114-Status: GOOD (  12.23  )
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

The KVM_REQ_HFENCE_GVMA_VMID_ALL is same as KVM_REQ_TLB_FLUSH so
to avoid confusion let's replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
KVM_REQ_TLB_FLUSH. Also, rename kvm_riscv_hfence_gvma_vmid_all_process()
to kvm_riscv_tlb_flush_process().

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 4 ++--
 arch/riscv/kvm/tlb.c              | 8 ++++----
 arch/riscv/kvm/vcpu.c             | 8 ++------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8aa705ac75a5..ff1f76d6f177 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -37,7 +37,6 @@
 #define KVM_REQ_UPDATE_HGATP		KVM_ARCH_REQ(2)
 #define KVM_REQ_FENCE_I			\
 	KVM_ARCH_REQ_FLAGS(3, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-#define KVM_REQ_HFENCE_GVMA_VMID_ALL	KVM_REQ_TLB_FLUSH
 #define KVM_REQ_HFENCE_VVMA_ALL		\
 	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HFENCE			\
@@ -331,8 +330,9 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
+
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index b3461bfd9756..da98ca801d31 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -162,7 +162,7 @@ void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 	local_flush_icache_all();
 }
 
-void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu)
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
 	unsigned long vmid = READ_ONCE(v->vmid);
@@ -342,14 +342,14 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 	data.size = gpsz;
 	data.order = order;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
-			    KVM_REQ_HFENCE_GVMA_VMID_ALL, &data);
+			    KVM_REQ_TLB_FLUSH, &data);
 }
 
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_GVMA_VMID_ALL,
-			    KVM_REQ_HFENCE_GVMA_VMID_ALL, NULL);
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_TLB_FLUSH,
+			    KVM_REQ_TLB_FLUSH, NULL);
 }
 
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a2dd4161e5a4..6eb11c913b13 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -721,12 +721,8 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_FENCE_I, vcpu))
 			kvm_riscv_fence_i_process(vcpu);
 
-		/*
-		 * The generic KVM_REQ_TLB_FLUSH is same as
-		 * KVM_REQ_HFENCE_GVMA_VMID_ALL
-		 */
-		if (kvm_check_request(KVM_REQ_HFENCE_GVMA_VMID_ALL, vcpu))
-			kvm_riscv_hfence_gvma_vmid_all_process(vcpu);
+		if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
+			kvm_riscv_tlb_flush_process(vcpu);
 
 		if (kvm_check_request(KVM_REQ_HFENCE_VVMA_ALL, vcpu))
 			kvm_riscv_hfence_vvma_all_process(vcpu);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
