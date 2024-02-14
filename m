Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C83FC48BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8WUDgIB0vscenKFKI6opGFF5X2AR4bf/lNaAkk3g4U=; b=F1eg8nOcBdlPe5
	9Pms3P6a29jut8xLybiugCDm07eOsxKbvC9zNSm0TXDXLiAWfdu25zEnxhYyMfNZzbD3VaEfhbSJ6
	i7zSrAnAJhXI5xhT4l7x8tz0GSHxEcGS3TlevicALWx/eDcK2+ZuzNf2cRhX8rimj1Oxih30BoTv2
	CRmhjKdzpXTUaS7Mrq/u2bdgvQITHcEIxGy4hM1owmBiHaW5350YnMd38PznYRVRHN0o1e82r9mWV
	SCqC0NS8qtfd8vRCuxyudM56rZ6Dqyvszw7fqTyRLrdP6J1TvXsXXiSjOm+X0XOSnltSq1zJ9ezrs
	SSBjN4IHJehyluhDWfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raDcl-0000000ChoJ-1k9b;
	Wed, 14 Feb 2024 11:40:23 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raDcj-0000000Chne-1av2
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 11:40:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707910818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VD63rmegeHIhLLGV64EOuqcCVX11XoTApOW/sI3SuGY=;
	b=Qoitnz4UP5hNcUavGMoMUemm8tfGEtUwTIwDldz/MawdEPqsfElc6milVX9Vr4uJ14t5tu
	jKyQlLzs5K/6MKFBpoQ4t/hExWMfhd73fjpBMPN5++7KvNey8dGfCiyo1Tt4y/Lt082eIj
	7LG0CurF9nAeOF+L0NJyiPfBKt9jvCQ=
From: Leo Yan <leo.yan@linux.dev>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>,
	Kan Liang <kan.liang@linux.intel.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linux.dev>
Subject: [PATCH v1 1/4] perf build: Remove unused CONFIG_PERF_REGS
Date: Wed, 14 Feb 2024 19:39:44 +0800
Message-Id: <20240214113947.240957-2-leo.yan@linux.dev>
In-Reply-To: <20240214113947.240957-1-leo.yan@linux.dev>
References: <20240214113947.240957-1-leo.yan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_034021_588873_C1F4E6A1 
X-CRM114-Status: UNSURE (   7.96  )
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

CONFIG_PERF_REGS is not used, remove it.

Signed-off-by: Leo Yan <leo.yan@linux.dev>
---
 tools/perf/Makefile.config | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index aa55850fbc21..8b740c668ab7 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -105,10 +105,6 @@ ifeq ($(ARCH),mips)
   LIBUNWIND_LIBS = -lunwind -lunwind-mips
 endif
 
-ifeq ($(NO_PERF_REGS),0)
-  $(call detected,CONFIG_PERF_REGS)
-endif
-
 # So far there's only x86 and arm libdw unwind support merged in perf.
 # Disable it on all other architectures in case libdw unwind
 # support is detected in system. Add supported architectures
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
