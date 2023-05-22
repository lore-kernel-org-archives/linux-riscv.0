Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B3C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoOgDOO0j0oaBBXZkeSQekxfgprs+bBBMYcmuL9NAig=; b=zRqkdbUoi366d9
	wE//4jETsboUzXFJNZ2J4UUpr0OqjWsAzM+3lXziOKPfu7X9H6G5LA0eXqaFaJ8LFAM/YIBMedkEB
	FX3brSghiDW9uW97N7Wf+sVKRFZZSckILAbHmWlARFJsqyrW9kSoBMAJzHn+qcFKLRoEIg4FCUWlW
	VB6enQ0EHoLRvRhGlS+A/1OkTO7OmghJeuEe7J9DFkvn/U5pp71cJgS4/2fYdPx/OTeUD7KAUONwG
	KVwFeSsuhY/1V78owOmu3OXnCKSpssF9QBeMzt8fppSiQiADOKVcWP2f3x2vmbjAcJ2f3oVSliXoD
	oWscKMWAJdhQpvdL+cdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q18Ue-007ECk-22;
	Mon, 22 May 2023 16:34:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q18Ua-007EBd-2O;
	Mon, 22 May 2023 16:34:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17A0811FB;
	Mon, 22 May 2023 09:35:22 -0700 (PDT)
Received: from [10.57.84.18] (unknown [10.57.84.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1BCF3F762;
	Mon, 22 May 2023 09:34:33 -0700 (PDT)
Message-ID: <e2c04000-8e2e-e5ab-daea-a84d9519569f@arm.com>
Date: Mon, 22 May 2023 17:34:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 2/5] perf parse-regs: Introduce functions
 arch__reg_{ip|sp}()
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
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
References: <20230520025537.1811986-1-leo.yan@linaro.org>
 <20230520025537.1811986-3-leo.yan@linaro.org>
 <839836e8-9600-9249-dcdb-e29519335141@arm.com>
 <20230522120729.GB1826292@leoy-yangtze.lan>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20230522120729.GB1826292@leoy-yangtze.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_093440_881363_42784DB7 
X-CRM114-Status: GOOD (  25.18  )
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



On 22/05/2023 13:07, Leo Yan wrote:
> On Mon, May 22, 2023 at 09:57:25AM +0100, James Clark wrote:
>>
>>
>> On 20/05/2023 03:55, Leo Yan wrote:
>>> Ideally, we want util/perf_regs.c to be general enough and doesn't bind
>>> with specific architecture.
>>>
>>> But since util/perf_regs.c uses the macros PERF_REG_IP and PERF_REG_SP
>>> which are defined by architecture, thus util/perf_regs.c is dependent on
>>> architecture header (see util/perf_regs.h includes "<perf_regs.h>", here
>>> perf_regs.h is architecture specific header).
>>>
>>> As a step to generalize util/perf_regs.c, this commit introduces weak
>>> functions arch__reg_ip() and arch__reg_sp() and every architecture can
>>> define their own functions; thus, util/perf_regs.c doesn't need to use
>>> PERF_REG_IP and PERF_REG_SP anymore.
>>>
>>> This is a preparation to get rid of architecture specific header from
>>> util/perf_regs.h.
>>>
>>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>>> ---
>> [...]
>>>  
>>> -#define DWARF_MINIMAL_REGS ((1ULL << PERF_REG_IP) | (1ULL << PERF_REG_SP))
>>> +#define DWARF_MINIMAL_REGS ((1ULL << arch__reg_ip()) | (1ULL << arch__reg_sp()))
>>>  
>>>  const char *perf_reg_name(int id, const char *arch);
>>>  int perf_reg_value(u64 *valp, struct regs_dump *regs, int id);
>>> diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
>>> index bdccfc511b7e..f308f2ea512b 100644
>>> --- a/tools/perf/util/unwind-libdw.c
>>> +++ b/tools/perf/util/unwind-libdw.c
>>> @@ -252,7 +252,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
>>>  	if (!ui->dwfl)
>>>  		goto out;
>>>  
>>> -	err = perf_reg_value(&ip, &data->user_regs, PERF_REG_IP);
>>> +	err = perf_reg_value(&ip, &data->user_regs, arch__reg_ip());
>>
>> Shouldn't it be more like this, because the weak symbols are a compile
>> time thing and it's supposed to support cross arch unwinding at runtime
>> (assuming something containing the arch from the file is passed down,
>> like we did with perf_reg_name()):
>>
>>   char *arch = perf_env__arch(evsel__env(evsel));
>>   err = perf_reg_value(&ip, &data->user_regs, arch__reg_ip(arch));
> 
> Thanks for pointing out, James.
> 
> Agreed that we need to return the IP and SP register based on the
> arch.  I will look into more details and spin for a new patch set for
> this.
> 

You might be able to skip the extra work for now though, seeing as your
change is no worse than it was before and it fixes the duplicate
declaration issue.

>> Now I'm wondering how cross unwinding ever worked because I see
>> libunwind also has something hard coded too:
>>
>>   #define LIBUNWIND__ARCH_REG_SP PERF_REG_SP
> 
> Yeah, I also used arch__reg_sp() to replace PERF_REG_SP; but as you
> suggestion, we should fix this with passing 'arch' parameter for
> getting SP register based on arch.
> 
> Another important thing is to find a good test for cross unwinding.
> Maybe I can use tools/perf/tests/shell/record.sh, function
> test_register_capture() for testing registers, if you have any other
> suggesion, please let me know.

The only way I can think is to have pre-recorded perf.data files in the
repo, but they'd also need the binary from the recording too. I think
this is probably not a very good idea because it's going to make the
repo huge if we keep changing them (which we will).

Some kind of third party perf test suite hosted somewhere might work but
I don't think this exists.

> 
> Thanks,
> Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
