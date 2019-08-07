Return-Path: <SRS0=DSzU=WD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98911C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 06:49:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B9921BF6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 06:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uQjFSusV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71B9921BF6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKIFQHFC558BHqdl/yE3bHsc0R+/D2cD3qlyunO+Awk=; b=uQjFSusVZ5Afpr
	qm6SRaZ7LdJhabyOHoWAtYWWLtlFpotpPvkxPJxXwcjYUmwx8Pe5Hh6toTR9QyXnH8jO6KXoMZvSz
	r+/8kWf0hRJof3TW2a5hMvOf6h8IPdus1J3FA+A0qNX4l0S7km25+zIQ8q9796yFE+JpQMyx0V3I1
	uhGXcOsa+jlXZT+Ha+HXBazmeEylLgDgCNHTjDC2Jsp2CWeiWv6sw66rXvqCf9kp95pWO93wXwANl
	iYPr54iFhVOJlZkcQ6x8uR658sAcDyKgzLopR2vEo/C256FLWkANKeIRR5iaDGCj5hlDm9DQHEqBy
	HPEwmrNI+sxGe070Vg4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvFko-0001tb-UD; Wed, 07 Aug 2019 06:48:58 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvFkn-0001tR-8b; Wed, 07 Aug 2019 06:48:57 +0000
Date: Tue, 6 Aug 2019 23:48:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: delay: use do_div() instead of __udivdi3()
Message-ID: <20190807064857.GA6942@infradead.org>
References: <alpine.DEB.2.21.9999.1908061906240.25231@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908061906240.25231@viisi.sifive.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
> index 87ff89e88f2c..8c686934e0f6 100644
> --- a/arch/riscv/lib/delay.c
> +++ b/arch/riscv/lib/delay.c
> @@ -81,9 +81,14 @@ EXPORT_SYMBOL(__delay);
>  void udelay(unsigned long usecs)
>  {
>  	u64 ucycles = (u64)usecs * lpj_fine * UDELAY_MULT;
> +	u64 n;
> +	u32 rem;
>  
>  	if (unlikely(usecs > MAX_UDELAY_US)) {
> -		__delay((u64)usecs * riscv_timebase / 1000000ULL);
> +		n = (u64)usecs * riscv_timebase;
> +		rem = do_div(n, 1000000);
> +
> +		__delay(n);
>  		return;

A few comments on the variable usage:

I think you really want a variable of type u64 that contains the usecs
value instead of casting it three times.

n and rem can be easily declared inside the branch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
