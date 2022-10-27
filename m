Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2736FECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1s/oYDkBt26ptC/4bYYIsXwkvnsg8jR0B1DQjI9Jae4=; b=myi6VILnMFPmHW
	BScEJYNmnQJfDTWbX4RB/TDk3LCzIlsEQFSJywuvyFYHlvQLHcqv5sbbMPKmz3X03H20lc0I/C2bJ
	Zz9ezz4POhK3/bNV0rDw8Y620pNJNORQOCHSlTelMjXhPy/3t04FycPjt/a3JJMni28SHokdi2Qny
	OL4KOlIkQwCQyWmCsUyAp534j0xLRHSAk37SdAbC+XlcItI0p49vJ6v7DFrUF+wKxcRyct4Qwi37W
	w8gUS0CVwj6iViVram2VMrhGahlu5fP9Hph2XR66KIpSf9vEBXBrF81zt4uxnSuLdb9Gx3fIudPwr
	cWDgvQEPTvT8J1KY21/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3j7-00DmkH-Tn; Thu, 27 Oct 2022 14:19:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3ix-00Dmgs-4j
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 14:19:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id w14so2413202wru.8
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/eINMlmbJBT0Nx7Q4sfLDyjRpzPNMcfZ0CREI4hqno=;
        b=mbukdALrSt0e0Xy4FkFyuHJzpwUdkyhoGFOxMyHUB7cxYmMBOVcqKs7RAsg3TvKCMI
         S6Zt6qpSUwkQjxNNynwidnp+zFyIsBNmXxZzJjNls7MYhrbClbxzYmIVgRYp06bSQdtL
         O7fH1uUWV7MEOXcVso26GgH9a/JML0ZANePeYFgvoRP0qL2d2Ahpn/AaBliDN7CLjbvY
         gJZTLiVy1C5KhCv9CDCCP3ri0epXt9PZTTgGTDX6YM3buYGEnVVu0TewyqNPkVoASFNV
         HoQLFEWGw10kDNxYOQhiSN2oCj4N7aJDsvRT/pTpO0Sl2koUjt+Id8P6r55SN+Gkye+h
         8EYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/eINMlmbJBT0Nx7Q4sfLDyjRpzPNMcfZ0CREI4hqno=;
        b=4lvhxVDEARiY0tPd1OTono6/9ACwZt8bW97iWnuc5T+Qvr7X5RSILXUyC2fp+5P2ot
         FYm3zX6sYeFuE+0sU0ERTBZKyG8fsPURC2vAcXNhxsGHpIVvztSaLcgyCJEqO3R3Knz4
         14TTz+zWbDWbxXaYQgbzSD8iWqE4aurajEjwv17Ib7IZmejwTzR97rIWE9wVLTmQxAq9
         QhLvaY9sw3qVR+l2jk7UVvtvGMK7/dtRMWgUtCh7rKS60DbMWgb8kYa2NqliOaqg0gld
         7bi83LK+01IuIuYQO2IbhGZQ9wpJQWimCKg7KZBGyi2bmNjFJHJIaHU3QoN8S0Mk1op7
         atnw==
X-Gm-Message-State: ACrzQf1Orm5RWsQ8QxzWiUBl3nB98KLCfe0EtWu6hVhQEpC5CGE6QVgH
	fVw/Plg8fsxabtZfbdqG2W2kjA==
X-Google-Smtp-Source: AMsMyM6DMVnaAfEbCGsBgr0BuHUuRcLePH4/Vs6YQPdqiIKHzKuxA0+67WIXfXH9Uz+IHOQBcqEyow==
X-Received: by 2002:a05:6000:79c:b0:236:6f2e:301e with SMTP id bu28-20020a056000079c00b002366f2e301emr14778667wrb.458.1666880345421;
        Thu, 27 Oct 2022 07:19:05 -0700 (PDT)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm1727545wmb.30.2022.10.27.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 07:19:04 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Barry Song <21cnbao@gmail.com>,  Yicong Yang <yangyicong@huawei.com>,
  yangyicong@hisilicon.com,  corbet@lwn.net,  peterz@infradead.org,
  arnd@arndb.de,  linux-kernel@vger.kernel.org,
  darren@os.amperecomputing.com,  huzhanyuan@oppo.com,  lipeifeng@oppo.com,
  zhangshiming@oppo.com,  guojian@oppo.com,  realmz6@gmail.com,
  linux-mips@vger.kernel.org,  openrisc@lists.librecores.org,
  linux-mm@kvack.org,  x86@kernel.org,
  linux-arm-kernel@lists.infradead.org,  linuxppc-dev@lists.ozlabs.org,
  akpm@linux-foundation.org,  linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org,  wangkefeng.wang@huawei.com,
  xhao@linux.alibaba.com,  prime.zeng@hisilicon.com,  Barry Song
 <v-songbaohua@oppo.com>,  Nadav Amit <namit@vmware.com>,  Mel Gorman
 <mgorman@suse.de>,  catalin.marinas@arm.com,  will@kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
References: <20220921084302.43631-1-yangyicong@huawei.com>
	<20220921084302.43631-3-yangyicong@huawei.com>
	<168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
	<8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
	<CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
	<ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com>
Date: Thu, 27 Oct 2022 15:19:02 +0100
In-Reply-To: <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com> (Anshuman
	Khandual's message of "Thu, 27 Oct 2022 16:11:59 +0530")
Message-ID: <87o7tx5oyx.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_071911_190254_07DE14AF 
X-CRM114-Status: GOOD (  22.87  )
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


[ Apologies for chiming in late in the conversation ]

Anshuman Khandual <anshuman.khandual@arm.com> writes:

> On 9/28/22 05:53, Barry Song wrote:
>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>>
>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>>>> [...]
>>>>
>>>> On 9/21/22 14:13, Yicong Yang wrote:
>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>>> +{
>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>>>>> +    if (num_online_cpus() <= 4)
>>>>
>>>> It would be great to have some more inputs from others, whether 4 (which should
>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>>>> is optimal for an wide range of arm64 platforms.
>>>>
>> 
>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
>> with 5,6,7
>> cores.
>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
>> this patch.
>> 
>> so it seems safe to have
>> if (num_online_cpus()  < 8)
>> 
>>>
>>> Do you prefer this macro to be static or make it configurable through kconfig then
>>> different platforms can make choice based on their own situations? It maybe hard to
>>> test on all the arm64 platforms.
>> 
>> Maybe we can have this default enabled on machines with 8 and more cpus and
>> provide a tlbflush_batched = on or off to allow users enable or
>> disable it according
>> to their hardware and products. Similar example: rodata=on or off.
>
> No, sounds bit excessive. Kernel command line options should not be added
> for every possible run time switch options.
>
>> 
>> Hi Anshuman, Will,  Catalin, Andrew,
>> what do you think about this approach?
>> 
>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
>> 
>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
>> even by hardware broadcast.
>
> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?

When running the test program in the commit in a VM, I saw benefits from
the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
ptep_clear_flush() went from ~1% in the unpatched version to not showing
up.

Yicong mentioned that he didn't see any benefit for <= 4 CPUs but is
there any overhead? I am wondering what are the downsides of enabling
the config by default.

Thanks,
Punit

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
