Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C09CC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 20:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cu0I4xYnL9QJO5mzJgG1PFwsZtloViHe1DuMTK+p4jI=; b=aW+fB/luk3VLM5
	phTk/MBA68sV4iOd5rmAzMLXhkxa1CyahZHVSJEBeDjg7MJgFYI15dpH/tPHE0Y4Mw/M66c6mrFpW
	OH5T8+SpkUVCl4zOa5thzJVSrTDIqCe1h0lXmZK3x8ofXt4x5/gayAMbA1Msxp82/Rl6FvDQSgqfo
	F8NBAyechSNh7NRriMnKBlzlTV4NEdOcIjL6G00dUApTZdZhMoUk0P62D3u8TWuLcKQccw7/4NLx5
	vuK/RyAkapjjJa50MJG3HufAYb1gaIWKEbltll+WXmbQcJ2R5zVUQRhiIfJfjCOT/ded59N3seJ64
	LjQx61OOmPUVHW78KmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3w9-0000000H7IA-0mab;
	Mon, 05 Aug 2024 20:04:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3vc-0000000H7DP-1Fqq;
	Mon, 05 Aug 2024 20:03:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8685C60C73;
	Mon,  5 Aug 2024 20:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74948C32782;
	Mon,  5 Aug 2024 20:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722888215;
	bh=I56lUn0T50rnwoB+HaYuikOVZBf51CF/GJDlHl+cHv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EueP6hOJGnTdBDozqxx7yqeaV2qTCDlkr06m4184D/UI9UftacpfKZYFpT8Y3mpg+
	 N8yKNOb2Rvsw3eyOnm+LT7gpFmKFEwI/KrR2zrMK+jeGnJr/9bdjLErlqRn5r1Vjaq
	 acPjUwecYZv8s2Dcvb7h5uTIyLqbi/tpAihSW1lR9hiIMNkMG/D0VbmMqKc46Uiqm1
	 lTtgD1IctE4V0A+UJNIDJ7lA7IV/hlCjO6GIEjiugkOArXFCnqSFJjY0eViv8Q/nsI
	 bqp++huTXR0u7xplv2gksTdgcc4DtDjPWoETjDS0i3e1Yas3F6rtCcvypOozCeIH2D
	 9BKsxQUgHZJuw==
Date: Mon, 5 Aug 2024 17:03:31 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Ci-Jyun Wu <dminus@andestech.com>,
	Locus Wei-Han Chen <locus84@andestech.com>,
	Atish Patra <atishp@rivosinc.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Xu Yang <xu.yang_2@nxp.com>, Sandipan Das <sandipan.das@amd.com>,
	Guilherme Amadio <amadio@gentoo.org>,
	Changbin Du <changbin.du@huawei.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, vincent.chen@sifive.com,
	greentime.hu@sifive.com, Eric Lin <eric.lin@sifive.com>
Subject: Re: [PATCH v1 2/5] perf pmu-events: Change dependencies for
 empty-pmu-events.c test
Message-ID: <ZrEwE1bzUsfC6Wfl@x1>
References: <20240805194424.597244-1-irogers@google.com>
 <20240805194424.597244-2-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240805194424.597244-2-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_130336_402232_2ED7CBDA 
X-CRM114-Status: GOOD (  15.87  )
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

On Mon, Aug 05, 2024 at 12:44:21PM -0700, Ian Rogers wrote:
> Switch from $? (all the prerequisites that are newer than the target)
> to $^ (all the prerequisites) as touching jevents.py will mean that
> empty-pmu-events.c won't be passed to the diff command breaking the
> build.

Thanks, added:

Reported-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/pmu-events/Build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
> index c3fa43c49706..d941bc9d16e9 100644
> --- a/tools/perf/pmu-events/Build
> +++ b/tools/perf/pmu-events/Build
> @@ -39,7 +39,7 @@ $(TEST_EMPTY_PMU_EVENTS_C): $(JSON) $(JSON_TEST) $(JEVENTS_PY) $(METRIC_PY) $(ME
>  
>  $(EMPTY_PMU_EVENTS_TEST_LOG): $(EMPTY_PMU_EVENTS_C) $(TEST_EMPTY_PMU_EVENTS_C)
>  	$(call rule_mkdir)
> -	$(Q)$(call echo-cmd,test)diff -u $? 2> $@ || (cat $@ && false)
> +	$(Q)$(call echo-cmd,test)diff -u $^ 2> $@ || (cat $@ && false)
>  
>  $(PMU_EVENTS_C): $(JSON) $(JSON_TEST) $(JEVENTS_PY) $(METRIC_PY) $(METRIC_TEST_LOG) $(EMPTY_PMU_EVENTS_TEST_LOG)
>  	$(call rule_mkdir)
> -- 
> 2.46.0.rc2.264.g509ed76dc8-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
