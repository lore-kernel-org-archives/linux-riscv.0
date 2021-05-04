Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E89C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 18:46:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27FC0600EF
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 18:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27FC0600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YRToASKAtt08G1SkDt1Zym3mBOTAos8SUYkAe3zJI9A=; b=LOnDeTkpMGg6G0a7rMPkPGFyl
	a4gWO3946Er8sCjaQmB3FZIbjZi5YAYsUMV8GOr5NmUxkt+kJfiXCLRPKa1O98rgBqHgoucnSy8Tp
	W33YtCz27usJrKi6PX7bOZtS6IH/oTZb807ExAt+b9PCTRad3ZYO1AKJUtjoR3AiIfXugvwiuCU6R
	pxLXVZrkLALeEdFsqgjk/ot9ZHf0Hr1FzJNQpb9Dh0IYUZXszswUOLbOGXd8rozdy23vbbEezDlt4
	VgY3hyqROCGHu81eeLVwKMoN57vj6TVfRJnzWKtvbjBmts0e+1kytKxcmBXy4p0uinZzwasSVymZ6
	kJefotUZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le03l-00Goc4-Kj; Tue, 04 May 2021 18:46:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le03T-00GobN-Rb
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 18:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=zhKDxdM7YejRHMBvAZbdZYLkdF/ugRnd+bihGiSwclA=; b=kHAi4ADL+yYipxNmQhww7vFrIs
 Zpq/rsO/zqCZwGbVWNOybLRqJXqDkFWGwkpiuEqExVH1irDmz8fqAt6KrAbUy5tz1EQwwFM8ID2PB
 3fdjfoctF6Fz1TQzWSPa8kA/t7SuhTUWSRHYwQTaq5eijQL66TpKul1qBOxWxmQ6NI8lQJzQBBLfp
 Jm1YHz3q+Dk9EdrZBO7Y7kJauev+kuMOuZmizUSpjHP7ZHSKGQoe513TP/sYLR0uqFQnEfv6wUr3w
 carVE6sTFYaHLTjRFJGKZXZJ/rAdSRxGRbKEoXqjgFjpKTvMzhkcGRWUKbuO32zcE50sV1xMVxcUf
 69DPRPhQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le03R-004BlW-7e
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 18:45:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56D51613B3;
 Tue,  4 May 2021 18:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620153956;
 bh=UTi8HBhw8z0P0MgM0KDvs/15h0MXq7TPBO59A7fxlWk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=n7f2f84idRrkFsoYOOczfzqsKAzM0IuEIXH33gGEJKh9Q2sW9nM3Vh7PKW25E/8b6
 Iig+PcBj24Q/qdbsBaZ4zrDSLYfI9xlKdhgV1sJFtgFR6bZQJ2kJGz2XZJ68byHV4K
 Q7eBAav8Mvug5sUswmXMYRB+1ygvttTTGWIp90ouqp0z/jprMnQ98Yzj8WNI9cgCzi
 6TND4FNt/PPyrc/CzdF8Ro9EoS2IyLARceFBW0anZCpPxzp5aBzB0lUosvmD6UXI9E
 aPmPfrhYriRlcA7a3hUsxLRvI/otU9c9b29UPUpBAiv4GIIu2BxmMy+iqJoaqYAvlo
 UTzjCTPCLwfYw==
Date: Tue, 4 May 2021 13:45:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greentime Hu <greentime.hu@sifive.com>, paul.walmsley@sifive.com,
 hes@sifive.com, erik.danie@sifive.com, zong.li@sifive.com,
 bhelgaas@google.com, robh+dt@kernel.org, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 1/6] clk: sifive: Add pcie_aux clock in prci driver
 for PCIe driver
Message-ID: <20210504184555.GA1144324@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJGOqaMulHzR9BZq@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_114557_319689_D6F2862A 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, May 04, 2021 at 09:12:57PM +0300, Leon Romanovsky wrote:
> On Tue, May 04, 2021 at 11:23:31AM -0500, Bjorn Helgaas wrote:

> > There are some weird/interesting bool vs int usages nearby, though:
> > 
> >   "bool __is_clk_gate_enabled()" goes to some trouble to convert
> >   int to bool ("return (reg_val & bit_mask) != 0;"), and then
> >   kona_peri_clk_is_enabled() converts the bool back to int ("return
> >   is_clk_gate_enabled(bcm_clk->ccu, gate) ? 1 : 0;").
> > 
> >   "int lpc32xx_clk_gate_is_enabled()" actually returns a bool that is
> >   implicitly converted to int.
> > 
> >   Many *_is_enabled() functions return !!(...) where !! is an
> >   int-to-bool conversion that is arguably unnecessary and again
> >   results in an implicit conversion to int.
> > 
> > I don't see any *problems* with any of these; it just seems like a
> > little more mental effort to think about all the explicit and implicit
> > conversions going on.
> 
> The code is written once but read many times and I can't agree with
> your that examples given by you are not the *problems*. They clearly
> says "the API is not great and easily can be improved".

I certainly agree that it's easier for readers if the style is
consistent.  I just meant I didn't see anything that's an actual bug.  

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
