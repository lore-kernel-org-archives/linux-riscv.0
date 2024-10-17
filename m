Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B56D2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idw5F0eFZ6GXqZiEhOTio8StPIl2UYliQKVdhyZPP9I=; b=woIZow2CxVy8Ry
	Ped2G2imOHae4AvQOZRFzL41T9lNtHT2GACtMNpadR6yenNnlyb97Yt5wX1MPfydEqWG6uqG9cx3n
	poFIdqmwiek8fJUmo2HKlg0g8r/IzQoMAl+aQARTqNAJJXxCMVpQUS8V4AEpIr62EZp7eFp+qTI2f
	tiYnSw9WriMZz/MVIlbZCV52Q48/smF2DBsqr/fcsmZC7Aa0hWgM5x2hRYGIYTq36PdOAaDZzKc0z
	zfYXf5lkFGwtLzR8UFxqZtiOi1PFyviY6O5e+kjpSsm8sOwfLuJ/QM0jk/KkotN0EJFE7ZqU6g/Xd
	KJDrB/TiOqoWpSn4Arkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ESq-0000000DMOs-0G3W;
	Thu, 17 Oct 2024 00:34:04 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9c-0000000DIBo-2lvb
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:13 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e370d76c15so9273357b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124051; x=1729728851; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vpg7UjVbvMTf2T5M8RY79W0YJsjIkpvO45Q8v0jMOdQ=;
        b=CdyWv9r4WQc3Gke+W5N8s9uMhqYCAR6xoew3U8BsFh7ZmHeMS58NsDJwtQ918eoUQs
         du4WXEp3ZcYSQvouermN0Yn1v6o3vte3ZTKwraCsc0oqkfYfSi4UfGCxMHr7Eewccg5j
         fxmj5QFG+G0xEGOBF9hTV9i6KMusfKS/fqzpDeNVOsyOPRX4FbRfkuz9U+JPeBW8EFnl
         9XPZJz7nSeZie81DlU4xcSbVntoVRu+FF6fcqcDoIX3qJoCxLSEhevm9W5t+TtY7Pmr/
         1jDlbDi29kNMur2aWX9885y/fCNHc7n6YBqvH05hUGPWSyms2rSZE0gkk3sdGKfSThAc
         6Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124051; x=1729728851;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vpg7UjVbvMTf2T5M8RY79W0YJsjIkpvO45Q8v0jMOdQ=;
        b=XeATV4YnQpkLGQPrCj/Rk95cZQthofgePd+Fnv0JXB12ekQUIerXGSPpScIX5kPL3M
         QJ3+IhLK99xZE6IMEIzM5ocNZlOJyJ9hpeaoAMv2eMIvubep0hIfplMPMq9uC5c8oSeM
         PwdznxhZ4Kq5txg5oA78uQXCKEdqqrr9GK8eCirGKm8/a3tc3x1wh4tYbjw4I21dP7nJ
         VosyUkdsURO++c+6o9Fvw7gVL9BtxPb+F0HQnUFOG9pyvRxZ8OqLKYm/O/xfsysorcOy
         zSQHo5+5Og+lr71epXg+TZ5bSskNewV2PBeGqCdliBrO0SvWL7mWHfSA22iOiDFNBtfj
         N/bw==
X-Forwarded-Encrypted: i=1; AJvYcCW86lc6bLTwT7jCfmhAjjOZvtQjVI3D3FWsZonKqeBiioG3BSJ4/sQNCBkuwMR4olyQO/VOMbfGoWCOvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj8LDdiL72MiVwZk/RfSf2RmEOCYXEqxwbPds8bLBtgEMerLd3
	cwe5Xv8m+nCjdPkjxDm0EoTmBO7J9aJz10n87zdTYel5IyExw2tAVPtDcnhW7xs0qhGnzTxG+Gj
	tEen3Jw==
X-Google-Smtp-Source: AGHT+IE02udqyL0ksFlRpgHYEs+RBRyhfL+nQeujKZ+O/NiCK6Bw9qW9/lbqOGgoYUwDeDIjpi9bLcuBC4kZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:9e0a:0:b0:e29:7454:a4dd with SMTP id
 3f1490d57ef6-e29782db2aemr7708276.4.1729124050459; Wed, 16 Oct 2024 17:14:10
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:46 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-4-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 03/11] perf build: Remove defined but never used variable
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
X-CRM114-CacheID: sfid-20241016_171412_709579_55A98AF1 
X-CRM114-Status: UNSURE (   9.70  )
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
index cc2cfc3aab40..dd5468b8b5de 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -756,8 +756,6 @@ endif
 ifeq ($(dwarf-post-unwind),1)
   CFLAGS += -DHAVE_DWARF_UNWIND_SUPPORT
   $(call detected,CONFIG_DWARF_UNWIND)
-else
-  NO_DWARF_UNWIND := 1
 endif
 
 ifndef NO_LOCAL_LIBUNWIND
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
