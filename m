Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0D2D68BC8
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llAjHHdqxRnIR+cSPdjwC4DirSv3WPz2Vj82kb81B9E=; b=XKweWDtl1rCZLz
	ntsouAsRQqD6NYsJc8Qm9z7KtVbc6iPf41A9KX4J5DjtahRZAXdbTIBOYf9aaxCEYcqUFyiwphRVs
	m1vNypwfI1RuAyxTey0GkRHE6vmF/mYxj3PyFf+nWsJG7hVwTqreuXz/FPqgMng0XeOmOsbZHBiri
	2o6wSiCbJg0PtzqBxZ5mroW3Fu/7Z6Qx1JxdvX9pO/vAfo2nwm6qsj6DX/itRRT1treNrbXdqXImc
	x+Ci9E+R8UCh9j2FewEUbCGANsPBj2xfK0QuLyAcXtceo5TfqrBeSUNO0zAll84VlnNt/ioKGSkVa
	oVqdlm7DwqZVTy19hlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByMd-00000003Bhb-33Wu;
	Fri, 15 Nov 2024 15:36:03 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByMb-00000003Bfl-1cy7
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 15:36:02 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5cf9cd1120bso656113a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731684959; x=1732289759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1RpKflVF0bebbJaxQf/ZXjTfRFvkv41edCIwaQJcQs=;
        b=YT1DtuGV/sLL5tXE1CQS6q7X8nwmwEOG3DFvrbZLqpW/p6J5E4JEscLOPk/kzyBtWy
         XKOCok7VNITz9P402+DqRjKtlqVAZ0SVe4fqGl03bKXSLeuJe49pzdfa2kMb2xgp3Xdo
         pe4wt7Y729Z4wJraUsfhR39R2aWrnqZ4ah/Sw6ExVbhyyKw8nSy33XwObwuIPFAvj0Jv
         4e5yi1VUsTrkMR2DKj4Cl6w22E8oPCoXwq1RLVlZjUGcP23v4/bEX8Xhs5PyrdMcrOEs
         snqfd/GxNcACDuoclhu+aB1l62P+tELfDAOpIabhky2KSdCddA64j5G9lK26l4AGE3jy
         VOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731684959; x=1732289759;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1RpKflVF0bebbJaxQf/ZXjTfRFvkv41edCIwaQJcQs=;
        b=a+H2+JA/oF3zcs3L3e2gOCiTNaD6+fNDdB4FWzVPKOQlqjtBLJXpmHvLRiIf7WBjLQ
         gb+joT5Ld+1dnIHXRunIAGKOHx3xszk+D/0TIJ1h5COXwpWlv26LgNJePieAo9N4/tWn
         R+ErJpjTVOdYfvC2TyeT+qfn4viPaJUAcK7X4GI++yCNOTH47xp9mDDWKPyWKunmQe1r
         /J0xwH+OMAH72cpJQCxGU0IW8JH+qJzeVigyvEjXUCLz1pXNP2ea6WvxiV7K1T8tBSed
         24+3BgRCY2ooOtsLHIEUTLqGeGKyVkvwDCCX3tiHsS/fciwWqQJT85BOseprNFEUA+BL
         QHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbhYYAkO6m1PRY8HMJ8i/5Vso3ANHVQlmCauuNSz4+dwpQ1qgRuUWv8bfcYCBA8zo1GPKfktINDhSlfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrerzhPue0YdPDX0DxIL8Nf8WCScmsHl2ewzFgwbh32BSjWIrG
	lTGf70MBrHPlsYj+GYeX3MCtH+xYw7ip7pFuS4OJHiUUPiOpYiR+/BS/DAfNNko=
X-Google-Smtp-Source: AGHT+IECuVoSF3cpPActYMtkLKV2qemZdHFkwL1b+NBlkRP5B3JvLdOGBczovm4O75t7YTAzxqF8NQ==
X-Received: by 2002:a05:6402:34c4:b0:5cf:14fa:cd10 with SMTP id 4fb4d7f45d1cf-5cf754df234mr6631178a12.5.1731684958824;
        Fri, 15 Nov 2024 07:35:58 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79c0ad15sm1676898a12.66.2024.11.15.07.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 07:35:58 -0800 (PST)
Message-ID: <215ca9a2-0a63-4d0c-8402-5cb1f2bb0794@linaro.org>
Date: Fri, 15 Nov 2024 15:35:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Refactor cpuid and metric table lookup code
To: Ian Rogers <irogers@google.com>, Xu Yang <xu.yang_2@nxp.com>
References: <20241107162035.52206-1-irogers@google.com>
Content-Language: en-US
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Ben Zong-You Xie <ben717@andestech.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das
 <sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@amd.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Dima Kogan <dima@secretsauce.net>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241107162035.52206-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_073601_434985_F8E3B908 
X-CRM114-Status: GOOD (  14.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 07/11/2024 4:20 pm, Ian Rogers wrote:
> Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
> lookup:
> https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.yang_2@nxp.com/
> These patches remove a lot of the logic relating CPUIDs to PMUs so
> that the PMU isn't part of the question when finding a metric table.
> For time reasons, it doesn't go as far as allowing system metrics
> without a metric table as a metric table is needed for metrics to
> refer to other metrics, and the refactoring of that resolution is a
> hassle.
> 
> Ian Rogers (7):
>    perf header: Move is_cpu_online to numa bench
>    perf header: Refactor get_cpuid to take a CPU for ARM
>    perf arm64 header: Use cpu argument in get_cpuid
>    perf header: Avoid transitive PMU includes
>    perf header: Pass a perf_cpu rather than a PMU to get_cpuid_str
>    perf jevents: Add map_for_cpu
>    perf pmu: Move pmu_metrics_table__find and remove ARM override
> 
> Xu Yang (1):
>    perf jevents: fix breakage when do perf stat on system metric
> 
>   tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
>   tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
>   tools/perf/arch/arm64/util/pmu.c         | 20 ------
>   tools/perf/arch/loongarch/util/header.c  |  4 +-
>   tools/perf/arch/powerpc/util/header.c    |  4 +-
>   tools/perf/arch/riscv/util/header.c      |  4 +-
>   tools/perf/arch/s390/util/header.c       |  6 +-
>   tools/perf/arch/x86/util/auxtrace.c      |  3 +-
>   tools/perf/arch/x86/util/header.c        |  5 +-
>   tools/perf/bench/numa.c                  | 53 +++++++++++++++
>   tools/perf/builtin-kvm.c                 |  4 +-
>   tools/perf/pmu-events/empty-pmu-events.c | 39 ++++++-----
>   tools/perf/pmu-events/jevents.py         | 39 ++++++-----
>   tools/perf/pmu-events/pmu-events.h       |  2 +-
>   tools/perf/tests/expr.c                  |  5 +-
>   tools/perf/util/env.c                    |  4 +-
>   tools/perf/util/expr.c                   |  6 +-
>   tools/perf/util/header.c                 | 82 ++++++++----------------
>   tools/perf/util/header.h                 | 23 +++----
>   tools/perf/util/pmu.c                    | 25 --------
>   tools/perf/util/pmu.h                    |  2 -
>   tools/perf/util/probe-event.c            |  1 +
>   22 files changed, 189 insertions(+), 229 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
