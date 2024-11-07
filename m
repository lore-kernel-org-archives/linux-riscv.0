Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F9D4337C
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 16:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/P8zgdixHxwgzOCIzLTI8PJ+xgTaGs+u5iecxcamLzI=; b=fViLRRtro5krI8
	9vYa72xOFEtGkVHIiw5rbeAQ06aI9449Wgm4YfF0t0cwVNMWjc0wtvqxrGjpXiexssuOpI7k1/AV3
	Ejefe0Fj+PG+8zR5HvV37IC/+fbS0b351Zm0Xyv4kwp1syZTBRRfl66S2L1RxltK5YK3Est6hppUC
	zM3aKC1oFciYfpVZhK60Yz4lcPCw1sysFaFgeIY4do07SACKZVE5M9UXhyaeD9IkB01NOlWeScJ1O
	3xFbg2Ifnd1U3bc42N+PumnBsv481q/FvmREW7MRLAQofJDVBto4Gpb5qBWisrxLMASyBFJ8zPH9l
	kty5UAoDpcTq08/8ayRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95SR-00000007fCT-1WXo;
	Thu, 07 Nov 2024 16:34:07 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95FW-00000007bbI-19Qb
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 16:20:48 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e38fabff35so22643017b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 08:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730996445; x=1731601245; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l25I5Jel5U2/0S9AyIDPTs5/QytgoUZMY3CNnmJZTzE=;
        b=RwQx6CuJDFrzx8h3PmdtYAPtN3XsdDHDxDD3UA9D8MghVoAgM3/XmYcOnyw68Xwa4B
         /RZ453TnrJKt0uQ24q0VHGKnwLSJ5z++c2tG4ObnWAKUAk/uELTUdsPR64TuHSftw2E4
         TMShdRA1PzNDQRn57BQvtFb5uGmBe1Q0/0pg5w/dU41MkVP9VIBfdXohchw8YpJpEA4w
         bovwyCI1wlup/LF2tVFYlYsaYvHmtyeNbcTM32jrJWNuF1KLnezWPTVwdJ4adT9rDlAX
         8aXl0T7Razw1fR30ERIlb24FUosKiqjU/nmGdkLzX6ypVvGYOEOvbgIHpVjzRm2LCfx0
         E/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730996445; x=1731601245;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l25I5Jel5U2/0S9AyIDPTs5/QytgoUZMY3CNnmJZTzE=;
        b=Ux27ldxFWp95eb5eQ6HbJH5UJSCHQqGpyJDoFhojoAko/Apf9uw8M6G+kYzpwz9Wc7
         IxsuTQhO3LJcr/vZ/XZzItEwQI9tYpQ1NHIvhrhotlGLg9f+ESXzJT8LWUHEFx06pk88
         QTWBBC7aOGOWOaNB5eMJl/5B1VzlQ3Z+UtKUW9eVih+SvEXDL1Na8Oseg1+9rwEeps0G
         6nfDPCXYAyOG0k1KXGRDcwwiVF3WLIlpEKTD2oNWlWNBMt7h/HQC9Y7J1vwiZy8JHDzB
         +MbuAuDbFzwkfJBReS97D/V3MEXNOVInrVKzs7WU4DST6o8IkdVJZUAFNo2wa12Jwsr3
         7quQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+vobmI1zSQUJwiRcBEyOYWqElqXWYaoIr7doFZqHZ/BZezaRqJBjQD49yY14U/gT5iflaTcm/HoPM9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJd7uWHrEh5zjNXsjAMtoOAVnFskNRyUek+4svR3Qh6JAOe2di
	9U/AqG0YIEkJ7/hJMAK07pB3XVKjlObWtj/3uYe2LGwdyHpRA7/00+SuDPz6FFFUH1ecGEjDtOe
	iDnryGg==
X-Google-Smtp-Source: AGHT+IFnTI4IcNJ51YDO3rsAiQCbXWeV3EQq6I2FsC+sGE3SpDVNd7WlWxpa52LoAfCUNYpttoUYsg4Abinq
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a05:690c:6313:b0:6e3:6414:80c5 with SMTP
 id 00721157ae682-6eadbedccc8mr2287b3.0.1730996445083; Thu, 07 Nov 2024
 08:20:45 -0800 (PST)
Date: Thu,  7 Nov 2024 08:20:29 -0800
In-Reply-To: <20241107162035.52206-1-irogers@google.com>
Message-Id: <20241107162035.52206-3-irogers@google.com>
Mime-Version: 1.0
References: <20241107162035.52206-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v2 2/8] perf header: Move is_cpu_online to numa bench
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_082046_375767_445231A7 
X-CRM114-Status: GOOD (  17.27  )
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

The helper function is only used in the NUMA benchmark as typically
online CPUs are determined through
perf_cpu_map__new_online_cpus(). Reduce the scope of the function for
now.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/bench/numa.c  | 53 ++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/header.c | 51 --------------------------------------
 tools/perf/util/header.h |  1 -
 3 files changed, 53 insertions(+), 52 deletions(-)

diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
index 1fbd7c947abc..19be2aaf4dc0 100644
--- a/tools/perf/bench/numa.c
+++ b/tools/perf/bench/numa.c
@@ -27,6 +27,7 @@
 #include <sys/resource.h>
 #include <sys/wait.h>
 #include <sys/prctl.h>
+#include <sys/stat.h>
 #include <sys/types.h>
 #include <linux/kernel.h>
 #include <linux/time64.h>
@@ -35,6 +36,7 @@
 
 #include "../util/header.h"
 #include "../util/mutex.h"
+#include <api/fs/fs.h>
 #include <numa.h>
 #include <numaif.h>
 
@@ -533,6 +535,57 @@ static int parse_cpu_list(const char *arg)
 	return 0;
 }
 
+/*
+ * Check whether a CPU is online
+ *
+ * Returns:
+ *     1 -> if CPU is online
+ *     0 -> if CPU is offline
+ *    -1 -> error case
+ */
+static int is_cpu_online(unsigned int cpu)
+{
+	char *str;
+	size_t strlen;
+	char buf[256];
+	int status = -1;
+	struct stat statbuf;
+
+	snprintf(buf, sizeof(buf),
+		"/sys/devices/system/cpu/cpu%d", cpu);
+	if (stat(buf, &statbuf) != 0)
+		return 0;
+
+	/*
+	 * Check if /sys/devices/system/cpu/cpux/online file
+	 * exists. Some cases cpu0 won't have online file since
+	 * it is not expected to be turned off generally.
+	 * In kernels without CONFIG_HOTPLUG_CPU, this
+	 * file won't exist
+	 */
+	snprintf(buf, sizeof(buf),
+		"/sys/devices/system/cpu/cpu%d/online", cpu);
+	if (stat(buf, &statbuf) != 0)
+		return 1;
+
+	/*
+	 * Read online file using sysfs__read_str.
+	 * If read or open fails, return -1.
+	 * If read succeeds, return value from file
+	 * which gets stored in "str"
+	 */
+	snprintf(buf, sizeof(buf),
+		"devices/system/cpu/cpu%d/online", cpu);
+
+	if (sysfs__read_str(buf, &str, &strlen) < 0)
+		return status;
+
+	status = atoi(str);
+
+	free(str);
+	return status;
+}
+
 static int parse_setup_cpu_list(void)
 {
 	struct thread_data *td;
diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index a6386d12afd7..55c28e4377ec 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -987,57 +987,6 @@ static int write_dir_format(struct feat_fd *ff,
 	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
 }
 
-/*
- * Check whether a CPU is online
- *
- * Returns:
- *     1 -> if CPU is online
- *     0 -> if CPU is offline
- *    -1 -> error case
- */
-int is_cpu_online(unsigned int cpu)
-{
-	char *str;
-	size_t strlen;
-	char buf[256];
-	int status = -1;
-	struct stat statbuf;
-
-	snprintf(buf, sizeof(buf),
-		"/sys/devices/system/cpu/cpu%d", cpu);
-	if (stat(buf, &statbuf) != 0)
-		return 0;
-
-	/*
-	 * Check if /sys/devices/system/cpu/cpux/online file
-	 * exists. Some cases cpu0 won't have online file since
-	 * it is not expected to be turned off generally.
-	 * In kernels without CONFIG_HOTPLUG_CPU, this
-	 * file won't exist
-	 */
-	snprintf(buf, sizeof(buf),
-		"/sys/devices/system/cpu/cpu%d/online", cpu);
-	if (stat(buf, &statbuf) != 0)
-		return 1;
-
-	/*
-	 * Read online file using sysfs__read_str.
-	 * If read or open fails, return -1.
-	 * If read succeeds, return value from file
-	 * which gets stored in "str"
-	 */
-	snprintf(buf, sizeof(buf),
-		"devices/system/cpu/cpu%d/online", cpu);
-
-	if (sysfs__read_str(buf, &str, &strlen) < 0)
-		return status;
-
-	status = atoi(str);
-
-	free(str);
-	return status;
-}
-
 #ifdef HAVE_LIBBPF_SUPPORT
 static int write_bpf_prog_info(struct feat_fd *ff,
 			       struct evlist *evlist __maybe_unused)
diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
index a63a361f20f4..e91e89d22537 100644
--- a/tools/perf/util/header.h
+++ b/tools/perf/util/header.h
@@ -196,7 +196,6 @@ int write_padded(struct feat_fd *fd, const void *bf,
 
 #define MAX_CACHE_LVL 4
 
-int is_cpu_online(unsigned int cpu);
 int build_caches_for_cpu(u32 cpu, struct cpu_cache_level caches[], u32 *cntp);
 
 /*
-- 
2.47.0.199.ga7371fff76-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
