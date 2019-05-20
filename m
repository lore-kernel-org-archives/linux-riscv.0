Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BE9C04AAC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 12:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2600520815
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 12:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IWYx9T+7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PIxO99nw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2600520815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUa7Nt1AfsOIqQ5fhtc1bwf+PL4aMSS8x30sxIrfTgc=; b=IWYx9T+7oz+vUj
	8SG/3Dq53ent6UvOL8REWE31JcXShlroejejGQSDamJ987WMDu1kOmLB+DsWVTcp1hEfthDwval4/
	lJ3UTd6EY/Rw6hu9nLyjjoKtCN225qRNoL3L94EX8HKYq0njrtQGkOgHtmvhDm11BHgemLVMLsjdZ
	k9PYHyr7Kn9IasIc3JjCtKfKNHe8sPzgmsK56iUWKc5NQsE227iB0TJJNacgf8+muwrBkKgQPibey
	outDhaRPo5NZMnoV6JnVf0gX+PmoJesy73qZCUEYjkrBJnrh0s6/2ZyGF1SwRHEpoxJDsplfChc1k
	U3xoCS0Vs4aXBn1lCNzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hShbW-0003OH-M5; Mon, 20 May 2019 12:41:22 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hShbT-0003Ny-Mb
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 12:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nBnRj/EK3sEUMzbkUvHuqcjTW3RRt/lB/8667Tiwik0=; b=PIxO99nwMHUosViOpBy5S6+McG
 ntWcm8Dksr3pquMWAWjk9qa209ixnC3c1CT3RDC6L5i3oOI50Mnw3LqOhXldniCOjNl4xM5RR/yon
 ZufQiR/rE0WR96qFsheL83jH77gJjfvhDVA19cEmP+Jja4plYPVovfuxOX1XIVQKHQsY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hShbH-0006pg-IA; Mon, 20 May 2019 14:41:07 +0200
Date: Mon, 20 May 2019 14:41:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v4 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC
Message-ID: <20190520124107.GA25785@lunn.ch>
References: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
 <1558354817-12034-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558354817-12034-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_054119_892314_8EA2CC5E 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, peter@korsgaard.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> @@ -406,7 +416,7 @@ static int ocores_xfer(struct i2c_adapter *adap,
>  {
>  	struct ocores_i2c *i2c = i2c_get_adapdata(adap);
>  
> -	if (i2c->flags & OCORES_FLAG_POLL)
> +	if ((i2c->flags & (OCORES_FLAG_POLL | OCORES_FLAG_BROKEN_IRQ)))
>  		return ocores_xfer_polling(adap, msgs, num);
>  	return ocores_xfer_core(i2c, msgs, num, false);
>  }

You are not listening to what i said. All you need to know here is
that you must poll. It does not matter if the IRQ is broken or not.

>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -ENXIO) {
> -		i2c->flags |= OCORES_FLAG_POLL;

If there is no interrupt, you need to poll. So keep this line.

> +		/*
> +		 * Set a OCORES_FLAG_BROKEN_IRQ to enable workaround for
> +		 * FU540-C000 SoC in polling mode interface of i2c-ocore driver.
> +		 * Else enable default polling mode interface for SIFIVE/OCORE
> +		 * device types.
> +		 */
> +		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
> +		if (match && (long)match->data == TYPE_SIFIVE_REV0)
> +			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;

If it is a OCORE, IRQ is broken, so OR in OCORES_FLAG_BROKEN_IRQ.

>  
> -	if (!(i2c->flags & OCORES_FLAG_POLL)) {
> +	if (!(i2c->flags & (OCORES_FLAG_POLL | OCORES_FLAG_BROKEN_IRQ))) {
>  		ret = devm_request_irq(&pdev->dev, irq, ocores_isr, 0,
>  				       pdev->name, i2c);

Here you just need to know if you are polling. Broken IRQ does not
matter.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
