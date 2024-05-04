Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5E1C4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 00:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YxlXLsjRNYhVnriv4zKRlNDNKcp8ncOm3KsZ1LQHEM=; b=NgVliKewD/L3LkdXOeGX9g2TVt
	ouZTuWgWYWbA42GbStFDLa2drnvgpQKmmsATZ7blEWMyY7p707SwZUAgqPXyTNfAVUACZ0SkXMoIJ
	JnacmRZ6Z2Gt7N68Ib3/S0J5mK/NWmz2bswlB2okH3Mlb0r+S4lMBM7Vs1Br0wd1dY9UlDvbbiNUR
	BmUQb0f/TrimtbV4OXuR0U/AaPtJ4D2rr5OxrIMSD8kVu+9xieGww82Mlp6qhZpA7JitZ8VIZN7MP
	wYeYRak5TvveCK6+8aSigp+nJa5oX5Db+FOVhDLpSwhwinwXMVTUTTrNG6tgzTGj8lqCYzHfkaJy+
	ROCgxmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s33DS-00000000qk5-2MC0;
	Sat, 04 May 2024 00:25:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s33DO-00000000qii-2qLo
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 00:25:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ec92e355bfso2005235ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 17:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714782321; x=1715387121; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jNUgL2JIPtjHS0zU6FMK7+7DqPWIOUfewm5xxpb/qS8=;
        b=n4Mejgy5Y9L9UdGuc1qJ7SA0HL1OqkXXiSuCH8zPrxqUPh1Xgn6oWVO/6MRKzJHQsR
         XXKJoeKKA3PeehN/l91FIlAmCu1/GIVQk8s9dHcUNCTErRJQev8WpG/3n1rOASEKaM5x
         MYj+otEQjHOSNOqM5EO21iOg/Yz7esh6ch5kgSuGGaxm1u5PmASPy9Gu4VVnW2ytdRFi
         sO2cWSKgkB5MS/j33ncaDoXf3LQ8MKupRiOoi+xXpwKkZPaQxEWmFmQYKE0j4FQ1Z5ww
         CeNq6cF/j4xdddRB+okjo5TeR0f700nTEIvwapkaK4AX9wR441/Dsz2k2uwvusu1olHe
         3rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714782321; x=1715387121;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jNUgL2JIPtjHS0zU6FMK7+7DqPWIOUfewm5xxpb/qS8=;
        b=hFHiKSTWjAgYhPS7FCt9GJWs02bIZyQNgZ0YIf4qMNXkhNJDBd4cyZAYU9QbipTki5
         EthVtb45L90aZWgWT24Uk2ahiqXY969jqAKm+/yQlBWw5N9LoPGUyflexfxSgmIQvDkq
         OWTPT6bEaCZvojRTNAmRQZ5m7Fjz8ZpzPqgFtX0RwqqTJdC5IfRBl9J1b35Ou6vQKfPn
         X3usVUdXyMhI9NMim4q2KBY63NsfzzccpieHj8uFdYMt7FcBtydrREUZQ9kQREV36BBU
         e8dp+ONoUoRbFQvfj5gf+eJD9nkOidtckga+UWvVnKGawEZ3nmJ/gGUKQmyLh0FhMgB4
         qn1w==
X-Forwarded-Encrypted: i=1; AJvYcCWrYimh2SCdlebVcg5sLODFZ7j2naauhwWZkWwG+g0WRfQTov9OEyep6/irENIWJFxxb75J4lhnQ5wa1oVKHXKPqRLD4nOPUKN/S45RfUOr
X-Gm-Message-State: AOJu0YyG7NgZmIokceqSkkWuVKELuEOD1DFHHJ5GYOs9sXo8caVjBqV8
	1M2e+dcPRswjAbjOFTB/c5sC3loKRRu/EdFltPpk0S6VozApWtLGIva6cZ8NYMLJamanDgkA4u9
	w
X-Google-Smtp-Source: AGHT+IGh4V5FPTFI69/PZua5IgLwb84yNbPsAUwBRhqzoGZaQ1fIxi3CqnFLXXpBX5NraTbXqAyf6Q==
X-Received: by 2002:a17:902:d353:b0:1eb:3d68:fc2d with SMTP id l19-20020a170902d35300b001eb3d68fc2dmr3537235plk.34.1714782321529;
        Fri, 03 May 2024 17:25:21 -0700 (PDT)
Received: from [172.16.0.22] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id la8-20020a170902fa0800b001e421f98ebdsm3849598plb.280.2024.05.03.17.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 17:25:21 -0700 (PDT)
Message-ID: <e4c61017-6667-4773-8f09-497002cbc6a9@rivosinc.com>
Date: Fri, 3 May 2024 17:25:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] perf kvm/riscv: Port perf kvm stat to RISC-V
Content-Language: en-US
To: Shenlin Liang <liangshenlin@eswincomputing.com>, anup@brainfault.org,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org
References: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
 <20240422080833.8745-3-liangshenlin@eswincomputing.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240422080833.8745-3-liangshenlin@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_172522_771306_136A3876 
X-CRM114-Status: GOOD (  19.45  )
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

On 4/22/24 01:08, Shenlin Liang wrote:
> 'perf kvm stat report/record' generates a statistical analysis of KVM
> events and can be used to analyze guest exit reasons.
> 
> "report" reports statistical analysis of guest exit events.
> 
> To record kvm events on the host:
>   # perf kvm stat record -a
> 
> To report kvm VM EXIT events:
>   # perf kvm stat report --event=vmexit
> 
> Signed-off-by: Shenlin Liang <liangshenlin@eswincomputing.com>
> ---
>   tools/perf/arch/riscv/Makefile                |  1 +
>   tools/perf/arch/riscv/util/Build              |  1 +
>   tools/perf/arch/riscv/util/kvm-stat.c         | 79 +++++++++++++++++++
>   .../arch/riscv/util/riscv_exception_types.h   | 35 ++++++++
>   4 files changed, 116 insertions(+)
>   create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
>   create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
> 
> diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
> index a8d25d005207..e1e445615536 100644
> --- a/tools/perf/arch/riscv/Makefile
> +++ b/tools/perf/arch/riscv/Makefile
> @@ -3,3 +3,4 @@ PERF_HAVE_DWARF_REGS := 1
>   endif
>   PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
>   PERF_HAVE_JITDUMP := 1
> +HAVE_KVM_STAT_SUPPORT := 1
> \ No newline at end of file
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
> index 603dbb5ae4dc..d72b04f8d32b 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -1,5 +1,6 @@
>   perf-y += perf_regs.o
>   perf-y += header.o
>   
> +perf-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
>   perf-$(CONFIG_DWARF) += dwarf-regs.o
>   perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
> diff --git a/tools/perf/arch/riscv/util/kvm-stat.c b/tools/perf/arch/riscv/util/kvm-stat.c
> new file mode 100644
> index 000000000000..58813049fc45
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/kvm-stat.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Arch specific functions for perf kvm stat.
> + *
> + * Copyright 2024 Beijing ESWIN Computing Technology Co., Ltd.
> + *
> + */
> +#include <errno.h>
> +#include <memory.h>
> +#include "../../../util/evsel.h"
> +#include "../../../util/kvm-stat.h"
> +#include "riscv_exception_types.h"
> +#include "debug.h"
> +
> +define_exit_reasons_table(riscv_exit_reasons, kvm_riscv_exception_class);
> +
> +const char *vcpu_id_str = "id";
> +const char *kvm_exit_reason = "scause";
> +const char *kvm_entry_trace = "kvm:kvm_entry";
> +const char *kvm_exit_trace = "kvm:kvm_exit";
> +
> +const char *kvm_events_tp[] = {
> +	"kvm:kvm_entry",
> +	"kvm:kvm_exit",
> +	NULL,
> +};
> +
> +static void event_get_key(struct evsel *evsel,
> +			  struct perf_sample *sample,
> +			  struct event_key *key)
> +{
> +	key->info = 0;
> +	key->key = evsel__intval(evsel, sample, kvm_exit_reason);
> +	key->key = (int)key->key;
> +	key->exit_reasons = riscv_exit_reasons;
> +}
> +
> +static bool event_begin(struct evsel *evsel,
> +			struct perf_sample *sample __maybe_unused,
> +			struct event_key *key __maybe_unused)
> +{
> +	return evsel__name_is(evsel, kvm_entry_trace);
> +}
> +
> +static bool event_end(struct evsel *evsel,
> +		      struct perf_sample *sample,
> +		      struct event_key *key)
> +{
> +	if (evsel__name_is(evsel, kvm_exit_trace)) {
> +		event_get_key(evsel, sample, key);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static struct kvm_events_ops exit_events = {
> +	.is_begin_event = event_begin,
> +	.is_end_event	= event_end,
> +	.decode_key	= exit_event_decode_key,
> +	.name		= "VM-EXIT"
> +};
> +
> +struct kvm_reg_events_ops kvm_reg_events_ops[] = {
> +	{
> +		.name	= "vmexit",
> +		.ops	= &exit_events,
> +	},
> +	{ NULL, NULL },
> +};
> +
> +const char * const kvm_skip_events[] = {
> +	NULL,
> +};
> +
> +int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid __maybe_unused)
> +{
> +	kvm->exit_reasons_isa = "riscv64";
> +	return 0;
> +}
> diff --git a/tools/perf/arch/riscv/util/riscv_exception_types.h b/tools/perf/arch/riscv/util/riscv_exception_types.h
> new file mode 100644
> index 000000000000..c49b8fa5e847
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/riscv_exception_types.h
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#ifndef ARCH_PERF_RISCV_EXCEPTION_TYPES_H
> +#define ARCH_PERF_RISCV_EXCEPTION_TYPES_H
> +
> +#define EXC_INST_MISALIGNED 0
> +#define EXC_INST_ACCESS 1
> +#define EXC_INST_ILLEGAL 2
> +#define EXC_BREAKPOINT 3
> +#define EXC_LOAD_MISALIGNED 4
> +#define EXC_LOAD_ACCESS 5
> +#define EXC_STORE_MISALIGNED 6
> +#define EXC_STORE_ACCESS 7
> +#define EXC_SYSCALL 8
> +#define EXC_HYPERVISOR_SYSCALL 9
> +#define EXC_SUPERVISOR_SYSCALL 10
> +#define EXC_INST_PAGE_FAULT 12
> +#define EXC_LOAD_PAGE_FAULT 13
> +#define EXC_STORE_PAGE_FAULT 15
> +#define EXC_INST_GUEST_PAGE_FAULT 20
> +#define EXC_LOAD_GUEST_PAGE_FAULT 21
> +#define EXC_VIRTUAL_INST_FAULT 22
> +#define EXC_STORE_GUEST_PAGE_FAULT 23
> +
> +#define EXC(x) {EXC_##x, #x }
> +
> +#define kvm_riscv_exception_class                                         \
> +	EXC(INST_MISALIGNED), EXC(INST_ACCESS), EXC(INST_ILLEGAL),         \
> +	EXC(BREAKPOINT), EXC(LOAD_MISALIGNED), EXC(LOAD_ACCESS),           \
> +	EXC(STORE_MISALIGNED), EXC(STORE_ACCESS), EXC(SYSCALL),            \
> +	EXC(HYPERVISOR_SYSCALL), EXC(SUPERVISOR_SYSCALL),                  \
> +	EXC(INST_PAGE_FAULT), EXC(LOAD_PAGE_FAULT), EXC(STORE_PAGE_FAULT), \
> +	EXC(INST_GUEST_PAGE_FAULT), EXC(LOAD_GUEST_PAGE_FAULT),            \
> +	EXC(VIRTUAL_INST_FAULT), EXC(STORE_GUEST_PAGE_FAULT)
> +
> +#endif /* ARCH_PERF_RISCV_EXCEPTION_TYPES_H */

For some reason my previous RB email doesn't show up in lore. So here it 
goes agian. Sorry for the spam it gets delivered twice.

Reviewed-by: Atish Patra <atishp@rivosinc.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
