Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C17ECD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYu7zSpfymq5JGsKQ0jRlcbp3VcLyfqPnYb/PV+HYUA=; b=t6zHYVyvsP1Jaq
	W9ILnDVjhgd1dbH/p6zSBkKGs5rVsYLE8S7vVc04Wa9y7vFahfxoT6YXkMbvVfdvOafZsMC1gpxcR
	j/artsMWLrc4OFJYXTwNMKYAw7OA0edLRgdpiJ+gCVFif2B/m/NdXnPzWgYVfy6zvWJCnSEDquqfS
	lezNOdHNmOg1F6gpssIPnXRCae7JVt1ttlcZVXoATVMvw3y7jCfUU5rcCIXb7OGwJDdSvIL15On1o
	UYl7ZWj0gY6NEdYOZiTxanfMtKOk+RqUYJeR0e2uLyABtGygf4Isk9l42AJ8SeFQZJHaqPMoWyFQt
	wX2KT+HgEbXiiCm9QK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8XO-0000000HUvt-3eth;
	Fri, 29 Mar 2024 09:28:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8X0-0000000HUfc-1Yjk
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 09:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kNl7zpQXvXrARiVNVkvkffUb5fHwj0L+2J3rA8qc0Og=; b=lDlAuEpywXXNpDnIjlw8CZNVkA
	ahrBSCbiHHQ0XrkW3UrMrN+GXZRoh7xDK9vBTlBSIKSchyxCmfcLzD3c9ksIqy/7Ck6v6dIKy/lFM
	oz2m9lBT63tyReQBiDiAgM1TS6eOMtxf/N1z6GIKBDkQDrGpJATGztAUxtDa1x1g20MU1jKrWMfU/
	VQtM5uCI4SRmJN8U45Dpy8GvoU8zKuaqWKenvfBki7LvV2yxiHnqo/zL/LdGPVuj9oRiZH5b0g/wI
	2gY7xUozlYfD+QMatEjizhmRgbB3IjoDW70jOzaA/L9wXV5S+iTrWBIy6t3HcB0bz+37HLyC3wJOF
	XjPBvGEg==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wx-00000001Twj-15hn
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:28:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5dca1efad59so1281205a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704489; x=1712309289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNl7zpQXvXrARiVNVkvkffUb5fHwj0L+2J3rA8qc0Og=;
        b=m6DGXWyaPBcUAsWRfZrxg/3/ZivUKZ4NbeqrM8gZEkjJnfCSS0kAC221tJucf+FlD0
         gxhUAqZYYp5e/02kfMrBL5NCZ9dCyA3QuNchLww5A0rqxUko6OYDZzrZu9/LZbAPUqml
         tOeX5EjcKFdP/XgOqu5PKKgAp88dCRFvnm8WW7GvuYd6Le6Z1xkki5/VFYbFudDtmFwI
         y87992vhOnvVo8VGB8nCjb8grG8IqAV0kGjoNKAcGVxKDMtzQUztmymqL//fQM223GB/
         zmDAoL1dbRAJvjOjaHZMHo4oj+OKNRvx2NIfYUCNzo6r9GfdxYVrVGxp4Jxx8k9qmFGG
         K3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704489; x=1712309289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNl7zpQXvXrARiVNVkvkffUb5fHwj0L+2J3rA8qc0Og=;
        b=Wr27/iuP5zM4cacxxJNAAE+sUZRtz0Om9tb2ejuyTs3Aylf2rxo4ThU8YyXwv7sXsj
         vQwSv7xUHwF154osLoORf25v2wKS+xtz4iz8Csd8mOroUGlGaUQDeerN4mRINc2iYcPx
         OvU/tnUohWcsCNy5lOrikIKrUDZtwOjQW8/MMKJahVq9wJE3F8NN+fZW2UiuFwsEACFD
         dvrHtUzX7nJ7fbHXv/sEUXO24nfoAkavwUojso3QkYQPLLv4r0USAImCzZm2HqEe8Kxy
         7wtbQkCmEOMkWXeAiis9G2Xpl+Vs6OVacaypwXa/yKjSEazOKwvr6R+K1B8RF1ML2Jl4
         mO2A==
X-Forwarded-Encrypted: i=1; AJvYcCUqexhlntqv/gUZ3GwceUGhfV1TFEX1TeSaOrrT6mIAp2G4hbq5/wAf+1nWojM+eDDutgEkJQqFFmqDQvoqT4/F0xygbXz3LbaQZR7Pue64
X-Gm-Message-State: AOJu0YzeU5mUQ0ASp9AkWtUjrlFoloagdKwc7pIfpMnfXlu2Z/wcosRM
	Yd0pYULHXR/feCtZb2HInJM/YFF+9pE6GvSUFn+2kmthMwYEcXVi8y0HbU203/WqujrU9eBxtOJ
	JtEY2Eyv6E7AHolWZTpAwRDXUAmWo2N/3Oi0zFidWp570IsZg4K1/33UDAhxYV7fGOFZHA+v0nX
	0F5aYwwmEuckr7gMA5TfmpT+RO039RwzHUQWZft1ZRGf7nn37GVw==
X-Google-Smtp-Source: AGHT+IGke3TYJDotnJqdt1iP+scqdGmagpwPxA2ur5Kz3bFCD/ukFY00kNWufcTpRyFgA8aurgnlgg==
X-Received: by 2002:a17:90a:3ea7:b0:29d:dbaf:bd77 with SMTP id k36-20020a17090a3ea700b0029ddbafbd77mr1594311pjc.43.1711704488865;
        Fri, 29 Mar 2024 02:28:08 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:28:08 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:24 +0800
Subject: [PATCH RFC 08/11] riscv: KVM: Add Sdtrig Extension Support for
 Guest/VM
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-8-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_092811_504483_7022AA51 
X-CRM114-Status: GOOD (  18.47  )
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

From: Yong-Xuan Wang <yongxuan.wang@sifive.com>

We extend the KVM ISA extension ONE_REG interface to allow VMM
tools to detect and enable Sdtrig extension for Guest/VM. We
also save/restore the scontext CSR for guest VCPUs and set the
HSCONTEXT bit in hstateen0 CSR if the scontext CSR is available
for Guest/VM when the Smstateen extension is present.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Co-developed-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h       | 11 +++++++++++
 arch/riscv/include/asm/kvm_vcpu_debug.h | 17 +++++++++++++++++
 arch/riscv/include/uapi/asm/kvm.h       |  1 +
 arch/riscv/kvm/Makefile                 |  1 +
 arch/riscv/kvm/vcpu.c                   |  8 ++++++++
 arch/riscv/kvm/vcpu_debug.c             | 29 +++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_onereg.c            |  1 +
 7 files changed, 68 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 484d04a92fa6..d495279d99e1 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -21,6 +21,7 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_pmu.h>
+#include <asm/kvm_vcpu_debug.h>
 
 #define KVM_MAX_VCPUS			1024
 
@@ -175,6 +176,10 @@ struct kvm_vcpu_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+struct kvm_vcpu_sdtrig_csr {
+	unsigned long scontext;
+};
+
 struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
@@ -197,6 +202,9 @@ struct kvm_vcpu_arch {
 	unsigned long host_senvcfg;
 	unsigned long host_sstateen0;
 
+	/* SCONTEXT of Host */
+	unsigned long host_scontext;
+
 	/* CPU context of Host */
 	struct kvm_cpu_context host_context;
 
@@ -209,6 +217,9 @@ struct kvm_vcpu_arch {
 	/* CPU Smstateen CSR context of Guest VCPU */
 	struct kvm_vcpu_smstateen_csr smstateen_csr;
 
+	/* CPU Sdtrig CSR context of Guest VCPU */
+	struct kvm_vcpu_sdtrig_csr sdtrig_csr;
+
 	/* CPU context upon Guest VCPU reset */
 	struct kvm_cpu_context guest_reset_context;
 
diff --git a/arch/riscv/include/asm/kvm_vcpu_debug.h b/arch/riscv/include/asm/kvm_vcpu_debug.h
new file mode 100644
index 000000000000..6e7ce6b408a6
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_debug.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 SiFive
+ *
+ * Authors:
+ *	Yong-Xuan Wang <yongxuan.wang@sifive.com>
+ */
+
+#ifndef __KVM_VCPU_RISCV_DEBUG_H
+#define __KVM_VCPU_RISCV_DEBUG_H
+
+#include <linux/types.h>
+
+void kvm_riscv_debug_vcpu_swap_in_guest_context(struct kvm_vcpu *vcpu);
+void kvm_riscv_debug_vcpu_swap_in_host_context(struct kvm_vcpu *vcpu);
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b1c503c2959c..9f70da85ed51 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZFA,
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
+	KVM_RISCV_ISA_EXT_SDTRIG,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index c9646521f113..387be968d9ea 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -15,6 +15,7 @@ kvm-y += vmid.o
 kvm-y += tlb.o
 kvm-y += mmu.o
 kvm-y += vcpu.o
+kvm-y += vcpu_debug.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
 kvm-y += vcpu_vector.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..1d0e43ab0652 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -20,6 +20,7 @@
 #include <asm/csr.h>
 #include <asm/cacheflush.h>
 #include <asm/kvm_vcpu_vector.h>
+#include <asm/switch_to.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -504,6 +505,9 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 					  SMSTATEEN0_AIA_ISEL;
 		if (riscv_isa_extension_available(isa, SMSTATEEN))
 			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
+
+		if (has_scontext())
+			cfg->hstateen0 |= SMSTATEEN0_HSCONTEXT;
 	}
 }
 
@@ -643,6 +647,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0,
 						     smcsr->sstateen0);
+
+	kvm_riscv_debug_vcpu_swap_in_guest_context(vcpu);
 }
 
 static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
@@ -656,6 +662,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0,
 					    vcpu->arch.host_sstateen0);
+
+	kvm_riscv_debug_vcpu_swap_in_host_context(vcpu);
 }
 
 /*
diff --git a/arch/riscv/kvm/vcpu_debug.c b/arch/riscv/kvm/vcpu_debug.c
new file mode 100644
index 000000000000..e7e9263c2e30
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_debug.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 SiFive
+ */
+
+#include <linux/kvm_host.h>
+#include <asm/switch_to.h>
+
+void kvm_riscv_debug_vcpu_swap_in_guest_context(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
+	unsigned long hcontext = vcpu->kvm->arch.hcontext;
+
+	if (has_hcontext())
+		csr_write(CSR_HCONTEXT, hcontext);
+	if (has_scontext())
+		vcpu->arch.host_scontext = csr_swap(CSR_SCONTEXT, csr->scontext);
+}
+
+void kvm_riscv_debug_vcpu_swap_in_host_context(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
+
+	/* Hypervisor uses the hcontext ID 0 */
+	if (has_hcontext())
+		csr_write(CSR_HCONTEXT, 0);
+	if (has_scontext())
+		csr->scontext = csr_swap(CSR_SCONTEXT, vcpu->arch.host_scontext);
+}
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f4a6124d25c9..10dda5ddc0a6 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -34,6 +34,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
 	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 	/* Multi letter extensions (alphabetically sorted) */
+	KVM_ISA_EXT_ARR(SDTRIG),
 	KVM_ISA_EXT_ARR(SMSTATEEN),
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
