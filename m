Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A8BC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 07:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7519D206E3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 07:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="inGNIWOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7519D206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DZGCymNogM2CbCpT5FWjbI33ZwnJb3aU2gLq362Nnv0=; b=inGNIWOPkU6+WpOAXWWht/w18
	GJ75HEXEeXr4ScesQTCsgPXNdNeR3LG+ponUY8f6gpCND4EF+NLpO1FiEV5z5i2z68fxwKHIK+hCK
	GVmTCOXYSYUGpJm+EiWriuvq/hVvhGajsBJjDpPhcGIuoO0PG+JAVsUpGIQnmhKRfqNBcqoV4r5GO
	l47qAug+poYd6QBa9Q91Z8wRVmeTfDj9jQoNRz48bpqqt3OPK4y+oOzMFUoudjJkao/F5GaoStq5b
	XPhZjT03uQhFQ6lKeVVPciw+25LVJ/MpZfkacfpqkUaeemnlqfeetNHJgQRFCtydy7i/4CQ9bTql7
	jI6dY3QHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd73C-0005ad-61; Thu, 12 Nov 2020 07:29:46 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd739-0005Zq-Ie
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 07:29:44 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWtX24mlhzhkn2;
 Thu, 12 Nov 2020 15:29:22 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 15:29:27 +0800
Subject: Re: [PATCH] riscv: Fix W+X mapping warning
To: Atish Patra <atishp@atishpatra.org>
References: <20201112064855.99578-1-wangkefeng.wang@huawei.com>
 <CAOnJCU+y4-ghEBm45HMhHxf5oVb-6CR9wa6amp0OCgEzFfiEag@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <bbb12047-6d98-1c10-d5da-a987be5b2b2d@huawei.com>
Date: Thu, 12 Nov 2020 15:29:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCU+y4-ghEBm45HMhHxf5oVb-6CR9wa6amp0OCgEzFfiEag@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_022943_878609_1ED9A004 
X-CRM114-Status: UNSURE (   7.83  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2020/11/12 15:10, Atish Patra wrote:
> On Wed, Nov 11, 2020 at 10:44 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> When boot with DEBUG_WX triggers the WX warning,
>>    riscv/mm: Found insecure W+X mapping at address ffffffe000000000/0xffffffe000000000
>>    WARNING: CPU: 1 PID: 1 at arch/riscv/mm/ptdump.c:236 note_page+0x248/0x25a
>>    ...
>>    Checked W+X mappings: failed, 512 W+X pages found
>>
>> The kernel_page_tables shows first 2M(kernel image) is with W attribute,
>> Use _start instead of text_start in mark_rodata_ro().
>>
>> Before,
>> 0xffffffe000000000-0xffffffe000200000    0x0000000080200000         2M PMD     D A . . X W R V
>> 0xffffffe000200000-0xffffffe000a00000    0x0000000080400000         8M PMD     D A . . X . R V
>> 0xffffffe000a00000-0xffffffe001000000    0x0000000080c00000         6M PMD     D A . . . . R V
>> 0xffffffe001000000-0xffffffe17fe00000    0x0000000081200000      6126M PMD     D A . . . W R V
>>
>> After,
>> 0xffffffe000000000-0xffffffe000a00000    0x0000000080200000        10M PMD     D A . . X . R V
>> 0xffffffe000a00000-0xffffffe001000000    0x0000000080c00000         6M PMD     D A . . . . R V
>> 0xffffffe001000000-0xffffffe17fe00000    0x0000000081200000      6126M PMD     D A . . . W R V
>>
> This is already fixed by the following series.
> https://patchwork.kernel.org/project/linux-riscv/list/?series=377843

Got it.

>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
