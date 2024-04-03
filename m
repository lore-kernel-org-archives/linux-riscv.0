Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128EDC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bj0IvKZKgGwXgbp/XQyK3DQ4DDhVBfHt2s4J99jy9mA=; b=zZDTE7QI3kOPUc
	e92FLc8xq/UO0KV609m/9cUDyR2y72Cw5EmrFBitW//VVTfTWf+sR72jrlg15YoxIOF90AXn9ryRk
	iKHzFtdGpR2LFMc9FSG8Zmj0u9uXcu/AIDKdjTKOhRqWXStBGhpFl+nfU15IsB6ydRi8iRQzpTtG4
	T0lxvkutrGZf9jO37xQfia4+QiQA9CAei/qm+Yesxs0jWBPzVm9XqtY3C/lhHKBls/l2f2ff+lUKg
	7+9LNU9lzzkoDlKl6pk6ne3/TH66oz5JSxzlPbSHWp1fgOz6QLbd/pzpDnSACNL+T6r9nZ2EcI1qY
	CTCampBKUIQowD5hSiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvdD-0000000Ej5d-0D4L;
	Wed, 03 Apr 2024 08:06:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvd0-0000000EiuR-3NSr
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 08:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UKKIkxhVPzlR31GWSQWSWFD216hXiUzA8utaOE+u8sQ=; b=GuAQUzw1FZ3ka9KiIOf4rLgX1o
	9eS6VflZNhRRr35X8j0khrMLIWxZWTgjO6J/x0sD0cNHSysU/UfZRE2Z4c4yc+EoO9UzcH5JoPfX1
	a0x8q+Wu5mC1cs6mIRe9R1TxKdFWGywsGBfh6KYtGI9MIxOd7raY9ebmpxOBX2MPapvCNwE8BUIQf
	DTEMXuyr8zpUexB2NF+HMOtEncFl+TJEcIRLqlASRboART4YH4hgGyocFM45lgLG+tI6yDJPYsgxt
	t8EBjsVGmjg32iPuue9HZ9UYo1/Q7R/ADoIMF50K+Y9MCcC1OW1fWTtV/YXHEoQvVeOt6CJ+fJGls
	JH26t4CA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcx-000000044q8-0F0J
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e0ae065d24so51513715ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131545; x=1712736345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKKIkxhVPzlR31GWSQWSWFD216hXiUzA8utaOE+u8sQ=;
        b=rVgY2YG5YWhFOfVZ3Nu1BpCVnlYfPYjjKo0ekFs+BH8DAsH0je8PJL/dgYFhd1DOiZ
         PJjwy1Cp2s6vCjrbUjintu7eA6srWgQ19Wjlb9X8jdFPHspyAHv4/486MQeSsi7WXARQ
         b9JEnT8uoWQKuJBg5CC1QgHqXBPZ5aafVO3Oi713+Ny2qusO9M0F3bpHqIwq4rPMQzzX
         9XkJJv/iGTd9hkYWwsmMNKwDgTVP0Hmi48rhxlo9hHmMbrALYrz3BrDofdqEkJDpx4Fo
         kQ2F5xywHXlyoA4VoqmFV6UKysbkZa9XU9JJRRbNHqvfIJvEcc2r89/vCgKf9Q2mX7fi
         cAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131545; x=1712736345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKKIkxhVPzlR31GWSQWSWFD216hXiUzA8utaOE+u8sQ=;
        b=mRORiO8zD4iE4zoplm2W3fItPeaYE0KueGbJnkNcsk6710JuCOzf35R8RdDYUBolcg
         Wmnag34KFnJO9TAoIajDioDKf5mqag5ophxTxDi3JaCt2l0dd2xCrs3UCJYIgkCWvBJW
         FnGsVr4fe2QREUCc67w2qn+RKxMfLI72nc1RCyBBsNIVGoW78dL6tec1gfeDWefTLh29
         HhvaV6Vw9KlPQBnwgB21zerq3LPbSsjSFat0gtBPTbQ9EkY3BSoaU5pZZKpr5Gr3zw/B
         HfVwMA5XFNBkq3Liifiz9RP06t8vX57OgmBIY07ZOR3k8YZpB3W05EZ7Z8Fz7Vu9flbs
         ZiDA==
X-Forwarded-Encrypted: i=1; AJvYcCWAi5JgfvfQa2T9iVa5/PC5TRyCPvkjYUPAbuOuToKtvl23uI5ti8sd2RKP5lKXjlNINtmNhb54eOvIqfbcju1LbcorNPfIh20wLTdx+iei
X-Gm-Message-State: AOJu0YwrfDLG6h5/pfncmj9LrDlWgp4+h+ou3xq0sAvEyDZhlubhmywv
	zuWtsO6fFjCz1i58qnsJ79jbm8YebWLxmpXC7q3cCJ7T7T/kzK6+vhV1vZxhZ18=
X-Google-Smtp-Source: AGHT+IEHII7tSGtUqO5wpO59JDooIKUZaJc45tvRQjDzAvEN2jSXssf4AqTMGpJ/lHoLRFAsmkx1xA==
X-Received: by 2002:a17:902:bf04:b0:1e0:115c:e03c with SMTP id bi4-20020a170902bf0400b001e0115ce03cmr11696876plb.53.1712131545155;
        Wed, 03 Apr 2024 01:05:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 16/22] KVM: riscv: selftests: Move sbi definitions to its own header file
Date: Wed,  3 Apr 2024 01:04:45 -0700
Message-Id: <20240403080452.1007601-17-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_090547_413086_4CB5C269 
X-CRM114-Status: GOOD (  15.05  )
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

The SBI definitions will continue to grow. Move the sbi related
definitions to its own header file from processor.h

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../selftests/kvm/include/riscv/processor.h   | 39 ---------------
 .../testing/selftests/kvm/include/riscv/sbi.h | 50 +++++++++++++++++++
 .../selftests/kvm/include/riscv/ucall.h       |  1 +
 tools/testing/selftests/kvm/steal_time.c      |  4 +-
 4 files changed, 54 insertions(+), 40 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/riscv/sbi.h

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index ce473fe251dd..3b9cb39327ff 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -154,45 +154,6 @@ void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handle
 #define PGTBL_PAGE_SIZE				PGTBL_L0_BLOCK_SIZE
 #define PGTBL_PAGE_SIZE_SHIFT			PGTBL_L0_BLOCK_SHIFT
 
-/* SBI return error codes */
-#define SBI_SUCCESS				0
-#define SBI_ERR_FAILURE				-1
-#define SBI_ERR_NOT_SUPPORTED			-2
-#define SBI_ERR_INVALID_PARAM			-3
-#define SBI_ERR_DENIED				-4
-#define SBI_ERR_INVALID_ADDRESS			-5
-#define SBI_ERR_ALREADY_AVAILABLE		-6
-#define SBI_ERR_ALREADY_STARTED			-7
-#define SBI_ERR_ALREADY_STOPPED			-8
-
-#define SBI_EXT_EXPERIMENTAL_START		0x08000000
-#define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
-
-#define KVM_RISCV_SELFTESTS_SBI_EXT		SBI_EXT_EXPERIMENTAL_END
-#define KVM_RISCV_SELFTESTS_SBI_UCALL		0
-#define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
-
-enum sbi_ext_id {
-	SBI_EXT_BASE = 0x10,
-	SBI_EXT_STA = 0x535441,
-};
-
-enum sbi_ext_base_fid {
-	SBI_EXT_BASE_PROBE_EXT = 3,
-};
-
-struct sbiret {
-	long error;
-	long value;
-};
-
-struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
-			unsigned long arg1, unsigned long arg2,
-			unsigned long arg3, unsigned long arg4,
-			unsigned long arg5);
-
-bool guest_sbi_probe_extension(int extid, long *out_val);
-
 static inline void local_irq_enable(void)
 {
 	csr_set(CSR_SSTATUS, SR_SIE);
diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
new file mode 100644
index 000000000000..ba04f2dec7b5
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RISC-V SBI specific definitions
+ *
+ * Copyright (C) 2024 Rivos Inc.
+ */
+
+#ifndef SELFTEST_KVM_SBI_H
+#define SELFTEST_KVM_SBI_H
+
+/* SBI return error codes */
+#define SBI_SUCCESS				 0
+#define SBI_ERR_FAILURE				-1
+#define SBI_ERR_NOT_SUPPORTED			-2
+#define SBI_ERR_INVALID_PARAM			-3
+#define SBI_ERR_DENIED				-4
+#define SBI_ERR_INVALID_ADDRESS			-5
+#define SBI_ERR_ALREADY_AVAILABLE		-6
+#define SBI_ERR_ALREADY_STARTED			-7
+#define SBI_ERR_ALREADY_STOPPED			-8
+
+#define SBI_EXT_EXPERIMENTAL_START		0x08000000
+#define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
+
+#define KVM_RISCV_SELFTESTS_SBI_EXT		SBI_EXT_EXPERIMENTAL_END
+#define KVM_RISCV_SELFTESTS_SBI_UCALL		0
+#define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
+
+enum sbi_ext_id {
+	SBI_EXT_BASE = 0x10,
+	SBI_EXT_STA = 0x535441,
+};
+
+enum sbi_ext_base_fid {
+	SBI_EXT_BASE_PROBE_EXT = 3,
+};
+
+struct sbiret {
+	long error;
+	long value;
+};
+
+struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
+			unsigned long arg1, unsigned long arg2,
+			unsigned long arg3, unsigned long arg4,
+			unsigned long arg5);
+
+bool guest_sbi_probe_extension(int extid, long *out_val);
+
+#endif /* SELFTEST_KVM_SBI_H */
diff --git a/tools/testing/selftests/kvm/include/riscv/ucall.h b/tools/testing/selftests/kvm/include/riscv/ucall.h
index be46eb32ec27..a695ae36f3e0 100644
--- a/tools/testing/selftests/kvm/include/riscv/ucall.h
+++ b/tools/testing/selftests/kvm/include/riscv/ucall.h
@@ -3,6 +3,7 @@
 #define SELFTEST_KVM_UCALL_H
 
 #include "processor.h"
+#include "sbi.h"
 
 #define UCALL_EXIT_REASON       KVM_EXIT_RISCV_SBI
 
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index bae0c5026f82..2ff82c7fd926 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -11,7 +11,9 @@
 #include <pthread.h>
 #include <linux/kernel.h>
 #include <asm/kvm.h>
-#ifndef __riscv
+#ifdef __riscv
+#include "sbi.h"
+#else
 #include <asm/kvm_para.h>
 #endif
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
