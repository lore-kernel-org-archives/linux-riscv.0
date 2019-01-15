Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B86C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 18:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8543D20656
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 18:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="grf6nd4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8543D20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+1XW7MHs/s1/kqWkFnbOcJAakal8rdRPzHrxtChVwRs=; b=grf6nd4SWvT8Pze9gyEtSWRke
	+vwVE1PGI10yjawk68H3yxl0GtfkMno3rH0KZ1lhfLaCa+7LhfS8CzqZdIALu3qoRqnp7V5HyNkKv
	/1Wvok+MP1krLlXWC0ra7575foVLPcPot4Hhck5vmgD309D3tsxsT7MQrVwGOy6onJHeYPpttDsWy
	PyglqIHjQWJgyHSs4bTRG9duqUgY4wrWOvV2hxZIqq18z/scUPxWZMhgR2XKykRobUqdmcs5+bGx/
	2TzaK6WvftaX6LpP9aEJYWk7OlHO8KhqKyPGCQcf6q97R0TWM76o8b8lmSLFkL/PsXf+WsEjrqYGH
	Z0hy5lgTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjTt5-0003Ro-SJ; Tue, 15 Jan 2019 18:56:35 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjTsu-0003Ha-Ip
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 18:56:26 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 953FD1C0004;
 Tue, 15 Jan 2019 18:56:13 +0000 (UTC)
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
To: Christoph Hellwig <hch@infradead.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
 <20190115160429.GA29683@infradead.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <066d8ba2-594e-2d50-e329-ea7166c5ff0a@ghiti.fr>
Date: Tue, 15 Jan 2019 18:56:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115160429.GA29683@infradead.org>
Content-Language: en-PH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_105624_780254_8DFDEF31 
X-CRM114-Status: GOOD (  12.56  )
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

On 1/15/19 4:04 PM, Christoph Hellwig wrote:
> On Wed, Jan 09, 2019 at 11:23:22AM -0800, Mike Kravetz wrote:
>>> CMA or (MEMORY_ISOLATION && COMPACTION) must be enabled so that boot
>>> reserved gigantic pages can be freed: indeed, one can reduce the number
>>> of huge pages by calling free_gigantic_pages which in turn calls
>>> free_contig_range, defined only with those configs defined.
>>> However I don't see any strong dependency between free_contig_range
>>> and those configs, maybe we could allow hugetlbfs users to free boot
>>> reserved hugepages without those configs activated, I will propose
>>> something if Mike Kravetz agrees.
>> Yes, that should be modified.  I think it would be a simple matter of moving
>> free_contig_range out of that ifdef block.  If you would like, I can submit
>> a patch for that.
> We should probably include that patch in this series.

Ok, the patch for this is ready, I will include it in the series with your
comments.

Thanks again for your reviews,

Alex

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
