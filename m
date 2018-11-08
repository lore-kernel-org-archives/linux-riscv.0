Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F388ECDE47
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 18:05:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5880A20684
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 18:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MCEKntUJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wGpRXXyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5880A20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZJWCKkvLmC5ZXoP7Z9yPaNrkC9HEmuGGHEGolZVDdk=; b=MCEKntUJwo2aGE
	roxg7dMlYG/4aPJ2q4Z4OfAxAv/6iACyHUEfjNVoF/7IQvDVBRVJUBJDEMFbfK5cSZHDVMrUJZl6j
	751qmLHmUL+5z1C3Yc5ZdI2rieGcHG6XsxSucCm6htwJwV0lrv9TrgAyeeQHhje4TfVll5fCN/Szr
	wXoC9MejGWaex/SV2k+GEWr9Zc1CuyOxmWncy5GS6QEVXTWAmBLsnNlwCQDZkztAuPJfguhld9qln
	/MI/Q27MxtwZLt7PHS6elrMaipS76cmHG8xDbz7hx+xzkCWgh46wJb5BvF9EUjakvN1wGRzcOiyof
	4RXA7kv/zU/ftgax0ZhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKofv-0004To-VE; Thu, 08 Nov 2018 18:05:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKofl-0004MS-Fr; Thu, 08 Nov 2018 18:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D4r1nk0jF9SXsAmhj59bm4mNg2KxtLNk33FOZk+l9VM=; b=wGpRXXyo0HDO/xmnXw+v9npo/
 OXYi8HIAa3J5EQoi2LCoXdgoA1gmQW0qcjJTus5GOIqaPoLniyVHHNvl3c5Ib3qV/sURLITs8q3nH
 ntYZxj2r8/X5/IJUe1PrS7nlosWeVa0F99CyNgJropvv42nly31ePVmO7T4phxVXpuLYXFHV2vTaC
 iyb9mA7F2ntSetCDWR5QMHL5L4xbSmE53LZL2ZJKBpJJsJMSziDE/mouEOlc2v6I8cREN0Qd5u+eu
 m37QjLnLRXJx9T90yv3+RYLXbUwhWoM3ksZxo8YQz2oIKNG44DQC+n//wNMueghjSMDZl2RvE3kLM
 v58FIYHzw==;
Received: from foss.arm.com ([217.140.101.70])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKofi-0005TZ-CM; Thu, 08 Nov 2018 18:04:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13F59EBD;
 Thu,  8 Nov 2018 10:04:38 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 D43A43F5CF; Thu,  8 Nov 2018 10:04:35 -0800 (PST)
Date: Thu, 8 Nov 2018 18:04:33 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v2 1/2] mm: Introduce common STRUCT_PAGE_MAX_SHIFT define
Message-ID: <20181108180432.GH144107@arrakis.emea.arm.com>
References: <20181107205433.3875-1-logang@deltatee.com>
 <20181107205433.3875-2-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181107205433.3875-2-logang@deltatee.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_180450_577343_54D5C646 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108180433.PpO_wkALGBbedmSJIUuugi9czYlEXhoPanyWBZTtts0@z>

On Wed, Nov 07, 2018 at 01:54:32PM -0700, Logan Gunthorpe wrote:
> This define is used by arm64 to calculate the size of the vmemmap
> region. It is defined as the log2 of the upper bound on the size
> of a struct page.
> 
> We move it into mm_types.h so it can be defined properly instead of
> set and checked with a build bug. This also allows us to use the same
> define for riscv.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Acked-by: Will Deacon <will.deacon@arm.com>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christoph Hellwig <hch@lst.de>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
