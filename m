Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04D3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 05:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A28BC61040
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 05:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A28BC61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJuEAnJJynQ82FdxT2+u0A7Y4jJoFUIgRTXXQfp+cbY=; b=eG+l5dzh8WejrI
	xSty+0+tZptCrsVTwG+vCYLTPW+w/i0iSDQzLwNICnFyDRtcjdOTRLqzJ7+zid/eqnu1re+VN2cjP
	D+1Qngx2NEvrF93fjzQwLmnwoCSXMIvz+2br7k+PW1GGI21uSo1lZNexNlGkYm40obW5qEUVgRTiy
	Rb+F8SrJ/bR5DpXs2+K8yBjTpxA05WY8v80GAfhqP79KQK1Dp0RO7/tiUW+PuMQJnVpyKfD2hNpIM
	Bj14ggegXvtvcLhX5frxDpiiukrp+La8wPU9BokvxzJBOkkLmGJ36FzzjQR0ksZ8HPHrcQZABi8sD
	VAdsgUlXWr07l0lS7A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXzUp-00CrzP-4R; Wed, 06 Oct 2021 05:29:39 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXzUM-00CryS-Nh; Wed, 06 Oct 2021 05:29:11 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 7B37080E1;
 Wed,  6 Oct 2021 05:29:40 +0000 (UTC)
Date: Wed, 6 Oct 2021 08:29:08 +0300
From: Tony Lindgren <tony@atomide.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/2] Fix simple-bus issues with fw_devlink
Message-ID: <YV00JD31EPD6WqlB@atomide.com>
References: <20210929000735.585237-1-saravanak@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210929000735.585237-1-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_222910_862072_EDAF86BC 
X-CRM114-Status: GOOD (  15.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

* Saravana Kannan <saravanak@google.com> [210929 03:08]:
> Ulf reported an issue[1] with fw_devlink. This series tries to fix that
> issue.
> 
> I replicated a similar set up on my end and I confirmed:
> - A simple-bus only device is probed.
> - Another device listing simple-bus as a 2nd compatible string isn't
>   probed.
> 
> v1->v2:
> - Switched to probing the simple-bus device instead of marking it as
>   NEVER_PROBES.
> 
> v2->v3:
> - Moved all the code into the simple-pm-bus driver
> - Addressed Ulf's comment about the remove() code missing a check.
> 
> v3->v4:
> - Added support for driver_override to accommodate the case where new
>   transparent bus compatible strings are added to DT, but the kernel hasn't
>   been updated yet.
> - Added/updated comments to give more details.
> - Adding Ulf's Tested-by that he have for v3 (v4 didn't change by much).

Works for me:

Tested-by: Tony Lindgren <tony@atomide.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
