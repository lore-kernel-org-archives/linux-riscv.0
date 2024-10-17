Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44A0D2F7DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 02:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+q0hnN0+UPVt2+LprbyRd5ZXIRkI5S5GNrgRU4D9BFo=; b=BVrLycJNqtfTyw
	W62JIJWi9O7jldiA6PbuHYNWEusto/5IxHPhsyi0Sxh/FYURgAvJ2bDOhqGvBHKITKLpfIzQMeF97
	IGYxhLXfRHkFU+Al5M0yhYRsEXZZNrI0gNSnQfmYfdHqS/Awy4GBgH0NQWZI3Dvp8XVwp2Aj5mqTR
	4NA5we0yTnIVheL/Yc17XnjeJLCBqWiV8BsqyH+zKW6nA5bmN7eKZMjw5xkVNYQJ7+2T+b9wrC/eX
	uxt9ou02axXC1CV0wApfMFhhrMkzp52wyNXoCDWjN0zBCzRo7/zMurngderHaM6azzk2D67ipbdGg
	PWIwIVnSJcx8nrj674VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1G3U-0000000DWxJ-1WpY;
	Thu, 17 Oct 2024 02:16:00 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ELI-0000000DKSa-2mPM
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:26:18 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e24a31ad88aso524986276.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124775; x=1729729575; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNbBqi1saNqYXEAAo8guTprpDL0iavWB2aVE9Nn4lPM=;
        b=XJF9gVL1tAwnEK6e9Uo6LYeKEre/NgYh+AT1w2rcazGbLFSMHJ6HdPFpb6+05p1bWk
         XCknr16X+yhaKID0peTwMwnZIBDIfoKPmWcIR7Ea9Tez3O3f4gJzsnQBaHGTOlpo7PZ4
         xlM6ihGRLOCII2x6J8oOuCGBRT4IM0ph11TH4aJeETTS1ECIUQMEU7+ZpY/jy4wjIvCN
         zxD45sBFaoJx7Rtm8Rrv0VzMDlCUPEgnRAXjHRiw0oDctb6NJp/pQvtLuf6KBLcHoQjg
         blRQBiEj6PQhk1O8hd7hv95jAhMqQEm+JNxW9MNSydVIPsG+PzjMZYW1yz/sWROxAyDE
         U5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124775; x=1729729575;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNbBqi1saNqYXEAAo8guTprpDL0iavWB2aVE9Nn4lPM=;
        b=WDB2hOi8XT42ptbUh5NdA0EvJDm9k3dcUJIusIIqGRK3iYNeQVdfn4YgUlycaZKYYJ
         vaag3c1EKOWZyqVFwH36y7fujmQezCl6tYerchKlH2m7oeXSuluiZjS2KjhKHdL4pgKv
         olvr2NHebovH2fDma5/m7EI0VnRwPJtgoZ5csF2EIq2GheP6AvjkamvKlwmTH4IO/Kjc
         9+KBusXnlW1usEgO4PZnbj19G9Wyz+Dksbo45phq92zAK1kMgj1GfsdHosERjg5KMowH
         daXISodFuHmDgnCr1mFx3hzl0QUJUeYmfuDw5uSZ6nc7sRJqJuKVzO+O2dHChdMBV6Up
         kbLA==
X-Forwarded-Encrypted: i=1; AJvYcCWSyKgcnVjsLCBWwhZeB6wLOkv482ZJpuPWWe1X+L8BhEHqVCc0wlaaPA0e9APYmBY3mVfDM4d5RSDrvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAgKrOrE65n572M0r6AFJHLV43XRFngF6d7YGmQNEr5dkjXy1J
	570ZlWhqEG2NikAsfSc3Br+S8lVsK2Wa98EB5FiMX64KAxqgRYTNr/u7QdSU+sB5SIW4D/rLRhq
	ftxj+7w==
X-Google-Smtp-Source: AGHT+IEbHtnjVfs/XyOXwRVtcImn7Ac6sTdT7J05MnwMea9QA/h1ss5WMT/c3lNVvH8+kCZUWXSdbtC8V8yG
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:dc02:0:b0:e1c:ed3d:7bb7 with SMTP id
 3f1490d57ef6-e29782c757dmr2976276.1.1729124774808; Wed, 16 Oct 2024 17:26:14
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:19 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-20-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 19/20] perf dwarf-regs: Remove get_arch_regstr code
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_172616_734679_21D1A784 
X-CRM114-Status: GOOD (  10.29  )
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

get_arch_regstr no longer exists so remove declaration. Associated ifs
and switches are made unconditional.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs.c         | 12 ------------
 tools/perf/util/include/dwarf-regs.h |  7 -------
 2 files changed, 19 deletions(-)

diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 05fff75a8f59..28a1cfdf26d4 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,23 +32,11 @@
 /* Return architecture dependent register string (for kprobe-tracer) */
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
-#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
-    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
-    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV || EM_HOST == EM_S390 || EM_HOST == EM_SH \
-    || EM_HOST == EM_SPARC || EM_HOST == EM_SPARCV9 || EM_HOST == EM_XTENSA
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
 	}
-#endif
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
-    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
-    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV && EM_HOST != EM_S390 && EM_HOST != EM_SH \
-    && EM_HOST != EM_SPARC && EM_HOST != EM_SPARCV9 && EM_HOST != EM_XTENSA
-	case EM_NONE:	/* Generic arch - use host arch */
-		return get_arch_regstr(n);
-#endif
 	case EM_386:
 		return __get_dwarf_regstr(x86_32_regstr_tbl, n);
 	case EM_X86_64:
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 9dfc9abfdddd..6ee95cc69917 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -79,13 +79,6 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
-#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
-    && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
-    && !defined(__powerpc64__) && !defined(__riscv__) && !defined(__s390x__) && !defined(__sh__) \
-    && !defined(__sparc64__) && !defined(__sparc__) && !defined(__xtensa__)
-const char *get_arch_regstr(unsigned int n);
-#endif
-
 const char *get_csky_regstr(unsigned int n, unsigned int flags);
 
 /**
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
