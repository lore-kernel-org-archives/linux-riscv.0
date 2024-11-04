Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A74D1BDF2
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 21:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lf3/54k3HndxcB5bmQ3ZbJPfI2iN3q/6zEwHdtljiDU=; b=wvcGNKexN7Ukb2
	P6cmF0W8Aup0mmkHvjoButCqFKK1eeKLsSigNn6UfWK7w3Eqw9sHaA0cDG0gwS7OCJCRZ44KRpvaQ
	bVGWFf4sMCIzjESHZQDyjw8AUSmqNcyGl7sZXtvInSOlcLcDsB/cwf00LlMOaHqf9v3GBRUi0i05o
	KlcLJHrWN9YUDbpvvDrup3QCO7cqKH00HnEbcKE3iaXKXJg2+BI+ZToIupPrTZQApameFqNMUJTc7
	AFf18uF7KdsEFeNyddaBdDqEOA/cfazpbRUkBH8Ra08w6lTPlzucB9h8Distmvsuw/Hv4+D/mdEpc
	sShVipPM8evuLVunLkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84P5-0000000F7v4-36kT;
	Mon, 04 Nov 2024 21:14:27 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84Hj-0000000F5Wg-1oQ6
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 21:06:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so3674952b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 13:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730754410; x=1731359210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+963qXEwYm2XJW7YS60AKfnebwcLNYV8rSqgqXSlsc=;
        b=rdXneaK68vCCItKCzHJTHw+gmeUTJaE7RxA0CElhOWOq7n/QukeyyZSKnyTu/RXFrF
         VIl73VOQuC0dT7r0R/OGkFseLCHSUbhkCgO4Hq84KGh1rr5c5Mcq+nvl79PZ7FDqxdhJ
         /5PYPGv2FIy0RnZ7FFfLdT0lEFvoXWdnhRqlYYR5S52LiY5uE/ffs4H41F47t97H4na0
         q1cNR1icQnywlSimGH2fhHcAhzWwLKiedb4iUBIyPWkdVtjKlfAIdHekIhO7LrAsRY1Z
         8MC4a09N9v0dA5HJxyPJ/o+fE+SPfsdso2tPPNtuqRHNZStYCCc/weTIra8o5s/wbsuv
         vM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754410; x=1731359210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+963qXEwYm2XJW7YS60AKfnebwcLNYV8rSqgqXSlsc=;
        b=VJFJPFV4pvHPNzWNI6vCA70927LxV2yDvG98KnvKpnfjAh6loI2J8QIRwze//9J52G
         0tg1FhnJ8RRz1ZVWYjlH+8hpuGtCIa0/XLg8qPf/ljLd14l7DDt9O4d1Aslj2c37xwPF
         PgQ+Zjp2Ztt3MWEndp8UDi7Y76Lwsus/XdUGbpcg3tIZzdh/4nJqdBshVlwlncXBES+1
         nuhMDK6kMNeIZ8DMtwstuwB7purJ9fFYKUaS4KhwYTqBMWcYiSsXHuDKk4O0EgH81xCt
         o6A0t+vHxJrQfD2/YlU52ONplwWFE697v7cBkRzeCFCx0I8kAdxnZ3Wu3JRWrpmvIzyF
         9j6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVhFEbpCQHzuU323EsmXqs+7eEe5rg6uiC/NUoeJo5GS6dyhEF4Kv+hSiXiJOUOPixvkI5AHP88aXTcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaDXv9eQn3f9FzH5p1FYv9olTQOe3zCpFj9gOGXnneXMQ+Mc7o
	BBJ6m9kfKPSWdVVBa4QGtVrjn4kCVtp/SdbDdF5zGlAvtB06tHcNMLrxNQgoz8s=
X-Google-Smtp-Source: AGHT+IF56vX4uXLDm1AHdM0OyBuJkwT7LeC8FxDJ053gvmIEUtUOVtkQSjLnyUylcTDwbzpxIp0ndA==
X-Received: by 2002:a05:6a20:3d88:b0:1db:ec5c:cae7 with SMTP id adf61e73a8af0-1dbec5ccb0bmr2012154637.40.1730754410022;
        Mon, 04 Nov 2024 13:06:50 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee490e08f4sm7248293a12.40.2024.11.04.13.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:06:49 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 04 Nov 2024 13:06:05 -0800
Subject: [PATCH RFT 03/16] perf tools: csky: Support generic syscall
 headers
MIME-Version: 1.0
Message-Id: <20241104-perf_syscalltbl-v1-3-9adae5c761ef@rivosinc.com>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
In-Reply-To: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2542; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ZitlmStPUDyqE42TaZ1/Aw7xZREQZHuveVKJPTTwCSY=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7qmebSPvJLnlxCDzruxNWwTI9QuWXrtCxerXi23pumc1
 TmjYJuOUhYGMQ4GWTFFFp5rDcytd/TLjoqWTYCZw8oEMoSBi1MAJnLnEMNf2dTNCj4yGg/ju9Z/
 PpMy3XOKlK28r5DDSzEJ47VhC9v5GBn+SDgfyNnayyra/erw82XVu80mWx/ya+lR2ioWWRZ7/x4
 HAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_130651_940743_352DE7F1 
X-CRM114-Status: GOOD (  14.03  )
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
 tools/perf/Makefile.config                            | 2 +-
 tools/perf/Makefile.perf                              | 2 +-
 tools/perf/arch/csky/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/csky/include/syscall_table.h          | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 504d762cc572..a19c59c8cd3b 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 02ff3f2fcf12..7c5fba39d8e6 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/csky/entry/syscalls/Kbuild b/tools/perf/arch/csky/entry/syscalls/Kbuild
new file mode 100644
index 000000000000..11707c481a24
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
new file mode 100644
index 000000000000..ea2dd10d0571
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += csky time32 stat64 rlimit
diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
new file mode 100644
index 000000000000..4c942821662d
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
