Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B96CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 10:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T1OtBftXc64if2j5VUfCGvDnMgKBV7JIXlB8U795n/s=; b=3uyRdrXckhvyWk
	ZN8QZWOXr8aHg548nJDdlpkevOyyju4lTlufund6wiH1GkAmwkPIVpSQ7A/TMyy6ptk/mq+cYqJVi
	393nx0Xdn14yulDkKZc/h5gp829jLXfjIYjk4B19orRV40SY68QSK2lz++XYo+Zq/+5djyL6/Ak3p
	YqEuKExeSXbuhWe6r8sIpQl610t5EiomLBFUr/l5lOxYeahhlqR1eKTTGEEvDwCRJBN+jI+L8gONT
	YFoHneDo4ej27eD3bPiTnM4wxBiuae4tyMwB9htvC8koV6PUwcFcBUizs8RlhagXCMhFQ9oTOYG6x
	qmqpvmTm29TQHWwe5arw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3vk-0000000B75C-3PN2;
	Fri, 26 Jun 2026 10:37:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3vi-0000000B73b-0SdM
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 10:37:03 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c7f385883cso3142535ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782470221; x=1783075021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2M7OHV5QInlnhYwnvp8dS/LgAte/nTo3qzO+dATYE0=;
        b=XYMCAY/IASBhHLgy3pY11WoU4ln/Qu6JJMsnl3XVgRbPfkA7usw17x9ME1sNowPVJD
         a89bQSKYWVHx9d6w6Or5gQayW2qSC4TIcUghkPgMC30l92ez+dfMUcTfA852enmVkQst
         svJ8sg48KZPu+WcEXHugWnzIXJI1YvrX2hc4nKv9r3JwZsIR5BDbuSUJZ+TzQsMJlgFn
         Hd7WhAK6NelmHUsPmTphEJ11gXrdkzDRgNlsFDpxTOdY+h4Qnzy4zGeXMokDFMNr4P6n
         Pqrd0TOXNMZCQc/3kodCakeyrF4nvig0a2M2wjw9NCMmpCFeoLFnP4FKF2ib0AWbLToV
         EOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782470221; x=1783075021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2M7OHV5QInlnhYwnvp8dS/LgAte/nTo3qzO+dATYE0=;
        b=G5AKNP2bgg5paW4YbdH31deoprtmVJbn8TjuN9Ci5iUfqyhlShhKZwEhbNm0bH4wLQ
         YziAWmZFf1nwyS6ZnAt8CMypI2zLV8Ha5Y1nLnAIfidMPr0XHsoQA1EFIj1PD0rGIymw
         Hig0GXTyLol38t+jxeUVsLj21H76+pGpVre3DVsx8y0+6Vf0V9ExIfEztmL1lYRqwK/3
         XPXaRvOimuBO46pWik2ausFnzgdxvRjT7I83aJAXnQGi75PSuMhzEXb9+5ug/2+1wbrE
         P+8Wtn8E+SJ095HIomhhdzR6E0gGinoxEpbRq0EZneIw5iACA2D3d9+EU1ItD8YNO39a
         pXHg==
X-Forwarded-Encrypted: i=1; AHgh+RqPum7QT824OS3+GKHSMLB6LLhuKzRwsK5VLBBxKCNJUOlPD9nC3T5qNZoIrp+29ScfqVK0OkNDFjT4BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwF0pIOZGzYEgVfv66HCJ6dg5IdQ9DXW1vy12Fre5hIxr+9JJVH
	SxpWQ7SKlLC4GQBoDMruUtr+cqlKuXXTVP7W4FwnrQyROHLH948Ef051
X-Gm-Gg: AfdE7ckVzLpYslyu+Dnjh2gwSJkV6iVrY9npAnXwJ6qREnoH2umZyvo46bDERAVSCs+
	KRLFcOZ61GYWnxgCLspybVqUY8MDfd4v739AOpAFCrMD2mbn4DXChAD83cbYo5b0jIvd04JPUvZ
	yLgDej5moUQXptELj7appXXQu2erDTH8m8Zl2IXi/X8w55/Sd1seIzfTwiNbDw/7YHU3TF1LbpP
	/zmCKExdXs4CQiz8v+4GytsAvdn9C1HQWXHFKokkwX26RYzGZrq0rQWzVorVcS4h0rgvr7d5aoU
	qxdjvmL/PqksZxbcVXZEgZAiNSC/Q9zfBDu5iZziZgJ8/foTu3XICB2/Yc6DdN1o+RNxcvxVG6y
	Hz9V6cLiHIaYrTleyWXxt9eFJarmBoNUJE2aP9drG6kd8pbLEguwmhMA+FrTi1ApWdYwFE2GpRR
	B3bjfRHzXoLtXYgC2vpcflqj3IlftC/40=
X-Received: by 2002:a17:903:1b65:b0:2c7:f65a:526c with SMTP id d9443c01a7336-2c7fc68d7bdmr60104035ad.11.1782470220816;
        Fri, 26 Jun 2026 03:37:00 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64cfdcbsm36298835ad.62.2026.06.26.03.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:37:00 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Yuhang.chen" <yhchen312@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	"bingyu . xian" <shanbeenyoo@gmail.com>
Subject: [PATCH] RISC-V: KVM: Add arch-specific tracepoints
Date: Fri, 26 Jun 2026 18:36:19 +0800
Message-Id: <20260626103619.174179-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_033702_183789_E9F06784 
X-CRM114-Status: GOOD (  16.39  )
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

Add RISC-V KVM tracepoints for events that are useful when debugging
guest exits and in-kernel emulation paths. The existing kvm_entry and
kvm_exit tracepoints are kept, with the kvm_entry PC format fixed to use
zero-padded hexadecimal output.

The newly added tracepoints cover:

* kvm_guest_fault for G-stage page faults
* kvm_irq_line for userspace IRQ injection
* kvm_mmio_emulate for MMIO load/store emulation
* kvm_timer_update_irq for VS timer interrupt updates
* kvm_wait_riscv for trapped WFI/WRS instructions
* kvm_sbi_ecall for SBI ecalls
* kvm_csr_access for CSR emulation

The tracepoints are modelled after useful ARM KVM events where the
concepts match, while remaining specific to RISC-V virtualization.

Example trace output:

kvm_irq_line:
VCPU: 0, IRQ: 10, level: 1

kvm_guest_fault:
VCPU: 0, GPA: 0x10000000, SEPC: 0x80200000,
SCAUSE: 0x17, STVAL: 0x10000000,
HTVAL: 0x4000000, HTINST: 0x2023

kvm_mmio_emulate:
VCPU: 0, Store MMIO at 0x10000000,
len 4, insn 0x2023, sepc 0x80200000

kvm_sbi_ecall:
VCPU: 0, SBI ecall at 0x80200000,
ext 0x54455354, fid 0x123, a0 0x55

kvm_csr_access:
VCPU: 0, SEPC: 0x80200000,
CSR: 0x600, insn: 0x60002573,
read, new_val: 0xffffffffffffffff,
write_mask: 0x0

kvm_wait_riscv:
VCPU: 0, guest executed wfi at: 0x80200000

kvm_timer_update_irq:
VCPU: 0, IRQ: 6, level: 1

Testing:

A QEMU-based test program was used to exercise:

```
- IRQ injection
- Guest page faults
- MMIO emulation
- SBI ecalls
- CSR accesses
- WFI handling
- VS timer interrupts
```

Verified trace output generation for:

```
- kvm_guest_fault
- kvm_irq_line
- kvm_mmio_emulate
- kvm_timer_update_irq
- kvm_wait_riscv
- kvm_sbi_ecall
- kvm_csr_access
```
Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: bingyu.xian <shanbeenyoo@gmail.com>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
---
 arch/riscv/kvm/trace.h      | 184 +++++++++++++++++++++++++++++++++++-
 arch/riscv/kvm/vcpu.c       |   3 +
 arch/riscv/kvm/vcpu_exit.c  |   4 +
 arch/riscv/kvm/vcpu_insn.c  |  18 +++-
 arch/riscv/kvm/vcpu_sbi.c   |   3 +
 arch/riscv/kvm/vcpu_timer.c |  15 ++-
 arch/riscv/kvm/vm.c         |   3 +
 7 files changed, 224 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/trace.h b/arch/riscv/kvm/trace.h
index 3d54175d805c..117e45ef397d 100644
--- a/arch/riscv/kvm/trace.h
+++ b/arch/riscv/kvm/trace.h
@@ -25,7 +25,7 @@ TRACE_EVENT(kvm_entry,
 		__entry->pc	= vcpu->arch.guest_context.sepc;
 	),
 
-	TP_printk("PC: 0x016%lx", __entry->pc)
+	TP_printk("PC: 0x%016lx", __entry->pc)
 );
 
 TRACE_EVENT(kvm_exit,
@@ -56,7 +56,187 @@ TRACE_EVENT(kvm_exit,
 		__entry->htinst)
 );
 
-#endif /* _TRACE_RSICV_KVM_H */
+TRACE_EVENT(kvm_guest_fault,
+	TP_PROTO(unsigned long vcpu_id, unsigned long sepc, unsigned long scause,
+		 unsigned long stval, unsigned long htval,
+		 unsigned long htinst, unsigned long fault_addr),
+	TP_ARGS(vcpu_id, sepc, scause, stval, htval, htinst, fault_addr),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned long, sepc)
+		__field(unsigned long, scause)
+		__field(unsigned long, stval)
+		__field(unsigned long, htval)
+		__field(unsigned long, htinst)
+		__field(unsigned long, fault_addr)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->sepc		= sepc;
+		__entry->scause		= scause;
+		__entry->stval		= stval;
+		__entry->htval		= htval;
+		__entry->htinst		= htinst;
+		__entry->fault_addr	= fault_addr;
+	),
+
+	TP_printk("VCPU: %lu, GPA: 0x%lx, SEPC: 0x%lx, SCAUSE: 0x%lx, STVAL: 0x%lx, HTVAL: 0x%lx, HTINST: 0x%lx",
+		  __entry->vcpu_id, __entry->fault_addr, __entry->sepc,
+		  __entry->scause, __entry->stval, __entry->htval,
+		  __entry->htinst)
+);
+
+TRACE_EVENT(kvm_irq_line,
+	TP_PROTO(int vcpu_id, unsigned int irq, int level),
+	TP_ARGS(vcpu_id, irq, level),
+
+	TP_STRUCT__entry(
+		__field(int, vcpu_id)
+		__field(unsigned int, irq)
+		__field(int, level)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->irq		= irq;
+		__entry->level		= level;
+	),
+
+	TP_printk("VCPU: %d, IRQ: %u, level: %d",
+		  __entry->vcpu_id, __entry->irq, __entry->level)
+);
+
+TRACE_EVENT(kvm_mmio_emulate,
+	TP_PROTO(unsigned long vcpu_id, unsigned long sepc, unsigned long insn,
+		 unsigned long fault_addr, bool write, int len),
+	TP_ARGS(vcpu_id, sepc, insn, fault_addr, write, len),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned long, sepc)
+		__field(unsigned long, insn)
+		__field(unsigned long, fault_addr)
+		__field(bool, write)
+		__field(int, len)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->sepc		= sepc;
+		__entry->insn		= insn;
+		__entry->fault_addr	= fault_addr;
+		__entry->write		= write;
+		__entry->len		= len;
+	),
+
+	TP_printk("VCPU: %lu, %s MMIO at 0x%lx, len %d, insn 0x%lx, sepc 0x%lx",
+		  __entry->vcpu_id, __entry->write ? "Store" : "Load",
+		  __entry->fault_addr, __entry->len, __entry->insn,
+		  __entry->sepc)
+);
+
+TRACE_EVENT(kvm_timer_update_irq,
+	TP_PROTO(unsigned long vcpu_id, unsigned int irq, int level),
+	TP_ARGS(vcpu_id, irq, level),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned int, irq)
+		__field(int, level)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->irq		= irq;
+		__entry->level		= level;
+	),
+
+	TP_printk("VCPU: %lu, IRQ: %u, level: %d",
+		  __entry->vcpu_id, __entry->irq, __entry->level)
+);
+
+TRACE_EVENT(kvm_wait_riscv,
+	TP_PROTO(unsigned long vcpu_id, unsigned long sepc, bool is_wfi),
+	TP_ARGS(vcpu_id, sepc, is_wfi),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned long, sepc)
+		__field(bool, is_wfi)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->sepc		= sepc;
+		__entry->is_wfi		= is_wfi;
+	),
+
+	TP_printk("VCPU: %lu, guest executed %s at: 0x%lx",
+		  __entry->vcpu_id, __entry->is_wfi ? "wfi" : "wrs",
+		  __entry->sepc)
+);
+
+TRACE_EVENT(kvm_sbi_ecall,
+	TP_PROTO(unsigned long vcpu_id, unsigned long sepc, unsigned long ext_id,
+		 unsigned long func_id, unsigned long a0),
+	TP_ARGS(vcpu_id, sepc, ext_id, func_id, a0),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned long, sepc)
+		__field(unsigned long, ext_id)
+		__field(unsigned long, func_id)
+		__field(unsigned long, a0)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->sepc		= sepc;
+		__entry->ext_id		= ext_id;
+		__entry->func_id	= func_id;
+		__entry->a0		= a0;
+	),
+
+	TP_printk("VCPU: %lu, SBI ecall at 0x%lx, ext 0x%lx, fid 0x%lx, a0 0x%lx",
+		  __entry->vcpu_id, __entry->sepc, __entry->ext_id,
+		  __entry->func_id, __entry->a0)
+);
+
+TRACE_EVENT(kvm_csr_access,
+	TP_PROTO(unsigned long vcpu_id, unsigned long sepc, unsigned long insn,
+		 unsigned int csr_num, bool write, unsigned long new_val,
+		 unsigned long write_mask),
+	TP_ARGS(vcpu_id, sepc, insn, csr_num, write, new_val, write_mask),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned long, sepc)
+		__field(unsigned long, insn)
+		__field(unsigned int, csr_num)
+		__field(bool, write)
+		__field(unsigned long, new_val)
+		__field(unsigned long, write_mask)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->sepc		= sepc;
+		__entry->insn		= insn;
+		__entry->csr_num	= csr_num;
+		__entry->write		= write;
+		__entry->new_val	= new_val;
+		__entry->write_mask	= write_mask;
+	),
+
+	TP_printk("VCPU: %lu, SEPC: 0x%lx, CSR: 0x%x, insn: 0x%lx, %s, new_val: 0x%lx, write_mask: 0x%lx",
+		  __entry->vcpu_id, __entry->sepc, __entry->csr_num,
+		  __entry->insn, __entry->write ? "write" : "read",
+		  __entry->new_val, __entry->write_mask)
+);
+
+#endif /* _TRACE_KVM_H */
 
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a73690eda84b..fda118c7f2cb 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -254,6 +254,9 @@ long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
 		if (copy_from_user(&irq, argp, sizeof(irq)))
 			return -EFAULT;
 
+		trace_kvm_irq_line(vcpu->vcpu_id, IRQ_VS_EXT,
+				   irq.irq == KVM_INTERRUPT_SET);
+
 		if (irq.irq == KVM_INTERRUPT_SET)
 			return kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
 		else
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..fc10343e2144 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -11,6 +11,7 @@
 #include <asm/insn-def.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
+#include "trace.h"
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -23,6 +24,9 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	int ret;
 
 	fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
+	trace_kvm_guest_fault(vcpu->vcpu_id, vcpu->arch.guest_context.sepc,
+			      trap->scause, trap->stval, trap->htval,
+			      trap->htinst, fault_addr);
 	gfn = fault_addr >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
 	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index f09f9251d1f0..dc90d059a2e9 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -9,6 +9,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
+#include "trace.h"
 
 struct insn_func {
 	unsigned long mask;
@@ -75,6 +76,7 @@ void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
 
 static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
+	trace_kvm_wait_riscv(vcpu->vcpu_id, vcpu->arch.guest_context.sepc, true);
 	vcpu->stat.wfi_exit_stat++;
 	kvm_riscv_vcpu_wfi(vcpu);
 	return KVM_INSN_CONTINUE_NEXT_SEPC;
@@ -82,6 +84,7 @@ static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 
 static int wrs_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
+	trace_kvm_wait_riscv(vcpu->vcpu_id, vcpu->arch.guest_context.sepc, false);
 	vcpu->stat.wrs_exit_stat++;
 	kvm_vcpu_on_spin(vcpu, vcpu->arch.guest_context.sstatus & SR_SPP);
 	return KVM_INSN_CONTINUE_NEXT_SEPC;
@@ -187,6 +190,9 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 	vcpu->arch.csr_decode.insn = insn;
 	vcpu->arch.csr_decode.return_handled = 0;
 
+	trace_kvm_csr_access(vcpu->vcpu_id, vcpu->arch.guest_context.sepc,
+			     insn, csr_num, !!wr_mask, new_val, wr_mask);
+
 	/* Update CSR details in kvm_run struct */
 	run->riscv_csr.csr_num = csr_num;
 	run->riscv_csr.new_value = new_val;
@@ -375,7 +381,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     unsigned long htinst)
 {
 	u8 data_buf[8];
-	unsigned long insn;
+	unsigned long insn, raw_insn;
 	int shift = 0, len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *ct = &vcpu->arch.guest_context;
@@ -405,6 +411,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		}
 		insn_len = INSN_LEN(insn);
 	}
+	raw_insn = insn;
 
 	/* Decode length of MMIO and shift */
 	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
@@ -453,6 +460,9 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (fault_addr & (len - 1))
 		return -EIO;
 
+	trace_kvm_mmio_emulate(vcpu->vcpu_id, ct->sepc, raw_insn, fault_addr,
+			       false, len);
+
 	/* Save instruction decode info */
 	vcpu->arch.mmio_decode.insn = insn;
 	vcpu->arch.mmio_decode.insn_len = insn_len;
@@ -502,7 +512,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	u32 data32;
 	u64 data64;
 	ulong data;
-	unsigned long insn;
+	unsigned long insn, raw_insn;
 	int len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *ct = &vcpu->arch.guest_context;
@@ -532,6 +542,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		}
 		insn_len = INSN_LEN(insn);
 	}
+	raw_insn = insn;
 
 	data = GET_RS2(insn, &vcpu->arch.guest_context);
 	data8 = data16 = data32 = data64 = data;
@@ -570,6 +581,9 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (fault_addr & (len - 1))
 		return -EIO;
 
+	trace_kvm_mmio_emulate(vcpu->vcpu_id, ct->sepc, raw_insn, fault_addr,
+			       true, len);
+
 	/* Save instruction decode info */
 	vcpu->arch.mmio_decode.insn = insn;
 	vcpu->arch.mmio_decode.insn_len = insn_len;
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 46ab7b989432..8aecdb1cecb5 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -11,6 +11,7 @@
 #include <linux/kvm_host.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_sbi.h>
+#include "trace.h"
 
 #ifndef CONFIG_RISCV_SBI_V01
 static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
@@ -598,6 +599,8 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	};
 	bool ext_is_v01 = false;
 
+	trace_kvm_sbi_ecall(vcpu->vcpu_id, cp->sepc, cp->a7, cp->a6, cp->a0);
+
 	sbi_ext = kvm_vcpu_sbi_find_ext(vcpu, cp->a7);
 	if (sbi_ext && sbi_ext->handler) {
 #ifdef CONFIG_RISCV_SBI_V01
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 9817ff802821..7aeea50b5b95 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -15,12 +15,23 @@
 #include <asm/kvm_isa.h>
 #include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_timer.h>
+#include "trace.h"
 
 static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
 {
 	return get_cycles64() + gt->time_delta;
 }
 
+static void kvm_riscv_vcpu_timer_update_irq(struct kvm_vcpu *vcpu, bool level)
+{
+	trace_kvm_timer_update_irq(vcpu->vcpu_id, IRQ_VS_TIMER, level);
+
+	if (level)
+		kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_TIMER);
+	else
+		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_TIMER);
+}
+
 static u64 kvm_riscv_delta_cycles2ns(u64 cycles,
 				     struct kvm_guest_timer *gt,
 				     struct kvm_vcpu_timer *t)
@@ -54,7 +65,7 @@ static enum hrtimer_restart kvm_riscv_vcpu_hrtimer_expired(struct hrtimer *h)
 	}
 
 	t->next_set = false;
-	kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_TIMER);
+	kvm_riscv_vcpu_timer_update_irq(vcpu, true);
 
 	return HRTIMER_NORESTART;
 }
@@ -91,7 +102,7 @@ static int kvm_riscv_vcpu_update_hrtimer(struct kvm_vcpu *vcpu, u64 ncycles)
 	if (!t->init_done)
 		return -EINVAL;
 
-	kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_TIMER);
+	kvm_riscv_vcpu_timer_update_irq(vcpu, false);
 
 	delta_ns = kvm_riscv_delta_cycles2ns(ncycles, gt, t);
 	t->next_cycles = ncycles;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..db4c3f0dc3cc 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -12,6 +12,7 @@
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_mmu.h>
+#include "trace.h"
 
 const struct kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
@@ -62,6 +63,8 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
 	if (!irqchip_in_kernel(kvm))
 		return -ENXIO;
 
+	trace_kvm_irq_line(-1, irql->irq, irql->level);
+
 	return kvm_riscv_aia_inject_irq(kvm, irql->irq, irql->level);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
