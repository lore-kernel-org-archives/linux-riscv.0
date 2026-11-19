Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC53C606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ypr4BeAg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fzZiLmxN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j/jPpwLhjWdcrCOteBHkVDQa6JxosY4q4q1jQ57Fjh0=; b=ypr4BeAg8Jz+Q1lhlBtU4ZVyVy
	5+deikoz/9TOOwDQ7ril3ZUQDDlmwPLg+vXVPIPll0419F+iBceQ+fXXiYjk0oLTVw+mC3edQ3vQf
	YEgq0wOmRY+FcjlZqaF/egoKjnQE9Xm2YODyTFHeil+GJC/hWpWdvcRBA9ZbgYCticmz5Ii9eo1gY
	7wrYDk9yOo+pyhCsY+f3r15UdGg0W80LJBCiZcCLyugSQ/HOSUqZmap3tnq1/gVl3oSJD6Y2BE/Ox
	mumPRMrqXBfidnChuo2sVPUkzSEByBYPoCOop1vtKGlFwyZKknz/3VfAuRTOAp9AGWCNR18xsmW9z
	Z2MbrDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xd-0000000BnAt-35BM;
	Thu, 19 Nov 2026 12:09:53 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xb-0000000Bn92-3bDF
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 12:09:53 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-14394530ec6so3300182c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090191; x=1795694991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
        b=fzZiLmxNeAkKXJlUCe8iuUA0tKWw1r8bHlHrkDS5hlRFvEqhkcQmMY4wGDaqOhfIEF
         z46Su+wUQ++Az3jnaXH9zmrvIgUkfcuHCUUslaildZX6X6pqr1nulVtcyxxCDqUerQfy
         zeyiYx//jGsbOqasYfghmBIBceM1aXGFxISsjsMOxRq6GzFLuSxwIiWRyzyC5cGstQc3
         o+nsOxRSsx9hMPDDA7MxlJ6OqAOsGGEtb/9K/1Pbq+VhnNs/6+02j2NmHry/2NyVaW2G
         t2EQOX004fhUn9SQveOabm/caeq/dafx1RraH1tNHcEjKi0TraE65zUkIeuSUEypBdHO
         Yf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090191; x=1795694991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
        b=b8avXb5C9l/vypJEi+rgwx/GklSUBVQh0aISIfr/S54BW4paURt1lVk22NHg1rZNM/
         oSCGuzSqcygrbNN6OitB9+7kGFkh/WBnHaNJJqPQ2VtTylqqZUK7TVfpKdoJ/sfQYKjb
         tyWV1BqOo8yX2kh4DeNNVMJIoJcNFZ+QfKnSuHsLIhKSlCaSjbpe5mWdZ2R26ZyZw793
         BiUn2Fu6ptCSFoAcqIE3xpSTifpcGMdhQtfRm4NyGyZLnzxe7UOVVJSisc7tk4obF/qb
         76oY2/fAHqXVjKa8lxFG1pBwfboJrebM33FdDYXrSAMjtGVryXFoI9b8ucAwegbcw0dK
         nzJQ==
X-Forwarded-Encrypted: i=1; AL+hErELzU66hYmTnml+0m+/vEOBIxaUmJQ84FaLh+spc9/JTJq3o+eYIF8OfOUbuNb+tWHk4udxm7Cdx5KCvw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8YmbSeE9lUIh9hmxxdwhHYJvSiiPnRCMVi47+GY2UeJQvHpfwe
	lgzBmBehvDWryPTB/8OlEc8Op0U+/OW/iP7qS2x8mCjuj2Kl/LFDgxAMZ679yE5QYFQ=
X-Gm-Gg: AZFdTZfIo71s4qYsU3Xtj02wR73/Olfipz6ZEWbmoYIFD52JYlsUnYGX+S9NqHrICUO
	X/QZ9pb3IYeynxg7Ae9ePoO0nZxRAm3s0OFvfUIOIQziMgDnc3W/z/ggdOXDhbhy2jIyseg5lkP
	SFxHW+P/iU/EEqagto+EBCkLEDVWrso0NrgSf5kywiWIkbAkBUXwUKyQasH/r2t8uhMPaobrVei
	GRj6ibb72WxNkqzFWDxM+WFfPaQ+nuQB3n0Igal4vpp6wNgE5A0+hyWiijdTj9YDi7HPApG7afX
	Z6Jcvjl1DPlJuihVe/udB3tOAqbJOWRVAMf66kcim/LwfZ0Rtr71rdUNMNw0L6FqwiD0/Bz+vLa
	Pn+uvAlAE4E+7p3SZ38FFTVT3O+qXSriolmxXZfTIlrzMTBLiteTdnnOc61IDZ6cuHNjXsngCT3
	GdcN6mQ1KR1vxzEX4HkH+kcPfyF926K4kHMTnneq0bbvHfTkeYMC1BaJDyjipJh58pBYpeE6gTp
	4OoUWKVwQ4zFX1vo3D3GBrmNCdlo2wSBBcJcaFY6rvX8u/lYXNb9p/7HOFToIUCJBaf2UtJYRy6
	qFQIMl2IJ13UUTFw4P+EBnseYdrPZI6fYJrkPeghp7/iSEyH5ONFuWaGgj97lcd/poXdm6FcLW1
	s5sTPPJU=
X-Received: by 2002:a05:7300:8288:b0:384:6487:b155 with SMTP id 5a478bee46e88-3846487bba9mr1500897eec.29.1795090190796;
        Thu, 19 Nov 2026 04:09:50 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:50 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 06/11] riscv: enable NMI-safe lockdep irqflags tracking
Date: Thu, 19 Nov 2026 20:08:30 +0800
Message-ID: <20261119120824.13969-19-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_040951_898038_B8D7EC5A 
X-CRM114-Status: GOOD (  12.79  )
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
index d2db8f40c616..5501c02a07eb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -225,6 +225,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select TRACE_IRQFLAGS_NMI_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select VDSO_DATASTORE if MMU
 	select VDSO_GETRANDOM if MMU && 64BIT
diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
index 032fcc07abcf..59e47a39589d 100644
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
