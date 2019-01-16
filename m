Return-Path: <SRS0=8WcR=PY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C444C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 13:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1ED20651
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 13:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QXxLQoAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B1ED20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q3nM3YW7jXH4QsPMi27cN11JmxmnftXJaJDpjgvePfw=; b=QXxLQoAwcikQtsYBn/m5Ppu+U
	wWLmRLU5tJN9Qk9ihNVk8xB+O+KH7xU1T71d5SDHiG40k3toF5pqeIPyiS291OmHhAI4F7j/EzbN8
	YTw0CWJrQd0d19cUUuHQnR3QESwReiYHM1vkdLsfe6geJeByuV6AMvwvneXJtqOgz9VzElwwR+M8s
	Gbmpr9v16Y1wo7/z8HHVqLH5kudpRDH5j4dS25gCMdf4uqkNr073eA+OzvaodrsTPBATWPnF3AiYP
	hlQOwVK9KE0E+Q4Ij4+xdStGanKf5yhIIDVzZFjsn/ArnL8ih2haFwYlu9gMwD1Sl3fiopQXSHGbI
	BDQz4mZ9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjl7A-0008JS-Rl; Wed, 16 Jan 2019 13:20:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjl77-0007y7-D1
 for linux-riscv@lists.infradead.org; Wed, 16 Jan 2019 13:20:15 +0000
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C80F220019;
 Wed, 16 Jan 2019 13:20:01 +0000 (UTC)
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
To: Christoph Hellwig <hch@infradead.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
 <20190115160429.GA29683@infradead.org>
 <5454277c-410d-f24e-882e-02442af8a719@oracle.com>
 <20190115205248.GA21340@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <5857443c-c76f-151b-c528-5855e6c75722@ghiti.fr>
Date: Wed, 16 Jan 2019 14:18:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190115205248.GA21340@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_052013_590965_185F90A6 
X-CRM114-Status: GOOD (  15.34  )
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
 palmer@sifive.com, ndesaulniers@google.com, Alexandre Ghiti <aghiti@upmem.com>,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org, mingo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 01/15/2019 09:52 PM, Christoph Hellwig wrote:
> On Tue, Jan 15, 2019 at 11:25:07AM -0800, Mike Kravetz wrote:
>> I would actually prefer that this be a separate patch.  Why?
>> - The functionality is arch independent and not specific to riscv.
>> - This functionality was intended in commit 944d9fec8d7a ("hugetlb:
>>    add support for gigantic page allocation at runtime").  However,
>>    there was no need to tie the functionality to CMA or (MEMORY_ISOLATION
>>    && COMPACTION).
>>
>> I don't care enough to insist the patch be separate.  Just seems like
>> it should be separate to me.
> Oh, I agree it should be a separate patch.  But it would be nice to
> merge it together with the RISC-V hugetlb support, so that it can
> depend on the patch instead of the current somewhat odd Kconfig
> dependencies.

Ok, I will submit the patch regarding the possibility to free gigantic
pages whatever the configuration is separately and rebase the riscv
hugetlbfs support on top of it.

Thanks for your feedbacks,

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
