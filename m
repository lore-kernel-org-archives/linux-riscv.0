Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A7E77184
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 23:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gl4aW1pgEIm3uxbxpKz3fAUM11WLbz/JW1Qpk/aR3ys=; b=YHUuvSufKA+v1/
	hGDJ1YA7VwM3T186zc33SMStFVKZZDsF2odfAkkm1edhaR1bqHfjxFgV6cMtbgTUzaKKV9SyKciz7
	MM1gT7Hyl8mM4Kg69q97bgzMhmyUhA1gpb5Xh8JjBogFhkmgCKB9Xlko9LJmbSjvFLongAqUAA3LC
	HxjixWGRWiXn1X4rYJgCn2yxHVdbPHBeT3gHrp6b8L5RgdtiaHMWl5TMo0s5yTN6fMvKbvOFp56PQ
	p0TxytB258/MMDNfbUhBp3H4IQCMIVBKpW2H0syK+6rxNcmEVIlUHDUXLnCgaQljnP05Uivtj95p9
	PRL5tmeW2iLFLUDqV1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhMf-0000000F8C2-3NCa;
	Tue, 17 Dec 2024 23:52:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhMd-0000000F8BP-0oA4
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 23:52:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2164b1f05caso54589415ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2024 15:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734479550; x=1735084350; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeOVEdFEHGFM6Kz0Pkc246HNNIx9K1qYWLTokvWzItw=;
        b=LnqHGuVgdshfVgj3jTlcqCgn+Hcv4eceZ+1TLLaCtJfMD/CEJGNAv7Sfp2XQ72/g8p
         zxS2W2IAC1pMIsW9EHrho0WZx/49VsoWoGQqSBgUNVVvr62JDad5vXkkBuWAX8HUoSNN
         Qm3K6ZKajLTKfuTd668mQfn75+e0wgecgMFZgNPvnHZ97/IMsm9KdwtM8V6sFKHxmVRW
         UOdEG/Ov/GGPejc/dhAmf4XRT5+tesNNUWdfognsr2jvTWxM0iZuBCyHu3xSJc2BLfl+
         6PrPEtqC37bvryJPsFX7MkcGUuoK7aUoAqG+yo7rbMx2kaEbryzeFfb1WVy2owKu0Du6
         wAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734479550; x=1735084350;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeOVEdFEHGFM6Kz0Pkc246HNNIx9K1qYWLTokvWzItw=;
        b=ZSkAG/VOOZdMTCWQgexEDVbUp5Mv2UYVNezupYnCZxGLljIvma1gmTVNliDehy6Pe4
         rhPencsnaYxMwOp2y7URkE00MpCgShLYLSdpOI5Rn/VwnmuMuUFVC/jq4c3gdU4EY7XA
         I0WfaKSSJpzmDHaQcdCiVu1Q9yIraXCyDzjkjJdxt9l3VsLjv7yp8sW6Df9wQopQGi6R
         KeDDOEc12BOkF+9BDE+jfJTJAsA5HZV3EUXYj84VEGSUrFe9GD+jYbOx/Pazk6rokoqT
         U6WKl2rSbDhrDyDFBS04gomO/YfaIAz1n5HAInT9Rt6W0jRZTsOxbiV65z9/9OOZyYI3
         71ug==
X-Forwarded-Encrypted: i=1; AJvYcCVZyCXD5iGbGjQYNJ73WI+ggWRUlBBJqSWilSI2RIjf8BcIAnjkSNVJJtk/iuhxiiqVogLgXRAA/XkLug==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwS1j1U7b+Ux31jrIPplACzEnVN98lT1h92wAD8cmm049uH+au
	zLVafEs4yYBonI91WGGTSc7n6yGeOEAeqa7tl5xtErASFNfudIxAFO73jDuCFeI=
X-Gm-Gg: ASbGncsK5GvqVmBoERprujAO+wy20hbQlSAAN+6w/5GDRx+XDOvdecyY4PppzfpK0R9
	dKMVjqqPHrQRkP0UvZoPtyYLevSMeq2sxWBIrlF0oYepgMGJjUDXApHMx8cKqT22liNfVaZ9DgC
	r98y8kMOjNte/CH99bG/uPUlGDFtRbRhqa5v6SuYXKVWhXu6kycMtUg/a/l28g/iXueR8gd1daP
	cV7l0Q0gMgpQqmap9al9P81Itn/A9o8lTpQM70YpwnUfKveqJopRr5aF0ZS89DEjjgF9Gad
X-Google-Smtp-Source: AGHT+IE8h+7wsOokGyz0BX6sDCEqaDaSYl7MWAZYjl0KKibeho6DEXkEcxCW4CpVQzh0X1E5CaXGpQ==
X-Received: by 2002:a17:902:f542:b0:216:554a:212c with SMTP id d9443c01a7336-218d725b78dmr9314985ad.46.1734479549811;
        Tue, 17 Dec 2024 15:52:29 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e72111sm64343085ad.271.2024.12.17.15.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 15:52:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 17 Dec 2024 15:52:08 -0800
Subject: [PATCH v2] tools: perf: tests: Fix code reading for riscv
MIME-Version: 1.0
Message-Id: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKcOYmcC/33NQQrCMBCF4auUrI0kqY22K+8hJSTptB3BpEwkK
 KV3NxbcuvwfwzcrS0AIiXXVyggyJoyhhDpUzM82TMBxKM2UUCepZM0XoNGM+DKEyWcT3d0Q2AH
 DxL11o1AOan9pWAEWgnK447e+9IzpGem9/8ryu/5Y/Y/Nkgvuzk2rldbCtu5KmGPC4I8+Pli/b
 dsHwq9MS8cAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4291; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=GMyLH59PFYiUYCKLwxtQUm2kAygEyDToR1S9m0WZNeM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3oS35br/zZf3zjl/K08fqNMNTNh4+5rr9IOWK2SE21/J
 +rxaKNkRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABP5tZPhv+9tu8bk+LXGbEva
 4wLbtZ47VNut59c7cejYjuf8R+tsvzMyvNENX8gTEHAlW3OV0v/I1CDe634fLnwyTFP7kbH/8uJ
 tPAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_155231_508889_252C15DC 
X-CRM114-Status: GOOD (  20.54  )
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
Changes in v2:
- Do objdump version detection at runtime (Ian)
- Link to v1: https://lore.kernel.org/r/20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com
---
 tools/perf/tests/code-reading.c | 84 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index 27c82cfb7e7de42284bf5af9cf7594a3a963052e..7e24d10a543ac18ac2be70b829d088874e0edfd5 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <inttypes.h>
@@ -176,6 +177,66 @@ static int read_objdump_output(FILE *f, void *buf, size_t *len, u64 start_addr)
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
@@ -183,9 +244,30 @@ static int read_via_objdump(const char *filename, u64 addr, void *buf,
 	const char *fmt;
 	FILE *f;
 	int ret;
+	u64 stop_address = addr + len;
+
+	if (IS_ENABLED(__riscv)) {
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
 
 	fmt = "%s -z -d --start-address=0x%"PRIx64" --stop-address=0x%"PRIx64" %s";
-	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, addr + len,
+	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, stop_address,
 		       filename);
 	if (ret <= 0 || (size_t)ret >= sizeof(cmd))
 		return -1;

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
