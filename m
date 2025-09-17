Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA9ACA0EE8
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGc8rr/tatGXbcCnxx0jf2sOzCOmmctKzJFaVA2ZTBI=; b=vuTcf539uSxojc
	FokG1qIOaSM0b+9M41AXzkRDFHLHCBRHDxZYoOJygPtEL+D4vmGV8jSg3tHYGGnu/fQ8JAHSOXTq0
	WSKxnaDnuZKYqqkHItKp77vYzCzjawNtcvzM9h0YNAH44girDBBTZG0bw1bjnU86WLN8yw2lA5AqL
	kcfNewzJ0AfxowuHjVJtcDtKxwhVYvRyiuRQ8jRgUnRxl25EfZZmkKNT4iwus/1rlroETBPtBNfgq
	NBNRYqTEGzs58p/O2J+mwtgBEssyzTJplW3a8Mc5g6Vi7HHgg2OekL+W2y3wLwDln1f1audNydQ7T
	oqvuMtiIQ4eAT9RwrwSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymbM-0000000AUBR-0ZA0;
	Wed, 17 Sep 2025 07:29:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymbJ-0000000AU9T-3PE5
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 07:29:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32e372c413aso2516871a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758094153; x=1758698953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGMxyAVQkLmt2nM51SfjyMANS8EMy8Kdk2x4MsTxGUg=;
        b=PirM09FJ3w0H0J7LcSTGdGftXzWtGYpj9o+ub7WFt+Bp0MV+nNr4cfS7KUzbTQmD8J
         DBB8xAYVziGefMH3tnWHxhtQWg+GJzNqLv35EkoocJYZocWbY0mozYnWE6DA6NrtPGdi
         Ssklug8xJU+VvdPg9ZIdB3u77GIWQq8J5G5WtsYVEbfgeklwKKs5ty3UimhjHpW6HwT1
         yQSdvz4+ftAVKgUoGpeL76DHspfkC9X/tSD2L7mhhP094Uzzxbxsn7Xtgy9KsnIuKqYS
         rDlPRUFjw34lybhR0wo93F3+SoYVzrEOiFiSe4pIxy6yuNk9yGOolkmffsSUF5Wah2rs
         iPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758094153; x=1758698953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGMxyAVQkLmt2nM51SfjyMANS8EMy8Kdk2x4MsTxGUg=;
        b=Ss/lS14G6sEq+J9xXVpjWk4kxzSvzO8sb2/t5MXRI5t1woxLlQ1qEZd+5MZpZ3Lp0/
         MLWGpQ/zAxeP2MkNpv61JHYT3U36CUqMVbt3DTj54s7SrngkZljOzuOKhLHscGS4tZlZ
         Nnnv4s9MgCzjAxqqEg28LKL0S9NGbD4E6YvawyGy3mOBkXI88B9RMrTh8schwX4O2hik
         K5/K6mOcZTabQK+wbwVRopHeT7QIJCd1oiMJ0iacnCbrxfNdeKoNz7+J/XNjyoKsQwne
         ijhFWDONV3pAL35F7+2BhOGmGoDRBTtommsdPCt+MFCy58xbfeJoYhE9R2jQaYxrkjtb
         UBZQ==
X-Gm-Message-State: AOJu0YzKq9XktUrcT2nLsmE4RnWKHORHeZj9dsJzK9X2aguMe2gpioU+
	AL2375q64AgW/lkAwPpcr0FdiQfE9R48mkqhXDwVTTIpCyew/8RmswSy
X-Gm-Gg: ASbGncu1i6FzWkxasJULTy0gsReJ9MIG1wzBxGU3vUPBkHzUZLBB2xXU6Nt8bjHT/mp
	ccnO1tfDvNSPGdSEgKgWUvfdJcRf10tuSYIxJ4/uzbnK9mXrNRJPGBsRCoSPy79tsdqpkBsV5oM
	jQzNDzxviJA8YgcZzsNIrHlrhvlCb4eggabpc1TiBGoZqLCjZJl7OR2Wl0fy4ZxhBL2eVfvMQ6t
	xDEuTc9pZhrZd6NbZhVwEJrQkkA6Z4d4nIH4UmvX4r23Nk6usQg8aUxFFeNUiRBhz16Mw1P5jZk
	5E/AgZre56SLnwZxMUiPRCWTbaVlZ6HhSNXyQwcaNizB9nC1Y3/LqH9xPVeybv9jjNmNligLSei
	yljo9ceZ3t8N8RtyIEG7c4zYb
X-Google-Smtp-Source: AGHT+IHUtcafhAyiAUgRuMgzIXX3ncYg9PIYU74U7gBGjUqm2CSWekMPflPgAWzrA95Bfx/ozkOv8Q==
X-Received: by 2002:a17:90b:3c05:b0:32e:32f8:bf9f with SMTP id 98e67ed59e1d1-32ee3f8df41mr1386261a91.30.1758094152532;
        Wed, 17 Sep 2025 00:29:12 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed275e795sm1581943a91.19.2025.09.17.00.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 00:29:11 -0700 (PDT)
Message-ID: <58439862-945d-4b7d-bf6a-6d398e6dd744@gmail.com>
Date: Wed, 17 Sep 2025 00:27:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] riscv: tarce: Implement riscv trace pmu driver
 and perf support
To: cp0613@linux.alibaba.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250911124448.1771-1-cp0613@linux.alibaba.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20250911124448.1771-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002913_863602_7639F277 
X-CRM114-Status: GOOD (  29.37  )
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

On 9/11/25 05:44, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> The RISC-V Trace Specification defines a standardized framework for
> capturing and analyzing the execution of RISC-V processors. Its main
> uses include: instruction and data tracing, real-time debugging, etc.
> Similar to Intel-PT and ARM-CoreSight.
> 
> According to the RISC-V Trace Control Interface specification [1].
> There are two standard RISC-V trace protocols which will utilize
> this RISC-V Trace Control Interface:
> - RISC-V N-Trace (Nexus-based Trace) Specification
> - Efficient Trace for RISC-V Specification
> So, this is a complete guideline for any standard RISC-V trace
> implementation.
> 
> This series of patches is mainly used to start related work and
> communication. It completes the following tasks:
> 1. dt-bindings completes the basic definition of riscv trace
>     component properties, but is still incomplete.
> 2. Implemented the basic RISC-V Trace PMU driver, including
>     support for the aux buffer.
> 3. Implemented basic support for AUXTRACE integration with perf
>     tools.
> 
> There's still more work to be done, such as:
> 1. Complete RISC-V Trace PMU implementation.
> 2. The perf.data generation and parsing including AUXTRACE events.
> 3. Taking RISC-V N-Trace as an example, implement the parsing of
>     Nexus Trace data format, including support for perf report and
>     perf script commands.
> We are still sorting out.
> 
> Any comments or suggestions are welcome.
> 
> [1] https://github.com/riscv-non-isa/tg-nexus-trace.git
> 

Hi Chen, thanks for starting this series. I have done a N-trace driver
in user space: https://github.com/ganboing/riscv-trace-umd, and I'd love
to see someone finally taking the effort to try a proper kernel driver.

My overall suggestions:

1. We need a way to expose proper topology to user-space like coresight.
    Thus, I'm thinking of using similar logic in coresight to export the
    topology through sysfs. Potentially we can abstract some logic out of
    coresight and make it a common core path that can be reused by riscv
    trace driver. Thus, we don't reinvent the wheel. This also helps
    debugging trace driver issues if anything goes wrong.

2. IMO, The driver should be moved to drivers/hwtracing/. It's not tightly
    coupled with arch, and there are many platform related logic where it
    doesn't belong to arch/riscv/. Having said that, I do believe we'll need
    something in arch/riscv/ eventually for trace once the self-hosted trace
    spec is finalized. Self-hosted trace behaves more like Intel PT, where
    the control will be done through some CSR(s), and it doesn't need those
    funnel/sink topology, and can emit trace stream to virtual memory directly.
    It's a per-hart thing with LAMBI and all that. I'd imagine that eventually
    riscv trace will be two parts. One is more coresight-alike, where you have
    encoders/funnel/sink/bridge that are described through DT and controlled by
    MMIO. The other part is more PT-alike, where the feature is described by
    ISA-string (I guess?), and it's much easier to program. For the time being,
    IMO, a coresight-alike driver, e.g., drivers/hwtracing/rvtrace, is more
    suited for existing platforms implementing N-trace or E-trace. Also, don't
    assume the memory sink is available. People using this "coresight-alike"
    driver can very-well be HW engineers who's collecting traces using external
    probes, so again I think we may want to abstract out part of coresight's
    logic and reuse then in riscv.

3. I've already implemented a N-trace decoder:
    https://github.com/ganboing/libnexus-rv
    It can decode N-trace on real HW (ESWIN EIC7700/Sifive P550). I'll try to
    see if I have the time to code up N-trace decoding in perf tool, once the
    driver and the perf trace collection part is stabilized. If not, I will be
    happy to review yours. Please include me in future series.

BTW, perhaps you want to also CC riscv Task Groups such as
   - Sig-Debug-Trace-Perf-Mon (DTPM)
   - Tech-Self-Hosted-Trace

to keep people like Beeman/Robert/Bruce/Iain/Greg posted. Robert mentioned
they tried to contact Sifive to see if they had similar driver upstreaming
effort just like yours, but there were no reply. Keep them posted anyway to
avoid duplicate work. We should also discuss this during riscv NA summit if
you or Guo's attending.

> Chen Pei (4):
>    dt-bindings: riscv: Add trace components description
>    riscv: event: Initial riscv trace driver support
>    tools: perf: Support perf record with aux buffer for riscv trace
>    riscv: trace: Support sink using dma buffer
> 
>   .../riscv/trace/riscv,trace,encoder.yaml      |  41 +++
>   .../riscv/trace/riscv,trace,funnel.yaml       |  46 ++++
>   .../riscv/trace/riscv,trace,sink.yaml         |  37 +++
>   arch/riscv/Kbuild                             |   1 +
>   arch/riscv/Kconfig                            |   2 +
>   arch/riscv/events/Kconfig                     |  11 +
>   arch/riscv/events/Makefile                    |   3 +
>   arch/riscv/events/riscv_trace.c               | 253 ++++++++++++++++++
>   arch/riscv/events/riscv_trace.h               | 133 +++++++++
>   arch/riscv/events/riscv_trace_encoder.c       | 109 ++++++++
>   arch/riscv/events/riscv_trace_funnel.c        | 160 +++++++++++
>   arch/riscv/events/riscv_trace_sink.c          | 100 +++++++
>   tools/perf/arch/riscv/util/Build              |   3 +
>   tools/perf/arch/riscv/util/auxtrace.c         |  33 +++
>   tools/perf/arch/riscv/util/pmu.c              |  18 ++
>   tools/perf/arch/riscv/util/riscv-trace.c      | 183 +++++++++++++
>   tools/perf/arch/riscv/util/tsc.c              |  15 ++
>   tools/perf/util/Build                         |   1 +
>   tools/perf/util/auxtrace.c                    |   4 +
>   tools/perf/util/auxtrace.h                    |   1 +
>   tools/perf/util/riscv-trace.c                 | 162 +++++++++++
>   tools/perf/util/riscv-trace.h                 |  18 ++
>   22 files changed, 1334 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,encoder.yaml
>   create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,funnel.yaml
>   create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,sink.yaml
>   create mode 100644 arch/riscv/events/Kconfig
>   create mode 100644 arch/riscv/events/Makefile
>   create mode 100644 arch/riscv/events/riscv_trace.c
>   create mode 100644 arch/riscv/events/riscv_trace.h
>   create mode 100644 arch/riscv/events/riscv_trace_encoder.c
>   create mode 100644 arch/riscv/events/riscv_trace_funnel.c
>   create mode 100644 arch/riscv/events/riscv_trace_sink.c
>   create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
>   create mode 100644 tools/perf/arch/riscv/util/pmu.c
>   create mode 100644 tools/perf/arch/riscv/util/riscv-trace.c
>   create mode 100644 tools/perf/arch/riscv/util/tsc.c
>   create mode 100644 tools/perf/util/riscv-trace.c
>   create mode 100644 tools/perf/util/riscv-trace.h
> 
Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
