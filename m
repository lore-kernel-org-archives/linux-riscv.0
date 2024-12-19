Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4F0E77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sSwnJmZuQRy/2F2WQNg+3MBHMhjOqMWIynFcW8JQ+4A=; b=di6uZ7ieUr+o+m
	xgaMe14EYHczdSQ2lfXy9il2NEgWa2Vhfmm+diwU48/eIDnkfoHRgoCY/n3LRaoR+ZNr1iZLQGyDy
	PTftfsdNpcRh8wRzgabUYBU1TYZ2FL31yL9sUi2gfrSEFTph5pgCaa+GYgB7034WXrXp1XdM9I3lc
	j1bOqyItZqKbm/3c/dNcK1P/vbgmSy3kXSYwehgibQ6ay0DxVQ0PfAfExkuj7UV4cBZOk42hd3zl5
	bT/C36eXEsvfyyRViikGvyUHkznQjpMMmxLSC7lAylLhlAsRnpYvRDoeHc2KDJp1Rz0luCQFBym5Q
	Xq6Fm8BPp2syJNx2Mkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOK1-00000003C1Y-02NS;
	Thu, 19 Dec 2024 21:44:41 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOJy-00000003C0r-3sra
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 21:44:40 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so1005557a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 13:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734644678; x=1735249478; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYEfqfk8DGuXJ+bqhaUnePdNAvFx/LugbO7a0lVFtTw=;
        b=tRJhHkGL8Pzbq//SS9ZYQD92UD4ylZZM1YNfyewzkqCHKaUqk+4ibGnYxuFRIOZtTO
         WiXBcL3fiy/fnqRW3dxgCfzO5JpdkKLF2gUa9NBHH4eWNb560UwCCGipG0iNhMBHNok6
         s83i5zkTv/RRhrLtPkCXe5O8Ix6ADdGqlTzeHYiIbuEPexpJuE3TuHdWTCGO7Z1oHKGQ
         CVd8JDA7WBCwzqgkI4Z6Pr9C8QFfQlApyMDI8SDt+R5z7T75UglOYmuiciMr7/8FAvKH
         +NuAdqRtMq1Ts1A00nWG4k0IV+nhmMVPXzCEEhEFNMM0Mx32R0AC7/62GKScgiVeo1w5
         pcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734644678; x=1735249478;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYEfqfk8DGuXJ+bqhaUnePdNAvFx/LugbO7a0lVFtTw=;
        b=QmXVvUSByN6AjujpMSLO8gwyMOfnvCD+Oot5JijgSvdWxyO9KCf3fKtpEUXu9XZ2U3
         l0YEYQhnQw2P62FR79nBVnfMrE8Erv71oTubf5plfbJ8ggZaztLe55YsL7e1jXtq+X5c
         RmRIn3kVmrEvpIui+d/+dCc/KvJqbmHVfBMtl4lkTaCLiv6jFuLJ6v4ZC3bBMTvpPuBy
         hsEs4/Do/t2JkVVnGwu2qGyr4womtC90tk1fN3L0f6cKs2z99BQ+ysekERn+4iXhFEA0
         MbzzNse/mkiv3KJR1DKQAW1CAy8Cq+j0qVoXvv32i4Iepnq8fJphHB71Q7oYWbzyi5rE
         fSsw==
X-Forwarded-Encrypted: i=1; AJvYcCWAPUb53zwO9/hbXr34O/FR3wkDq14hTieiWTJoFmRvLv3DnJVo+jwe5mUwUMxKvlJToE2OVSfZSyKRrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc+AV33ABbK37OpPPZ8d2i54ORsS84YY3GseXbGGXv8DgASiTM
	d45uYAnrSp9mCcf588S4PrKx6PNm5YdU+s0dv6+oc/BJHeuUXO+E7wItYqHZbYQ=
X-Gm-Gg: ASbGncu/ldpBqthgkUOEKzWVMjx1IupRS0kWTbAfSkdKXXq5cfG/gzDG5gxcliHXVnw
	QVeZfAzwU7Ic6NGT12rRays9bleFwL/3HePQQlYGYUBt1uRXOwS+cSOyHVA+UT66HbmHPwGpcxK
	cuMXtu6i15voXBKK5/AlIBoOf5/d/h23GnoQRWHQ2Y9KQK+Fe/HrKN0PriKPjQ6VeGY7bA6dZo+
	ySwiPzE6k5UkNAb/GaAryY4T6HqgiXsBKZ5BsmcUSsXqx4e2ilYXp1uVkKjHc7lByCgvBPx
X-Google-Smtp-Source: AGHT+IH3kYwgtQW1aXJARuWrTfbyWFEx2W9Kj5c944+awCZK4morLQyWo6rMAMCN9RkSh+qEbRce9w==
X-Received: by 2002:a17:90b:538e:b0:2ee:fc08:1bc1 with SMTP id 98e67ed59e1d1-2f452eeb5aemr855129a91.37.1734644677918;
        Thu, 19 Dec 2024 13:44:37 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52d27esm3847949a91.10.2024.12.19.13.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:44:36 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 19 Dec 2024 13:44:25 -0800
Subject: [PATCH v3] tools: perf: tests: Fix code reading for riscv
MIME-Version: 1.0
Message-Id: <20241219-perf_fix_riscv_obj_reading-v3-1-a7d644dcfa50@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIALiTZGcC/33N0QrCIBTG8VcJrzPUbbp11XtEiDrdTpAODSnG3
 j03CKKLXf4/Dr8zo2Qj2ITOhxlFmyFB8CWq4wGZUfnBYuhLI0ZYTRmt8GSjkw5eMkIyWQZ9l9G
 qHvyAjdKOMG0r0zaoAFO05XDDr7fSI6RniO/tV6br+mX5HpspJliLpuOMc6I6fYmQQwJvTiY80
 Cpn9quJXY1hipvWtVQLXRvR/2nLsnwAxBQauxUBAAA=
X-Change-ID: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4747; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=wWyB3e6Pwb2xRIuVd33jnwwDT6+K1bV7pj/iZQhcDZo=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rK5L1hex84vCmuenXW62S0/v5jDz8cWPAsouaTyOVom
 ZNvu3pSO0pZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZiIkhLD/xj3KdP1NK0+eh9q
 u5bs1HWwUkFhK6P3pJP8j7N9Ze8ynWRkuCp0uNNb9rbNc9n4UP49Go+2r+hbrJTVWduqOZtBQOI
 gJwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_134438_964469_5B5EB341 
X-CRM114-Status: GOOD (  21.45  )
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
A binutils patch has been sent as well to fix this in objdump [1].

Link:
https://sourceware.org/pipermail/binutils/2024-December/138139.html [1]
---
Changes in v3:
- Dynamically detect riscv for objdump change (Arnaldo)
- Link to v2: https://lore.kernel.org/r/20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com

Changes in v2:
- Do objdump version detection at runtime (Ian)
- Link to v1: https://lore.kernel.org/r/20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com
---
 tools/perf/tests/code-reading.c | 92 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index 27c82cfb7e7de42284bf5af9cf7594a3a963052e..b1abb34d7818d8a9ac963e2185ec3e7d9bf8d387 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <inttypes.h>
@@ -8,6 +9,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <sys/param.h>
+#include <sys/utsname.h>
 #include <perf/cpumap.h>
 #include <perf/evlist.h>
 #include <perf/mmap.h>
@@ -176,16 +178,104 @@ static int read_objdump_output(FILE *f, void *buf, size_t *len, u64 start_addr)
 	return err;
 }
 
+/*
+ * Only gets GNU objdump version. Returns 0 for llvm-objdump.
+ */
+static int objdump_version(void)
+{
+	size_t line_len;
+	char cmd[PATH_MAX * 2];
+	char *line = NULL;
+	const char *fmt;
+	FILE *f;
+	int ret;
+
+	int version_tmp, version_num = 0;
+	char *version = 0, *token;
+
+	fmt = "%s --version";
+	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path);
+	if (ret <= 0 || (size_t)ret >= sizeof(cmd))
+		return -1;
+	/* Ignore objdump errors */
+	strcat(cmd, " 2>/dev/null");
+	f = popen(cmd, "r");
+	if (!f) {
+		pr_debug("popen failed\n");
+		return -1;
+	}
+	/* Get first line of objdump --version output */
+	ret = getline(&line, &line_len, f);
+	pclose(f);
+	if (ret < 0) {
+		pr_debug("getline failed\n");
+		return -1;
+	}
+
+	token = strsep(&line, " ");
+	if (token != NULL && !strcmp(token, "GNU")) {
+		// version is last part of first line of objdump --version output.
+		while ((token = strsep(&line, " ")))
+			version = token;
+
+		// Convert version into a format we can compare with
+		token = strsep(&version, ".");
+		version_num = atoi(token);
+		if (version_num)
+			version_num *= 10000;
+
+		token = strsep(&version, ".");
+		version_tmp = atoi(token);
+		if (token)
+			version_num += version_tmp * 100;
+
+		token = strsep(&version, ".");
+		version_tmp = atoi(token);
+		if (token)
+			version_num += version_tmp;
+	}
+
+	return version_num;
+}
+
 static int read_via_objdump(const char *filename, u64 addr, void *buf,
 			    size_t len)
 {
+	u64 stop_address = addr + len;
+	struct utsname uname_buf;
 	char cmd[PATH_MAX * 2];
 	const char *fmt;
 	FILE *f;
 	int ret;
 
+	ret = uname(&uname_buf);
+	if (ret) {
+		pr_debug("uname failed\n");
+		return -1;
+	}
+
+	if (!strncmp(uname_buf.machine, "riscv", 5)) {
+		int version = objdump_version();
+
+		/* Default to this workaround if version parsing fails */
+		if (version < 0 || version > 24100) {
+			/*
+			 * Starting at riscv objdump version 2.41, dumping in
+			 * the middle of an instruction is not supported. riscv
+			 * instructions are aligned along 2-byte intervals and
+			 * can be either 2-bytes or 4-bytes. This makes it
+			 * possible that the stop-address lands in the middle of
+			 * a 4-byte instruction. Increase the stop_address by
+			 * two to ensure an instruction is not cut in half, but
+			 * leave the len as-is so only the expected number of
+			 * bytes are collected.
+			 */
+			stop_address += 2;
+		}
+	}
+
 	fmt = "%s -z -d --start-address=0x%"PRIx64" --stop-address=0x%"PRIx64" %s";
-	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, addr + len,
+	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, stop_address,
 		       filename);
 	if (ret <= 0 || (size_t)ret >= sizeof(cmd))
 		return -1;

---
base-commit: 233157785a34612e5899be6edcc6a53ea682d379
change-id: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
