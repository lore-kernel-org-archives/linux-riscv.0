Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551EBC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 12:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2508C20823
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 12:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bKGEwdAe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2508C20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lBrSU4A4zlJCWvwhEZzR78bLWDDbfhuwsbYw2VOsM4A=; b=bKGEwdAe4QLfTfeEYa70xcFga
	X/DdNR/3W12Y2fmzLur829W4A/xJzFOnQObjozoEbMi7LaHHFfmJiAs2A+SfSjfnZ3xNOH/PXXlXP
	ixpalAHn6yTaH55QUIAwO2p9G5NZV33tHFM6hwZMMpGEsxbnLbZJRJ33nMyi4OdTbAxs2jrFMCE1Y
	EDSJVSXxP4YKTLcb4GQaxueq34zuvXbP0vnU88sdcyUHrJOgKInoHdFPofuRNDA3AKHBTWzBp7hRu
	07FfUh5PHrzupPZzfNVXrjks/Bw6GSkbzsyFg5HsKH3wxGZPGZ9kxRelZUtIZzsGl/TzShz3WFzEF
	w6dIrTeRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grjAD-0005kX-Qq; Thu, 07 Feb 2019 12:52:21 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grjA6-0005XJ-Nd
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 12:52:19 +0000
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F09DF20000D;
 Thu,  7 Feb 2019 12:52:02 +0000 (UTC)
Subject: Re: [PATCH 2/3] riscv: Fix wrong comment about task size for riscv64
From: Alexandre Ghiti <alex@ghiti.fr>
To: Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@sifive.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <20181210062146.24951-3-aghiti@upmem.com>
 <20190115155836.GE13095@infradead.org>
 <868ec175-381d-9675-65a6-e1b77ad7ab36@ghiti.fr>
Message-ID: <534ede3a-94ce-2399-6986-c32d7d9f2d28@ghiti.fr>
Date: Thu, 7 Feb 2019 13:52:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <868ec175-381d-9675-65a6-e1b77ad7ab36@ghiti.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_045215_589189_53E9F249 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, palmer@sifive.com,
 ndesaulniers@google.com, mingo@kernel.org, atish.patra@wdc.com,
 akpm@linux-foundation.org, linux-riscv@lists.infradead.org,
 mike.kravetz@oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 01/15/2019 07:53 PM, Alex Ghiti wrote:
> On 1/15/19 3:58 PM, Christoph Hellwig wrote:
>> Looks fine to me, and should go in independent of the hugetlb support.
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> Thanks for your review,
>
> Alex

Hi Palmer,

I'm about to send the v2 for hugetlbfs support, do you want me to
merge this patch into it or do you prefer this patch to be separate ?

Thanks,

Alex

>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
