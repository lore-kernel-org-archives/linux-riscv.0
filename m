Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5157C2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 03:17:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52881206DF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 03:17:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jFXS53Q9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52881206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8RmhDfRupKD5+Aywnd168f6zFNAg6fGtpnCT+MEePu0=; b=jFXS53Q9NVdolcbzNfMOAdY1f
	pQ98Mkcr3pJ5rpo213TZYpVONtW2ulC0oJbEjEy9usKmciCwxDowf27Qv5t2lTGlQ6ZYnpJjAasvr
	EtDmRyK2iJRIQDc7SrlgQvgCNlru6VYKsqjNseLl0uup3uWIbmfLrMwd9ADtKRCZQdvrU3fZgds95
	sn8IUOBLHzI6p0xuFac9Ihs4NDFOmLIZLvud4cQOnZAhTSErNtxDTzr8lhmWg4KQC7Jgjw6Jk+7La
	oUCsnBW4SIWNG9NKQXs/WPNM/xbnz0VcubOK7oRlLHHl5R0O/cBbDIWdsq1XsFecEe3FTh5YbC8FQ
	d1NdUAqLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka9Ij-0000rN-41; Wed, 04 Nov 2020 03:17:33 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka9If-0000qc-Rb
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 03:17:31 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CQsK070vjzhfyd;
 Wed,  4 Nov 2020 11:17:24 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Wed, 4 Nov 2020 11:17:20 +0800
Subject: Re: [PATCH 3/3] riscv: Ignore all compressed Image formats
To: Atish Patra <atishp@atishpatra.org>
References: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
 <20201102040357.118400-3-wangkefeng.wang@huawei.com>
 <35efc7af-dd90-a1b5-b363-9dbb8d7ce4a8@huawei.com>
 <CAOnJCUKLqG-wZgGgUwaKM8OXaWjPikwVBQJ6DvNLMfLPNAeVGA@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <d0fcd1a4-ac2c-7f86-0847-28fd935e06bf@huawei.com>
Date: Wed, 4 Nov 2020 11:17:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUKLqG-wZgGgUwaKM8OXaWjPikwVBQJ6DvNLMfLPNAeVGA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_221730_172273_E3A09A0D 
X-CRM114-Status: GOOD (  13.46  )
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
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2020/11/3 23:56, Atish Patra wrote:
> On Sun, Nov 1, 2020 at 11:27 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>
>> On 2020/11/2 12:03, Kefeng Wang wrote:
>>> Do not track all compressed Image formats.
>> should add all loader.* too, eg loader.bin,  will resend after all
>> patches reviewed.
> But not loader.S & loader.lds.S

Yes, only add loader.bin, will send v2, thanks

>
>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> ---
>>>    arch/riscv/boot/.gitignore | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
>>> index 574c10f8ff68..2a31a61ca382 100644
>>> --- a/arch/riscv/boot/.gitignore
>>> +++ b/arch/riscv/boot/.gitignore
>>> @@ -1,5 +1,5 @@
>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>    Image
>>> -Image.gz
>>> +Image.*
>>>    loader
>>>    loader.lds
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
