Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8E8FA3741
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHGilYTPien4GoTyEZjWD0MYjYJ2VsikBJ/UDMiPB1I=; b=W5CNxDbYCk+guf
	JgFId3QzQGP8GaxzTGtnRgwIJeJwVfkLjKPs1g+jf2gZF07KhI42UotNM0qm/cVJLL+cM9wBGPVg1
	9sOx/AwB4oD0vI6h9lgwOPBi/qbL8d19l3KUBzJikcqJlHE/4B27hckmXB64VdFrq/6syIPqWRBFh
	ppIlsEAQtyQq/t/aLCJxjTD3je5xepk/F37n0h4bBnidespNjnz6cibA+vDKzkZP9U+ZBX4W4j8aX
	eiHdgJNFDVioOsgTrmBDkB4le2R/LT32p9Q1W/0Fi5pRum8bkPCVEDSsPageCbOIhc+lX15UaFc0t
	ekwDDjAsH6sgYLEJiEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZen-00Dokj-At; Mon, 31 Oct 2022 18:37:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZea-00Doe3-Nu
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 18:36:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id a14so17205471wru.5
        for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 11:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNqF1x5hFExPPQ1p8H8ZfUJkMN/LytiJFdG0FgSo0Yc=;
        b=Mki3cqNyLb6i/7bDr8xmcRoAI7MKB8Ubep7MvVdCAwvVAv/rvYzaNntbYk7evNSPOx
         iZSZj+1kqC7UTT9hY3p9QxXxVMZ7rRgmk+9DY9r7FhExeFFt1VDbTR9aAf2X+JrZ0tNY
         Tr/US88lDzmERESqdII2j74Xqtc13Nxr3puP6+gFIxszTZcUEQgT950jsRCvi08bhiKR
         jD8ZqkKvxW/CqsLaBVsSxX0va4onlR2A9GDsiypQf+pm99b/Y+UG3WiItOZJ+Li8JVOO
         +Y1i4xOLivYeF+DP4zPejP0GtpVAQoKKHaj+oeUXTWFGo9wGo7aYYFoFnonbrsyfX2Yj
         K6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNqF1x5hFExPPQ1p8H8ZfUJkMN/LytiJFdG0FgSo0Yc=;
        b=hnlH2w8SDjNf76LKt1E+DXdZMOcjBIvVYA+mtS/5k5GfR6v9yWVphl2KIm4e91g2N2
         wvzS70vHQ1fSxYccNZA066pPz2JCFZYynk73vb8EKj/ezK4S/0Ht6EUjXib+0AP4ZmCq
         XX5nPJeUmWFdPdUXMdqsiXzME1G0Rg1vvJ+4hp27lyHTLYUpFSRVyMVhM3Ns1oFhErRo
         PJfq6fuFtF/R+jLkrVg/2QTvdw/a0OUZfR7zt/JOniaKrL3k71D9izQrqw2w8FfmZC5P
         Cqwq12y+0rb1bRrPT5LC4cvfmSFGzA0sdhLz9hioUsySpduBJYTsiPNR8OVdntMJN9Rk
         IOhA==
X-Gm-Message-State: ACrzQf0C+QfFoD06QJ+djtr4LAEQmY++JANz4qBDFrgLwsPIqScVbfkT
	ypD64wzeO9+kxT0oqpufeNpQSA==
X-Google-Smtp-Source: AMsMyM6L4c0mU3rV7kcQN/uxBci0PgFY6LkbseXn4PqZrB/kcujXoiDFpfGo/UsDapmtxjnBCDkTjg==
X-Received: by 2002:a5d:584e:0:b0:236:6f0f:9d8 with SMTP id i14-20020a5d584e000000b002366f0f09d8mr9048660wrf.701.1667241412938;
        Mon, 31 Oct 2022 11:36:52 -0700 (PDT)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id b20-20020a05600c151400b003b3307fb98fsm7781722wmg.24.2022.10.31.11.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:36:52 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Punit Agrawal <punit.agrawal@bytedance.com>,  Yicong Yang
 <yangyicong@huawei.com>,  yangyicong@hisilicon.com,  corbet@lwn.net,
  peterz@infradead.org,  arnd@arndb.de,  linux-kernel@vger.kernel.org,
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
  linux-doc@vger.kernel.org,  Anshuman Khandual <anshuman.khandual@arm.com>
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
	<87bkpw5bzm.fsf@stealth>
	<CAGsJ_4xj2fKLOEHYC46P8ZhUPX8rw=yTNv3Zs=CPxLON6Xxvqw@mail.gmail.com>
Date: Mon, 31 Oct 2022 18:36:51 +0000
In-Reply-To: <CAGsJ_4xj2fKLOEHYC46P8ZhUPX8rw=yTNv3Zs=CPxLON6Xxvqw@mail.gmail.com>
	(Barry Song's message of "Sat, 29 Oct 2022 10:40:11 +1300")
Message-ID: <87zgdb4z7g.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_113656_960653_2FE8C4A2 
X-CRM114-Status: GOOD (  27.49  )
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

Barry Song <21cnbao@gmail.com> writes:

> On Sat, Oct 29, 2022 at 2:11 AM Punit Agrawal
> <punit.agrawal@bytedance.com> wrote:
>>
>> Yicong Yang <yangyicong@huawei.com> writes:
>>
>> > On 2022/10/27 22:19, Punit Agrawal wrote:
>> >>
>> >> [ Apologies for chiming in late in the conversation ]
>> >>
>> >> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> >>
>> >>> On 9/28/22 05:53, Barry Song wrote:
>> >>>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>> >>>>>
>> >>>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>> >>>>>> [...]
>> >>>>>>
>> >>>>>> On 9/21/22 14:13, Yicong Yang wrote:
>> >>>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>> >>>>>>> +{
>> >>>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>> >>>>>>> +    if (num_online_cpus() <= 4)
>> >>>>>>
>> >>>>>> It would be great to have some more inputs from others, whether 4 (which should
>> >>>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>> >>>>>> is optimal for an wide range of arm64 platforms.
>> >>>>>>
>> >>>>
>> >>>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
>> >>>> with 5,6,7
>> >>>> cores.
>> >>>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
>> >>>> this patch.
>> >>>>
>> >>>> so it seems safe to have
>> >>>> if (num_online_cpus()  < 8)
>> >>>>
>> >>>>>
>> >>>>> Do you prefer this macro to be static or make it configurable through kconfig then
>> >>>>> different platforms can make choice based on their own situations? It maybe hard to
>> >>>>> test on all the arm64 platforms.
>> >>>>
>> >>>> Maybe we can have this default enabled on machines with 8 and more cpus and
>> >>>> provide a tlbflush_batched = on or off to allow users enable or
>> >>>> disable it according
>> >>>> to their hardware and products. Similar example: rodata=on or off.
>> >>>
>> >>> No, sounds bit excessive. Kernel command line options should not be added
>> >>> for every possible run time switch options.
>> >>>
>> >>>>
>> >>>> Hi Anshuman, Will,  Catalin, Andrew,
>> >>>> what do you think about this approach?
>> >>>>
>> >>>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
>> >>>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
>> >>>>
>> >>>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
>> >>>> even by hardware broadcast.
>> >>>
>> >>> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
>> >>> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>> >>
>> >> When running the test program in the commit in a VM, I saw benefits from
>> >> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
>> >> ptep_clear_flush() went from ~1% in the unpatched version to not showing
>> >> up.
>> >>
>> >
>> > Maybe you're booting VM on a server with more than 32 cores and Barry tested
>> > on his 4 CPUs embedded platform. I guess a 4 CPU VM is not fully equivalent to
>> > a 4 CPU real machine as the tbli and dsb in the VM may influence the host
>> > as well.
>>
>> Yeah, I also wondered about this.
>>
>> I was able to test on a 6-core RK3399 based system - there the
>> ptep_clear_flush() was only 0.10% of the overall execution time. The
>> hardware seems to do a pretty good job of keeping the TLB flushing
>> overhead low.

I found a problem with my measurements (missing volatile). Correcting
that increased the overhead somewhat - more below.

> RK3399 has Dual-core ARM Cortex-A72 MPCore processor and
> Quad-core ARM Cortex-A53 MPCore processor. you are probably
> going to see different overhead of ptep_clear_flush() when you
> bind the micro-benchmark on different cores.

Indeed - binding the code on the A53 shows half the overhead from
ptep_clear_flush() compared to the A72.

On the A53 -

    $ perf report --stdio -i perf.vanilla.a53.data | grep ptep_clear_flush
         0.63%  pageout  [kernel.kallsyms]  [k] ptep_clear_flush

On the A72

    $ perf report --stdio -i perf.vanilla.a72.data | grep ptep_clear_flush
         1.34%  pageout  [kernel.kallsyms]      [k] ptep_clear_flush


[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
