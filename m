Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03CBC10F15
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+1+emrlf3ZHo4ZuE7zmbxMoQvywEEWHGEvrV/P++AI=; b=vaydT+U/4sdvuk
	lOZhsE/gR+9b3HNBgbeBy0jedxt8dWM7UGYwWyqja3H/MIMCPoqiNDj6cf9l13M2MzIqWhCa8WGbu
	nv3oo0ezcNUj9R58eYdXtcE6IKoXKTFX7kJNGqbJIQa99Ek38tNcPk6pRDVMWcL8f7fuc/FRPAf4X
	VO1hlNtJHn6isD+Z2xtnvZQVcgcWXyIbpyZT0TG5UkdJ3gDOEd7PWBRsVDFuXWCek3VLtDamTDUJ+
	7EkCMb54DnoXjgmbA+TpGVVBSC3QqDvEu3hV2JTI3ZS6H0vmF4z6yMB49srGB5fPuP11xribKUbnC
	lNFHgzJOZzDfORR9vgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzee2-00000004k1U-2zuD;
	Wed, 24 Apr 2024 15:34:50 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzedy-00000004jyw-1Jk4
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 15:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713972886; x=1745508886;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=XHcrnAmOsOix8K/xKq2+ZtbSNEaC/vMNW+9wzdDr6Fg=;
  b=HkZuXtm6tdT37JcQxdnClG8nBIOnUwVPFKW3TNOkD9U4+WaZl69QbSEP
   6TFWnBRJ13bTLR9TLSRgMANVhLfRbTmxa97uz3g0yoqaDclP3pHvdAZhp
   NdyAoJ2wrbvhg7fGU8KVEStxkI4VZqujYCOZ4ERx9dIcU95+3YDfYM+Im
   QiAeRkPzl7vBxnxhaCshEBcDGdIUhIuFleWeBDNpVRfjECQKK5ArTXzOd
   GwXd1YoK+mcBFmz3cI7ZfF1XuBUUyMNyMEgBwo2Ub/rxbB+jFHLzSMO9C
   Krcoi5Wjq+fFcxSX0BBH8RN5JwSDFHgUR+SqmjZs5o7YLRZCuwfz/nPX1
   A==;
X-CSE-ConnectionGUID: BAJqYGwhQSq+52wzUlKLaA==
X-CSE-MsgGUID: IbGBbej/Q7eygW4C4HwHyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35011184"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="35011184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:34:35 -0700
X-CSE-ConnectionGUID: rM0GpW3TRuC8zyhzefLgaQ==
X-CSE-MsgGUID: 6mtRVtWERXaa/MAJLWhc0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29556579"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:34:36 -0700
Received: from [10.212.107.188] (kliang2-mobl1.ccr.corp.intel.com [10.212.107.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2E4F6206D89D;
	Wed, 24 Apr 2024 08:34:33 -0700 (PDT)
Message-ID: <54a2ecfc-5a31-4e11-9e97-5a96baf18a0d@linux.intel.com>
Date: Wed, 24 Apr 2024 11:34:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] Consistently prefer sysfs/json events
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 Beeman Strong <beeman@rivosinc.com>
References: <20240416061533.921723-1-irogers@google.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_083446_456006_24B72CE5 
X-CRM114-Status: GOOD (  12.47  )
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



On 2024-04-16 2:15 a.m., Ian Rogers wrote:
> As discussed in:
> https://lore.kernel.org/lkml/20240217005738.3744121-1-atishp@rivosinc.com/
> preferring sysfs/json events consistently (with or without a given
> PMU) will enable RISC-V's hope to customize legacy events in the perf
> tool.
> 
> Some minor clean-up is performed on the way.
> 
> v2. Additional cleanup particularly adding better error messages. Fix
>     some line length issues on the earlier patches.
> 
> Ian Rogers (16):
>   perf parse-events: Factor out '<event_or_pmu>/.../' parsing
>   perf parse-events: Directly pass PMU to parse_events_add_pmu
>   perf parse-events: Avoid copying an empty list
>   perf pmu: Refactor perf_pmu__match
>   perf tests parse-events: Use branches rather than cache-references
>   perf parse-events: Legacy cache names on all PMUs and lower priority
>   perf parse-events: Handle PE_TERM_HW in name_or_raw
>   perf parse-events: Constify parse_events_add_numeric
>   perf parse-events: Prefer sysfs/json hardware events over legacy
>   perf parse-events: Inline parse_events_update_lists
>   perf parse-events: Improve error message for bad numbers
>   perf parse-events: Inline parse_events_evlist_error
>   perf parse-events: Improvements to modifier parsing
>   perf parse-event: Constify event_symbol arrays
>   perf parse-events: Minor grouping tidy up
>   perf parse-events: Tidy the setting of the default event name
> 
>  tools/perf/tests/parse-events.c |   6 +-
>  tools/perf/util/parse-events.c  | 482 ++++++++++++++++----------------
>  tools/perf/util/parse-events.h  |  49 ++--
>  tools/perf/util/parse-events.l  | 196 +++++++++----
>  tools/perf/util/parse-events.y  | 261 +++++++----------
>  tools/perf/util/pmu.c           |  27 +-
>  tools/perf/util/pmu.h           |   2 +-
>  7 files changed, 540 insertions(+), 483 deletions(-)
> 


The series looks good to me.

Reviewed-by: Kan Liang <kan.liang@linux.intel.com>

Thanks,
Kan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
