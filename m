Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8D2C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXFpbCgmOVGyEfNSjaRZXqc+wFXlQ5TLQnjX3XuII6c=; b=mMkZoNzaqLI2l2
	eY+3OECAgpIhnQysancE1zCKwaRgVM9J7jnMtdfaj1hkgPNPBSGy976BtHd1sa4ldXG+2m20/1+dq
	yG//VCTBA5/f+xvD/ajLQo36tPrOD6OGqxTUxqpHe+4g0mLL1g/AZmzuCpP5su0/SXgT2QXaiUSA1
	2GTzGO0flyGQbDvdykm17AbNhjNwlXHzWxRLivGrUYdzZU17Acbhi/kRvKgzqurngziPTqTTn8YAF
	L5XlCLSDK+IsQwZNrgsLPkE8jsBtSBhIk9fntsE8EFFMW3AJ9EDBDBfVfy4JYEGkuEPmL11r+sRyM
	wfsIWTn0W9tFRQUE9JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooP9o-00HGZE-UM; Fri, 28 Oct 2022 13:12:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooP9M-00HGML-Hc
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 13:11:54 +0000
Received: by mail-wr1-x42f.google.com with SMTP id z14so6534555wrn.7
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 06:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Aj7lCoa9R32lr+KR5EAOPwdoRP9ej39sPKRFvXXmKo=;
        b=EFIo+tctRNuBHWwWw1xOq1kEixfm3foZR690FRJu3AM3x8PYD0ZDLFys0bq0GHDw0q
         D+MTVPyEG1mTG0ZgdOgJq8+gjfvXKbovWD8hGjcbI7wWrksCjPBNiTntRvERjSr3G2+k
         Lu7JNnRQmZ6+8v+2wFsOY4k1EMCtFfmzGGyaZDJW+zI6dotPwQ2SHNssHmq5yH6XrLvw
         xSqtVUxuIWlv47NuYTEMe31KwKyXtoj47d/WfUsTDmeHSsavPPN1aNy232z2FiDj7IE2
         kdVuMjIFXr8rqIXxZZe02eKvfiUGYKO5h8nAQjogNLBpf+5ZCJOnzUUb++YTPAQ3vG+E
         aVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Aj7lCoa9R32lr+KR5EAOPwdoRP9ej39sPKRFvXXmKo=;
        b=qf+CpPt9u3MfmhRhSVQXraC3LWeysQJGCFlF5l3Fnv3+H/3f6GpKUwHULsT4/EOoe6
         F9XXfV+063Wys0lQ5X7o3oxIuRs7KQ4D+YrxxjjmX0N8ZKoaRhbSIPb+7Ev+ZzTE5ycs
         2io5Grig/B1Vaqsrj5TUmolzOUzZs53GNBnvp1p1J437R48y1yomWVnI5qk4P87vulOj
         /7ZhesqkZzjsLYH2Uged1HFCQVE4qd7WhDGT3gR6+GpQ6uUs6gElyjXpUd8sj4xNki8Y
         sKDaFGefv/C4xfbapSV2wc/kW/4ruRkPqIJAy+D5YfC+LxKNt1I6WDgrBwewHiBvZhHG
         ZEJg==
X-Gm-Message-State: ACrzQf0aBVthOC5xE+A+f/P4UfWUOru1IuHYU6d+m+d11AY+zbarV3r7
	y//8NvUVSsZ2hreWRuZ8qsODKw==
X-Google-Smtp-Source: AMsMyM6YDLGx8tddVpugpJgNDAZlKMyecbRnjlokKyPGo/AAsO2SU74UqqxLLYtDEOG4bOxEAgjUZA==
X-Received: by 2002:adf:df83:0:b0:236:6d5d:ff8b with SMTP id z3-20020adfdf83000000b002366d5dff8bmr18336437wrl.315.1666962704559;
        Fri, 28 Oct 2022 06:11:44 -0700 (PDT)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003bfaba19a8fsm4641180wms.35.2022.10.28.06.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 06:11:43 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Punit Agrawal <punit.agrawal@bytedance.com>,  Barry Song
 <21cnbao@gmail.com>,  <yangyicong@hisilicon.com>,  <corbet@lwn.net>,
  <peterz@infradead.org>,  <arnd@arndb.de>,
  <linux-kernel@vger.kernel.org>,  <darren@os.amperecomputing.com>,
  <huzhanyuan@oppo.com>,  <lipeifeng@oppo.com>,  <zhangshiming@oppo.com>,
  <guojian@oppo.com>,  <realmz6@gmail.com>,  <linux-mips@vger.kernel.org>,
  <openrisc@lists.librecores.org>,  <linux-mm@kvack.org>,
  <x86@kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linuxppc-dev@lists.ozlabs.org>,  <akpm@linux-foundation.org>,
  <linux-riscv@lists.infradead.org>,  <linux-s390@vger.kernel.org>,
  <wangkefeng.wang@huawei.com>,  <xhao@linux.alibaba.com>,
  <prime.zeng@hisilicon.com>,  Barry Song <v-songbaohua@oppo.com>,  Nadav
 Amit <namit@vmware.com>,  Mel Gorman <mgorman@suse.de>,
  <catalin.marinas@arm.com>,  <will@kernel.org>,
  <linux-doc@vger.kernel.org>,  Anshuman Khandual
 <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
References: <20220921084302.43631-1-yangyicong@huawei.com>
	<20220921084302.43631-3-yangyicong@huawei.com>
	<168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
	<8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
	<CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
	<ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com>
	<87o7tx5oyx.fsf@stealth>
	<bc44cf85-aee9-03ca-9911-dbd904a43cc8@huawei.com>
Date: Fri, 28 Oct 2022 14:11:41 +0100
In-Reply-To: <bc44cf85-aee9-03ca-9911-dbd904a43cc8@huawei.com> (Yicong Yang's
	message of "Fri, 28 Oct 2022 09:20:08 +0800")
Message-ID: <87bkpw5bzm.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_061152_624211_33E048EA 
X-CRM114-Status: GOOD (  22.83  )
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

Yicong Yang <yangyicong@huawei.com> writes:

> On 2022/10/27 22:19, Punit Agrawal wrote:
>> 
>> [ Apologies for chiming in late in the conversation ]
>> 
>> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> 
>>> On 9/28/22 05:53, Barry Song wrote:
>>>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>>>>
>>>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>>>>>> [...]
>>>>>>
>>>>>> On 9/21/22 14:13, Yicong Yang wrote:
>>>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>>>>> +{
>>>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>>>>>>> +    if (num_online_cpus() <= 4)
>>>>>>
>>>>>> It would be great to have some more inputs from others, whether 4 (which should
>>>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>>>>>> is optimal for an wide range of arm64 platforms.
>>>>>>
>>>>
>>>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
>>>> with 5,6,7
>>>> cores.
>>>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
>>>> this patch.
>>>>
>>>> so it seems safe to have
>>>> if (num_online_cpus()  < 8)
>>>>
>>>>>
>>>>> Do you prefer this macro to be static or make it configurable through kconfig then
>>>>> different platforms can make choice based on their own situations? It maybe hard to
>>>>> test on all the arm64 platforms.
>>>>
>>>> Maybe we can have this default enabled on machines with 8 and more cpus and
>>>> provide a tlbflush_batched = on or off to allow users enable or
>>>> disable it according
>>>> to their hardware and products. Similar example: rodata=on or off.
>>>
>>> No, sounds bit excessive. Kernel command line options should not be added
>>> for every possible run time switch options.
>>>
>>>>
>>>> Hi Anshuman, Will,  Catalin, Andrew,
>>>> what do you think about this approach?
>>>>
>>>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
>>>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
>>>>
>>>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
>>>> even by hardware broadcast.
>>>
>>> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
>>> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>> 
>> When running the test program in the commit in a VM, I saw benefits from
>> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
>> ptep_clear_flush() went from ~1% in the unpatched version to not showing
>> up.
>> 
>
> Maybe you're booting VM on a server with more than 32 cores and Barry tested
> on his 4 CPUs embedded platform. I guess a 4 CPU VM is not fully equivalent to
> a 4 CPU real machine as the tbli and dsb in the VM may influence the host
> as well.

Yeah, I also wondered about this.

I was able to test on a 6-core RK3399 based system - there the
ptep_clear_flush() was only 0.10% of the overall execution time. The
hardware seems to do a pretty good job of keeping the TLB flushing
overhead low.

[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
