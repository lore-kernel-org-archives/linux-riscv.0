Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E659C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 18:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB9B20656
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 18:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WM7j9+ae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EB9B20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SdDZgC8qyXjvUsIyvV4qio2SkJJ7PDQYrsZap/I94M0=; b=WM7j9+aeZg22TjgbaTd913JNK
	ZhLcSZqrhedwdRx+C/7RQYoYzLpOyRgFy4UBjdq5VExLQaSykV7NNt/NocL19leXye1hIAMsTQwDE
	2QJD6CELZ2aRWFlVcqUO/9v3CmpD0HCcDp344F61WL537BLAujlAoIp0A0eR2DhGfUdJ19BsaYMM5
	LjslY9iVKVjWsSqRJ/yhvIX8QLiSVs4MPn2sO1GfbbvxhV3VBOJWB+sr1lV/vbmvMe+WzCoF1V3fY
	F0RT8XkyWCJdEmg9LcLBP137dmqn14cMERkfSEloi1H9ZRsBET2pX+nPaspHYHGgX2ZGONNsFiuAm
	iy6pH3SaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjTrH-0001jr-W4; Tue, 15 Jan 2019 18:54:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjTrE-0001ix-MS
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 18:54:42 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0BF6720003;
 Tue, 15 Jan 2019 18:54:27 +0000 (UTC)
Subject: Re: [PATCH 3/3] riscv: Adjust mmap base address at a third of task
 size
To: Christoph Hellwig <hch@infradead.org>, Alexandre Ghiti <aghiti@upmem.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <20181210062146.24951-4-aghiti@upmem.com>
 <20190115160206.GF13095@infradead.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <c45285f7-9b05-9f04-a5a0-5d5dc075bb1b@ghiti.fr>
Date: Tue, 15 Jan 2019 18:54:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115160206.GF13095@infradead.org>
Content-Language: en-PH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_105440_887164_9DA13D64 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: aou@eecs.berkeley.edu, akpm@linux-foundation.org, catalin.marinas@arm.com,
 palmer@sifive.com, ndesaulniers@google.com, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org, mike.kravetz@oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/15/19 4:02 PM, Christoph Hellwig wrote:
> On Mon, Dec 10, 2018 at 06:21:46AM +0000, Alexandre Ghiti wrote:
>> This ratio is the most used among all other architectures and make
>> icache_hygiene libhugetlbfs test pass: this test mmap lots of
>> hugepages whose addresses, without this patch, reach the end of
>> the process user address space.
> This does indeed look common, so this looks sensible to me and might
> be worth picking up ASAP even without the hugetlb support:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> I wonder if we should provide this value as a defualt
> TASK_UNMAPPED_BASE if the architecture doesn't provide one.

Thanks for your review.
I think you're right regarding having a default version of 
TASK_UNMAPPED_BASE,
I will propose something.

Alex


> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
