Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977D9CFB42D
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPLHJ+f7JXnRkOugEWhOFkyfPqzMtu1FLp8ywMiNsTw=; b=C2KIn1X3NDPRh5
	/zCimpvS2PkKraSyoMpHSWraDS0GWnvBxvjsijum0YEjSgtgquQWrofbW5Qbp3zf+YAX/3JFx1Qcq
	rCdP2TyFQl3Vnut8ekns7ssb1ENv9qiCbBDPhTVg3j2oJp13Zd9UuEGv2pijD+sXIYdzygdLJFo/U
	OSsHQjd7tMPMz66IdnwDzb6xqkmKTKsrP5LhgLUf45UrFqYq5S09JD9PlFgyZrIq2sns+L86/ku2+
	PNzWqZJxFkWq/aQUcHTT2ogH3s3eyBo+NQ3b2iXE3HEVIdUqgCOsQDs51p0njD/B4eeSA0pxd45mE
	mwhtEIYql9RyFBvKcq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAwn-0000000FrCS-1zD8;
	Sat, 05 Oct 2024 20:00:13 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAso-0000000FpqX-3V6x
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:08 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e25cae769abso4576877276.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158165; x=1728762965; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kkv8bNfBm9/dMXp08m7d8I1ujeupVoM1qxtGNFcSU78=;
        b=lfdqAL7dZ3VgrQe2MknYqqPHaf2QQ+0fQF/dYEuE/NNpREo3Y9rUE7isC5LpNPKS+S
         81MOaJ5QGFNECSs+L7hfn1p8PhC7lNkJVu0c6qoCWRO5y5Vi1nWYwfSVfNzq+M1pJIT8
         cY47A0iu75Lj57iebu8h6yeHzDEARCiYkXeNsO+2mtFFQkLrl2cGN7f+iMCelV9jjRzn
         MaUjg52TyIpwvwH3qcMtl31EGWx1DR2whDIS21C7C1q/3z/tTjmcB8dFxQE3k+rWpQqC
         o7EchKWFOjnPgMvIY5paJiYint5BNFFS4B53AdULIVHTvzSfznoGVmEg2ESkraCw1wdp
         8Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158165; x=1728762965;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kkv8bNfBm9/dMXp08m7d8I1ujeupVoM1qxtGNFcSU78=;
        b=QrF95KllS4dpGCXVJE+Mi86rYHp5h/ix/IoQm0In9sPcJNkehiBsq+MLHH3GWj3hTN
         etlfOS6HkGLRtf5bYnRp04UYcv5kAh0P5dzDRBpuzKztaoyCo4N6KLNppY2pfw384wFn
         4a46SIAQiOmHrQj0pYE6W24pO59VYN2Y4yHlEvUFJlzEe3NwmyIQsUU9lxaWc5y6hi66
         iXdV/4mim+CqqwD5Ughotij0fGHtmMKA1xF7dJQwaoclLL04ydbNPxDaUEDqUxlOSYRo
         FaveEKqAH3pQjQGV9GWdCWeqoDgmq+XsCvta5vX0T+PHkfmJYLjPPfRKn0iRofoc/5Fi
         Lqwg==
X-Forwarded-Encrypted: i=1; AJvYcCWDgJzo7pAXZ4b4i3nnE7GrA6pEQaSg0iEFmLOrIPhQKe6F4TeKzckOOkyma357TAhXXWNZOdVq8/gX3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2WUyiY3Z/diMF13WL4rbjt6gIALcKr9y/l5MK1p9xPCyIKl/J
	u3egq6u4yC7FlsxJHaNj8q59MBnwl3FWeG4C/ULNb2czmRJsm6mlZeMJ9dW9RcJgyHla6VQ7BYi
	7N49qxw==
X-Google-Smtp-Source: AGHT+IHhkYnBtrBd+SOkXzP7+HOoF5g3/WxbcOIpY5cilwtjjCAK86WSpPWlw1sMJUnsYpXgeVLoazZjXm6V
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a25:7446:0:b0:e16:6771:a299 with SMTP id
 3f1490d57ef6-e289394dd4dmr4215276.11.1728158164909; Sat, 05 Oct 2024 12:56:04
 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:13 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-4-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 03/31] perf build: Remove defined but never used variable
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
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner <dwagner@suse.de>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Shenlin Liang <liangshenlin@eswincomputing.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Yury Norov <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_125606_902413_F0684738 
X-CRM114-Status: UNSURE (   8.99  )
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

Previously NO_DWARF_UNWIND was part of conditional compilation but it
is now unused so remove.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 55a39211496d..182e14e39cd5 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -753,8 +753,6 @@ endif
 ifeq ($(dwarf-post-unwind),1)
   CFLAGS += -DHAVE_DWARF_UNWIND_SUPPORT
   $(call detected,CONFIG_DWARF_UNWIND)
-else
-  NO_DWARF_UNWIND := 1
 endif
 
 ifndef NO_LOCAL_LIBUNWIND
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
