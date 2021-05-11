Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EBBC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 13:29:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D25613CD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 13:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D25613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g+5uWJkvmciAFST8qC7tRuoT9PaZ6vs5PAuMLvjqzjY=; b=QWWz/jv5pVrYtsMiaMLazBm7R
	SqQIDQNtqmeO2ZlEiV/y7R60qB6fL/dzIA+jc6we96mSet+qaEWjHpJsncVnu3vfEsxN7b9yL9Ute
	xAzFt+6IwPEazYFfjj+6jNtdsu0WCp9djIiLGEjjlyxjPhV5qqph5oWCszeKvmX2mAxQ9v2Unpgr6
	0Vhm3uXnLBzxC/g3ixPDiE1MzX34r1qQJt+Djfy68f5wTVPaiv9PP/wxtUNNI7t07Pi4wjyXuRNOx
	8Mq0iGxasl37LKqCFxMHvP/bMCooEseNDh6Wmk2cJsjtFhqWGQ2A4EswrsqLzJwJv4UK3JlwkRsk0
	2JOml3b4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSRL-0007Yw-HY; Tue, 11 May 2021 13:28:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgRcQ-00HQ5X-VE; Tue, 11 May 2021 12:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=NYXJBN3WobENOWfGDygqbobAQEKEQ51Tw1yxTFf871M=; b=QKfXPj3viNypiOMNNxUZJf9BTF
 gN8yQWmk8utMwsUEmj9RFLuZFS2E0ZO21ohoa4+A1cftcFEqiX5Nc7osED1ojLUafOLuBZUz8bOTY
 mjVSLsRB7vvlBAiyIS0UbZ2LQfuZHQXYTcHWsAhCqgwp4b0GtGyrcmqkJydzksiJ6796y3i7GRP/C
 WGm/I1gbm3ikx34WrAIq3JvYa9LpQlIgmSEYDD5QlU5kvitA5HIBPl7eyFUV/XmiRTpmj+o1Av3tG
 Iu8r7b8TPh8AhJmWJWe458l6umwLa4X5NU/GRS8FkI6tpqREzd+YCLdpTX22qEay6fONG8Ek5tS24
 tqPP3/wg==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgRcN-009ZhT-QY; Tue, 11 May 2021 12:36:09 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Ffclc1cMrzCr9G;
 Tue, 11 May 2021 20:33:16 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 20:35:48 +0800
Subject: Re: [PATCH stable v5.10 0/7] arm64: Default to 32-bit wide ZONE_DMA
To: Greg KH <gregkh@linuxfoundation.org>, Jing Xiangfeng
 <jingxiangfeng@huawei.com>
CC: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <rppt@kernel.org>, <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>,
 <sudeep.holla@arm.com>, <rjw@rjwysocki.net>, <lenb@kernel.org>,
 <song.bao.hua@hisilicon.com>, <ardb@kernel.org>, <anshuman.khandual@arm.com>, 
 <bhelgaas@google.com>, <guro@fb.com>, <robh+dt@kernel.org>,
 <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <frowand.list@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
 <YEDkmj6cchMPAq2h@kroah.com>
 <9bc396116372de5b538d71d8f9ae9c3259f1002e.camel@suse.de>
 <YEDr/lYZHew88/Ip@kroah.com>
 <827b317d7f5da6e048806922098291faacdb19f9.camel@suse.de>
 <YETwL6QGWFyJTAzk@kroah.com> <604597E3.5000605@huawei.com>
 <YEX1OcbVNSqwwusF@kroah.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <31cd8432-2466-555d-7617-ae48cbcd4244@huawei.com>
Date: Tue, 11 May 2021 20:35:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <YEX1OcbVNSqwwusF@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_053608_049476_4BA7F124 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2021/3/8 17:58, Greg KH wrote:
> On Mon, Mar 08, 2021 at 11:20:03AM +0800, Jing Xiangfeng wrote:
>>
>>
>> On 2021/3/7 23:24, Greg KH wrote:
>>> On Thu, Mar 04, 2021 at 04:09:28PM +0100, Nicolas Saenz Julienne wrote:
>>>> On Thu, 2021-03-04 at 15:17 +0100, Greg KH wrote:
>>>>> On Thu, Mar 04, 2021 at 03:05:32PM +0100, Nicolas Saenz Julienne wrote:
>>>>>> Hi Greg.
>>>>>>
>>>>>> On Thu, 2021-03-04 at 14:46 +0100, Greg KH wrote:
>>>>>>> On Wed, Mar 03, 2021 at 03:33:12PM +0800, Jing Xiangfeng wrote:
>>>>>>>> Using two distinct DMA zones turned out to be problematic. Here's an
>>>>>>>> attempt go back to a saner default.
>>>>>>> What problem does this solve?  How does this fit into the stable kernel
>>>>>>> rules?
>>>>>> We changed the way we setup memory zones in arm64 in order to cater for
>>>>>> Raspberry Pi 4's weird DMA constraints: ZONE_DMA spans the lower 1GB of memory
>>>>>> and ZONE_DMA32 the rest of the 32bit address space. Since you can't allocate
>>>>>> memory that crosses zone boundaries, this broke crashkernel allocations on big
>>>>>> machines. This series fixes all this by parsing the HW description and checking
>>>>>> for DMA constrained buses. When not found, the unnecessary zone creation is
>>>>>> skipped.
>>>>> What kernel/commit caused this "breakage"?
>>>> 1a8e1cef7603 arm64: use both ZONE_DMA and ZONE_DMA32
>>> Thanks for the info, all now queued up.
>> There is a fix in 5.11. Please consider applying the following commit to
>> 5.10.y:
>>
>> aed5041ef9a3 of: unittest: Fix build on architectures without
>> CONFIG_OF_ADDRES
> 
> Thanks, now queued up.

Hi Grep, another commit d78050ee3544 "arm64: Remove 
arm64_dma32_phys_limit and its uses" should be involved, thanks.

"Prior to this patch, disabling CONFIG_ZONE_DMA32 leads to CMA
allocation from the whole RAM as arm64_dma32_phys_limit becomes
PHYS_MASK+1." from Catalin, see more from the link
https://www.spinics.net/lists/arm-kernel/msg867356.html
> 
> greg k-h
> .
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
