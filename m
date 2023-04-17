Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2E9C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UylisV/Td2yWmVgFu9HRGO063FZ07JlLGLxX/Vd5prs=; b=v/6a7bud6uWsHp
	wjfxP8ZISYZk09VI66+dJ6Od0t64sfy+tdLYL0Y0qgUc4DRTtc7LuVa4oE0zh7Hy18Dex1QVsbWVh
	eZ/MEmWGc72y8Xa4w6pIuOFGD2/hh4CYklBVldQ3xHo/qw29C5maZHlzCOG/vJ/tx8QN8naPNdnJa
	ivIak0M/e25uk8a51aAtmEWiBHg2R7Q747e1UXi7yw3XTD6kr5l3/7snBmYPMW0S5syGqDa4o6Ci/
	n3GiFTe0R5UwFOtbjqhFMCIJdo24XRX6pGsb+N0fxTtK0tX2tVJtzkDzkdKcCjSMR1D1R0a10lzHF
	Z8AuACwN5buJjfmjpnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIQ-00G1Mt-0j;
	Mon, 17 Apr 2023 11:45:22 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBk-00Fkqx-2G
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:28 +0000
Received: by mail-ej1-f42.google.com with SMTP id c9so23954962ejz.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727662; x=1684319662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVt0lw69EHvz4t9Bycq9Ts+axEONPkDMjQoH6kPFB7Y=;
        b=Ym20gcbHJIamOwuKHfEacNpgCqFfTgNCuNEVpIfyTEDtp6fGXJ9YowWLvvGijE/W9B
         UpWxfZ2sTJRFRe1KG1XVrH1qY9tSzrStHosxYCupga/q/iZfAX2Ja5gq/65VeTNbZ4Ex
         cMReS5lxwfyrNWPl/oNckO4HZfvTFYn1FDd64vbGw3Q966o9S7JVRr9NcZenyGXgUtmP
         3YqjNDHwLpRDi4LLd9YLd6yWKaA17pOazQ7c3a5J9L/GCPCXd3QkV0/zd6i2DktR1imo
         HwvpyP7L4eyO00u/7ZivAQ460pOtfCY2Dh7QAYcGYmb5RstTGQC2vx5HvFBMBhOImQ+c
         XXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727662; x=1684319662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVt0lw69EHvz4t9Bycq9Ts+axEONPkDMjQoH6kPFB7Y=;
        b=BWGpIVsuOD5EQJMjrA/uNihOwcMJuRVbqGcbXBzJQSPnDt1UCPq/pHoCYyyiWvA9Ub
         HcQRz4gM9TNWSlhpnEINdE3Lfss0cqHLgnZoNnPEmgEbvnUygNCsFpl7KSg9WsvuB8uR
         uIiRRdVfSkVQ4pJes6p2RRjn8doKmZ/YTU4dsyU1IfGb2OdIUGgn+KinirliayyilvVe
         3WoR5SMBtaKt1HjZrStr1Ac0VKTi0VTqHwsCqUiD6/Yi5eBcRXpHTe0y4N5Ybcxes5bc
         dNlXNapeTDeSObnVwAi5Jy/3RSRPW25Itff3NEU0JK2PYFwkA8NOt/9n4YJQqC1wodFW
         xA4Q==
X-Gm-Message-State: AAQBX9e6GIooo2Det66faYQz2F+PQIsSTkMUJ+lAKJFQTVOwWD/yPz/7
	Wqj9zrvgaBOk8iD51nqkVM9Bog==
X-Google-Smtp-Source: AKy350a8Lj7EgkeS1iRJ7k5BaKeuNiPpWnB/KLG809ED2EzJAgHR9+HESvMYHMWLt9Kr0+L4xJqKyQ==
X-Received: by 2002:a17:906:a93:b0:94f:9cd:464b with SMTP id y19-20020a1709060a9300b0094f09cd464bmr6794895ejf.15.1681727662324;
        Mon, 17 Apr 2023 03:34:22 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b0094eaa31aa63sm6209061ejc.77.2023.04.17.03.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:22 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 10/14] RISC-V: KVM: Add support for SBI STA registers
Date: Mon, 17 Apr 2023 12:33:58 +0200
Message-Id: <20230417103402.798596-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033424_749335_877D58E9 
X-CRM114-Status: GOOD (  15.54  )
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

KVM userspace needs to be able to save and restore the steal-time
shared memory address. Provide the address through the get/set-one-reg
interface with two ulong-sized SBI STA extension registers (lo and hi).
64-bit KVM will always save/restore zero for the hi register.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 +++
 arch/riscv/include/uapi/asm/kvm.h     | 10 ++++++
 arch/riscv/kvm/vcpu.c                 |  5 +++
 arch/riscv/kvm/vcpu_sbi_sta.c         | 52 +++++++++++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index c63c6bbc2f74..ed5a294c479a 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -52,6 +52,10 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid);
+int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long *reg_val);
+int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long reg_val);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 
 #ifdef CONFIG_RISCV_SBI_V01
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 172dc565e01a..17b109a9ba7b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -128,6 +128,12 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
+/* SBI STA extension registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_sbi_sta {
+	unsigned long shmem_lo;
+	unsigned long shmem_hi;
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -189,6 +195,10 @@ enum KVM_RISCV_SBI_EXT_ID {
 /* Registers for specific SBI extensions are mapped as type 9 */
 #define KVM_REG_RISCV_SBI		(0x09 << KVM_REG_RISCV_TYPE_SHIFT)
 
+#define KVM_REG_RISCV_SBI_STA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_STA_REG(name)	\
+	(offsetof(struct kvm_riscv_sbi_sta, name) / sizeof(unsigned long))
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 56aec4c2521e..bdc14ebf50a3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -603,6 +603,9 @@ static int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		ret = kvm_riscv_vcpu_get_reg_sbi_sta(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -636,6 +639,8 @@ static int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		return kvm_riscv_vcpu_set_reg_sbi_sta(vcpu, reg_num, reg_val);
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index bc4f7390a9a8..3d98f140bd06 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  */
 
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/kvm_host.h>
 #include <linux/mm.h>
@@ -145,3 +146,54 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
 	.handler = kvm_sbi_ext_sta_handler,
 	.probe = kvm_sbi_ext_sta_probe,
 };
+
+int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
+				   unsigned long reg_num,
+				   unsigned long *reg_val)
+{
+	switch (reg_num) {
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
+		*reg_val = (unsigned long)vcpu->arch.sta.shmem;
+		break;
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
+		if (IS_ENABLED(CONFIG_32BIT))
+			*reg_val = upper_32_bits(vcpu->arch.sta.shmem);
+		else
+			*reg_val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu,
+				   unsigned long reg_num,
+				   unsigned long reg_val)
+{
+	switch (reg_num) {
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
+
+			vcpu->arch.sta.shmem = reg_val;
+			vcpu->arch.sta.shmem |= hi << 32;
+		} else
+			vcpu->arch.sta.shmem = reg_val;
+		break;
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
+
+			vcpu->arch.sta.shmem = ((gpa_t)reg_val << 32);
+			vcpu->arch.sta.shmem |= lo;
+		} else if (reg_val != 0)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
