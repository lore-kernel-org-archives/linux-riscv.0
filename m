Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B7CD4F3D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQ7DT5TeBhvx4QaACls5gSMzUkRkbEmCP5Bv8A8CcGs=; b=OukOKESz69s/Hd
	mo4q/kJ/eTXPHNpQ3keEPPm/IGIguRcZtPYEWwJ0fyPYKTSeEVcWOlaqdZRnuFy+bCa0HIz0Stj60
	fahhQRjuxVJ3R5PTFAwlqu3k2bQE3HyX9fhH5mRDkFq9evWZkVjX64gvoTbWBVVM8kY0L+fFwnY6l
	fTSkp5bbhtdeSnT3SLbPAslat6CyDrythepnhLRfwEPneb7a6IGAhbZdGXuEw5NruO9bLAY9pZ/pW
	CyNB0NuB6BGph1GserlXetmrdvhKQfue6lY0kfecixclTtZ2mm7yrqO+vVSLhWhHPLnhuEPKL2i0O
	dd2LDk00UGRNuVqCU62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqhz-00000008BjP-2E9O;
	Fri, 15 May 2026 11:27:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqhw-00000008Big-42oV;
	Fri, 15 May 2026 11:27:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AB0540ACC;
	Fri, 15 May 2026 11:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B08C2BCB0;
	Fri, 15 May 2026 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844476;
	bh=1QmB3Gx/1WbwJvtwiPsMqLpKCcMjMe1a+V1Ox4LyywU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ngf+V18Ur5maro1wDSUVkYvZsmnY0ceVusXYlGsjjujySbK+xDLHBppOtWEmUbTCZ
	 gVdL43QtPuDf88ZRUVt3xUoGumi4qWMpVHb9HK3MkqHRhWSxqkO+N55zQfxbL2+Mcw
	 zQ1UgEPdz1RAV+eWQgvfxGubdhFBFWDhv8akq0YrpgVpNWqldNSKSpBTYGUxB1miUN
	 70PE3WXEdhdvqG+qntvdGLz9Iv/StpStAghQurkSvHTvNpDhU2Y+v2zgM7GFebfnrW
	 NpiceKUZzALlN1/rh58lVjzfoAwiFS7rcZ+IppjDLReJsTcUokHCmSw+G0K0gsDH+4
	 yeAyQbusl+pFg==
Date: Fri, 15 May 2026 08:27:53 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com,
	james.clark@linaro.org, namhyung@kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 9erthalion6@gmail.com,
	alex@ghiti.fr, alexander.shishkin@linux.intel.com,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	atrajeev@linux.ibm.com, howardchu95@gmail.com,
	john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev,
	libunwind-devel@nongnu.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org, mingo@redhat.com,
	palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org,
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com,
	will@kernel.org
Subject: Re: [PATCH v5 1/7] perf unwind: Refactor get_entries to allow
 dynamic libdw/libunwind selection
Message-ID: <agcDOac0qbP1KZ4Y@x1>
References: <20260413024805.1316480-1-irogers@google.com>
 <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-2-irogers@google.com>
 <agZk-CCrLUMTyWE4@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <agZk-CCrLUMTyWE4@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_042757_044148_8C9ACFDC 
X-CRM114-Status: GOOD (  12.11  )
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

On Thu, May 14, 2026 at 09:12:40PM -0300, Arnaldo Carvalho de Melo wrote:
> On Wed, May 13, 2026 at 04:31:45PM -0700, Ian Rogers wrote:

<SNIP>

> > +++ b/tools/perf/util/unwind.h

<SNIP>

> > +static inline int libdw__get_entries(unwind_entry_cb_t cb __maybe_unused, void *arg __maybe_unused,
> > +				     struct thread *thread __maybe_unused,
> > +				     struct perf_sample *data __maybe_unused,
> > +				     int max_stack __maybe_unused,
> > +				     bool best_effort __maybe_unused)
> > +{
> > +	pr_err("Error: libdw dwarf unwinding not built into perf\n");
> > +	return 0;
> > +}
> > +#endif

I also addressed this local sashiko review comment:

-------------------------------------------------------------------------
Since unwinding is performed per-sample in the hot path, will using pr_err()
here cause console flooding if the user explicitly configures an unsupported
unwind style?
Should this use pr_warning_once() instead, similar to the UNWIND_STYLE_UNKNOWN
fallback behavior in unwind.c?
-------------------------------------------------------------------------

And in one other place, please ack,

- Arnaldo

diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
index 28db3e3b9b513401..69ba08afda792d17 100644
--- a/tools/perf/util/unwind.h
+++ b/tools/perf/util/unwind.h
@@ -53,7 +53,7 @@ static inline int libdw__get_entries(unwind_entry_cb_t cb __maybe_unused, void *
 				     int max_stack __maybe_unused,
 				     bool best_effort __maybe_unused)
 {
-	pr_err("Error: libdw dwarf unwinding not built into perf\n");
+	pr_warning_once("Error: libdw dwarf unwinding not built into perf\n");
 	return 0;
 }
 #endif
@@ -81,7 +81,7 @@ static inline int libunwind__get_entries(unwind_entry_cb_t cb __maybe_unused,
 					 int max_stack __maybe_unused,
 					 bool best_effort __maybe_unused)
 {
-	pr_err("Error: libunwind dwarf unwinding not built into perf\n");
+	pr_warning_once("Error: libunwind dwarf unwinding not built into perf\n");
 	return 0;
 }
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
