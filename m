Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58F9C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nz9HhLzBk2E6QIlsa1K+VgksQHzPZVq4QqQq/zmTnVE=; b=WlvlkwXnRWfDui
	KQrS7MzI5725cNe1S8Zv1XjB6WWvGcFcv03ZonBAR4dDmmKBLR0ozsl2BfYz/zX9GELlbrJModgIq
	yEvHZ3RZFwjTfPL/am+SRj8AJ1Wv3+pNBOOxFAEwCxT7fV68bI7Uw2VSGAbzbNbxr/HsvwRTvxIfS
	lVu+x/p6Hj7E+p9W9TBHkZFZeYcQLfLXRzr5KMU7c/WOK74XYhxN/gJh9J9us0J/DY3vetMEb7P7N
	HsQhuEygIlH6UAvcZdJc5RC1l1D9yi188Aono/O0zPkE4wS19cXHO6HDiqUcRSzd8ysmmyYXpY80y
	t6N7JDMYsCZe9Jn0lH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxy0P-00000007L85-3xDo;
	Fri, 19 Apr 2024 23:50:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxzl-00000007KbJ-2n1b
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Apr 2024 23:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BPwZXE2XSKrr96afFvE5Ak7Tq3sKjSlK1s+9Ond0wds=; b=KZgc0Q/oAZePjxndiYTnj3aJ99
	QNl3hucZTvAtmkDx42pP6lf+SCMaApQSa9skEeEci1NEq7qNZZ2Cnpap8nL8nwNKaQ76Fb0RlfxC2
	F3zDdegYfB3r2kvDActwnDyY2EIE7dXPVAk3C+Ekuv8itG0XCxbNw4UHJ6KMHovA5yNyNqNCKEfTC
	X9VjCgaMt2dUM/hkTVeUeetF0Th+gg9gX4mF1G7wja3ADEEpCgKp+6nUtG23DC94BkC1iXtIeNRxc
	QngYpvAaDIK4aFz6szdIOwAoEJwwGq0BplMHMtmntunzfxRUJDmomCpKRfraj/AZ0Bp8Z1Bs7iTB9
	yn7HlLeQ==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxzh-00000008nWx-0trl
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:50:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e2bbc2048eso22761045ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570496; x=1714175296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPwZXE2XSKrr96afFvE5Ak7Tq3sKjSlK1s+9Ond0wds=;
        b=lS9t3QjqxbyUY/SA1gKqNrSzMLjr3y6EwB+tlA7JpxyxT+i26mihOvLvhaKe/pcZJZ
         wt66ZM8DXCCkQfX6ZDD7PslHYmjdJpMojEXTnrnLn2rNXstRHG82Ii3dNPFesbDaS93Y
         b7jWEpiViPtUz1iIuixj7ivqZUe3O1MDijt6QCPocC45VyoO5kA1oKmn+9NJRRrCNgnF
         ZKhcmrhDlGKOikaZnoUfsy8xk7u/16AZj0z9FCYuCdRlDFKDcSjQ1de38j8IL9zXW9k9
         GdIOZbZy2Sb8FUm7nH0hLkchYga5Bi9Q6gB3LvNB8NJ6RSYAyGYezwaanlXtJ3F9egrf
         GohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570496; x=1714175296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPwZXE2XSKrr96afFvE5Ak7Tq3sKjSlK1s+9Ond0wds=;
        b=CHELDtyDd/aTYI/Ggb9HpGyk6BV9s8p6oDS9cSyDKKWhpfZw7i3QEU7C43VKgFv753
         GuZfyCQYUrxkiiFSUhaTqWrLpAR7fR6wCsXJ2c2DDjkL5nYNGswM1U+0ssuLXig1Rp9t
         hcYDkxK2oWjO+OFdrlkB/4OIifnJ6LGSF9ArzVNxZ+/5NcWb3MG3qWZTUgZCWB0uqw7b
         QafcnjJnFua5Jw33oeaV7hJ87tzVHdsvLFxAEkFVyDvRlUtOLvyJO8ZjsfSVfOB7ZF12
         csvHdN+BqYFpB3wMpo2TGjSwaKNLIbiXAQw+FJJ+oJbhCEoXkuOKTVnLVAr+BiaJaaRE
         paGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzxQqK/JIOZZWzIRCiBrNV/+NKOcgfoD4ub1NiTg64IweGBPFzMG/BegbdG2EkNRIQVv4VH1/sQrPZ/9KsGJCakmX+Y71SpcwdVRa/+7Hg
X-Gm-Message-State: AOJu0YxXrhd2BqdIuL07l89YJM8qe2mgkpQuThkvnpFsTaJ7SapUMbzg
	+6/F7tyHYpQYZn3/hoU0Csy4UcGYVD+947WW2Rwid1ynfaQHrw7HkTDK+aepJZs=
X-Google-Smtp-Source: AGHT+IFRcup8Ti0gooDAZTTbhQjj5zf7+rm82Vsc5fHG88uaPlWDIHwWr0GfvfVWaLNldavabFklCg==
X-Received: by 2002:a17:902:f605:b0:1dd:dde1:31dc with SMTP id n5-20020a170902f60500b001dddde131dcmr4970560plg.26.1713570495784;
        Fri, 19 Apr 2024 16:48:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	samuel.holland@sifive.com,
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
Subject: [PATCH v8 17/24] KVM: riscv: selftests: Move sbi definitions to its own header file
Date: Sat, 20 Apr 2024 08:17:33 -0700
Message-Id: <20240420151741.962500-18-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_005013_310169_8588C632 
X-CRM114-Status: GOOD (  14.97  )
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
