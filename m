Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA60C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJZuhdSzQST7iYYM9AsT4qrZbAApf3Fud6yG56bRKuM=; b=2YExvwudroJvTJ
	ThDJgNMp66n/RQq7FubIdcvgakJSXgSWqxyxWHzUBNhui+PduOsUp89igSyK1BIkhy+LQL5Zw0vIN
	0MYTAHkPZf/LJJqSKC1zzfzGhC/y6HJsIqT4aFwkuk0G/uC7fHmJGgTtewxavE/q3GruyfNcvEegw
	v19nNafy7JIY/GFomraOHo/hqM0EgusVVaJdtkpbAQugY5bnWC5Gu8bch4Kmy9E+8/UC616MKLXiJ
	MdgsFXV8dTo4lfVJmyZJJRSotKU7XHFqegQJ+4+hzWX/BBcIyS1IzQSGX227HwFmJc5TsYRAzo+Sf
	EfMr5XbUiDwF/1NP7i/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBJ-00000003Baz-2frh;
	Fri, 19 Jul 2024 16:10:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqB7-00000003BQB-2bEG
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fb3b7d0d3aso12773935ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405393; x=1722010193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNRjpl9AWOu5Y/06ZXovZLxYd73eZ2CcfqE7LV9a3jU=;
        b=gUxEjbP8BpXgGukOF/suXynrE076z7yLh2xnLc85GkoDICrlcLqHL+bfnLQPyOL3wP
         8w8we7x4+5Qt4SA8KWieuyxQbQpXMnqpjR+7w2+RE7kGhUvkdlLfT06D09CEMCTuHSlD
         gT/qG7UUIVxApWrHiGbN5QIhcP4GejEkZ9fOxreRDEJ3fAB8f1DS+HOZquTJ6ch5d5kk
         jo5uXlC6fpTonvKnBPANd/1/eqH3D9NaUDTdhhYY179HY9lNi/w8FclMyiE15Nk9MR6S
         A5NJiH5G/EmjxuBCztd91W/uv/yFfdUYdGULm5uCTNnWUgRLdIjjznubTz0s/7C/6XGs
         vVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405393; x=1722010193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNRjpl9AWOu5Y/06ZXovZLxYd73eZ2CcfqE7LV9a3jU=;
        b=chF9hEGnfEuPQjxTzQro/OWVGiqJGf4XLB0yxL5lO99Ul27LfDTe3+0n0KtdWhslEY
         B9FbD/0ows613ODtDEoK6uHmwD2BtvKRwi2ompDLQYSGSIe7oaMoqvSS+8hsUykis+tO
         1SaIDA400srm0/feQsHRn7UH+a1ur7kVGTPNuWA18BbP18k9cth0axsyrGnekue9puSY
         ZvS4QVcKh6egn008UwUBjrKLy/QW71SGrVR7wWXdigDjo5+EDg+XTyRj4WDwIvIbBGkc
         JX6jDW6VSBMod0wmCK24cWsplg56Ltf/L3BB2T4GiifaYQaEuQ/DB2q2Hf+PJPiEI0e3
         geJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlI2jfsvgL8by30VWH6tUA+yCxx+W4QvH2144ut997uGYv17YzxcaCZTU0km97E9u7lGGPGL+hCJtPu8nvGtzdEawPABins7CLfnZK9MyF
X-Gm-Message-State: AOJu0YyCUlzOClJCbAv2UN1TTgeneeZa71JMJ67sU9N3nS+k4OD0hpo/
	A7hJE3Mki0zE1HAPqe7ZVdQQuPQnxZZiwr+LWv9TGsYA5MzpbqmlJXwA1g2Z0n8=
X-Google-Smtp-Source: AGHT+IGsSBffRZbxlhKIbUi3MquECwG/00bsx5PoG3YEzYyosi1BS/71TDciBJgkl9GHm7KPMmnNHw==
X-Received: by 2002:a17:902:e547:b0:1fa:ab25:f625 with SMTP id d9443c01a7336-1fd74585690mr3006245ad.38.1721405392800;
        Fri, 19 Jul 2024 09:09:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:52 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 08/13] RISC-V: KVM: Add common nested acceleration support
Date: Fri, 19 Jul 2024 21:39:08 +0530
Message-Id: <20240719160913.342027-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090953_724834_E362B466 
X-CRM114-Status: GOOD (  24.29  )
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

Add a common nested acceleration support which will be shared by
all parts of KVM RISC-V. This nested acceleration support detects
and enables SBI NACL extension usage based on static keys which
ensures minimum impact on the non-nested scenario.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_nacl.h | 205 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/main.c             |  53 +++++++-
 arch/riscv/kvm/nacl.c             | 152 ++++++++++++++++++++++
 4 files changed, 409 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_nacl.h
 create mode 100644 arch/riscv/kvm/nacl.c

diff --git a/arch/riscv/include/asm/kvm_nacl.h b/arch/riscv/include/asm/kvm_nacl.h
new file mode 100644
index 000000000000..a704e8000a58
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_nacl.h
@@ -0,0 +1,205 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ */
+
+#ifndef __KVM_NACL_H
+#define __KVM_NACL_H
+
+#include <linux/jump_label.h>
+#include <linux/percpu.h>
+#include <asm/byteorder.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+
+DECLARE_STATIC_KEY_FALSE(kvm_riscv_nacl_available);
+#define kvm_riscv_nacl_available() \
+	static_branch_unlikely(&kvm_riscv_nacl_available)
+
+DECLARE_STATIC_KEY_FALSE(kvm_riscv_nacl_sync_csr_available);
+#define kvm_riscv_nacl_sync_csr_available() \
+	static_branch_unlikely(&kvm_riscv_nacl_sync_csr_available)
+
+DECLARE_STATIC_KEY_FALSE(kvm_riscv_nacl_sync_hfence_available);
+#define kvm_riscv_nacl_sync_hfence_available() \
+	static_branch_unlikely(&kvm_riscv_nacl_sync_hfence_available)
+
+DECLARE_STATIC_KEY_FALSE(kvm_riscv_nacl_sync_sret_available);
+#define kvm_riscv_nacl_sync_sret_available() \
+	static_branch_unlikely(&kvm_riscv_nacl_sync_sret_available)
+
+DECLARE_STATIC_KEY_FALSE(kvm_riscv_nacl_autoswap_csr_available);
+#define kvm_riscv_nacl_autoswap_csr_available() \
+	static_branch_unlikely(&kvm_riscv_nacl_autoswap_csr_available)
+
+struct kvm_riscv_nacl {
+	void *shmem;
+	phys_addr_t shmem_phys;
+};
+DECLARE_PER_CPU(struct kvm_riscv_nacl, kvm_riscv_nacl);
+
+void __kvm_riscv_nacl_hfence(void *shmem,
+			     unsigned long control,
+			     unsigned long page_num,
+			     unsigned long page_count);
+
+int kvm_riscv_nacl_enable(void);
+
+void kvm_riscv_nacl_disable(void);
+
+void kvm_riscv_nacl_exit(void);
+
+int kvm_riscv_nacl_init(void);
+
+#ifdef CONFIG_32BIT
+#define lelong_to_cpu(__x)	le32_to_cpu(__x)
+#define cpu_to_lelong(__x)	cpu_to_le32(__x)
+#else
+#define lelong_to_cpu(__x)	le64_to_cpu(__x)
+#define cpu_to_lelong(__x)	cpu_to_le64(__x)
+#endif
+
+#define nacl_shmem()							\
+	this_cpu_ptr(&kvm_riscv_nacl)->shmem
+#define nacl_shmem_fast()						\
+	(kvm_riscv_nacl_available() ? nacl_shmem() : NULL)
+
+#define nacl_sync_hfence(__e)						\
+	sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SYNC_HFENCE,		\
+		  (__e), 0, 0, 0, 0, 0)
+
+#define nacl_hfence_mkconfig(__type, __order, __vmid, __asid)		\
+({									\
+	unsigned long __c = SBI_NACL_SHMEM_HFENCE_CONFIG_PEND;		\
+	__c |= ((__type) & SBI_NACL_SHMEM_HFENCE_CONFIG_TYPE_MASK)	\
+		<< SBI_NACL_SHMEM_HFENCE_CONFIG_TYPE_SHIFT;		\
+	__c |= (((__order) - SBI_NACL_SHMEM_HFENCE_ORDER_BASE) &	\
+		SBI_NACL_SHMEM_HFENCE_CONFIG_ORDER_MASK)		\
+		<< SBI_NACL_SHMEM_HFENCE_CONFIG_ORDER_SHIFT;		\
+	__c |= ((__vmid) & SBI_NACL_SHMEM_HFENCE_CONFIG_VMID_MASK)	\
+		<< SBI_NACL_SHMEM_HFENCE_CONFIG_VMID_SHIFT;		\
+	__c |= ((__asid) & SBI_NACL_SHMEM_HFENCE_CONFIG_ASID_MASK);	\
+	__c;								\
+})
+
+#define nacl_hfence_mkpnum(__order, __addr)				\
+	((__addr) >> (__order))
+
+#define nacl_hfence_mkpcount(__order, __size)				\
+	((__size) >> (__order))
+
+#define nacl_hfence_gvma(__shmem, __gpa, __gpsz, __order)		\
+__kvm_riscv_nacl_hfence(__shmem,					\
+	nacl_hfence_mkconfig(SBI_NACL_SHMEM_HFENCE_TYPE_GVMA,		\
+			   __order, 0, 0),				\
+	nacl_hfence_mkpnum(__order, __gpa),				\
+	nacl_hfence_mkpcount(__order, __gpsz))
+
+#define nacl_hfence_gvma_all(__shmem)					\
+__kvm_riscv_nacl_hfence(__shmem,					\
+	nacl_hfence_mkconfig(SBI_NACL_SHMEM_HFENCE_TYPE_GVMA_ALL,	\
+			   0, 0, 0), 0, 0)
+
+#define nacl_hfence_gvma_vmid(__shmem, __vmid, __gpa, __gpsz, __order)	\
+__kvm_riscv_nacl_hfence(__shmem,					\
+	nacl_hfence_mkconfig(SBI_NACL_SHMEM_HFENCE_TYPE_GVMA_VMID,	\
+			   __order, __vmid, 0),				\
+	nacl_hfence_mkpnum(__order, __gpa),				\
+	nacl_hfence_mkpcount(__order, __gpsz))
+
+#define nacl_hfence_gvma_vmid_all(__shmem, __vmid)			\
+__kvm_riscv_nacl_hfence(__shmem,					\
+	nacl_hfence_mkconfig(SBI_NACL_SHMEM_HFENCE_TYPE_GVMA_VMID_ALL,	\
+			   0, __vmid, 0), 0, 0)
+
+#define nacl_hfence_vvma(__shmem, __vmid, __gva, __gvsz, __order)	\
+__kvm_riscv_nacl_hfence(__shmem,					\
+	nacl_hfence_mkconfig(SBI_NACL_SHMEM_HFENCE_TYPE_VVMA,		\
+			   __order, __vmid, 0),				\
+	nacl_hfence_mkpnum(__order, __gva),				\
+	nacl_hfence_mkpcount(__order, __gvsz))
+
+#define nacl_hfence_vvma_all(__shmem, __vmid)				\
+__kvm_riscv_nacl_hfence(__shmem,					\
+	nacl_hfence_mkconfig(SBI_NACL_SHMEM_HFENCE_TYPE_VVMA_ALL,	\
+			   0, __vmid, 0), 0, 0)
+
+#define nacl_hfence_vvma_asid(__shmem, __vmid, __asid, __gva, __gvsz, __order)\
+__kvm_riscv_nacl_hfence(__shmem,					\
+	nacl_hfence_mkconfig(SBI_NACL_SHMEM_HFENCE_TYPE_VVMA_ASID,	\
+			   __order, __vmid, __asid),			\
+	nacl_hfence_mkpnum(__order, __gva),				\
+	nacl_hfence_mkpcount(__order, __gvsz))
+
+#define nacl_hfence_vvma_asid_all(__shmem, __vmid, __asid)		\
+__kvm_riscv_nacl_hfence(__shmem,					\
+	nacl_hfence_mkconfig(SBI_NACL_SHMEM_HFENCE_TYPE_VVMA_ASID_ALL,	\
+			   0, __vmid, __asid), 0, 0)
+
+#define nacl_csr_read(__shmem, __csr)					\
+({									\
+	unsigned long *__a = (__shmem) + SBI_NACL_SHMEM_CSR_OFFSET;	\
+	lelong_to_cpu(__a[SBI_NACL_SHMEM_CSR_INDEX(__csr)]);		\
+})
+
+#define nacl_csr_write(__shmem, __csr, __val)				\
+do {									\
+	void *__s = (__shmem);						\
+	unsigned int __i = SBI_NACL_SHMEM_CSR_INDEX(__csr);		\
+	unsigned long *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
+	u8 *__b = (__s) + SBI_NACL_SHMEM_DBITMAP_OFFSET;		\
+	__a[__i] = cpu_to_lelong(__val);				\
+	__b[__i >> 3] |= 1U << (__i & 0x7);				\
+} while (0)
+
+#define nacl_csr_swap(__shmem, __csr, __val)				\
+({									\
+	void *__s = (__shmem);						\
+	unsigned int __i = SBI_NACL_SHMEM_CSR_INDEX(__csr);		\
+	unsigned long *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
+	u8 *__b = (__s) + SBI_NACL_SHMEM_DBITMAP_OFFSET;		\
+	unsigned long __r = lelong_to_cpu(__a[__i]);			\
+	__a[__i] = cpu_to_lelong(__val);				\
+	__b[__i >> 3] |= 1U << (__i & 0x7);				\
+	__r;								\
+})
+
+#define nacl_sync_csr(__csr)						\
+	sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SYNC_CSR,			\
+		  (__csr), 0, 0, 0, 0, 0)
+
+#define ncsr_read(__csr)						\
+({									\
+	unsigned long __r;						\
+	if (kvm_riscv_nacl_available())					\
+		__r = nacl_csr_read(nacl_shmem(), __csr);		\
+	else								\
+		__r = csr_read(__csr);					\
+	__r;								\
+})
+
+#define ncsr_write(__csr, __val)					\
+do {									\
+	if (kvm_riscv_nacl_sync_csr_available())			\
+		nacl_csr_write(nacl_shmem(), __csr, __val);		\
+	else								\
+		csr_write(__csr, __val);				\
+} while (0)
+
+#define ncsr_swap(__csr, __val)						\
+({									\
+	unsigned long __r;						\
+	if (kvm_riscv_nacl_sync_csr_available())			\
+		__r = nacl_csr_swap(nacl_shmem(), __csr, __val);	\
+	else								\
+		__r = csr_swap(__csr, __val);				\
+	__r;								\
+})
+
+#define nsync_csr(__csr)						\
+do {									\
+	if (kvm_riscv_nacl_sync_csr_available())			\
+		nacl_sync_csr(__csr);					\
+} while (0)
+
+#endif
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index c1eac0d093de..0fb1840c3e0a 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -16,6 +16,7 @@ kvm-y += aia_device.o
 kvm-y += aia_imsic.o
 kvm-y += main.o
 kvm-y += mmu.o
+kvm-y += nacl.o
 kvm-y += tlb.o
 kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index bab2ec34cd87..fd78f40bbb04 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -10,8 +10,8 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/kvm_host.h>
-#include <asm/csr.h>
 #include <asm/cpufeature.h>
+#include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
 
 long kvm_arch_dev_ioctl(struct file *filp,
@@ -22,6 +22,12 @@ long kvm_arch_dev_ioctl(struct file *filp,
 
 int kvm_arch_hardware_enable(void)
 {
+	int rc;
+
+	rc = kvm_riscv_nacl_enable();
+	if (rc)
+		return rc;
+
 	csr_write(CSR_HEDELEG, KVM_HEDELEG_DEFAULT);
 	csr_write(CSR_HIDELEG, KVM_HIDELEG_DEFAULT);
 
@@ -49,11 +55,14 @@ void kvm_arch_hardware_disable(void)
 	csr_write(CSR_HVIP, 0);
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
+
+	kvm_riscv_nacl_disable();
 }
 
 static int __init riscv_kvm_init(void)
 {
 	int rc;
+	char slist[64];
 	const char *str;
 
 	if (!riscv_isa_extension_available(NULL, h)) {
@@ -71,16 +80,53 @@ static int __init riscv_kvm_init(void)
 		return -ENODEV;
 	}
 
+	rc = kvm_riscv_nacl_init();
+	if (rc && rc != -ENODEV)
+		return rc;
+
 	kvm_riscv_gstage_mode_detect();
 
 	kvm_riscv_gstage_vmid_detect();
 
 	rc = kvm_riscv_aia_init();
-	if (rc && rc != -ENODEV)
+	if (rc && rc != -ENODEV) {
+		kvm_riscv_nacl_exit();
 		return rc;
+	}
 
 	kvm_info("hypervisor extension available\n");
 
+	if (kvm_riscv_nacl_available()) {
+		rc = 0;
+		slist[0] = '\0';
+		if (kvm_riscv_nacl_sync_csr_available()) {
+			if (rc)
+				strcat(slist, ", ");
+			strcat(slist, "sync_csr");
+			rc++;
+		}
+		if (kvm_riscv_nacl_sync_hfence_available()) {
+			if (rc)
+				strcat(slist, ", ");
+			strcat(slist, "sync_hfence");
+			rc++;
+		}
+		if (kvm_riscv_nacl_sync_sret_available()) {
+			if (rc)
+				strcat(slist, ", ");
+			strcat(slist, "sync_sret");
+			rc++;
+		}
+		if (kvm_riscv_nacl_autoswap_csr_available()) {
+			if (rc)
+				strcat(slist, ", ");
+			strcat(slist, "autoswap_csr");
+			rc++;
+		}
+		kvm_info("using SBI nested acceleration with %s\n",
+			 (rc) ? slist : "no features");
+	}
+
 	switch (kvm_riscv_gstage_mode()) {
 	case HGATP_MODE_SV32X4:
 		str = "Sv32x4";
@@ -108,6 +154,7 @@ static int __init riscv_kvm_init(void)
 	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (rc) {
 		kvm_riscv_aia_exit();
+		kvm_riscv_nacl_exit();
 		return rc;
 	}
 
@@ -119,6 +166,8 @@ static void __exit riscv_kvm_exit(void)
 {
 	kvm_riscv_aia_exit();
 
+	kvm_riscv_nacl_exit();
+
 	kvm_exit();
 }
 module_exit(riscv_kvm_exit);
diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
new file mode 100644
index 000000000000..08a95ad9ada2
--- /dev/null
+++ b/arch/riscv/kvm/nacl.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ */
+
+#include <linux/kvm_host.h>
+#include <linux/vmalloc.h>
+#include <asm/kvm_nacl.h>
+
+DEFINE_STATIC_KEY_FALSE(kvm_riscv_nacl_available);
+DEFINE_STATIC_KEY_FALSE(kvm_riscv_nacl_sync_csr_available);
+DEFINE_STATIC_KEY_FALSE(kvm_riscv_nacl_sync_hfence_available);
+DEFINE_STATIC_KEY_FALSE(kvm_riscv_nacl_sync_sret_available);
+DEFINE_STATIC_KEY_FALSE(kvm_riscv_nacl_autoswap_csr_available);
+DEFINE_PER_CPU(struct kvm_riscv_nacl, kvm_riscv_nacl);
+
+void __kvm_riscv_nacl_hfence(void *shmem,
+			     unsigned long control,
+			     unsigned long page_num,
+			     unsigned long page_count)
+{
+	int i, ent = -1, try_count = 5;
+	unsigned long *entp;
+
+again:
+	for (i = 0; i < SBI_NACL_SHMEM_HFENCE_ENTRY_MAX; i++) {
+		entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
+		if (lelong_to_cpu(*entp) & SBI_NACL_SHMEM_HFENCE_CONFIG_PEND)
+			continue;
+
+		ent = i;
+		break;
+	}
+
+	if (ent < 0) {
+		if (try_count) {
+			nacl_sync_hfence(-1UL);
+			goto again;
+		} else {
+			pr_warn("KVM: No free entry in NACL shared memory\n");
+			return;
+		}
+	}
+
+	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
+	*entp = cpu_to_lelong(control);
+	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PNUM(i);
+	*entp = cpu_to_lelong(page_num);
+	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PCOUNT(i);
+	*entp = cpu_to_lelong(page_count);
+}
+
+int kvm_riscv_nacl_enable(void)
+{
+	int rc;
+	struct sbiret ret;
+	struct kvm_riscv_nacl *nacl;
+
+	if (!kvm_riscv_nacl_available())
+		return 0;
+	nacl = this_cpu_ptr(&kvm_riscv_nacl);
+
+	ret = sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SET_SHMEM,
+			nacl->shmem_phys, 0, 0, 0, 0, 0);
+	rc = sbi_err_map_linux_errno(ret.error);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+void kvm_riscv_nacl_disable(void)
+{
+	if (!kvm_riscv_nacl_available())
+		return;
+
+	sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SET_SHMEM,
+		  SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
+}
+
+void kvm_riscv_nacl_exit(void)
+{
+	int cpu;
+	struct kvm_riscv_nacl *nacl;
+
+	if (!kvm_riscv_nacl_available())
+		return;
+
+	/* Allocate per-CPU shared memory */
+	for_each_possible_cpu(cpu) {
+		nacl = per_cpu_ptr(&kvm_riscv_nacl, cpu);
+		if (!nacl->shmem)
+			continue;
+
+		free_pages((unsigned long)nacl->shmem,
+			   get_order(SBI_NACL_SHMEM_SIZE));
+		nacl->shmem = NULL;
+		nacl->shmem_phys = 0;
+	}
+}
+
+static long nacl_probe_feature(long feature_id)
+{
+	struct sbiret ret;
+
+	if (!kvm_riscv_nacl_available())
+		return 0;
+
+	ret = sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_PROBE_FEATURE,
+			feature_id, 0, 0, 0, 0, 0);
+	return ret.value;
+}
+
+int kvm_riscv_nacl_init(void)
+{
+	int cpu;
+	struct page *shmem_page;
+	struct kvm_riscv_nacl *nacl;
+
+	if (sbi_spec_version < sbi_mk_version(1, 0) ||
+	    sbi_probe_extension(SBI_EXT_NACL) <= 0)
+		return -ENODEV;
+
+	/* Enable NACL support */
+	static_branch_enable(&kvm_riscv_nacl_available);
+
+	/* Probe NACL features */
+	if (nacl_probe_feature(SBI_NACL_FEAT_SYNC_CSR))
+		static_branch_enable(&kvm_riscv_nacl_sync_csr_available);
+	if (nacl_probe_feature(SBI_NACL_FEAT_SYNC_HFENCE))
+		static_branch_enable(&kvm_riscv_nacl_sync_hfence_available);
+	if (nacl_probe_feature(SBI_NACL_FEAT_SYNC_SRET))
+		static_branch_enable(&kvm_riscv_nacl_sync_sret_available);
+	if (nacl_probe_feature(SBI_NACL_FEAT_AUTOSWAP_CSR))
+		static_branch_enable(&kvm_riscv_nacl_autoswap_csr_available);
+
+	/* Allocate per-CPU shared memory */
+	for_each_possible_cpu(cpu) {
+		nacl = per_cpu_ptr(&kvm_riscv_nacl, cpu);
+
+		shmem_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
+					 get_order(SBI_NACL_SHMEM_SIZE));
+		if (!shmem_page) {
+			kvm_riscv_nacl_exit();
+			return -ENOMEM;
+		}
+		nacl->shmem = page_to_virt(shmem_page);
+		nacl->shmem_phys = page_to_phys(shmem_page);
+	}
+
+	return 0;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
