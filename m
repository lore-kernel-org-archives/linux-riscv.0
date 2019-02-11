Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2605C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 12:09:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2B9218D8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 12:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRBGhK6K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F2B9218D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4/tZQYhKs09Z57zRTn/E5Eshl6b9e9/uvOHvhulXoM=; b=XRBGhK6K7G95f6aevw1K9uM5m
	4IdQj2p7L06JCXmUWpZm1oybVmj2hfFcx/4vJTzUsJOG0LtNeVY2cF54nQvvRkFIz7dZR4p7Isbsp
	UfJ5koLZ14Esizl3TgM/38C8GHKDHM5iuxsl8Qk/qnGe23JZxreB+gRvqyK71bWQyfLl2OFJFILAu
	Y9/IUVB6hPCjDlOMyC11D+wp7WCq/YmSKGgClA5Y8S16zNSXni2ZNJjHzrXGsntV4t2DbiLORWCld
	ARXAGzzYHnEF3pBCisH5aYzEtoiGlgnmp1w8dqFR13vY6evXt70HMh3REBL+cfKgF32Wg+pAxNWb/
	MouElxGfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtAPI-0005Kh-20; Mon, 11 Feb 2019 12:09:52 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtAPE-0005KA-Na
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 12:09:50 +0000
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id EF54F240009;
 Mon, 11 Feb 2019 12:09:37 +0000 (UTC)
Subject: Re: [PATCH v2] riscv: Make mmap allocation top-down by default
To: Christoph Hellwig <hch@infradead.org>
References: <20190128174902.22912-1-alex@ghiti.fr>
 <20190211082705.GA18519@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <865ae0da-2804-0243-7a0c-01fa236d98fa@ghiti.fr>
Date: Mon, 11 Feb 2019 13:09:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190211082705.GA18519@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_040948_917256_DFC94B65 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 02/11/2019 09:27 AM, Christoph Hellwig wrote:
> On Mon, Jan 28, 2019 at 12:49:02PM -0500, Alexandre Ghiti wrote:
>> In order to avoid wasting user address space by using bottom-up mmap
>> allocation scheme, prefer top-down scheme when possible.
>>
>> This patch is based on arm64 implementation.
> Any chance you could lift the arm64 code into a generic top-down library
> and reuse that instead of duplicating it?

Of course, I'm on it.

Thanks for your answer,

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
