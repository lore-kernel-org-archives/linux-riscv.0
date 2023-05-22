Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB9BC77B73
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ru8kUe+hUrGcLxg9bXVdrVGGaei1f23W97Kltgz07Ek=; b=UX0YoIbQndggW/
	W91K4E2JSMlmrwBzIyZCcafnDSxSUwLOWSmQ/VV5DoUeJbW2Wk6qviG92Z/BXewX63AkITwxqFRjE
	rgPuPv1Ssi2+rQyXJ2xmEcF3XsfjZC/92JUz+YvjCDK1TYQGR5B8hHkTIoH9uQot0+x7jCr7gQKts
	jr8Ldag0NYbN3HnIbn4mwn6FnFDPf9tNrWEKD/YAc+IPSMp0yLq52qUAfF6m5pXW+PDUA9M76Yho5
	gv8lOZmcAN0IoLQA5AAKE5LpOgteebMQwNFKv70vxn2+uoZdtmftdua+WxPWWmMrzjuhXewuCcM8v
	x+gHc22PVVmP9Dc1EEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11MK-005oWF-2o;
	Mon, 22 May 2023 08:57:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11MG-005oUh-3A;
	Mon, 22 May 2023 08:57:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5796311FB;
	Mon, 22 May 2023 01:58:18 -0700 (PDT)
Received: from [192.168.1.3] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 559A53F6C4;
	Mon, 22 May 2023 01:57:30 -0700 (PDT)
Message-ID: <839836e8-9600-9249-dcdb-e29519335141@arm.com>
Date: Mon, 22 May 2023 09:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 2/5] perf parse-regs: Introduce functions
 arch__reg_{ip|sp}()
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
References: <20230520025537.1811986-1-leo.yan@linaro.org>
 <20230520025537.1811986-3-leo.yan@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Eric Lin <eric.lin@sifive.com>, Kan Liang <kan.liang@linux.intel.com>,
 Qi Liu <liuqi115@huawei.com>, Sandipan Das <sandipan.das@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: James Clark <james.clark@arm.com>
In-Reply-To: <20230520025537.1811986-3-leo.yan@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_015737_083637_879DA489 
X-CRM114-Status: GOOD (  16.92  )
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



On 20/05/2023 03:55, Leo Yan wrote:
> Ideally, we want util/perf_regs.c to be general enough and doesn't bind
> with specific architecture.
> 
> But since util/perf_regs.c uses the macros PERF_REG_IP and PERF_REG_SP
> which are defined by architecture, thus util/perf_regs.c is dependent on
> architecture header (see util/perf_regs.h includes "<perf_regs.h>", here
> perf_regs.h is architecture specific header).
> 
> As a step to generalize util/perf_regs.c, this commit introduces weak
> functions arch__reg_ip() and arch__reg_sp() and every architecture can
> define their own functions; thus, util/perf_regs.c doesn't need to use
> PERF_REG_IP and PERF_REG_SP anymore.
> 
> This is a preparation to get rid of architecture specific header from
> util/perf_regs.h.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
[...]
>  
> -#define DWARF_MINIMAL_REGS ((1ULL << PERF_REG_IP) | (1ULL << PERF_REG_SP))
> +#define DWARF_MINIMAL_REGS ((1ULL << arch__reg_ip()) | (1ULL << arch__reg_sp()))
>  
>  const char *perf_reg_name(int id, const char *arch);
>  int perf_reg_value(u64 *valp, struct regs_dump *regs, int id);
> diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
> index bdccfc511b7e..f308f2ea512b 100644
> --- a/tools/perf/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw.c
> @@ -252,7 +252,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
>  	if (!ui->dwfl)
>  		goto out;
>  
> -	err = perf_reg_value(&ip, &data->user_regs, PERF_REG_IP);
> +	err = perf_reg_value(&ip, &data->user_regs, arch__reg_ip());

Shouldn't it be more like this, because the weak symbols are a compile
time thing and it's supposed to support cross arch unwinding at runtime
(assuming something containing the arch from the file is passed down,
like we did with perf_reg_name()):

  char *arch = perf_env__arch(evsel__env(evsel));
  err = perf_reg_value(&ip, &data->user_regs, arch__reg_ip(arch));

Now I'm wondering how cross unwinding ever worked because I see
libunwind also has something hard coded too:

  #define LIBUNWIND__ARCH_REG_SP PERF_REG_SP


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
