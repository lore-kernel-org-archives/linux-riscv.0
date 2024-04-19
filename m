Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67739C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hec24QraTy9j7F8+9iDJiTCD+cBQji6RkAhbrVMP/xg=; b=2QejAxJ5TrSzx8
	lcnwNDLqHynbtX9btQvAouKnnoCKcBuu5P0h7Nfl2Gpuvf8+KWxOQinviiV2ZRxjTo63wi460uPMC
	xY2qZ+IJB2HOJde5/cazR26KzvYaNhhAWVdwMBUEFE6UjZ4MTLmb/CWvw5+JMwl4g3ObGUQd0Wvbm
	K3+ip9vTXBhImiFVb04+lvxAyaq4coVbdQUfVqzUVmPUHh4Kesl72LuGUh0zpu+A8Q0iv9AfcByD6
	g5sNUf+V6wmcm2/gSpU3jChPkaD9x/4BN3iHJYxnsYXGtDCJYwk1M3AGX+39dFduja33UDhc6poy8
	NmdWRNYV8MF0wfk0QkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxoAq-00000005jmD-0nWj;
	Fri, 19 Apr 2024 13:21:04 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxoAn-00000005jlQ-1SeV
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 13:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713532861; x=1745068861;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9AoVEv+4aXGan7HuUBUV61T8VtGyQUi1t/MC18wWiQM=;
  b=fHTWH2yhu3nF8ZYhzXkAUEqeu+VZbXjBKEDYEyPan4YLwQwO8MnJjBjH
   W0BVYbrAbYOqQDUAoNayR9Y7/1pzVS7vaZC4YizhXEN9AK87DgwyWtAIl
   ulARU2dIAAg1VrGPgOvGp3hXxqavVtHQzGI6IYyIgnTO71UitxVLNXXCf
   goqvuEccgNBaUs9VsRb8EAUzz5d8r2QLFLk1zmTWoJ7xW3aberDd0reTK
   T+kV+DrU0fQ6MbsPGGAl4DweHWmcQBLDRxd2YzCmbE1OorNCiC8DJDDp8
   B37BnmYeq0n0MiFAzgzgmALJ8D/WtQkAr79WQY1JKzZsXzIXkX5PFQETw
   Q==;
X-CSE-ConnectionGUID: RgPo2vnTQraQkfUKgII2BQ==
X-CSE-MsgGUID: BeSsoDejQGW3NwOhH/PiSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20524390"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="20524390"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:20:58 -0700
X-CSE-ConnectionGUID: l1Ba9EzxSTqRx/qsd0wjTw==
X-CSE-MsgGUID: sRof6H5HReWc4pDZ+Zd1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="27793667"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:20:57 -0700
Received: from [10.212.13.6] (dojung-mobl.amr.corp.intel.com [10.212.13.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 9E8E8206DFDC;
	Fri, 19 Apr 2024 06:20:54 -0700 (PDT)
Message-ID: <7df3ff63-a421-42cc-bcaa-b0254ff6a0e8@linux.intel.com>
Date: Fri, 19 Apr 2024 09:20:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] perf parse-events: Improvements to modifier
 parsing
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 Beeman Strong <beeman@rivosinc.com>
References: <20240416061533.921723-1-irogers@google.com>
 <20240416061533.921723-14-irogers@google.com>
 <e8147f53-1930-44d8-abb8-fee460ec355f@linux.intel.com>
 <CAP-5=fVXv_gsoq5L08gaEJvU1E8xoihc3-L4taA+bPHyOJfgqw@mail.gmail.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <CAP-5=fVXv_gsoq5L08gaEJvU1E8xoihc3-L4taA+bPHyOJfgqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_062101_436551_D29BA501 
X-CRM114-Status: GOOD (  13.65  )
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



On 2024-04-19 2:22 a.m., Ian Rogers wrote:
>>> +             /* Simple modifiers copied to the evsel. */
>>> +             if (mod.precise) {
>>> +                     u8 precise = evsel->core.attr.precise_ip + mod.precise;
>>> +                     /*
>>> +                      * precise ip:
>>> +                      *
>>> +                      *  0 - SAMPLE_IP can have arbitrary skid
>>> +                      *  1 - SAMPLE_IP must have constant skid
>>> +                      *  2 - SAMPLE_IP requested to have 0 skid
>>> +                      *  3 - SAMPLE_IP must have 0 skid
>>> +                      *
>>> +                      *  See also PERF_RECORD_MISC_EXACT_IP
>>> +                      */
>>> +                     if (precise > 3) {
>> The pmu_max_precise() should return the max precise the current kernel
>> supports. It checks the /sys/devices/cpu/caps/max_precise.
>>
>> I think we should use that value rather than hard code it to 3.
> I'll add an extra patch to do that. I'm a bit concerned it may break
> event parsing on platforms not supporting max_precise of 3.

The kernel already rejects the precise_ip > max_precise (using the same
x86_pmu_max_precise()). It should be fine to apply the same logic in the
tool.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/events/core.c#n566

Will the extra patch be sent separately?

Thanks,
Kan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
