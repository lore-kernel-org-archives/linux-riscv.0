Return-Path: <SRS0=XAcR=FW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BA0C4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 08:25:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 473D923A63
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 08:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 473D923A63
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GGyF0oQPoF1sr8h7yE1MxQq7D7EL7IjvZVhTqblljv0=; b=e6YTb4TczUrBJ8WJFnMi7Y/GD
	6dVGHblgWkckHfkW2Xu9I3iqHeZMqEaP+9spS2/xadhJuuKj47RqP/IRYc49xG+zfdK2/XT8sytJP
	FUJOX1qLp0zxbf3+AyxqDPHQIDLBVUOyUd1F4UM0pE9CA3H/ubhlOnDPmBD/9osvYYIO/t2lhp+Lr
	npx6el5n9Ec1YuoRCDUVvocKAb4QhD+CnTxdQFJ/UbNczmtISb2o64vfYT2Umicf2LW3hLy0O2OU9
	G4T+f0lx2RJt3n3HHe/alFRTvSZtjUv+5Fqgfx3A7G1k4vn2CH6M2RjkxE5z8hz50WxUyojB4U1Kg
	sJ2NMN6Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqB4S-0004jm-SZ; Fri, 18 Dec 2020 08:25:04 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqB4Q-0004ig-Mw
 for linux-riscv@lists.infradead.org; Fri, 18 Dec 2020 08:25:04 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cy22M3fZWzM5B9;
 Fri, 18 Dec 2020 16:23:55 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Fri, 18 Dec 2020 16:24:41 +0800
Subject: Re: [PATCH] riscv: cacheinfo: Fix using smp_processor_id() in
 preemptible
To: Atish Patra <atishp@atishpatra.org>
References: <20201116081238.44223-1-wangkefeng.wang@huawei.com>
 <CAOnJCUJz-L_S77rU+whk-86vkHkdrx4V9F-mYb72J0fT6yysmw@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <1b70da3a-29ef-9456-6419-eca78c82446b@huawei.com>
Date: Fri, 18 Dec 2020 16:24:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJz-L_S77rU+whk-86vkHkdrx4V9F-mYb72J0fT6yysmw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_032503_624982_2C3A9E82 
X-CRM114-Status: GOOD (  16.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2020/12/18 16:14, Atish Patra wrote:
> On Mon, Nov 16, 2020 at 12:08 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> Use raw_smp_processor_id instead of smp_processor_id() to fix warning,
>>
>> BUG: using smp_processor_id() in preemptible [00000000] code: init/1
>> caller is debug_smp_processor_id+0x1c/0x26
>> CPU: 0 PID: 1 Comm: init Not tainted 5.10.0-rc4 #211
>> Call Trace:
>>    walk_stackframe+0x0/0xaa
>>    show_stack+0x32/0x3e
>>    dump_stack+0x76/0x90
>>    check_preemption_disabled+0xaa/0xac
>>    debug_smp_processor_id+0x1c/0x26
>>    get_cache_size+0x18/0x68
>>    load_elf_binary+0x868/0xece
>>    bprm_execve+0x224/0x498
>>    kernel_execve+0xdc/0x142
>>    run_init_process+0x90/0x9e
>>    try_to_run_init_process+0x12/0x3c
>>    kernel_init+0xb4/0xf8
>>    ret_from_exception+0x0/0xc
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/riscv/kernel/cacheinfo.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
>> index de59dd457b41..9b5a8a347434 100644
>> --- a/arch/riscv/kernel/cacheinfo.c
>> +++ b/arch/riscv/kernel/cacheinfo.c
>> @@ -26,7 +26,7 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
>>
>>   static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
>>   {
>> -       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
>> +       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(raw_smp_processor_id());
>>          struct cacheinfo *this_leaf;
>>          int index;
>>
>> --
>> 2.26.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>
> As this issue is only reproducible with CONFIG_PREEMPT, the commit
> text can be updated to specify that. I have tested this patch with
> Qemu as well. FWIW,
>
> Tested-by: Atish Patra <atish.patra@wdc.com>

Thanks Atish, will send v2.


>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
