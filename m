Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E5BD2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGajJDuN5F9ih78adep2ph96mxJYRztmgjzNsxXDDz8=; b=fMaILJ6ndEa9cW
	sa4lfF44udVnRHxgJIt54JbdZZQzI2JOlgTTmfYJRJtnQ8NxH/r4TE9kwKLihiKw7xDHEY1SAEjoI
	rE39AsDjrMDPfqR4qyhFaxwYwkXkGpMxPYff5oLlbWyqdX2nypRQhDuBju9+tbUvWRkDuupt9a6H4
	hnR7XuFAtlgAKgifVrWg9ZQyAhqJYlQ2MRLOBehK4+o8X3Hs1bszxprZZzZ2lUCBlmKmybTM5sLoK
	esjgep/KI8cr5euSxRZd2S+C7Me67e5FbXlni1BTmabzsb5mY7rt3yyLUwdb/t1W1LL9zfxKMO7po
	WUmOl1c08oKCPCIMzH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EPy-0000000DLd1-1cBw;
	Thu, 17 Oct 2024 00:31:06 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9X-0000000DI9W-34lx
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:09 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so647880276.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124046; x=1729728846; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Zgjnj0m5GCDK5RZDSEvmChYUUBqnb9Kjcf22Xw9GZo=;
        b=SfXbHPIvYlhduGvBT4GA6O+zbrW+jXyPUNUukPlgnyjlKFfYflPAHVxn350hIA81Ap
         SaO5NTXOb+IzbS39OoNXCbEMcTcvpDrXzXA5QMevFu8wl3jbLdiCDsOf14+jjXWXlbAH
         h0qjclwFsH7eMbwDV6pWn+pIOXZPIYV5t5JbuqDo0oeoffo/BwRkz2Exx8eXkZ0SOAEp
         INsV7wV4OGPXv6dfuhazdAQjZFZv+RrJ4vACPbPIYS0PmCnq9t/F3ldAjvKifB6zHUu9
         b6DGj5YJe3Z+pIt6McSY/G0kwN8Y1ubtC2dvCfdilTOMEx/5nokgLXPTg58HfTAsBzdo
         A7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124046; x=1729728846;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Zgjnj0m5GCDK5RZDSEvmChYUUBqnb9Kjcf22Xw9GZo=;
        b=oJ0o3YiYIbRQc5k+Z9br6lVjnyvcUqwhZEbOCCaUEFNnTQyix1vSxRVRwFgsoDj80b
         3PB0aWXozha7EDsTgwb/994TWeVAI9b8uxBqxcbqHx+Ewc32XK33fzeG72qaIpMrS/C6
         2nnJALSi3YD/yyT6G86NURab5I0cyt5PGHAL51zAzdZ/YralJSuDUbMKS5E/kCsLtYJg
         wOxcAAN/rHwk3fR+QqMvNn3a0sltA6O8l25Zfd2ICDxGhIb5G3t4g6xiPRz/C/egrrbY
         XAoUJHi8ViZVXliqKz4H4dGOAhQtvo9N3VNDYPrrPybpFmvbB1NUdRIJUcYkaF/vYtsK
         T1bw==
X-Forwarded-Encrypted: i=1; AJvYcCXyPAq/j3+t/klNN8q10vwff1cPcTUbAsw34qi4FofPP3HZO0sv4NLNf68Usz9hRqmMSMCVqIzYGtlfig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ6MA1zEK2VxSmuTe8egM2sPchClUwqsatcY2VSQXZRdlrjG5a
	OnANA9EosF5pQ8M3VzXlm7zsQ0vEtuhVrwdvhsru8hAAmk+0bBnxWno/WYBDDXXn3/U77S7UI9y
	Q9fw5Iw==
X-Google-Smtp-Source: AGHT+IG4yOEShi7bfA//zRBXm0HyxwcMrNGTLY2U0O7sKDY8krpaQf7LbxB/HvXewatFXm/5ipRsL7HiuJQ8
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a05:6902:2d08:b0:e1d:912e:9350 with SMTP
 id 3f1490d57ef6-e2978559a74mr9642276.6.1729124045785; Wed, 16 Oct 2024
 17:14:05 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:44 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-2-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 01/11] perf build: Fix LIBDW_DIR
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
X-CRM114-CacheID: sfid-20241016_171407_782137_0A779E0A 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Testing with a LIBDW_DIR showed that in Makefile.config the dwarf
feature tests need the LIBDW_DIR setting in the CFLAGS/LDFLAGS.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 4ddb27a48eed..c1c7c25887a7 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -162,8 +162,14 @@ ifeq ($(findstring -static,${LDFLAGS}),-static)
   # Must put -ldl after -lebl for dependency
   DWARFLIBS += -ldl
 endif
+FEATURE_CHECK_CFLAGS-dwarf := $(LIBDW_CFLAGS)
+FEATURE_CHECK_LDFLAGS-dwarf := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 FEATURE_CHECK_CFLAGS-libdw-dwarf-unwind := $(LIBDW_CFLAGS)
 FEATURE_CHECK_LDFLAGS-libdw-dwarf-unwind := $(LIBDW_LDFLAGS) $(DWARFLIBS)
+FEATURE_CHECK_CFLAGS-dwarf_getlocations := $(LIBDW_CFLAGS)
+FEATURE_CHECK_LDFLAGS-dwarf_getlocations := $(LIBDW_LDFLAGS) $(DWARFLIBS)
+FEATURE_CHECK_CFLAGS-dwarf_getcfi := $(LIBDW_CFLAGS)
+FEATURE_CHECK_LDFLAGS-dwarf_getcfi := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 
 # for linking with debug library, run like:
 # make DEBUG=1 LIBBABELTRACE_DIR=/opt/libbabeltrace/
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
