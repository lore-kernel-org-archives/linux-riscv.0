Return-Path: <SRS0=JdoE=7A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19855C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 15:41:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E165920657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 15:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1VSmTA6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E165920657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vOgHDwdjHw7cAs4Jei5lrgjJwrtqE5lNvx4B+8DE4s=; b=l1VSmTA6t86QHl
	sCIkh2+bKku3GvEAbxp+6d/wcPeOUAmnME+5IX2oXXh1YxttBThi7hDE8/p6UzkBfaB3lyeKKTAv3
	fLM6PWp7p+EmuXY7QDWnNb/sIIR5ij8Q5aprdt+ZKodPK9vO7h8r+zdPUZIMX9dh893M9dovyRpyt
	BvWx/bAnSqTqwMpm5J+PHb0OBDBPgD3DagreaN++mw/6cU1khA+9Mwf7zp8+2vkNtovz404Qjya4/
	z96cxKVlxDiRsjrg7jKulMixg99+Y0/IpMaHDn5kdMg6TLi6kKkQLpKcF57Ktg9d+UZrgUEHqmAEU
	w983hEFkstlIq4+VJSnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jahtf-0006gv-Fn; Mon, 18 May 2020 15:41:43 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jahtb-0006dk-Br
 for linux-riscv@lists.infradead.org; Mon, 18 May 2020 15:41:41 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6737BA8FA906232413BF;
 Mon, 18 May 2020 23:41:00 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.93) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 18 May 2020
 23:40:53 +0800
Subject: Re: [PATCH 09/10] timer-riscv: Fix undefined riscv_time_val
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, <tglx@linutronix.de>
References: <mhng-0c491e9e-41fd-4f76-a048-55c03d9359f0@palmerdabbelt-glaptop1>
 <66121f9a-48f3-d3a5-7c96-d71397e12aed@linaro.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <0bc3eb36-7b9d-7c86-130c-68b566e85c10@huawei.com>
Date: Mon, 18 May 2020 23:40:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <66121f9a-48f3-d3a5-7c96-d71397e12aed@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.166.215.93]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_084140_147293_421DD370 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
Cc: hulkci@huawei.com, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On 2020/5/18 22:09, Daniel Lezcano wrote:
> On 13/05/2020 23:14, Palmer Dabbelt wrote:
>> On Sun, 10 May 2020 19:20:00 PDT (-0700), wangkefeng.wang@huawei.com wrote:
>>> ERROR: modpost: "riscv_time_val" [crypto/tcrypt.ko] undefined!
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> ---
>>>   drivers/clocksource/timer-riscv.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/clocksource/timer-riscv.c
>>> b/drivers/clocksource/timer-riscv.c
>>> index c4f15c4068c0..071b8c144027 100644
>>> --- a/drivers/clocksource/timer-riscv.c
>>> +++ b/drivers/clocksource/timer-riscv.c
>>> @@ -19,6 +19,7 @@
>>>
>>>   u64 __iomem *riscv_time_cmp;
>>>   u64 __iomem *riscv_time_val;
>>> +EXPORT_SYMBOL(riscv_time_val);
>>>
>>>   static inline void mmio_set_timer(u64 val)
>>>   {
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> Adding the clocksource maintainers.  Let me know if you want this
>> through my
>> tree, I'm assuming you want it through your tree.
> How can we end up by an export symbol here ?!

Hi Danile,

Found this build error when CONFIG_RISCV_M_MODE=y and CONFIG_RISCV_SBI 
is not,

see patch "4f9bbcefa142 riscv: add support for MMIO access to the timer 
registers"

thanks.

>
>


