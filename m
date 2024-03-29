Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DFBC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CkELF7Q5aQN2Q2GCWNWw0vv/LbvTGNWVqrB0qnFdSU=; b=aEcYod0uBDgFO2
	P1ggR5Mom6hw6GJpT5nuLNDMuE5A0j4cC5R2LVxvNzG5O+Ok5p2r+lzHYWEpRgVMIvp8kJcORSldD
	yHvTJ9d4fm453Cf5bqWEDNLWbkpt8Y1BbIc05smSi8x81foMpdKwvM1I5HvvvqeD73eCotnUbq9HA
	FuxbkB1AItwpA4gZ/T4Sqn9ArNg0FYgZoyXwVZthcNkWAbsaAsOjMWRAKTFo2zgzIQ96XzaxIDpwZ
	uwXyqSc+El8iHivE2jR/whPpzPJICHMR9ZXAln2gEIbNhsPV8sIecsOg9sN8D92uUZUc0t6462NgA
	luDE5SulG0CWr7Z8waPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6dl-0000000HA3b-1mbH;
	Fri, 29 Mar 2024 07:27:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bu-0000000H8mi-00kW
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1ZUya0v8Oh5iLzX7Kw5hO2ocqVWj9tNi/iu8yR8eYow=; b=FLdY2Ck/0DadFmItQP0yXtBbJd
	LWwObX5ez9PBlY/odgrOKUwdenDksFdBDJ33GggOc16EvRFrIwBSppmSXZstTsVcoSbOqe7D+2xh4
	x9AjU8ggYSzqnfWtH4Tvo+lKz+L5mlvd4ezp6gEpZPD732vzzE7dBKCatCNQFtHLOUIswB8suZjSk
	SbQVahrmdhOFfd6+LNEgFUOlcMdOl00egHZAZ6KkerAHgCyrBwsObYpxSC7pwyP1nQVlGHN+IchiT
	1FMT8w/or4ikyb2owpD8zuHW45PFS9xLWCbWR7Di7WSPq7mdwo3de0XR/lxiH0aNTAJo/s/uMKgSU
	dZwLDA/Q==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bn-00000001Qur-3j3K
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:25:06 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2a209b8af12so915240a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697101; x=1712301901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZUya0v8Oh5iLzX7Kw5hO2ocqVWj9tNi/iu8yR8eYow=;
        b=UdHh3OsTB8lgvqDTPwH1434wlD/BI9ambuJZoE8cuq7fb2/dLX1cBf1gsgx+Y7Qu6E
         OnZKnlgCWJ9NhhQh4tEXKAWjEm+47pdRTzQzbKOtgzj2tCrrSHSpHUfEPe1vCtDkhcOR
         cZe1CWgAeNDVH7I609v6XUfK0xYeB7ackZEemDQECPKnR/O9uQtAL2nvl/VAguzha3SD
         BDatEosxnchtMvUHgS63s6bOEZUU2xNUb9JO+PCSjGUICV4KTl8fsOi+FwJAkINqvkiO
         +dAEnCXfpMXh2GirV5bcQDHD+jbK5h6P4CH2oyIXpzvkoTYh0n6n9inBQq5fqKh8cCnu
         mZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697101; x=1712301901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZUya0v8Oh5iLzX7Kw5hO2ocqVWj9tNi/iu8yR8eYow=;
        b=jhZw+cWPgNZ1L8Th7mjHO5hdy9AV3JdE6Fz2uCOnQI1eBAJj+PaNh2LQfmKwrb0xdP
         Pw8cOWfIt9ytVyAbiNPuVcipijT4IO0W2vwSMoOfTdbvyoESkazZXEepBM11ra3LcCtx
         aGU2oDo4GgaNzJUfIjVsDZHkCj0I/1M9//HA6MRVudZP5ZAFcmrqvfnU6rR7MsIbJUYP
         Ihdg5Q+tdVUxw/k6MynGRbvxg8f/KYdzKtNPttXoCzKkvscuma0BpD9Ct5W09qtu0f7m
         vP67/eFrNf1FKrme0u+GDoynZhQrSaXTMA0O3Xxk3258oGaQUzewAGuf0wqYEeaqk8V9
         JjVw==
X-Forwarded-Encrypted: i=1; AJvYcCUC+Vl6qm+g3XKbHWI13otFyIGRzMcREdV1bVG12DdJkIrVVUsMYR+QHbv9IZlsX1wfcIiU/w0uVEMvuzbE6oxzZnED3qxjMikGkPu1/k6c
X-Gm-Message-State: AOJu0YyV+WnBFf4QZKbjpF1F2jM/fdIBp867znhmmJ6abpw4Ng2Y2+sX
	uxQhwnSP+fa32huaJzwXE7UqaC9peAAmKkg3pR+/RVNPzDbTZv1qVPHBSJ0L+/+C3qpvODOB3NO
	L
X-Google-Smtp-Source: AGHT+IERKMtTUUrMNrNdpmOZyYX6MKtFB7fSH53v9LodH/8MB2comF4l1LxXs3fRZJNBleQgeI68Nw==
X-Received: by 2002:a17:90a:b008:b0:2a0:5339:7751 with SMTP id x8-20020a17090ab00800b002a053397751mr1529473pjq.37.1711697101571;
        Fri, 29 Mar 2024 00:25:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:01 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 10/15] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:25 -0700
Message-ID: <20240329072441.591471-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072504_137826_C9FEDE9F 
X-CRM114-Status: GOOD (  15.30  )
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

x86 already provides kernel_fpu_begin() and kernel_fpu_end(), but in a
different header. Add a wrapper header, and export the CFLAGS
adjustments as found in lib/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/x86/Kconfig           |  1 +
 arch/x86/Makefile          | 20 ++++++++++++++++++++
 arch/x86/include/asm/fpu.h | 13 +++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/x86/include/asm/fpu.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 39886bab943a..7c9d032ee675 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -83,6 +83,7 @@ config X86
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64
+	select ARCH_HAS_KERNEL_FPU_SUPPORT
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 662d9d4033e6..5a5f5999c505 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -74,6 +74,26 @@ KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
 KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 
+#
+# CFLAGS for compiling floating point code inside the kernel.
+#
+CC_FLAGS_FPU := -msse -msse2
+ifdef CONFIG_CC_IS_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
+#
+# The "-msse" in the first argument is there so that the
+# -mpreferred-stack-boundary=3 build error:
+#
+#  -mpreferred-stack-boundary=3 is not between 4 and 12
+#
+# can be triggered. Otherwise gcc doesn't complain.
+CC_FLAGS_FPU += -mhard-float
+CC_FLAGS_FPU += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
+endif
+
 ifeq ($(CONFIG_X86_KERNEL_IBT),y)
 #
 # Kernel IBT has S_CET.NOTRACK_EN=0, as such the compilers must not generate
diff --git a/arch/x86/include/asm/fpu.h b/arch/x86/include/asm/fpu.h
new file mode 100644
index 000000000000..b2743fe19339
--- /dev/null
+++ b/arch/x86/include/asm/fpu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_X86_FPU_H
+#define _ASM_X86_FPU_H
+
+#include <asm/fpu/api.h>
+
+#define kernel_fpu_available()	true
+
+#endif /* ! _ASM_X86_FPU_H */
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
