Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F96E77199
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 02:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2vhUJsBEpwVCFTJg2TQBqUOp2XcOT9814p7u/LwccA=; b=nR3ZHR5gXE/W1H
	x0L9f21hNJyu+mrUYwFV8yOYmICDSkrMIWci3/qbwTLingYug3zugkgiI4oi29dgtLd0v9mYdhzfN
	rYQgvJBz8mlARPoPP4RJm0CgZCuQ1psiD8JYrSzhTUsbhWC0xf3cy0/rIZ6ziek1AWkF38peY3hUV
	oB5zpy9dRhTn/y9c6G0DRGhcI9N4BfPzdsJ8Vy7x3JKssYt1A8cqo6HjCYAxc6aV0eeDZWPur4F8h
	gLYMQ6lCkO7/5eCHLhRLwyk5B6YJ7NLAu93cZKy3/lkjqwcqxiOhMhSCC4quW8RUMuoQuv9+Mq858
	SFy+GpE1dZ0esKBsmH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tViQq-0000000ASpb-2j4u;
	Thu, 09 Jan 2025 02:38:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tViPb-0000000ASDA-1Edc
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 02:36:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2165cb60719so6599915ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 18:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736390202; x=1736995002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05wirhUQV9Km8dQngc0z5Y797cbCbqNKIhJCCOZ4z1g=;
        b=ePs+o2dBQYkUGZCSbdSw4Sua0mViKh96Ifa9z6xSPy91/KnvR1MroDJzMY4ezUxH2d
         NOrw+mn3wzrG18f/87IPxXWiAO+KzpuJ+JSfvhu9n8ftOPgj1eGacucClC/EIhJtBLHj
         ISpeYB+70tyKsSgUQA2g2q9gozp2m6WSUXR9qMdb41lTVDRr81Ps2g6uW/iqDOo9HkD4
         SEME3/BM8hy1r6T4LEFFPYmlLJVxK1zuvxRU9H0YlmqNZBH8cO/EagAJ/iA/E9b5etPN
         O7xWFecZPPmokX4AufO3kpaESznhOYPLpNulk+p7vAtY87+dR96GVx4eguSn6i8U/Vs/
         HA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736390202; x=1736995002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05wirhUQV9Km8dQngc0z5Y797cbCbqNKIhJCCOZ4z1g=;
        b=Yyduv5jJofg0VYGphUWuWMdDGIoaYqtwn9xeJAxlxgQyBzI4d4DPky5tKhqeO3rRBV
         kLGSlFM+pfDCWh6Iyz8777yKhlaRTV6NQm2n7b7iW+7MAkGHxScFT6bfDka8N8TnkMO6
         XdqozS38JbzeM9ArcpGRrEDs2oQkDyGsJG9abL5w6Ub1W973jo6sVu2xXb2XuNxcFd3k
         ylCWpbuVwdokPVBwjFqEwYQQv86EtBtR5JYI5WPi5DGvq0aD1XI6qOfZMuMds3ez72nK
         Yn7eOgSlHNvzBxXBVho2PlEnmcGL5qRIGd5hOH8ZWleZHQNxDujFX7wx5Juc0wyfp2q8
         uB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/Eks6PLNsCdgDbXcuEWXt/li25LRpol1Db5Tbcx+MDQxpA+4U9Ziv4iVJFLa5R6kMxnu1UJg0YxqdFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcR/+kBv/t5d09DZLQuK9StDqjgtO3n6qTT8b5/Jk9imbnM/TQ
	FHEcC/SNycb9NvZhY0j+9JBUPz3Z3u6gSBXXiEJ/DRirD9F5lVoYxK90yaDpCj8=
X-Gm-Gg: ASbGncsGUs4mY+DcOQTSXxj8volW5aBX+SkFWOyQAzYrNdaIP5KHFfhHWbyXKZFKsHS
	mpnC3Ew4SH5jXP8MZjySLnbXTsk806lX0foJ+4jPBdK/8dEtj0U3khGlG/qww54pT5Kom2THLL9
	Wf/VIPhOXi54DOQ0VqIQvVq5c3/egNf/C2GtTbVXAw3/FCx8LUxIYjGWM47ddDoQYX9BpVnNt0X
	05gw0o2F68aTocHhK0+w4QweszVzrOQdG5AINcb1dyi5r0yqVF0zUfTVqGbA4AU5JAq7BNW
X-Google-Smtp-Source: AGHT+IFiR6AClEYyCeay/hplxruI5zUWl8aXWQv5HrmktLRGxcP+45E5k67qNfXZ2vQHsxEzKTLuZw==
X-Received: by 2002:a17:902:e74e:b0:215:aee1:7e3e with SMTP id d9443c01a7336-21a83f36d48mr71977845ad.5.1736390202400;
        Wed, 08 Jan 2025 18:36:42 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9176bed6sm1434365ad.12.2025.01.08.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 18:36:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 08 Jan 2025 18:36:18 -0800
Subject: [PATCH v6 03/16] perf tools: csky: Support generic syscall headers
MIME-Version: 1.0
Message-Id: <20250108-perf_syscalltbl-v6-3-7543b5293098@rivosinc.com>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
In-Reply-To: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ChjCi+WDWxIeAEQr9uB+RlwWvFzZ2k5NiZ20md8SwKA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3q9mU4tJ+sitVdXi50kly5mevw4wyvfdsnPgvhdN/OkF
 E6FMH/uKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCICIQy/2RdYF5ldWF8zbd2d
 Iy57ZizXVH5wpIj5cMz+BVkp0tNW72D4K6jHKPDXw2RxwY/fvdLvimzW+CzMzizzXBKnqnNhe9M
 KHgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_183643_326482_C66A0646 
X-CRM114-Status: GOOD (  13.39  )
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

csky uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.perf                              | 2 +-
 tools/perf/arch/csky/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/csky/include/syscall_table.h          | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 44b9e33b9568f638ba12ad688833fdb661c16c16..3fe47bd21c0ea39473c584c82383ca5d4daf580f 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc
+generic_syscall_table_archs := riscv arc csky
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
diff --git a/tools/perf/arch/csky/entry/syscalls/Kbuild b/tools/perf/arch/csky/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..ea2dd10d0571df464574a9c0232ada0ac1f79a3f
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += csky time32 stat64 rlimit
diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/csky/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
