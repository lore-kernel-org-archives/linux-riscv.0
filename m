Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D312C636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 09:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpYc92IWaNZmjLuG6MdlGHEokupYm/xMKjeI+OaMaHE=; b=VniaGsmt5W2PtZ
	b1plZjmqbK3hibQ79oYBHCr7DskrIQMXFAhrIqH0bsdcfQukJe8Iwc5+JByfcf1smn3ZKQRr8TaWP
	Ob/he/bot9+ug0IIBvM/fTLNCIu4QI2bZguqEwO5xPPfYpXvMmwjdB/Y27rlrYrfZpJNTgniyxnmS
	a2+ZsBhiWpMi3OkUidzcy3tGa6LdK06sV/Wk7DGmppqgk1o87+UERMJnbdCWNYmYE0tTyEvOozPei
	Q9h4R0frkfaEks7CELnpLmRIAbqFrxC1sFUUuaM958L5L5rfa/hjSKyg5A/2rHDh2vghqqU9R/2rP
	u1ve6A6B63eU2PJkb9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKiM-00BbRn-V2; Tue, 07 Feb 2023 09:56:39 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKiE-00BbKE-S8
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 09:56:34 +0000
Received: by mail-pj1-x1036.google.com with SMTP id d6-20020a17090ae28600b00230aa72904fso6093032pjz.5
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 01:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULNMR5Ocp1PNupfsvdIL5d5DRjzc3aRnh38pGV22zi8=;
        b=jsjQLmEJu+Rf0RpzAP/8uCkuDH7Fs1becZ1ts0p7Hvoy50DATjr45e9mlXtoYslWtR
         pxbIzrmWILftf2D7niL8fzkr8FCZAjVX0iEK51k1CuArIWvMGgRRpbBbBwkVVW7kfPcJ
         KJphmdFZq4DE92KoQXhyr7iEr0mr/BKhFNyJswMIKr3T+xelrNs5WketOf+hFAQTourP
         NnwseEesdgNLnxOZuKAi0VVlAQ//T4ji4CyRPrvo6he50/wsan2Ll3cxp8llQNZ/Z5O1
         SmX8HNJoGEAVJGo2ZEMYXa2gYT5MBZxUhnxK5T/5BMC0injae9zwMTVGvpKCpHZQ4Lpb
         LCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULNMR5Ocp1PNupfsvdIL5d5DRjzc3aRnh38pGV22zi8=;
        b=4HT+BfNQ0gvrAgbDQRzWNUFEv+FTL2lfCUXJynMv815YeenHucsusbRcYJS68vabeU
         y/8qGDaJLIg5HoMgObl99CRhQtcVFOA5AvoLuiKiM8RW2fMrS1vtasZX223Ws/UiuN6u
         B2X90xRw2FgKTlp6EFVGmFee+oJ+Jzodka/9o1UhK9GdasNjGTL2fsslpVVRe88kXkZp
         9iccIFOl7lLY3gCXdKbS/zvWIInFTz1vBNPiZbcQZyMj0avGoSzriB398ow2qQjqD0wR
         3GH+v2ZA8y2Df8WOB4Rx0079xMnOdHAF4TX6HAKWZQQvpqCv98UxYz2txmguxNKPAS9J
         iz9w==
X-Gm-Message-State: AO0yUKXAVsOj0NOowVCpRxMxlOW31qVUVzOKq3MWCU/eMBfaJJL5Un7n
	hPZ2NZ5cSMe2bubA/lAl0sVqXA==
X-Google-Smtp-Source: AK7set8Uk2pIH/HpkP+1Jihyh75Gz31f6PUT76AC8PIC1Arx/kfUyeFaJv1eNy7XJweB6ETzm0dwjw==
X-Received: by 2002:a17:902:ce83:b0:199:2236:ae88 with SMTP id f3-20020a170902ce8300b001992236ae88mr2159830plg.43.1675763790092;
        Tue, 07 Feb 2023 01:56:30 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709027b8800b0019602b2c00csm4030598pll.175.2023.02.07.01.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:56:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v6 2/8] RISC-V: KVM: Add SBI PMU extension support
Date: Tue,  7 Feb 2023 01:55:23 -0800
Message-Id: <20230207095529.1787260-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207095529.1787260-1-atishp@rivosinc.com>
References: <20230207095529.1787260-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_015630_938305_F5E0DC1E 
X-CRM114-Status: GOOD (  18.52  )
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

SBI PMU extension allows KVM guests to configure/start/stop/query about
the PMU counters in virtualized enviornment as well.

In order to allow that, KVM implements the entire SBI PMU extension.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/Makefile       |  2 +-
 arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
 arch/riscv/kvm/vcpu_sbi_pmu.c | 86 +++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 5de1053..278e97c 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -25,4 +25,4 @@ kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_hsm.o
 kvm-y += vcpu_timer.o
-kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index fe2897e..15fde15 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -20,6 +20,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 };
 #endif
 
+#ifdef CONFIG_RISCV_PMU_SBI
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
+#else
+static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
+	.extid_start = -1UL,
+	.extid_end = -1UL,
+	.handler = NULL,
+};
+#endif
+
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
 	&vcpu_sbi_ext_base,
@@ -28,6 +38,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_rfence,
 	&vcpu_sbi_ext_srst,
 	&vcpu_sbi_ext_hsm,
+	&vcpu_sbi_ext_pmu,
 	&vcpu_sbi_ext_experimental,
 	&vcpu_sbi_ext_vendor,
 };
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
new file mode 100644
index 0000000..38efadb
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Rivos Inc
+ *
+ * Authors:
+ *     Atish Patra <atishp@rivosinc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				   struct kvm_vcpu_sbi_return *retdata)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	unsigned long funcid = cp->a6;
+	u64 temp;
+
+	if (!kvpmu->init_done) {
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
+		return 0;
+	}
+
+	switch (funcid) {
+	case SBI_EXT_PMU_NUM_COUNTERS:
+		ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
+#if defined(CONFIG_32BIT)
+		temp = ((uint64_t)cp->a5 << 32) | cp->a4;
+#else
+		temp = cp->a4;
+#endif
+		/*
+		 * This can fail if perf core framework fails to create an event.
+		 * Forward the error to userspace which is an error happened
+		 * within the host kernel. The other option would be to convert
+		 * to an SBI error and forward to the guest.
+		 */
+		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
+						       cp->a2, cp->a3, temp, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_START:
+#if defined(CONFIG_32BIT)
+		temp = ((uint64_t)cp->a4 << 32) | cp->a3;
+#else
+		temp = cp->a3;
+#endif
+		ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
+						   temp, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_STOP:
+		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_FW_READ:
+		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
+		break;
+	default:
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
+	}
+
+	return ret;
+}
+
+static unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+
+	return kvpmu->init_done;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
+	.extid_start = SBI_EXT_PMU,
+	.extid_end = SBI_EXT_PMU,
+	.handler = kvm_sbi_ext_pmu_handler,
+	.probe = kvm_sbi_ext_pmu_probe,
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
