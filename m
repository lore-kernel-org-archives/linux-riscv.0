Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8A2CD1299
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nz9HhLzBk2E6QIlsa1K+VgksQHzPZVq4QqQq/zmTnVE=; b=CSHi3+7nX2KHFI
	ay3bV/h4iksnYnxoXayPk3gCHvLgYljvFVI8bjpZbDpvw8f8wnpn7ZRx8S134DQpO4aktYizRUIYZ
	rmDk7JwvsVjH+YtJylkq+dBgcoGOwXAQV+SZunyONaFyPe5mBsUXRkJhS+Z5R7JRXc2wdAMvL907A
	cerRCue/Sqxbng0noV0iuGYnbYKa7TPN2gaCCPsMsZVWeL0q3EDH/s+T39hZ/Mn1cSN43KbfJHZHx
	f8PHJppnsUViR5Stw16gnZ5w7JxmWvLvWf0AvzgW2eYPXm5iJv96v2AYrl0GEQD8iIEb65hYXwPRo
	w8bV1FLE0TKgsCAW/L5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui1z-00000009bxm-3jQS;
	Thu, 11 Apr 2024 00:11:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0e-00000009apZ-3NyX
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Apr 2024 00:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BPwZXE2XSKrr96afFvE5Ak7Tq3sKjSlK1s+9Ond0wds=; b=k23WE9FlQzlROQxr8mESDaJLMr
	qXsBs0hVGooxJxxE6bDbbS7pDvmfyKP9RWdSwdqapSvhNOUDeouc1FtPe1nv9wXreFXfLn5K/aqOr
	9E1o4Ax9f+pnmVBv37D8J+N9xh+KkR4JxRvkXDIbKsrEvfMDlcgx2O3lKxbdfowtse34miRW5NYZN
	xbKWQLj1EqZcP3j85jrfNd390/oBSBlJ6GABQjS8xDyq5k2SODJHMLLii0MDISw7m4ya9Gl7ZJrVb
	UFnsoFjSURq2eNZM6DQdqho5rawzjHfWC7nwTTv4JNetzTOc8d7Zj0jazMfi4i3anMj0BdWPv+dR+
	ZUm2m7nw==;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0O-00000008JzY-1JKm
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:09:42 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e2b1cd446fso53934395ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794134; x=1713398934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPwZXE2XSKrr96afFvE5Ak7Tq3sKjSlK1s+9Ond0wds=;
        b=iwVf5Q9oAMjUKisg7mmY8Xo7RjHzdcxs4CfgDdtDUVx8AxxMJIcpITnZ/Am4B2uusD
         aRYObVJKnVtbMGDEmWYiUPHcFO7nTMhwBpWyeKLLR9uktWdFOpnFpd9v2Z1jSYIQ63SO
         Xs6HWVL8S+pgocuhhoMPWNvuYgUa1UJz9PwJ+84pVyQk+L/sXzLlroHTTRpehJA+DU1H
         BLlJQifSxlSPyvn/U+noapam4eW+H+smVyv7B4YM6nPqkGmCPuxQS/LJhzkM7JLBbmwC
         YuTQjiXD0RKajWVLyDzHMRP3MChTPCciiEpFucJw3wNVFJZd/3QSN0kb5OnnejeHzHm0
         w/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794134; x=1713398934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPwZXE2XSKrr96afFvE5Ak7Tq3sKjSlK1s+9Ond0wds=;
        b=ipIobsNkjxMvz5ZU9a8IoP0t6nH6L112haGyvSP46oP4Au36gakn990LhR461UKe6Y
         RByoohs8cV+Rt9Yg1uw+paoabKFXG+tBxYDDeE/m0vDjDXvkyvV/E32zPN3IBNLKnFKW
         1d0Kr7AGnq+s8cZVtevWweRDVsoUGlAE8pIcbtMLyZwSkqF12bD1cmyDHxmknpibSax7
         JJjTho5n/aKrypXVUR63uVAFyS7z28DqU0I3qax5oxlfl1VosZuqYUrD0oSGCQVBesSG
         /3dvO9+/TXZDP6PpxkZpOcSLsT+QiuNMpqwyCfSPE86lnyPkOPSWeAuzHMXxxs7kiOPS
         P2+w==
X-Forwarded-Encrypted: i=1; AJvYcCVgqg2+MvDSsSGDIlvwr5fAfJZknrLjXBeNV1j2FgJxaR1lI3ljRQW3Wvv6lIWoKGkkacWkh0EUA9KqQE9uaWN2zgXO7G2Br4VmLBaHndaI
X-Gm-Message-State: AOJu0YycgQCCbYrFZSMNg46SKtaKf2UBU8cQR8HNNsigKwz3eNvH9HS+
	lo0+Pay8c7JpsPVUhirIDsD1eNB7+DbZITNJ5xb0oDlMWvCEVQZqzU9weL6/U+o=
X-Google-Smtp-Source: AGHT+IHKxJVlEJl1bIRvxy3wACB6zmCTyQenR8DXY67Mr7CLfIwwr6/IL7jBf9RGIaMj04NY6rQR/Q==
X-Received: by 2002:a17:902:c94d:b0:1e2:6152:3439 with SMTP id i13-20020a170902c94d00b001e261523439mr4102847pla.6.1712794133940;
        Wed, 10 Apr 2024 17:08:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:53 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v6 17/24] KVM: riscv: selftests: Move sbi definitions to its own header file
Date: Wed, 10 Apr 2024 17:07:45 -0700
Message-Id: <20240411000752.955910-18-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_010937_747391_864D93FA 
X-CRM114-Status: GOOD (  15.00  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
