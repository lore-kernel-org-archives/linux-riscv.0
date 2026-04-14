Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A953DF9D0F6
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 23:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NpxFtwpaTi9qN2M5OZbRHxGBeR3csPJJrb3hSSz04yc=; b=W/neYg3KRFdEwI
	7bIwcZz/RZib5d+BlF9kOec9AP1UTrw/jHn5xp1+6rtU44czBqtpd1zCyaTJWm4bok7SiGked53o/
	wrZkcxogxikYEpKYlLW2csfjrpyuP8vvdjhVU1MhkQIz3YeuUZKLB+YJq5pq2fGvTvUn2VoCYJVVz
	xUhmQtith/F36sVv/9yDKWa2JVD43VZ76JKnjURFTLDXF86Z+d/Nbfl3ChlOOq/PUHM43ceafifK/
	Alzigl2OJxZgM7ilhgZKX/Yk+Hyq+ON+3C28vOe3GEqxd8IY2oVd6JvDVl6snzU0LO7ae/sXPPJio
	aJ0/p/6uKYPtp08Y+j6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCn9M-00000000KXO-04tC;
	Tue, 14 Apr 2026 23:26:32 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCn9J-00000000KX0-0XJ6
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 23:26:30 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so12515615eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 16:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776209188; x=1776813988; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQKwHS4WLZQFuuFkVYO5PQwY4AUg0AiUXq52eLyqUWE=;
        b=DekrSHvsKGg6DiSVhzO4n+Y14/ZhpoEie7VYqEwpQ/MD0FZjuo9MPtMtpUqv3PlnQl
         orffHI5BdM6hGJb75sC8rlppUggKfoSRN0m6Ji+tmCqA7o19tJgir6rI+sm+E+p3sERV
         +H7AtuEb1FlRr3rxUps+Fp0zq1F4u4kzbVqcnV73VeXhkbga85Ob3dVdeMttuUAAZDdc
         QSWFENNs0IYu0H8bM78diLuFGzNWLV6AjogEzNq59gelPU3bR4A9QA+DVaXZ/IxgoBzF
         hAT+PCGdRPaXXQ76MDpeYqV4C+LkF5xbb5aPRc2tdj2shWYzPm8O086SYsOOrF6cQ35a
         GtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776209188; x=1776813988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQKwHS4WLZQFuuFkVYO5PQwY4AUg0AiUXq52eLyqUWE=;
        b=hsOD0hHbjUlGMrm1IdWx0FG7x5ZEfr39nGQkcDpxaxABuHlKH2TmOarnZv3W3ATTt4
         Bs8n83eu9IdHtuITYAvci2brHwcAHJsWrVLOARcQDYAjx5/f0Vblf42wA4MOyJO+CpKf
         W0jhgKaH24g7jyWwuQgSUaK32xvbdpQF+L9AqGF7sClLPTNJpfKNESAsM1Aaf6gaOEZW
         w9lnR/CqcD57IgdYTCl5N+bYww1Tc7ONUrYI1cIEUUH2gG7p+181ujXu1qacc5EALcC5
         9TXESUdg5+tsoUWkiU+TZe4owN6HdaJdvGnZXx7nytxs1bP1mt3he+0mfOBRWNkodnRj
         WoTA==
X-Forwarded-Encrypted: i=1; AFNElJ+eHWVP5f4OnhFzU5odref7N+CSsWeCKhdOK0D7TWDvSbyyV2PUESdqHndWUyggJXwxZpeQ7488cMU/8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCEGBmOqpW6qEaj5xysa1HykiqHjg5ZO+xbEXLV6FI5dBFLNfC
	D6nGK/qO4YuFI/l/gEvhe2nrw4dvwqAVYwyqtuTTiE+sb4dPqUY6y3h3
X-Gm-Gg: AeBDiesM6ZDwrMtY3s+ss3xm9pI1V+s9H8yH6ZT1TvfWHIhRk9EPeo181WwG7Ja0RiH
	3G4qh2tVQS+hMMKdCdBv09FPoaQUJuV3XehbJTExr5PKKqIRTTfTtIO+XduoXySNQ6Q2WAIeF0f
	1qVODdsP/MbVEU21IGYIXY0IJ9gnNlKxQkYVlA0PelQ5az0IGUgcCZOkcICE4HlfUzx2wjR/FO/
	XJTfmiAG3EAWzaVy+NYzHhuImHR5SBJewz7OYLg2AHoybd87ZiuxdCNpSzCCqksA1vA0qRrXPJe
	/rt6A9xJkdxLHF7uImZlkZIj5hj+KY8EQB8U6qotNecGVzfJ2GyC1GBR3Mnpw6J50zqkgoMIZOP
	pAVqomnlPGbyLCmQA9peRFSOhStxS0oQyFCkqT0zqJ8V/UTWeum9j9gQ0SC/oc2NkR2Q3bukVks
	FieOZ1MUL6U3FbrbSSbrXEa8w1rRuR/chpF3phaetzqQFGdAM=
X-Received: by 2002:a05:7301:150d:b0:2da:1874:f39c with SMTP id 5a478bee46e88-2da1874f8e4mr4066308eec.12.1776209187358;
        Tue, 14 Apr 2026 16:26:27 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84511sm83049eec.17.2026.04.14.16.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 16:26:25 -0700 (PDT)
Message-ID: <80ef37c7-ddfc-4268-b5d5-534c4c5091c3@gmail.com>
Date: Tue, 14 Apr 2026 16:31:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/12] perf tools: Add RISC-V trace PMU record
 capabilities
To: Zane Leung <liangzhen@linux.spacemit.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, palmer@dabbelt.com, pjw@kernel.org,
 gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com,
 irogers@google.com
Cc: coresight@lists.linaro.org, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com, jolsa@kernel.org,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, mchitale@gmail.com,
 anup@brainfault.org, atish.patra@linux.dev, andrew.jones@oss.qualcomm.com,
 sunilvl@oss.qualcomm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, anup.patel@oss.qualcomm.com,
 mayuresh.chitale@oss.qualcomm.com, zhuangqiubin@linux.spacemit.com
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
 <20260414034153.3272485-10-liangzhen@linux.spacemit.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260414034153.3272485-10-liangzhen@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_162629_224320_1D1B6530 
X-CRM114-Status: GOOD (  29.45  )
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

NACK. The file is largely copied from tools/perf/arch/x86/util/intel-pt.c
There's even markers like "Intel Processor Trace" in file auxtrace.c.
There's no mentioning of authorship, but instead Spacemit claming its
copyright over it.

Bo

On 4/13/26 20:41, Zane Leung wrote:
> From: liangzhen <zhen.liang@spacemit.com>
> 
> Introduce the required auxiliary API functions allowing
> the perf core to interact with RISC-V trace perf driver.
> 
> Signed-off-by: liangzhen <zhen.liang@spacemit.com>
> ---
>   tools/perf/arch/riscv/util/Build      |   2 +-
>   tools/perf/arch/riscv/util/auxtrace.c | 489 ++++++++++++++++++++++++++
>   tools/perf/util/auxtrace.c            |   1 +
>   tools/perf/util/auxtrace.h            |   1 +
>   tools/perf/util/rvtrace.h             |  38 ++
>   5 files changed, 530 insertions(+), 1 deletion(-)
>   create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
>   create mode 100644 tools/perf/util/rvtrace.h
> 
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
> index 748068a3a5c5..10f41f97bc2e 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -1,3 +1,3 @@
>   perf-util-y += header.o
>   
> -perf-util-y += pmu.o
> +perf-util-y += pmu.o auxtrace.o
> diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
> new file mode 100644
> index 000000000000..5feee198ef97
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/auxtrace.c
> @@ -0,0 +1,489 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 Spacemit Limited. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include <linux/log2.h>
> +#include <linux/zalloc.h>
> +#include <linux/string.h>
> +#include <time.h>
> +
> +#include <internal/lib.h> // page_size
> +#include "../../../util/auxtrace.h"
> +#include "../../../util/cpumap.h"
> +#include "../../../util/debug.h"
> +#include "../../../util/event.h"
> +#include "../../../util/evlist.h"
> +#include "../../../util/evsel.h"
> +#include "../../../util/rvtrace.h"
> +#include "../../../util/pmu.h"
> +#include "../../../util/record.h"
> +#include "../../../util/session.h"
> +#include "../../../util/tsc.h"
> +#include "../../../util/evsel_config.h"
> +
> +#define RVTRACE_PMU_NAME "rvtrace"
> +#define KiB(x) ((x) * 1024)
> +#define MiB(x) ((x) * 1024 * 1024)
> +
> +static const char * const metadata_encoder_ro[] = {
> +	[RVTRACE_ENCODER_FORMAT]    = "control/format",
> +	[RVTRACE_ENCODER_CONTEXT]   = "control/context",
> +	[RVTRACE_ENCODER_INHB_SRC]  = "control/inhb_src",
> +	[RVTRACE_ENCODER_SRCBITS]   = "features/srcb",
> +	[RVTRACE_ENCODER_SRCID]	    = "features/srcid"
> +};
> +
> +struct rvtrace_recording {
> +	struct auxtrace_record	itr;
> +	struct perf_pmu *rvtrace_pmu;
> +	struct evlist *evlist;
> +	bool snapshot_mode;
> +	size_t snapshot_size;
> +};
> +
> +static int rvtrace_parse_snapshot_options(struct auxtrace_record *itr,
> +					  struct record_opts *opts,
> +					  const char *str)
> +{
> +	struct rvtrace_recording *ptr =
> +				container_of(itr, struct rvtrace_recording, itr);
> +	unsigned long long snapshot_size = 0;
> +	char *endptr;
> +
> +	if (str) {
> +		snapshot_size = strtoull(str, &endptr, 0);
> +		if (*endptr || snapshot_size > SIZE_MAX)
> +			return -1;
> +	}
> +
> +	opts->auxtrace_snapshot_mode = true;
> +	opts->auxtrace_snapshot_size = snapshot_size;
> +	ptr->snapshot_size = snapshot_size;
> +
> +	return 0;
> +}
> +
> +static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __maybe_unused,
> +				     struct evlist *evlist __maybe_unused)
> +{
> +	int encoder;
> +	struct perf_cpu_map *event_cpus = evlist->core.user_requested_cpus;
> +	struct perf_cpu_map *intersect_cpus;
> +
> +	if (!perf_cpu_map__has_any_cpu(event_cpus)) {
> +		/* cpu map is not "any" CPU , we have specific CPUs to work with */
> +		struct perf_cpu_map *online_cpus = perf_cpu_map__new_online_cpus();
> +
> +		intersect_cpus = perf_cpu_map__intersect(event_cpus, online_cpus);
> +		perf_cpu_map__put(online_cpus);
> +	} else {
> +		/* Event can be "any" CPU so count all online CPUs. */
> +		intersect_cpus = perf_cpu_map__new_online_cpus();
> +	}
> +
> +	encoder = perf_cpu_map__nr(intersect_cpus);
> +	perf_cpu_map__put(intersect_cpus);
> +
> +	return (RVTRACE_HEADER_SIZE + encoder * RVTRACE_ENCODER_PRIV_SIZE);
> +}
> +
> +static int rvtrace_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val)
> +{
> +	char pmu_path[PATH_MAX];
> +	int scan;
> +
> +	/* Get RO metadata from sysfs */
> +	snprintf(pmu_path, PATH_MAX, "cpu%d/%s", cpu.cpu, path);
> +
> +	scan = perf_pmu__scan_file(pmu, pmu_path, "%llx", val);
> +	if (scan != 1) {
> +		pr_err("%s: error reading: %s\n", __func__, pmu_path);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rvtrace_get_metadata(struct perf_cpu cpu, u32 *offset,
> +				 struct auxtrace_record *itr,
> +				 struct perf_record_auxtrace_info *info)
> +{
> +	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
> +	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
> +
> +	info->priv[*offset + RVTRACE_ENCODER_CPU] = cpu.cpu;
> +	info->priv[*offset + RVTRACE_ENCODER_NR_TRC_PARAMS] = RVTRACE_ENCODER_NR_TRC_PARAMS_LENGTH;
> +
> +	/* Get read-only information from sysFS */
> +	rvtrace_get_ro(rvtrace_pmu, cpu, metadata_encoder_ro[RVTRACE_ENCODER_FORMAT],
> +			&info->priv[*offset + RVTRACE_ENCODER_FORMAT]);
> +	rvtrace_get_ro(rvtrace_pmu, cpu, metadata_encoder_ro[RVTRACE_ENCODER_CONTEXT],
> +			&info->priv[*offset + RVTRACE_ENCODER_CONTEXT]);
> +	rvtrace_get_ro(rvtrace_pmu, cpu, metadata_encoder_ro[RVTRACE_ENCODER_INHB_SRC],
> +			&info->priv[*offset + RVTRACE_ENCODER_INHB_SRC]);
> +	rvtrace_get_ro(rvtrace_pmu, cpu, metadata_encoder_ro[RVTRACE_ENCODER_SRCBITS],
> +			&info->priv[*offset + RVTRACE_ENCODER_SRCBITS]);
> +	rvtrace_get_ro(rvtrace_pmu, cpu, metadata_encoder_ro[RVTRACE_ENCODER_SRCID],
> +			&info->priv[*offset + RVTRACE_ENCODER_SRCID]);
> +
> +	/* Where the next CPU entry should start from */
> +	*offset += RVTRACE_ENCODER_PRIV_MAX;
> +}
> +
> +static int rvtrace_info_fill(struct auxtrace_record *itr, struct perf_session *session,
> +			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
> +{
> +	int i;
> +	u32 offset;
> +	u64 nr_cpu, type;
> +	struct perf_cpu_map *cpu_map;
> +	struct perf_cpu_map *event_cpus = session->evlist->core.user_requested_cpus;
> +	struct perf_cpu_map *online_cpus = perf_cpu_map__new_online_cpus();
> +	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
> +	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
> +	struct perf_cpu cpu;
> +
> +	if (priv_size != rvtrace_info_priv_size(itr, session->evlist))
> +		return -EINVAL;
> +
> +	if (!session->evlist->core.nr_mmaps)
> +		return -EINVAL;
> +
> +	/* If the cpu_map has the "any" CPU all online CPUs are involved */
> +	if (perf_cpu_map__has_any_cpu(event_cpus)) {
> +		cpu_map = online_cpus;
> +	} else {
> +		/* Make sure all specified CPUs are online */
> +		perf_cpu_map__for_each_cpu(cpu, i, event_cpus) {
> +			if (!perf_cpu_map__has(online_cpus, cpu))
> +				return -EINVAL;
> +		}
> +
> +		cpu_map = event_cpus;
> +	}
> +
> +	nr_cpu = perf_cpu_map__nr(cpu_map);
> +	type = rvtrace_pmu->type;
> +
> +	/* First fill out the session header */
> +	auxtrace_info->type = PERF_AUXTRACE_RISCV_TRACE;
> +	auxtrace_info->priv[RVTRACE_PMU_TYPE_CPUS] = type << 32;
> +	auxtrace_info->priv[RVTRACE_PMU_TYPE_CPUS] |= nr_cpu;
> +
> +	offset = RVTRACE_HEADER_MAX;
> +
> +	perf_cpu_map__for_each_cpu(cpu, i, cpu_map) {
> +		assert(offset < priv_size);
> +		rvtrace_get_metadata(cpu, &offset, itr, auxtrace_info);
> +	}
> +
> +	perf_cpu_map__put(online_cpus);
> +
> +	return 0;
> +}
> +
> +static int rvtrace_set_sink_attr(struct perf_pmu *pmu,
> +				 struct evsel *evsel)
> +{
> +	char msg[BUFSIZ], path[PATH_MAX], *sink;
> +	struct evsel_config_term *term;
> +	int ret = -EINVAL;
> +	u32 hash;
> +
> +	if (evsel->core.attr.config2 & GENMASK(31, 0))
> +		return 0;
> +
> +	list_for_each_entry(term, &evsel->config_terms, list) {
> +		if (term->type != EVSEL__CONFIG_TERM_DRV_CFG)
> +			continue;
> +
> +		sink = term->val.str;
> +		snprintf(path, PATH_MAX, "sinks/%s", sink);
> +
> +		ret = perf_pmu__scan_file(pmu, path, "%x", &hash);
> +		if (ret != 1) {
> +			if (errno == ENOENT)
> +				pr_err("Couldn't find sink \"%s\" on event %s\n"
> +				       "Missing kernel or device support?\n\n"
> +				       "Hint: An appropriate sink will be picked automatically if one isn't specified.\n",
> +				       sink, evsel__name(evsel));
> +			else
> +				pr_err("Failed to set sink \"%s\" on event %s with %d (%s)\n",
> +				       sink, evsel__name(evsel), errno,
> +				       str_error_r(errno, msg, sizeof(msg)));
> +			return ret;
> +		}
> +
> +		evsel->core.attr.config2 |= hash;
> +		return 0;
> +	}
> +
> +	/*
> +	 * No sink was provided on the command line - allow the CoreSight
> +	 * system to look for a default
> +	 */
> +	return 0;
> +}
> +
> +static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist *evlist,
> +				     struct record_opts *opts)
> +{
> +	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
> +	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
> +	struct evsel *evsel, *rvtrace_evsel = NULL;
> +	struct perf_cpu_map *cpus = evlist->core.user_requested_cpus;
> +	bool privileged = perf_event_paranoid_check(-1);
> +	struct evsel *tracking_evsel;
> +	int err;
> +
> +	ptr->evlist = evlist;
> +	ptr->snapshot_mode = opts->auxtrace_snapshot_mode;
> +	evlist__for_each_entry(evlist, evsel) {
> +		if (evsel->core.attr.type == rvtrace_pmu->type) {
> +			if (rvtrace_evsel) {
> +				pr_err("There may be only one " RVTRACE_PMU_NAME "x event\n");
> +				return -EINVAL;
> +			}
> +			evsel->core.attr.freq = 0;
> +			evsel->core.attr.sample_period = 1;
> +			evsel->needs_auxtrace_mmap = true;
> +			rvtrace_evsel = evsel;
> +			opts->full_auxtrace = true;
> +		}
> +	}
> +
> +	if (!opts->full_auxtrace)
> +		return 0;
> +
> +	err = rvtrace_set_sink_attr(rvtrace_pmu, rvtrace_evsel);
> +	if (err)
> +		return err;
> +
> +	/* we are in snapshot mode */
> +	if (opts->auxtrace_snapshot_mode) {
> +		/*
> +		 * No size were given to '-S' or '-m,', so go with
> +		 * the default
> +		 */
> +		if (!opts->auxtrace_snapshot_size && !opts->auxtrace_mmap_pages) {
> +			if (privileged) {
> +				opts->auxtrace_mmap_pages = MiB(4) / page_size;
> +			} else {
> +				opts->auxtrace_mmap_pages = KiB(128) / page_size;
> +				if (opts->mmap_pages == UINT_MAX)
> +					opts->mmap_pages = KiB(256) / page_size;
> +			}
> +		} else if (!opts->auxtrace_mmap_pages && !privileged &&
> +						opts->mmap_pages == UINT_MAX) {
> +			opts->mmap_pages = KiB(256) / page_size;
> +		}
> +
> +		/*
> +		 * '-m,xyz' was specified but no snapshot size, so make the
> +		 * snapshot size as big as the auxtrace mmap area.
> +		 */
> +		if (!opts->auxtrace_snapshot_size) {
> +			opts->auxtrace_snapshot_size =
> +				opts->auxtrace_mmap_pages * (size_t)page_size;
> +		}
> +
> +		/*
> +		 * -Sxyz was specified but no auxtrace mmap area, so make the
> +		 * auxtrace mmap area big enough to fit the requested snapshot
> +		 * size.
> +		 */
> +		if (!opts->auxtrace_mmap_pages) {
> +			size_t sz = opts->auxtrace_snapshot_size;
> +
> +			sz = round_up(sz, page_size) / page_size;
> +			opts->auxtrace_mmap_pages = roundup_pow_of_two(sz);
> +		}
> +
> +		/* Snapshot size can't be bigger than the auxtrace area */
> +		if (opts->auxtrace_snapshot_size >
> +				opts->auxtrace_mmap_pages * (size_t)page_size) {
> +			pr_err("Snapshot size %zu must not be greater than AUX area tracing mmap size %zu\n",
> +			       opts->auxtrace_snapshot_size,
> +			       opts->auxtrace_mmap_pages * (size_t)page_size);
> +			return -EINVAL;
> +		}
> +
> +		/* Something went wrong somewhere - this shouldn't happen */
> +		if (!opts->auxtrace_snapshot_size || !opts->auxtrace_mmap_pages) {
> +			pr_err("Failed to calculate default snapshot size and/or AUX area tracing mmap pages\n");
> +			return -EINVAL;
> +		}
> +
> +		pr_debug2("%s snapshot size: %zu\n", RVTRACE_PMU_NAME,
> +			  opts->auxtrace_snapshot_size);
> +	}
> +
> +	/* Buffer sizes weren't specified with '-m,xyz' so give some defaults */
> +	if (!opts->auxtrace_mmap_pages) {
> +		if (privileged) {
> +			opts->auxtrace_mmap_pages = MiB(4) / page_size;
> +		} else {
> +			opts->auxtrace_mmap_pages = KiB(128) / page_size;
> +			if (opts->mmap_pages == UINT_MAX)
> +				opts->mmap_pages = KiB(256) / page_size;
> +		}
> +	}
> +
> +	/* Validate auxtrace_mmap_pages */
> +	if (opts->auxtrace_mmap_pages) {
> +		size_t sz = opts->auxtrace_mmap_pages * (size_t)page_size;
> +		size_t min_sz;
> +
> +		if (opts->auxtrace_snapshot_mode)
> +			min_sz = KiB(4);
> +		else
> +			min_sz = KiB(8);
> +
> +		if (sz < min_sz || !is_power_of_2(sz)) {
> +			pr_err("Invalid mmap size for Intel Processor Trace: must be at least %zuKiB and a power of 2\n",
> +			       min_sz / 1024);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/*
> +	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
> +	 * must come first.
> +	 */
> +	evlist__to_front(evlist, rvtrace_evsel);
> +
> +	/*
> +	 * get the CPU on the sample - need it to associate trace ID in the
> +	 * AUX_OUTPUT_HW_ID event, and the AUX event for per-cpu mmaps.
> +	 */
> +	evsel__set_sample_bit(rvtrace_evsel, CPU);
> +
> +	/* Add dummy event to keep tracking */
> +	err = parse_event(evlist, "dummy:u");
> +	if (err)
> +		return err;
> +
> +	tracking_evsel = evlist__last(evlist);
> +	evlist__set_tracking_event(evlist, tracking_evsel);
> +
> +	tracking_evsel->core.attr.freq = 0;
> +	tracking_evsel->core.attr.sample_period = 1;
> +
> +	/* In per-cpu case, always need the time of mmap events etc */
> +	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus))
> +		evsel__set_sample_bit(tracking_evsel, TIME);
> +
> +	return 0;
> +}
> +
> +static int rvtrace_snapshot_start(struct auxtrace_record *itr)
> +{
> +	struct rvtrace_recording *ptr =
> +			container_of(itr, struct rvtrace_recording, itr);
> +	struct evsel *evsel;
> +
> +	evlist__for_each_entry(ptr->evlist, evsel) {
> +		if (evsel->core.attr.type == ptr->rvtrace_pmu->type)
> +			return evsel__disable(evsel);
> +	}
> +	return -EINVAL;
> +}
> +
> +static int rvtrace_snapshot_finish(struct auxtrace_record *itr)
> +{
> +	struct rvtrace_recording *ptr =
> +			container_of(itr, struct rvtrace_recording, itr);
> +	struct evsel *evsel;
> +
> +	evlist__for_each_entry(ptr->evlist, evsel) {
> +		if (evsel->core.attr.type == ptr->rvtrace_pmu->type)
> +			return evsel__enable(evsel);
> +	}
> +	return -EINVAL;
> +}
> +
> +static u64 rvtrace_reference(struct auxtrace_record *itr __maybe_unused)
> +{
> +	return rdtsc();
> +}
> +
> +static void rvtrace_recording_free(struct auxtrace_record *itr)
> +{
> +	struct rvtrace_recording *ptr =
> +			container_of(itr, struct rvtrace_recording, itr);
> +
> +	free(ptr);
> +}
> +
> +static struct auxtrace_record *rvtrace_recording_init(int *err, struct perf_pmu *rvtrace_pmu)
> +{
> +	struct rvtrace_recording *ptr;
> +
> +	if (!rvtrace_pmu) {
> +		*err = -ENODEV;
> +		return NULL;
> +	}
> +
> +	ptr = zalloc(sizeof(*ptr));
> +	if (!ptr) {
> +		*err = -ENOMEM;
> +		return NULL;
> +	}
> +
> +	ptr->rvtrace_pmu = rvtrace_pmu;
> +	ptr->itr.parse_snapshot_options = rvtrace_parse_snapshot_options;
> +	ptr->itr.recording_options = rvtrace_recording_options;
> +	ptr->itr.info_priv_size = rvtrace_info_priv_size;
> +	ptr->itr.info_fill = rvtrace_info_fill;
> +	ptr->itr.snapshot_start = rvtrace_snapshot_start;
> +	ptr->itr.snapshot_finish = rvtrace_snapshot_finish;
> +	ptr->itr.free = rvtrace_recording_free;
> +	ptr->itr.reference = rvtrace_reference;
> +	ptr->itr.read_finish = auxtrace_record__read_finish;
> +	ptr->itr.alignment = 0;
> +
> +	*err = 0;
> +	return &ptr->itr;
> +}
> +
> +static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
> +					   int pmu_nr, struct evsel *evsel)
> +{
> +	int i;
> +
> +	if (!pmus)
> +		return NULL;
> +
> +	for (i = 0; i < pmu_nr; i++) {
> +		if (evsel->core.attr.type == pmus[i]->type)
> +			return pmus[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +struct auxtrace_record *auxtrace_record__init(struct evlist *evlist, int *err)
> +{
> +	struct perf_pmu	*rvtrace_pmu = NULL;
> +	struct perf_pmu *found_rvtrace = NULL;
> +	struct evsel *evsel;
> +
> +	if (!evlist)
> +		return NULL;
> +
> +	rvtrace_pmu = perf_pmus__find(RVTRACE_PMU_NAME);
> +	evlist__for_each_entry(evlist, evsel) {
> +		if (rvtrace_pmu && !found_rvtrace)
> +			found_rvtrace = find_pmu_for_event(&rvtrace_pmu, 1, evsel);
> +	}
> +
> +	if (found_rvtrace)
> +		return rvtrace_recording_init(err, rvtrace_pmu);
> +
> +	*err = 0;
> +	return NULL;
> +}
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index a224687ffbc1..944a43d48739 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -1411,6 +1411,7 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
>   	case PERF_AUXTRACE_VPA_DTL:
>   		err = powerpc_vpadtl_process_auxtrace_info(event, session);
>   		break;
> +	case PERF_AUXTRACE_RISCV_TRACE:
>   	case PERF_AUXTRACE_UNKNOWN:
>   	default:
>   		return -EINVAL;
> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
> index 6947f3f284c0..4f4714c1b53f 100644
> --- a/tools/perf/util/auxtrace.h
> +++ b/tools/perf/util/auxtrace.h
> @@ -46,6 +46,7 @@ enum auxtrace_type {
>   	PERF_AUXTRACE_S390_CPUMSF,
>   	PERF_AUXTRACE_HISI_PTT,
>   	PERF_AUXTRACE_VPA_DTL,
> +	PERF_AUXTRACE_RISCV_TRACE,
>   };
>   
>   enum itrace_period_type {
> diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
> new file mode 100644
> index 000000000000..1e48ed989dd7
> --- /dev/null
> +++ b/tools/perf/util/rvtrace.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright(C) 2026 Spacemit Limited. All rights reserved.
> + */
> +
> +#ifndef INCLUDE__UTIL_PERF_RVTRACE_H__
> +#define INCLUDE__UTIL_PERF_RVTRACE_H__
> +
> +#include "debug.h"
> +#include "auxtrace.h"
> +#include "util/event.h"
> +#include "util/session.h"
> +#include <linux/bits.h>
> +
> +enum {
> +	/* PMU->type (32 bit), total # of CPUs (32 bit) */
> +	RVTRACE_PMU_TYPE_CPUS,
> +	RVTRACE_HEADER_MAX,
> +};
> +
> +/* Trace Encoder metadata */
> +enum {
> +	RVTRACE_ENCODER_CPU,
> +	RVTRACE_ENCODER_NR_TRC_PARAMS,
> +	RVTRACE_ENCODER_FORMAT,
> +	RVTRACE_ENCODER_CONTEXT,
> +	RVTRACE_ENCODER_INHB_SRC,
> +	RVTRACE_ENCODER_SRCBITS,
> +	RVTRACE_ENCODER_SRCID,
> +	RVTRACE_ENCODER_PRIV_MAX,
> +};
> +
> +#define RVTRACE_ENCODER_NR_TRC_PARAMS_LENGTH (RVTRACE_ENCODER_PRIV_MAX - RVTRACE_ENCODER_FORMAT)
> +
> +#define RVTRACE_HEADER_SIZE		(RVTRACE_HEADER_MAX * sizeof(u64))
> +#define RVTRACE_ENCODER_PRIV_SIZE	(RVTRACE_ENCODER_PRIV_MAX * sizeof(u64))
> +
> +#endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
