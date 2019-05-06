Return-Path: <SRS0=A6Fl=TG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1919BC04A6B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 May 2019 13:29:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5DD6206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 May 2019 13:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8bjC1ne";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Xi4GnazF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5DD6206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXWOwHKD/VQU59ZR/FpQ1GCPGSGSr5boGnEQ8rDPGIU=; b=g8bjC1neM5pru6
	5cHIpzQEF604FPmsT40aXRXzLE/J7XROF170tNTWi/HD4n7zJqEhYXbwVB0agtQcNjpA3S6h0KJiF
	xFLEk7y6WQPyjC+bYQfMiDUsSkdHUsuA6E4gKzyvcqCJqngyu3uLRiH9LOiOdcpVHjue4PLgrpZVx
	urIM4dTTSgEJ9NjD6OlrE50eVhT4lpYKz+QluPsP1pNllGmFR0yEJADqauxntNbI4shxl2jIn1Q6w
	Ypuy887eVMY7x2SjbKJE3TeV2Gsmw59Q6exN8QI3/4ORS33rq9p0Z591Bib/KDxDCMe5PoZgjjx3b
	U1JePbqH+rJCASqLL3eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNdgS-00053r-9I; Mon, 06 May 2019 13:29:32 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNdgP-00053S-Bu
 for linux-riscv@lists.infradead.org; Mon, 06 May 2019 13:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iqK/8epn5ls+IZG0UVMrU/nhCwJXFn7xBX1PC/hdTw8=; b=Xi4GnazFzWujEyL0+B6GoxfPXw
 yypf4DnisTvFQyII2YxI8Dq+6W1uRpKc+dxsYsBsa+Dpv2j+og2+nHKl5eyc96I8rPF6SecgNg+qv
 dnTngDKXOw4HfSo1EdOyX4oJ89lR64yLS2wQ4mZE13dQi9ckbzmSoJ8oR4rkGq2lWWRs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hNdgK-00051K-MA; Mon, 06 May 2019 15:29:24 +0200
Date: Mon, 6 May 2019 15:29:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v1 v1 3/3] i2c-ocores: sifive: add polling mode
 workaround for FU540-C000 SoC.
Message-ID: <20190506132924.GD15291@lunn.ch>
References: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
 <1557147240-29551-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557147240-29551-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_062929_561070_3841F7D6 
X-CRM114-Status: GOOD (  12.17  )
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

>  /*
>   * 'process_lock' exists because ocores_process() and ocores_process_timeout()
> @@ -239,8 +240,13 @@ static irqreturn_t ocores_isr(int irq, void *dev_id)
>  	struct ocores_i2c *i2c = dev_id;
>  	u8 stat = oc_getreg(i2c, OCI2C_STATUS);
>  
> -	if (!(stat & OCI2C_STAT_IF))
> +	if (i2c->flags && SIFIVE_FLAG_POLL) {

Do you really want && here?

> +		if (stat & OCI2C_STAT_IF)
> +			if (!(stat & OCI2C_STAT_BUSY))
> +				return IRQ_NONE;
> +	} else if (!(stat & OCI2C_STAT_IF)) {
>  		return IRQ_NONE;
> +	}
>  
>  	ocores_process(i2c, stat);
>  
> @@ -356,6 +362,11 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
>  		ret = ocores_isr(-1, i2c);
>  		if (ret == IRQ_NONE)
>  			break; /* all messages have been transferred */
> +		else {
> +			if (i2c->flags && SIFIVE_FLAG_POLL)

And here?

> +				if (i2c->state == STATE_DONE)
> +					break;
> +		}
>  	}
>  }
>  
> @@ -406,7 +417,7 @@ static int ocores_xfer(struct i2c_adapter *adap,
>  {
>  	struct ocores_i2c *i2c = i2c_get_adapdata(adap);
>  
> -	if (i2c->flags & OCORES_FLAG_POLL)
> +	if ((i2c->flags & OCORES_FLAG_POLL) || (i2c->flags & SIFIVE_FLAG_POLL))

You can combine this

if ((i2c->flags & (OCORES_FLAG_POLL | SIFIVE_FLAG_POLL))

>  		return ocores_xfer_polling(adap, msgs, num);
>  	return ocores_xfer_core(i2c, msgs, num, false);
>  }
> @@ -597,6 +608,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  {
>  	struct ocores_i2c *i2c;
>  	struct ocores_i2c_platform_data *pdata;
> +	const struct of_device_id *match;
>  	struct resource *res;
>  	int irq;
>  	int ret;
> @@ -678,13 +690,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -ENXIO) {
> -		i2c->flags |= OCORES_FLAG_POLL;
> +		/*
> +		 * Set a SIFIVE_FLAG_POLL to enable workaround for FU540
> +		 * in polling mode interface of i2c-ocore driver.
> +		 */
> +		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
> +		if (match && (long)match->data == TYPE_SIFIVE_REV0)
> +			i2c->flags |= SIFIVE_FLAG_POLL;
> +		else
> +			i2c->flags |= OCORES_FLAG_POLL;

Please take a look at the whole code, and consider if it is better to
set both SIFIVE_FLAG_POLL and OCORES_FLAG_POLL. Maybe rename
SIFIVE_FLAG_POLL to OCORES_FLAG_BROKEN_IRQ_BIT?

Thanks
	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
