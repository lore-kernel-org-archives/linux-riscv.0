Return-Path: <SRS0=VRtT=MG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB50ECE568
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Sep 2018 21:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A4EA20666
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Sep 2018 21:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m1ziwDrO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mmmzoqsf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="rwGEpJxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A4EA20666
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yHvVGL4nFSFQfzM9SeECq/w7Vikl9ai8rNhrVZ1rDU4=; b=m1ziwDrOLMKLgIdwqhY5XdfFM
	rFa0qexHw53BnV/o2gOiE8toQyd+baaz6E3ERp1JkuKvDxcZf0aCqIHftTHMc4BXLXRPPjEq0BeCh
	1HW6t2GzPG5mc5HKGKeVPtdJqJ1gh12bsUwVKv8rOOxg9DR0UKgpC6f3d359gDTCWe4rdjHENf9Lm
	k2CwAMdVLWGIRVg+buHw0v3It9CQeLF3/Q2nIzNC9rqcM4m3Vj/jUK1WK71C23ENcjqRX1ss6135o
	VDYKZvAPITIFZK+EW9sMVES59aqXsedl38o4DLIOWBIEkzNQxk4g5Z0aXmZmaR4DH/Fn9y7nKoCR4
	LIE1ZbZxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4Y7T-0000t3-Se; Mon, 24 Sep 2018 21:10:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4Y78-0000f9-6c
 for linux-riscv@bombadil.infradead.org; Mon, 24 Sep 2018 21:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Moh3jlnB4LAik7xhYmQfdXcJpooEfD0O8K5BFsg531E=; b=mmmzoqsfFhe8WOnIyQ/lZxKFUH
 u7Ul4AG/VsQMjm1lLQPdJuz2bJ/edI57/nuBUlYUalJCjWm4tuzxbSykfRCdIJro9/EwH3NWS0voU
 RDzFYHv+D90XJpWDEXTnlSMYWyakrTOd3q2v7E6SgYA2hg01CTvdFDVStsffgAXXXUhr/fGh9q4L2
 Sgr+2dtKAFFmJ1Z3CNVWa8qhmzCjAeYEnDGSB6GvQ25W8ChSCZcrY7OImQeHHEkIdC3dVY9lp7yd3
 4mlRdIbs1TvLYeHdMUdN/dbt4+fYhuqfhI8pZU8GnoUCriOiRa+HFq2Tn0fHJyA/T4bIqQuCBSRlW
 Kp5ssUGQ==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4Xt1-0004Wd-En
 for linux-riscv@lists.infradead.org; Mon, 24 Sep 2018 20:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1537822519; x=1569358519;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7HoNZHAIVceRRl8V9absbQdxVJL1GpmgDBfkNWWq6Fc=;
 b=rwGEpJxqQBi42fN+jm/CuWjwg9k8TzgD372StSVZqddwIVyfX6E+jZjd
 6nSzbhLG7SVDyeFtdveXGCJwP894Jvtgo95Ys4M0ZKjyIJ0iGnGzasUYo
 Agh9il8ClQgmINnvxhQdqX8cp643fiXp/zyJMC22MxOmu+zTxj70yvqeg
 BE72SJkie0DUFn8n0ocwvd/pz0HED4lwfSDdm2fPHznPhMi0w7ZGNjwYO
 KUbw0bYcr7b2VhxYnENgjnBuhDDJ2Dk/KBfCK60dafkDQn3SENg+0vPKX
 18KAe7YjKshlp4haWDbqbjSSyDF+pvDTZUct4qZ8suw7tB+FbRRKKfLEk Q==;
X-IronPort-AV: E=Sophos;i="5.54,299,1534780800"; d="scan'208";a="194692179"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 Sep 2018 04:55:04 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 24 Sep 2018 13:40:57 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.196.159.148])
 ([10.196.159.148])
 by uls-op-cesaip01.wdc.com with ESMTP; 24 Sep 2018 13:55:05 -0700
Subject: Re: [PATCH] RISCV: Fix end PFN for low memory
To: "palmer@sifive.com" <palmer@sifive.com>
References: <1536690618-9157-1-git-send-email-atish.patra@wdc.com>
 <20180917140816.GA28689@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <50f35396-9e2b-c177-6a96-9c450c7abdde@wdc.com>
Date: Mon, 24 Sep 2018 13:55:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180917140816.GA28689@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180924_215519_786893_01087B38 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "terpstra@sifive.com" <terpstra@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180924205504.6eXEBkj1P47lJrUgwsAmyKGANfIeTLEsPcF7WGNmZCA@z>

On 9/17/18 7:08 AM, Christoph Hellwig wrote:
> On Tue, Sep 11, 2018 at 11:30:18AM -0700, Atish Patra wrote:
>> Use memblock_end_of_DRAM which provides correct last low memory
>> PFN. Without that, DMA32 region becomes empty resulting in zero
>> pages being allocated for DMA32.
>>
>> This patch is based on earlier patch from palmer which never
>> merged into 4.19. I just edited the commit text to make more
>> sense.
> 
> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Palmer, can you queue this up for 4.19?
> 
Hi Palmer,
I did not see this one pulled into your rc6 PR.
Not sure if it was intentional or just lost in heap of emails.


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
