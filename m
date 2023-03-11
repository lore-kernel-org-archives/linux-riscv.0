Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72273C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9L9WpkKSeHtJKYRc39SX2HVt1kRdQn/jAceswsjWAWw=; b=I9+J3xEkVRNs7f
	CAA+1MRgT0Ckyomg3xjIxdiIjsQ407auY41fKU6hZEqaKy7tStpy2oN4aYU3LbuVfO6qK77g2uKHL
	4Rys3r7cDAK2JXRiMDsZ4PAUY6zwzKz5MaoDz9wqDFnuV5VTlChMcZnMlPguyqfUKS2piKfeu7teU
	gXUigXV3BR5acp1HL1gY7nKRu8zottA1PIhEw4OTi+/E1TsEHheDKPJYvd9VnM1dGt+OM8t5U+ZpU
	Om7NFU7TZIg2bG7wSNP6PavFD5lTJVzXVU590U7RqEcJk0BhTf6uiycl9LcKC8gtfBQo/AJlAfmjU
	M0eeDyp6YC9ay+MlG1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxOZ-000LUF-OX; Sat, 11 Mar 2023 11:28:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxIp-000J08-QD
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 11:22:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id i3so8215105plg.6
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678533737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ3pWdzvgyzFWwehYnV2owVmjn0zg/w4S967lskCtEY=;
        b=o9by0IefuLncZNR0lGzGGkYmV3tCLpct/VIqyysUdtMMmijUXRXVvYczYF19jx4w/9
         3P6Wph9/uqDRVkssg8IcDPd0N1cNPDcjXEdXGSMl62MwpYHv5MnmyQdaxrI8G244b8G9
         mIL82j60RuLTahi1ij14+rGMY02lmqKmUx/2FGa5at0nQjiL1b/oUqtsvgVkpYvyZfzU
         lUTJUpaW0OyZQvg3OkSIPqpshIzG+8OL2wcZaKE2R8/gpC+bbnUj7jNBfKrePZSJsswO
         8BPGWMynCzdEmSqGxS4gbYJJcbQmU6XO1TYIUsoghWSJkre2IZIvDaX9DAbifYkeW5IA
         CWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQ3pWdzvgyzFWwehYnV2owVmjn0zg/w4S967lskCtEY=;
        b=iz7sekHuqM2gTjcgETpa44Z5sjk4gKTBjbYl75COug1hNiI2UCbY2JuS5dkRtJh3TL
         Y8Jjf6kTB0bZOZqLZiC261la1LbyL9E0SCqhzmi1lE4cNlxc155eI5xlnoQe5PpW6/1S
         WvYxWUYDVwN67dRbA3H/9nmS0RQVOaXnZ3RwBVkuFidMT6Hgb/W8Ry+27mjOM+vLxYxS
         PYDfRbZqCb1S0qUsg6PWX5QFCp/cpLIvl7rKCSW+O8YJKGxiQxs8g9qysUeiSWh0nOJt
         t1ZI4iRfB6O5v6gw+h2srDgAqNO4kzqMjqk6xhmW+kNKDhe7b8aohUweevEi1mfamraZ
         tH9A==
X-Gm-Message-State: AO0yUKV4W9hSbF+VZKlZAZ3ICZKAl6/jVX2jpgjV9U/HOia7xGtNmgdL
	QrKuncZo6sQ1GxCgJqQI3g8=
X-Google-Smtp-Source: AK7set+2yemjXIhufbiQIUZV+/nrTJ6zdAlrOSUpszmESQ+sgDlwA8YkmZRJZG9bi+ACHzp79Mr3Mw==
X-Received: by 2002:a17:903:230e:b0:19c:b4e3:c660 with SMTP id d14-20020a170903230e00b0019cb4e3c660mr32223340plh.47.1678533736916;
        Sat, 11 Mar 2023 03:22:16 -0800 (PST)
Received: from kim-GL702ZC.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id ls8-20020a17090b350800b002367325203fsm1326941pjb.50.2023.03.11.03.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:22:16 -0800 (PST)
From: paranlee <p4ranlee@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>,
	Anton Blanchard <anton@ozlabs.org>,
	Daniel Axtens <dja@axtens.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	paranlee <p4ranlee@gmail.com>
Subject: [PATCH] perf tools riscv: Add support for riscv lookup_binutils_path
Date: Sat, 11 Mar 2023 20:21:22 +0900
Message-Id: <20230311112122.28894-1-p4ranlee@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_032220_135320_02264B7C 
X-CRM114-Status: GOOD (  10.08  )
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

Add to know RISC-V binutils path.
Secondarily, edit the code block with alphabetical order.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 tools/perf/arch/common.c | 51 +++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/tools/perf/arch/common.c b/tools/perf/arch/common.c
index 59dd875fd5e4..058527ededdd 100644
--- a/tools/perf/arch/common.c
+++ b/tools/perf/arch/common.c
@@ -29,11 +29,23 @@ const char *const arm_triplets[] = {
 };
 
 const char *const arm64_triplets[] = {
+	"aarch64-unknown-linux-",
 	"aarch64-linux-android-",
 	"aarch64-linux-gnu-",
 	NULL
 };
 
+const char *const mips_triplets[] = {
+	"mips-unknown-linux-gnu-",
+	"mipsel-linux-android-",
+	"mips-linux-gnu-",
+	"mips64-linux-gnu-",
+	"mips64el-linux-gnuabi64-",
+	"mips64-linux-gnuabi64-",
+	"mipsel-linux-gnu-",
+	NULL
+};
+
 const char *const powerpc_triplets[] = {
 	"powerpc-unknown-linux-gnu-",
 	"powerpc-linux-gnu-",
@@ -43,6 +55,20 @@ const char *const powerpc_triplets[] = {
 	NULL
 };
 
+const char *const riscv32_triplets[] = {
+	"riscv32-unknown-linux-gnu-",
+	"riscv32-linux-android-",
+	"riscv32-linux-gnu-",
+	NULL
+};
+
+const char *const riscv64_triplets[] = {
+	"riscv64-unknown-linux-gnu-",
+	"riscv64-linux-android-",
+	"riscv64-linux-gnu-",
+	NULL
+};
+
 const char *const s390_triplets[] = {
 	"s390-ibm-linux-",
 	"s390x-linux-gnu-",
@@ -78,17 +104,6 @@ const char *const x86_triplets[] = {
 	NULL
 };
 
-const char *const mips_triplets[] = {
-	"mips-unknown-linux-gnu-",
-	"mipsel-linux-android-",
-	"mips-linux-gnu-",
-	"mips64-linux-gnu-",
-	"mips64el-linux-gnuabi64-",
-	"mips64-linux-gnuabi64-",
-	"mipsel-linux-gnu-",
-	NULL
-};
-
 static bool lookup_path(char *name)
 {
 	bool found = false;
@@ -164,18 +179,22 @@ static int perf_env__lookup_binutils_path(struct perf_env *env,
 		path_list = arm_triplets;
 	else if (!strcmp(arch, "arm64"))
 		path_list = arm64_triplets;
+	else if (!strcmp(arch, "mips"))
+		path_list = mips_triplets;
 	else if (!strcmp(arch, "powerpc"))
 		path_list = powerpc_triplets;
-	else if (!strcmp(arch, "sh"))
-		path_list = sh_triplets;
+	else if (!strcmp(arch, "riscv32"))
+		path_list = riscv32_triplets;
+	else if (!strcmp(arch, "riscv64"))
+		path_list = riscv64_triplets;
 	else if (!strcmp(arch, "s390"))
-		path_list = s390_triplets;
+		path_list = s390_triplets;		
+	else if (!strcmp(arch, "sh"))
+		path_list = sh_triplets;		
 	else if (!strcmp(arch, "sparc"))
 		path_list = sparc_triplets;
 	else if (!strcmp(arch, "x86"))
 		path_list = x86_triplets;
-	else if (!strcmp(arch, "mips"))
-		path_list = mips_triplets;
 	else {
 		ui__error("binutils for %s not supported.\n", arch);
 		goto out_error;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
