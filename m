Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD57C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQdqBaBgphlLGsrDKE1u4Lti2sLF01T1v9sWyCuQ3K4=; b=2SEqTNHkUEuLfb
	wsPapFnPT4Cdbn8bAs4At1wTb4YkPdIa4O/xpvJYqDGNZM2VrecsjmtBAM+d5GB7uxwhCw5GZH0en
	LvKIwwjwxqheUUbsOViDTAdXvUPrP/oqFF6a8j7zyAo7lmyiodYq4d45hy/1HgkMKFG0zWV95Gjvk
	xqAwKIcpAPHUAOn/X7kHsYqW5pJfdN5pfjEjgZO0GkgXVgZSYHOD68kud+Bd5PuaEICNH0AP/PHvy
	nPkTUsxeBT/Vio4eCiaQ9irnx5QFo69SUWg/p+uqdK5LBOSE4/qPJ7gah66ksBgE7SBzZATH0pyqW
	i6XCO48R1J3I/5yaSBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14KJ-006N3v-20;
	Mon, 22 May 2023 12:07:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14KH-006N2I-0S
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 12:07:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64d44b198baso1435821b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 05:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684757261; x=1687349261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQchT/0lNTrw+8B0CuId0SUlnq7U6PVfXba1xiCz71w=;
        b=wca6fpXjHkjd3rjsv8N4x5KSOncS2a0VHpnNGtiD4rgVZBbKqmLjWnIGdun2rYA/Y8
         vff4t0nOJLv+32DDppIspgUMVPSoPyRDnYg1Nn7G2Txn94Bb87rwsF5tBn6ISb2TZphQ
         HSmIDap0oJXPdGavLiMT9AkoOT80M8S3khfihAGpad399PH5nZPUhOPGwBmfTpSMFdsD
         4OYK2K44TRvJOZDyhX2Pz1Ost8odRND3dzVNGMlKqfaVxaUu/aDVttcZ7BStvoPVb6pg
         kYOeXj3W5hETAxwn0fd/NIPW/6XUCFvuRvRY5d9Z6ZF6m0Llla+WfrPG+R+YuCYFZ15t
         /dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757261; x=1687349261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQchT/0lNTrw+8B0CuId0SUlnq7U6PVfXba1xiCz71w=;
        b=A/ELkWrtf4A+LaXrDWydHCEfqYH7RtyWNOjtHl2X2iXM3D7VfhAbePRjjHVZNmEt16
         Kz2LnPCa8m4h1WGoM9E0ty5s0JbMIOlzK5L/XHQpL5Kl3lL0BALmLgbESLWt6oskd8wZ
         q82pfSDX3dxdefPPmGf6YUmD6lghHixNre5M10d04fD7jsnYZrUwT5zKV4vLK+xEB99B
         eChFZrmTYRQM8+Rt69KcG9LOIYlfY+2hymFL4iolW6dYjhD10hu9GrpEQFffL2V9pYrU
         vMTjyZxS/vZbNuwNJ7pQVofEKyT4/EOd0y8YnvND7qsUH/vxH5d/7I2c/XcyjsgBBbOU
         eTwA==
X-Gm-Message-State: AC+VfDxLjNArJPV19dTlth2+6ZUPCftagv7PEJBXWrXS+LUNPovbkqM6
	+6s3S9gYlWkQu/ZZOPCLAaeKiw==
X-Google-Smtp-Source: ACHHUZ7FzhOI1oZLY82kXv7E96TdiFUnztouK0GLFhMQ6d59+neuCKyIRvk0N2kpg8Te/400FlOEsA==
X-Received: by 2002:a05:6a00:1d1d:b0:64d:5683:1977 with SMTP id a29-20020a056a001d1d00b0064d56831977mr5334494pfx.9.1684757261369;
        Mon, 22 May 2023 05:07:41 -0700 (PDT)
Received: from leoy-yangtze.lan ([107.151.177.126])
        by smtp.gmail.com with ESMTPSA id p7-20020a62ab07000000b00640defda6d2sm3980510pff.207.2023.05.22.05.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:07:40 -0700 (PDT)
Date: Mon, 22 May 2023 20:07:29 +0800
From: Leo Yan <leo.yan@linaro.org>
To: James Clark <james.clark@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>, Qi Liu <liuqi115@huawei.com>,
	Sandipan Das <sandipan.das@amd.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/5] perf parse-regs: Introduce functions
 arch__reg_{ip|sp}()
Message-ID: <20230522120729.GB1826292@leoy-yangtze.lan>
References: <20230520025537.1811986-1-leo.yan@linaro.org>
 <20230520025537.1811986-3-leo.yan@linaro.org>
 <839836e8-9600-9249-dcdb-e29519335141@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <839836e8-9600-9249-dcdb-e29519335141@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_050745_217923_7758D610 
X-CRM114-Status: GOOD (  26.53  )
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

On Mon, May 22, 2023 at 09:57:25AM +0100, James Clark wrote:
> 
> 
> On 20/05/2023 03:55, Leo Yan wrote:
> > Ideally, we want util/perf_regs.c to be general enough and doesn't bind
> > with specific architecture.
> > 
> > But since util/perf_regs.c uses the macros PERF_REG_IP and PERF_REG_SP
> > which are defined by architecture, thus util/perf_regs.c is dependent on
> > architecture header (see util/perf_regs.h includes "<perf_regs.h>", here
> > perf_regs.h is architecture specific header).
> > 
> > As a step to generalize util/perf_regs.c, this commit introduces weak
> > functions arch__reg_ip() and arch__reg_sp() and every architecture can
> > define their own functions; thus, util/perf_regs.c doesn't need to use
> > PERF_REG_IP and PERF_REG_SP anymore.
> > 
> > This is a preparation to get rid of architecture specific header from
> > util/perf_regs.h.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> [...]
> >  
> > -#define DWARF_MINIMAL_REGS ((1ULL << PERF_REG_IP) | (1ULL << PERF_REG_SP))
> > +#define DWARF_MINIMAL_REGS ((1ULL << arch__reg_ip()) | (1ULL << arch__reg_sp()))
> >  
> >  const char *perf_reg_name(int id, const char *arch);
> >  int perf_reg_value(u64 *valp, struct regs_dump *regs, int id);
> > diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
> > index bdccfc511b7e..f308f2ea512b 100644
> > --- a/tools/perf/util/unwind-libdw.c
> > +++ b/tools/perf/util/unwind-libdw.c
> > @@ -252,7 +252,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
> >  	if (!ui->dwfl)
> >  		goto out;
> >  
> > -	err = perf_reg_value(&ip, &data->user_regs, PERF_REG_IP);
> > +	err = perf_reg_value(&ip, &data->user_regs, arch__reg_ip());
> 
> Shouldn't it be more like this, because the weak symbols are a compile
> time thing and it's supposed to support cross arch unwinding at runtime
> (assuming something containing the arch from the file is passed down,
> like we did with perf_reg_name()):
> 
>   char *arch = perf_env__arch(evsel__env(evsel));
>   err = perf_reg_value(&ip, &data->user_regs, arch__reg_ip(arch));

Thanks for pointing out, James.

Agreed that we need to return the IP and SP register based on the
arch.  I will look into more details and spin for a new patch set for
this.

> Now I'm wondering how cross unwinding ever worked because I see
> libunwind also has something hard coded too:
> 
>   #define LIBUNWIND__ARCH_REG_SP PERF_REG_SP

Yeah, I also used arch__reg_sp() to replace PERF_REG_SP; but as you
suggestion, we should fix this with passing 'arch' parameter for
getting SP register based on arch.

Another important thing is to find a good test for cross unwinding.
Maybe I can use tools/perf/tests/shell/record.sh, function
test_register_capture() for testing registers, if you have any other
suggesion, please let me know.

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
