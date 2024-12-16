Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB97E77186
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 23:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euGVpxwk9nNDjQcfc3CZ81fmWy4AvahwXx1JysmU2DU=; b=am/ZqIBdNNKlrA
	r7J+zXnVu1+XOVl92I0fYfQhRQF2OQuvaku5hnJEDfeep2vipJKrfNylY8B362kZEZLoolzIIxBs7
	tFrLz81f531vfdkNGHA/WVY7LR9t8RRQB7mKQ6pPOEz2yZQ+FnuDZvjIrXarKGbeMHMen2nXT8zzT
	xkW4T28vYMnucz15x+8zuYNILjmETvr986euR13aNFb2CRjKsqQtUwzUM7KlEBilXrVzi5HPje0lG
	UoK46+jdmVzB6Law42zadjWG5pSI8jl9JtgiKDC7YWmfL7u5/kMd8BqF1+v5EEoW7lN5dL97cT8cf
	Y/anQIZoHDYM1Gk68luA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKHM-0000000BcgS-1kRO;
	Mon, 16 Dec 2024 23:13:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKHJ-0000000BceO-24Hb
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 23:13:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21654fdd5daso38629445ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 15:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734390809; x=1734995609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm+gy0vg6ADpwKtQUne3ds2s3sgHguLz0qdVVhDqizo=;
        b=fnFB3NLHfG7QZlZ3o2r72AuUTOfkXT/piu8nHBSRmbfzGYIQ0zrHVZivxbknyn5LJg
         Vyn7lrhCbDBhLAsJ2MWYRwd3q4hTrJdZ856UgFZHKeU33IdA+KpMlvOUOhpDFo/tTUlC
         v/KsYgROuyOVefkseQgP/ojHtTR/afhafVHwuxVgXEFR9VAuuUVqz/YO73IWq/doAfpd
         QIe07+EskodSFpp2rRb2OVBiHryub4rHLLfuNTGgIxldUe+Oi9mSOftm+8E/H1ejGcTj
         EjLHeTBkaP7Ml0twZmKTKyZ1+3iHHmYhmDGUouNkaGILgBSaUJ6Q+V3y76b8uJJoP8ny
         M3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734390809; x=1734995609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm+gy0vg6ADpwKtQUne3ds2s3sgHguLz0qdVVhDqizo=;
        b=eJLOM2tc4jbPX3g8hb+IDk+k0cY5Io4wFNQ74gCVApRnu38dMQgZfDnPaAQtGFrLds
         wfqjydlQzcG/M7gHoK+nZnivqL2fUZL6FBIXFqwHyrQZRMEdwIrHtDkqN078VPU6br0C
         IDb2IURT+3PJ5rH9OUW4RbwUjxQ2dhXB4ZCbrVQCW0y0PR3OFNfrdHKx9/w79ATZgVrT
         N7AsxT+VW5jP1LwlRWegTXhVAsrcVSi3y4EjghnMuJi4ywCq+iegQYzf9NbqHUogWi7N
         DPhDinmXAlkX2E38BfiJN7T+Dd3TOfBzjG3lHCfQ18jkvMeYwPUXt6nJlsE8COsVTJuR
         jQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUaLHN/b50mYABcHOONRsms2GKeMId4zFSQjNm9NMa46ihClaEnxr/zTQKzwcnYn6cFEoJVtDIp0N/XA==@lists.infradead.org
X-Gm-Message-State: AOJu0YypVO9iPDhjhO5T2U+xFb3wRjaK2534MJ0xFb4MWhBp09tZB2yJ
	kcPyMqDODi8tCkW95zPDxeGbMxsQ0jFur/ueThg1D8Z2YWwkY91O+q3X0GDsAzc=
X-Gm-Gg: ASbGnct/VZHGA3GivpHmLEtkzQYtKurop3iDSQc6YdvAQBvQDG/BaSfVhkLnobZwpVs
	e99JVEXfLMjK5ik257MB1wIfhikazE+sgYzXQD/sdUfT1samAoQMkIcfH2wmxzsgVYKyKooKe1n
	ftYNttsP7uVMVLoX6oKqaue3sU+kMYXV2k/4xnxRjg7S15wtTGMNwXQohPckk47cI2q8b/bEJkm
	IKoIw+1ednwC/MRVMrujCP1cDZKXfokTuG7nz2FrElGdMg/GlpQssJJLfZV729DRrIsGaDP
X-Google-Smtp-Source: AGHT+IEUS1KQ0ef501yi9KQdApUOJap2Q7VLgsPuhiCn2hfgEw7VxTtRPysE5A5XxEfaj3jPqra1Kw==
X-Received: by 2002:a17:902:ecd1:b0:216:3eaf:3781 with SMTP id d9443c01a7336-21892a58734mr187815855ad.43.1734390808967;
        Mon, 16 Dec 2024 15:13:28 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcc47bsm48333255ad.63.2024.12.16.15.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 15:13:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 15:12:52 -0800
Subject: [PATCH 2/2] tools: perf: tests: Fix code reading for riscv
MIME-Version: 1.0
Message-Id: <20241216-perf_fix_riscv_obj_reading-v1-2-b75962660a9b@rivosinc.com>
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Nelson Chu <nelson@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=k4Sj7dM5EROtRyKRIxtv+8o9o4DaFse9qSyIbzlZ98Q=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rCFsHN62Zdecfs+JNP2uLlep5+jx3vdkTV/r39gW3+i
 RnX8+22dZSyMIhxMMiKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCR+wmMDF+2JGUuPhm4eJ+U
 wobqzxGrOt5EMjWvrZGL5XpxZAfXtzWMDFOnT7tTaS962CctyFjKfIG1dduJX4UMnUpCpZ6iYvz
 KnAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_151329_541792_C12550B1 
X-CRM114-Status: GOOD (  15.37  )
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

After binutils commit e43d876 which was first included in binutils 2.41,
riscv no longer supports dumping in the middle of instructions. Increase
the objdump window by 2-bytes to ensure that any instruction that sits
on the boundary of the specified stop-address is not cut in half.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig              |  5 +++++
 tools/perf/tests/code-reading.c | 17 ++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c071b536df59c0eb11d55f9080c7cd..f164047471267936bc62389b7d7d9a7cbdca8f97 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -229,6 +229,11 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=8)
 
+config RISCV_OBJDUMP_SUPPORTS_SPLIT_INSTRUCTION
+	# Some versions of objdump do not support dumping partial instructions
+	def_bool y
+	depends on !(OBJDUMP_IS_GNU && OBJDUMP_VERSION > 24100)
+
 config HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option,-fsanitize=shadow-call-stack)
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index 27c82cfb7e7de42284bf5af9cf7594a3a963052e..605f4a8e1dbc00d8a572503f45053c2f30ad19e3 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <inttypes.h>
@@ -183,9 +184,23 @@ static int read_via_objdump(const char *filename, u64 addr, void *buf,
 	const char *fmt;
 	FILE *f;
 	int ret;
+	u64 stop_address = addr + len;
+
+	if (IS_ENABLED(__riscv) && !IS_ENABLED(CONFIG_RISCV_OBJDUMP_SUPPORTS_SPLIT_INSTRUCTION)) {
+		/*
+		 * On some versions of riscv objdump, dumping in the middle of
+		 * instructions is not supported. riscv instructions are aligned along
+		 * 2-byte intervals and can be either 2-bytes or 4-bytes. This makes it
+		 * possible that the stop-address lands in the middle of a 4-byte
+		 * instruction. Increase the stop_address by two to ensure an
+		 * instruction is not cut in half, but leave the len as-is so only the
+		 * expected number of bytes are collected.
+		 */
+		stop_address += 2;
+	}
 
 	fmt = "%s -z -d --start-address=0x%"PRIx64" --stop-address=0x%"PRIx64" %s";
-	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, addr + len,
+	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, stop_address,
 		       filename);
 	if (ret <= 0 || (size_t)ret >= sizeof(cmd))
 		return -1;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
