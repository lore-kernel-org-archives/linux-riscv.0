Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5221C606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KDEGEndi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dZOLxhnJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HopfkQza9r7x+juk7DXibSm+LtUJgpc2brcpZrST9P4=; b=KDEGEndiKUoLXimfJWL+ehd5+M
	P+Tb4sHopt1Lr5YarXl2feyZGkMzQ2fzgNPSZ8GQlkLsvoEq0xX4UZi7n/Gy8QR10q0fF5kUMJUOd
	c/eYN5hvkRCjxl11ddjIXUelh0EzYPhTYjbJCqejrE/kiQd6pfv5ncWCTczpGa+23rpKjqFkzK/JK
	ilJOZjTvIp2LE6wNR27X+Qk03E8oLZ2/AEg7WH3jUtQgc/nrKIOv1W0fF2UPdpBcnWVlzj7krOgJ1
	IHy9wDeJMZgeuzbH9Jy+/zSdI63PHJ6KYgS3KOD+WKZ0Y/wYOJpUoQq+gi9XRO2kEWM5NyoOyG42P
	r8YIGrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKuA-00000008aId-4ABc;
	Thu, 29 Oct 2026 07:50:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKu6-00000008aGU-3gct
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 07:50:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2e9f6a16aedso11806755ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260230; x=1793865030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oepihVkZlK/qzYmwSGek/f6xpe+tahIK2SzRmS26BHM=;
        b=dZOLxhnJjQdX8cus6vq2nLyi+dOcOmbNvhe4ICr5T5smU4Bn2HVTPM59SZ3kPSNM6M
         MELY6t8Kw0nkRqL8aGZJuIY+E1cY0xEFzDi0UPrTGnlSgkwkaDk5k0KXY/zLNPD/jDZV
         tBmOVwz3KoLPVQFC3MATNzQVjZIn6VqNjNBltmiWOpmDdsKVkZ+VAV9ACLwlod5YRe+L
         ndgZr1RJhtWXBbuKbsv96bnTS5+Lhm/YnwipL2/CtaFU7f4AFQhxtbL+1E313FwfNG/R
         3uYSW0VhvtBme3qRSk4vgYgulTTNU1hSJ8z2jp6VR05GgPb/2hYQ1gg8Zs7fPsHxDOOs
         S7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260230; x=1793865030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oepihVkZlK/qzYmwSGek/f6xpe+tahIK2SzRmS26BHM=;
        b=bj5xIgMtYzcC6w7hBpQazvojm4WvWpMdsN5u8yNYiKSNJgPHHhTkK9D7OZUInn0qbh
         Vr1i0bHqA8PU6kLCF2LWdZieq0TSiqXlKGJ6jnbioeIxfvq9Z8S5kcn4onCr9On/iX/t
         HDRADJYpSNctrE2QwgtMWeJIUzfFLXeBQx0Mp9DM4mZSzGR2FrDigdoffCphn1s9wwhf
         Z+oeHCxmP2XOjBd2GKdYQwgOkydxL/VYGr4Ffe6Z2eNAK4z2kSwmwXIgNxJqIKm0Fqdw
         4pqIoBFfmO7UTLLc6JduKJDoCHt6zNBCUFpAU8oVEvBJ8UUah89hkkK7y/4VEa1Ww08f
         fYSw==
X-Forwarded-Encrypted: i=1; AKwUvBwtCvjBmOfBjMAJP5dYNDRCL3ga1DvsoBYp144XG/4SZMH5gKK5FhvN0br5CGw6mAJ2yS7ssDto2g6POA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLw4kptdPKaqBzns8FB7BtTzU1wIGZOd4/b0h2od4Oz3EZ7ikAk
	RN+N9zXaZt7jVX+r8AcI7dyEH5+ILihb5WFeH+prCmVzslPEuav891b71jqcELy1LMk=
X-Gm-Gg: AYBFou0dmAYv9NXyo/jH57pnoIRAB80I6vDnMKnN6iCbsUa53j0AqiDSHDRKBVu899i
	72LD12xOduq4bvFxQOQEFlFhF1JHPB7etbj1MrUozo+z4G5Xkv5hXIczWxF/KQc0q9hbwH2hoHq
	P1iiA2EsZJCXcStA+CM5EYDGLq7dsf778gH93jYJgc9HrbzWUEQ5l7DjeU+PNKALD7Bmfk9faqf
	FSv1CBPTuA9mZJVMv+GlbEOMiOf0k7flFVeNtD5ILBQSSs78no86BcdCJ8OXwD7xrslIUYgrtw0
	DptRY25ArGX7Ge5VXm1DsHAV37VrEJwsL8UDx4SLnzK/23e7wPnitPmjvouLySIRKZ+pRSj2RS3
	BqZl515jGEs9kBkpLBYf14cM0divejxNRdoUoKZkjYlRUddIoYcs+dD5PiKirj4+Q/W+04k3Ypm
	YHZ3mhi6B69juDYSmmbOOk7YcXHPlE+gnoKvWJS3w//uLCTIJb4nY4an/7tskkvm8lqjXvRhpLV
	N7XLDDlOgXGm7MhL7dfuS8smcqmwcJAIAK8ULGHk0DhP5hR46IsmaAHxJ9ZBT1W1yXoFEmHIrxG
	YwrePOgbq78rKjouaO3Rs2MxT29t6AmcB3nny01Ziomv/785SxVy/43EVcyvwlrq/7kpBbTFYWj
	Mp0v3Hdk=
X-Received: by 2002:a17:903:3c28:b0:2e9:3f26:5d83 with SMTP id d9443c01a7336-2eb004000b6mr42659455ad.12.1793260229799;
        Thu, 29 Oct 2026 00:50:29 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.50.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:50:29 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 06/11] riscv: enable NMI-safe lockdep irqflags tracking
Date: Thu, 29 Oct 2026 15:48:48 +0800
Message-ID: <20261029074853.35467-7-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_005031_451889_856C3510 
X-CRM114-Status: GOOD (  14.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An SSE handler runs with interrupts masked, but can interrupt code whose
lockdep hardirq state is enabled. Bare nmi_enter()/nmi_exit() do not
update that state. Consequently, lockdep_assert_irqs_disabled() in the
perf overflow path can report a warning despite interrupts being masked.

Select TRACE_IRQFLAGS_NMI_SUPPORT so lockdep can update its hardirq state
inside an NMI. Pair this with irqentry_nmi_enter()/irqentry_nmi_exit() in
the SSE wrapper: these helpers save the previous tracked state, mark
interrupts disabled on entry and restore the tracked state on exit.
Selecting the configuration option alone does not perform those updates.
This follows the entry helpers used by the other RISC-V NMI-like traps.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/sbi_sse.c | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 467a877445a..dea30784fc7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -228,6 +228,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select TRACE_IRQFLAGS_NMI_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select VDSO_DATASTORE if MMU
 	select VDSO_GETRANDOM if MMU && 64BIT
diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
index 032fcc07abc..59e47a39589 100644
--- a/arch/riscv/kernel/sbi_sse.c
+++ b/arch/riscv/kernel/sbi_sse.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2025 Rivos Inc.
  */
-#include <linux/nmi.h>
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/scs.h>
 #include <linux/bitfield.h>
@@ -36,9 +36,10 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 {
 	struct riscv_sse_interrupted_context context = { regs, hstatus };
 	struct riscv_sse_interrupted_context *previous;
+	irqentry_state_t state;
 	struct sbiret sret;
 
-	nmi_enter();
+	state = irqentry_nmi_enter(regs);
 	instrumentation_begin();
 
 	/* Retrieve missing GPRs from SBI */
@@ -84,7 +85,7 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 
 out:
 	instrumentation_end();
-	nmi_exit();
+	irqentry_nmi_exit(regs, state);
 }
 
 static void *alloc_to_stack_pointer(void *alloc)
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
