Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA26C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 03:21:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0867D64F29
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 03:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0867D64F29
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lmEdbRoF2tIYxfxVzkuJV1cNGvGyXq/fqZ9HR1YwPGo=; b=FJOglQ8eNTLbnsgP5Vz3g5keC
	E0ySFTlqMl+w/YVd7LI2leRz+EWwXTDoxwMhAuSnVUXr0gDZrKueuo5u+fMrZMpBfgXl5Of9P8mCs
	+xLm+RCrq6/j4sY0KB06aeS0qloESpW36QrArrxShSh8wnn71bP31ZBRXFnrDAzlPDcCG/5xbSRl2
	LXv78kRLJ7ofH1Mifrc3DbQVw2CZRX5tKFCPcMHgASkv/2znCe9c6W8z159bU8x4RUnpIFHgTOX1D
	1kx1RJ+mDEGSoDq9cVeiIQEB0OTkhkzO+KV6m7WeT/EogR2rSgKn/uljh702Syc14dWkOnxn6Efje
	sgbcsD0vw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6Ru-00EnAu-BA; Mon, 08 Mar 2021 03:20:50 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6RX-00En3E-Sh; Mon, 08 Mar 2021 03:20:31 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dv3T15rNxz7kKK;
 Mon,  8 Mar 2021 11:18:29 +0800 (CST)
Received: from [10.174.178.215] (10.174.178.215) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 8 Mar 2021
 11:20:04 +0800
Subject: Re: [PATCH stable v5.10 0/7] arm64: Default to 32-bit wide ZONE_DMA
To: Greg KH <gregkh@linuxfoundation.org>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
 <YEDkmj6cchMPAq2h@kroah.com>
 <9bc396116372de5b538d71d8f9ae9c3259f1002e.camel@suse.de>
 <YEDr/lYZHew88/Ip@kroah.com>
 <827b317d7f5da6e048806922098291faacdb19f9.camel@suse.de>
 <YETwL6QGWFyJTAzk@kroah.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>, 
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <rppt@kernel.org>, <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>,
 <sudeep.holla@arm.com>, <rjw@rjwysocki.net>, <lenb@kernel.org>,
 <song.bao.hua@hisilicon.com>, <ardb@kernel.org>, <anshuman.khandual@arm.com>, 
 <bhelgaas@google.com>, <guro@fb.com>, <robh+dt@kernel.org>,
 <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <frowand.list@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>, <wangkefeng.wang@huawei.com>
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Message-ID: <604597E3.5000605@huawei.com>
Date: Mon, 8 Mar 2021 11:20:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <YETwL6QGWFyJTAzk@kroah.com>
X-Originating-IP: [10.174.178.215]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_032029_482788_EB6489E4 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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



On 2021/3/7 23:24, Greg KH wrote:
> On Thu, Mar 04, 2021 at 04:09:28PM +0100, Nicolas Saenz Julienne wrote:
>> On Thu, 2021-03-04 at 15:17 +0100, Greg KH wrote:
>>> On Thu, Mar 04, 2021 at 03:05:32PM +0100, Nicolas Saenz Julienne wrote:
>>>> Hi Greg.
>>>>
>>>> On Thu, 2021-03-04 at 14:46 +0100, Greg KH wrote:
>>>>> On Wed, Mar 03, 2021 at 03:33:12PM +0800, Jing Xiangfeng wrote:
>>>>>> Using two distinct DMA zones turned out to be problematic. Here's an
>>>>>> attempt go back to a saner default.
>>>>> What problem does this solve?  How does this fit into the stable kernel
>>>>> rules?
>>>> We changed the way we setup memory zones in arm64 in order to cater for
>>>> Raspberry Pi 4's weird DMA constraints: ZONE_DMA spans the lower 1GB of memory
>>>> and ZONE_DMA32 the rest of the 32bit address space. Since you can't allocate
>>>> memory that crosses zone boundaries, this broke crashkernel allocations on big
>>>> machines. This series fixes all this by parsing the HW description and checking
>>>> for DMA constrained buses. When not found, the unnecessary zone creation is
>>>> skipped.
>>> What kernel/commit caused this "breakage"?
>> 1a8e1cef7603 arm64: use both ZONE_DMA and ZONE_DMA32
> Thanks for the info, all now queued up.
There is a fix in 5.11. Please consider applying the following commit to 
5.10.y:

aed5041ef9a3 of: unittest: Fix build on architectures without 
CONFIG_OF_ADDRES

Thanks

>
> greg k-h
> .
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
