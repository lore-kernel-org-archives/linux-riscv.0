Return-Path: <SRS0=F3Ra=MX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E7EC677FF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Oct 2018 17:31:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 660E02075B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Oct 2018 17:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Is/s/HJr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 660E02075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZO449SwqGiubShFzw1KQ0laseBldhKwDeYhhkus3Eg=; b=Is/s/HJrztUyF3
	vCBY14OA82L6DluE9K9vvbXiI4RsxWPxCGgeLfwX6NJZ6Ma6xdOV7eXTL3gQEU8jTOPD2NVrjnf2R
	vHgn94/ewCNFdVJnOOXkIUNt4Uaq0DO6atxWUp66xQZ2n/pum0mYo1Z2/q2ITaSQWGvZqvSM5FDac
	IJkjaffVWDsiBo9NpgXlniLK4zrfoQemoxY1I/zIWGCPn/QNWzw5dHrX68b1cW03zLVPNjec+zjzQ
	D8eezdjoJqfmqJzoWpMKW3+S2n7NF50A+ja13NPYdW86QoRsicqQfitIenzqEN5PDIw1yGXd9tPfw
	rH30I8YBnpX1uBms2Zlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAena-0000Mn-HS; Thu, 11 Oct 2018 17:30:58 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAen4-00006x-Ox; Thu, 11 Oct 2018 17:30:28 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1gAemt-0002Cu-3o; Thu, 11 Oct 2018 11:30:16 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: Christoph Hellwig <hch@lst.de>
References: <20181005161642.2462-1-logang@deltatee.com>
 <20181005161642.2462-6-logang@deltatee.com> <20181011133730.GB7276@lst.de>
 <8cea5ffa-5fbf-8ea2-b673-20e2d09a910d@deltatee.com>
Message-ID: <8ebf1a13-ec4e-c546-641c-f8dcb1f6c44d@deltatee.com>
Date: Thu, 11 Oct 2018 11:30:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <8cea5ffa-5fbf-8ea2-b673-20e2d09a910d@deltatee.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, michaeljclark@mac.com,
 linux-riscv@lists.infradead.org, olof@lixom.net, linux-mm@kvack.org,
 zong@andestech.com, sbates@raithlin.com, linux-kernel@vger.kernel.org,
 palmer@sifive.com, linux-sh@vger.kernel.org, andrew@sifive.com,
 aou@eecs.berkeley.edu, robh@kernel.org, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 5/5] RISC-V: Implement sparsemem
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181011_103026_864566_0745C42F 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Waterman <andrew@sifive.com>, linux-sh@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, Zong Li <zong@andestech.com>,
 linux-mm@kvack.org, Olof Johansson <olof@lixom.net>,
 linux-riscv@lists.infradead.org, Michael Clark <michaeljclark@mac.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181011173007.pwM6OFPnFgHdmeXASSGa1tx7d5pHi_MHeIvUpja_cQk@z>



On 2018-10-11 10:24 a.m., Logan Gunthorpe wrote:
> On 2018-10-11 7:37 a.m., Christoph Hellwig wrote:
>>> +/*
>>> + * Log2 of the upper bound of the size of a struct page. Used for sizing
>>> + * the vmemmap region only, does not affect actual memory footprint.
>>> + * We don't use sizeof(struct page) directly since taking its size here
>>> + * requires its definition to be available at this point in the inclusion
>>> + * chain, and it may not be a power of 2 in the first place.
>>> + */
>>> +#define STRUCT_PAGE_MAX_SHIFT	6
>>
>> I know this is copied from arm64, but wouldn't this be a good time
>> to move this next to the struct page defintion?
>>
>> Also this:
>>
>> arch/arm64/mm/init.c:   BUILD_BUG_ON(sizeof(struct page) > (1 << STRUCT_PAGE_MAX_SHIFT));
>>
>> should move to comment code (or would have to be duplicated for riscv)
> 
> Makes sense. Where is a good place for the BUILD_BUG_ON in common code?

Never mind. Seems like it's pretty trivial to do this:

#define STRUCT_PAGE_MAX_SHIFT \
    ilog2(roundup_pow_of_two(sizeof(struct page)))

So the BUILD_BUG_ON becomes unnecessary.

The comment saying it can't be done is really misleading as it wasn't
actually difficult.

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
