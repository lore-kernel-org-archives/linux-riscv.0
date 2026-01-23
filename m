Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC02D72372
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 11:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuWzI+aAZ9Mh42Jza1pZh6IPAWsnbgx89wArNa9eduw=; b=b1lyJ6s7vj9+52
	8xbRwr6a7oRZehBB8HNxpfV+oNv+Eq033SMmNpIGq+Sgi6FJshmnG2ylIuOteUolcWRUx1XsWLmjS
	HBufF8T1Vnxt57SgQZySOHlh+FjdcxUaqhC8lKzahrE0+LnxGPTyBM5grj79oQVF5Ff7GAlxwqGqh
	hgoiE0DRTxdRnAUf1yb24+NtnWbVtZVR4idhadzomlu+aZTuqxhKrqeU14mFuQlMvdpLh2AMWw2YR
	XB+1hmUeHHg7YXJ3cYEqkq2HjCihn4RZr8SJHbAk7Wmset7n34PPy3DkgSFR6etRfs4Y2pmwuKJ/L
	1BuwyTYgZN4VmEKarcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvp-00000008nDy-27Ps;
	Fri, 23 Jan 2026 11:02:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvd-00000008n0T-1bDK
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Jan 2026 11:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Jv/G1MGb+4f8ZIWOhwVSNcothLIoyDDC/IvXUwLAuxo=; b=R2oHfQ/SOvAnLjfMguQ1DHndk8
	gvbbZ5BQzYvhrASiP234mofF0Fez0o+YFtaNIOf4+PFKtlrgM1xzApapEcUZ/qnCaiVDlSJhK9/ma
	AcSmq/d1TtnDMogsCJzJOOaRFXywgQUaP+XhXskRRHosJHvKhv33i70q1CsC6laO2UxTeB9S9wBKN
	8qcv9BGtfQdmPJ2DDdRS9WY69gx/3sgIHYA+pfmOMa6y7Ey7/zGGt78XbhMzTqn+4w0E/qKtAULDm
	M3cFdGTY6hpzEK9+9xoHYMyvZmjKsLUXGfcNE7Fw3UFw7IC9WVY5TKyvwJUQO0AfMwn5AQqyTtObd
	0zdc2sLA==;
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEva-00000002Dak-11rS
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 11:02:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso10136435e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 03:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769166128; x=1769770928; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jv/G1MGb+4f8ZIWOhwVSNcothLIoyDDC/IvXUwLAuxo=;
        b=GOSiJygCKv4EpAkFrZ2icuS4mQpv/r5Cy+CQ7GmmHaaJngGspQ2kI9a5PwYFfN67GG
         CAAjFY6ACIDx6YD1yjLADBJDhGzltVvBBatqBfUpMh7Wvg0P603rF36nDhpOWxJfXsBI
         Ey8Vv0gOGIEp1eIcwfByd62qpvhXDWXBte2prmNiQsyowM7awpTeX0N561xWznyNFohB
         X1cHSoSMI74eiY9RqxGOkNM6EgbFPDiDEp31tueS6Zh5c/DQR8gM4IGWxa5E0qB9pnI9
         mjGuXFfmkTzabkCWFb7AwJqN8fIG0Um9rGqwcOQxSsG+x0qUrq7QdCOAUoZaO9oc+5o7
         KwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769166128; x=1769770928;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv/G1MGb+4f8ZIWOhwVSNcothLIoyDDC/IvXUwLAuxo=;
        b=UhCYwSYPe8w7pEVwLE6K2hmckvcNDFpHi67iIl40zJiW86GR47KswWqGCqCDVKVYMj
         +en9Dn8H5l1Xy6UuxHV7qgX+JQ4vt3nWfHawLruyZ9mxKMktBR5wowrN5rIDkHFylvEG
         32Kq6nwCrLz1w1ZAnuBTZAw/foVORXPuia3k7f3KzqS+kmneKyJniT0hFacxObzo6ULD
         og1dLMNxKCGZ3Q37AymnnEpVhntfBbU+g+v3et0cJNNFzD3DHPglUemh0Ahm4HQ0xF9y
         ZZCe77BnK7Ag8g2XIXeQnmjFGcaKeqzLyM6QiR4ig3dVN2T9wmCuoZh2y48PZ5UaQXZd
         ePEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPLXt7h0U9qbuQNZvWCdhKTM3mc9R6OBUNTtrER2cWnIceeUAorqP3blUGW940XWZUW33W6z58kZI0lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt7RA+LaCqXezbgTgphqEg+jWALY+hUWhKHMfHnbl3uLTtcm7b
	1KBMixvSmc0kGD3PPIuJRIpiUApaZ7EBsLaQEZk5aNA7P/cUZOFZT8VXGYnHqGYCX1c=
X-Gm-Gg: AZuq6aKg1qo0L6ggzNKzGJn1sguZezy3VQjwxawtytdlT4LlKFS9CX3z4+Z2jUGhULR
	eMNG6nl1QO3jVPcbLkLxNduFJ0b0sdFi07QmBmK+eN2Y/oW75O5NjZqCmeIy6+tSopSB6XVqAAv
	iNhbSsNW+nc6YqkwDfOSUulLjhnKDZzoOdn3ylE4mA+DBPb+hgk9Acn2LkywNsvXCWbHhu9XEqZ
	lClAALu2TySfJxRNPlpNKclhDYKyc17OaEvSuzNXOXiTkuJy8WiTp0Nu/jMe9Hgnsjwv2gAgGa+
	6q1Vjj0dfrG1XpxxIc6po+iMuVyIaR1dfPA5uPplGJHDN8JiJQi57akVQRdeDggtTgpWeXG57ad
	oc8YTc7pGr/EVfJ4r7LVnbvOHUSyKS+OXtl6hcRAK5CppZsol0G6JM5kVlAtzvBzRFAtWc0BC1f
	dRwzdpgz8urfZWt2yD
X-Received: by 2002:a05:600c:3b18:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-4804c94c4c4mr36618455e9.11.1769166127961;
        Fri, 23 Jan 2026 03:02:07 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbc0d84sm18454735e9.6.2026.01.23.03.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 03:02:07 -0800 (PST)
Message-ID: <1310a240-077a-49f6-b83a-a8a4fd52127b@linaro.org>
Date: Fri, 23 Jan 2026 11:02:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] perf annotate arch clean up
To: Ian Rogers <irogers@google.com>
References: <20260122213516.671089-1-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>,
 Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall
 <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>,
 Athira Rajeev <atrajeev@linux.ibm.com>,
 Aditya Bodkhe <aditya.b1@linux.ibm.com>, Howard Chu <howardchu95@gmail.com>,
 =?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Shimin Guo <shimin.guo@skydio.com>, Sergei Trofimovich <slyich@gmail.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110210_504264_44AC2708 
X-CRM114-Status: GOOD (  22.90  )
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



On 22/01/2026 9:35 pm, Ian Rogers wrote:
> 3 initial memory leak fix patches for perf annotate.
> 
> Move the disasm.c #included arch files into a new util/annotate-arch
> directory. Make the code compile standalone. Try to better encapsulate
> architecture specific code within the files and with a
> arch__new_<arch> function that allows additional data to be associated
> with the struct arch using the standard container_of trick.
> 
> Make the lookup of struct arch use the ELF machine gather from a
> thread rather than an evsel. For example, the evsel can't determine
> the difference between EM_386 and EM_X86_64 so generally the latter
> has currently been used. This means the dwarf registers are off as
> register 1 is CX with EM_386 and DX with EM_X86_64. To facilitate this
> change map_symbol is refactored to use a struct thread rather than a
> struct maps, the maps being obtainable from the thread.
> 
> To make in and out arguments clearer, for safety, etc. try to constify
> struct arch and its related structs.
> 
> v3: Fix arch initialization on arm, arm64, powerpc and sparc as spotted by Suchit
>      Karunakaranw.
> 
> v2: Add a patch to fix a domain info memory leak that was blocking
>      leak sanitizer analysis. Fix more map_symbol leaks or uses after
>      reference count put (Suchit Karunakaranw
>      <suchitkarunakaran@gmail.com>).  Try to repro annotate test crash
>      (James Clark) but suspect it was addressed in the other reference
>      count fixes.
>      https://lore.kernel.org/lkml/20260122165407.561888-1-irogers@google.com/
> 
> v1: https://lore.kernel.org/lkml/20260122073127.375139-1-irogers@google.com/
> 
> Ian Rogers (12):
>    perf header: Fix memory leaks in process_cpu_domain_info
>    perf annotate: Fix args leak of map_symbol
>    perf maps: Fix reference count leak in maps__find_ams
>    perf disasm: Constify use of struct arch
>    perf disasm: Constify use of struct ins_op
>    perf disasm: Constify use of struct ins
>    perf disasm: Rework the string arch__is to use the ELF machine
>    perf disasm: Don't include C files from the arch directory
>    perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_ops
>    perf map_symbol: Switch from holding maps to holding thread
>    perf disasm: Refactor arch__find and initialization of arch structs
>    perf disasm: Minor layout tweaks for struct arch
> 
>   tools/perf/arch/arc/annotate/instructions.c   |  11 -
>   .../perf/arch/riscv64/annotate/instructions.c |  36 --
>   tools/perf/ui/browsers/annotate.c             |   6 +-
>   tools/perf/ui/browsers/hists.c                |   3 +-
>   tools/perf/util/Build                         |   1 +
>   tools/perf/util/addr_location.c               |   4 -
>   tools/perf/util/addr_location.h               |   1 -
>   tools/perf/util/annotate-arch/Build           |  11 +
>   tools/perf/util/annotate-arch/annotate-arc.c  |  18 +
>   .../annotate-arch/annotate-arm.c}             |  50 +-
>   .../annotate-arch/annotate-arm64.c}           |  59 +--
>   .../annotate-arch/annotate-csky.c}            |  29 +-
>   .../annotate-arch/annotate-loongarch.c}       |  71 +--
>   .../annotate-arch/annotate-mips.c}            |  29 +-
>   .../annotate-arch/annotate-powerpc.c}         | 127 +++++-
>   .../util/annotate-arch/annotate-riscv64.c     |  41 ++
>   .../annotate-arch/annotate-s390.c}            |  70 +--
>   .../annotate-arch/annotate-sparc.c}           |  28 +-
>   .../annotate-arch/annotate-x86.c}             |  89 ++--
>   tools/perf/util/annotate-data.c               |  12 +-
>   tools/perf/util/annotate-data.h               |   2 +-
>   tools/perf/util/annotate.c                    |  88 ++--
>   tools/perf/util/annotate.h                    |  10 +-
>   tools/perf/util/callchain.c                   |  12 +-
>   tools/perf/util/capstone.c                    |  18 +-
>   tools/perf/util/db-export.c                   |   1 -
>   tools/perf/util/disasm.c                      | 428 +++++++-----------
>   tools/perf/util/disasm.h                      |  95 ++--
>   tools/perf/util/event.c                       |   2 -
>   tools/perf/util/header.c                      |  17 +-
>   tools/perf/util/hist.c                        |  18 +-
>   tools/perf/util/llvm.c                        |   8 +-
>   tools/perf/util/machine.c                     |  13 +-
>   tools/perf/util/map_symbol.c                  |   5 +-
>   tools/perf/util/map_symbol.h                  |   3 +-
>   tools/perf/util/maps.c                        |   1 +
>   tools/perf/util/sort.c                        |   2 +-
>   tools/perf/util/unwind-libdw.c                |   2 +-
>   tools/perf/util/unwind-libunwind-local.c      |   2 +-
>   39 files changed, 775 insertions(+), 648 deletions(-)
>   delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
>   delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
>   create mode 100644 tools/perf/util/annotate-arch/Build
>   create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
>   rename tools/perf/{arch/arm/annotate/instructions.c => util/annotate-arch/annotate-arm.c} (59%)
>   rename tools/perf/{arch/arm64/annotate/instructions.c => util/annotate-arch/annotate-arm64.c} (70%)
>   rename tools/perf/{arch/csky/annotate/instructions.c => util/annotate-arch/annotate-csky.c} (67%)
>   rename tools/perf/{arch/loongarch/annotate/instructions.c => util/annotate-arch/annotate-loongarch.c} (60%)
>   rename tools/perf/{arch/mips/annotate/instructions.c => util/annotate-arch/annotate-mips.c} (59%)
>   rename tools/perf/{arch/powerpc/annotate/instructions.c => util/annotate-arch/annotate-powerpc.c} (73%)
>   create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
>   rename tools/perf/{arch/s390/annotate/instructions.c => util/annotate-arch/annotate-s390.c} (66%)
>   rename tools/perf/{arch/sparc/annotate/instructions.c => util/annotate-arch/annotate-sparc.c} (85%)
>   rename tools/perf/{arch/x86/annotate/instructions.c => util/annotate-arch/annotate-x86.c} (93%)
> 

Reviewed-by: James Clark <james.clark@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
