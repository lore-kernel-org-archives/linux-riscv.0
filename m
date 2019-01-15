Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5A2C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 18:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A92C20656
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 18:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kyWfPPge"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A92C20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7VQOh6RWyv+skvt6+YKE/mlsAmmPFC7/tW6tUH7Lmuc=; b=kyWfPPgeJewNRQpqfz/JRiN5T
	v5QoMqS+o3tRpTZL+E44wuS7YDPn1DtheXVu4UHrZ56k/fRZuP58BBUolIhIRIQonUlpk6pSKM9Km
	OlyWk46ZpXr4E7CJ3IWCZLjNNOMzlj0PDpmMydpzlSGIqcWZjHMyFIdbqsQz69pnfoNOogUr9QChE
	Rj4EByuDl+mt6LVJqCiqp8BNVq5NFID05CiGu5rQtS566u7NZfp/hQQdjTetu4CfD1Sismv+w5yry
	yZilnC1u/tj1ucCqICxlfWTqMwx0gv1ZO58lN5exFZVYrawasGfTF4XevDmD68FQrB6pSVfxY5PmW
	X/A0AnD5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjTq7-0001c4-5g; Tue, 15 Jan 2019 18:53:31 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjTq4-0001bc-NJ
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 18:53:30 +0000
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 30AB2240009;
 Tue, 15 Jan 2019 18:53:12 +0000 (UTC)
Subject: Re: [PATCH 2/3] riscv: Fix wrong comment about task size for riscv64
To: Christoph Hellwig <hch@infradead.org>, Alexandre Ghiti <aghiti@upmem.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <20181210062146.24951-3-aghiti@upmem.com>
 <20190115155836.GE13095@infradead.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <868ec175-381d-9675-65a6-e1b77ad7ab36@ghiti.fr>
Date: Tue, 15 Jan 2019 18:53:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115155836.GE13095@infradead.org>
Content-Language: en-PH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_105328_908413_937150E8 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
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

On 1/15/19 3:58 PM, Christoph Hellwig wrote:
> Looks fine to me, and should go in independent of the hugetlb support.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks for your review,

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
