Return-Path: <SRS0=H4VQ=TQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B336C04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 12:31:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D9E2087B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 12:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0Jk2j/p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2FkCg+QJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D9E2087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5hWlhO2BhtJfteDEk0+60fZBRIzNus+dKZXTZBDA9g=; b=k0Jk2j/pRFVBrf
	GyANS5mAJzvy9RvsQfRiAEyuC93ZB0rWflTo74wlZ4owpdoDEriswBoqG5eXl+NX7xUTJFbRKhIqm
	Q1QKRgWbdmj6v4b3YvhTxjVgYwWa3adw/KBIpe1jw8mcmpEt+GxXbiBEHdQHYQDXgWAdsyFMlqNCp
	8mLiDV971DOBlamZVuNF4lvwRfWb72emkl8IUIhq7iqcZUYwXBfJTovSXI5jnHKh+ep8FjaUPq87L
	YWm8sA56PcFq5TVHBePr/r6/E2y+AnexQQjMZ62cODsRUGSFuQGi6I+/37tEOujRjCpxF1+I8bWzg
	2iFFFGagClVz13oMpRnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRFXv-0005P4-Si; Thu, 16 May 2019 12:31:39 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRFXr-0005O1-Pe
 for linux-riscv@lists.infradead.org; Thu, 16 May 2019 12:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8xq/AtLnhhHzaEV7B7DQtMaLbospcYCiDyDYIDbl+EM=; b=2FkCg+QJQNemfvntMoY/Sg2hMR
 Es9XwCnKNwndQo+A6WrRG5rz/xlK+Qsws4mgav7Mjtd6IqnpBtwer1SzXie7pUP3pIl9icMIJRfM4
 rjVfOUlzl6zwAErRc6zFfEeUB3JWyORiOyLHCnNeLrMqPtFZMAFuEqcrxOXG2F5eZ22A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hRFXc-0002lz-VF; Thu, 16 May 2019 14:31:21 +0200
Date: Thu, 16 May 2019 14:31:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v3 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC
Message-ID: <20190516123120.GB14298@lunn.ch>
References: <1557983320-14461-1-git-send-email-sagar.kadam@sifive.com>
 <1557983320-14461-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557983320-14461-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_053135_984514_AA6AF66C 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, peter@korsgaard.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> @@ -682,13 +693,24 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -ENXIO) {
> -		i2c->flags |= OCORES_FLAG_POLL;
> +		/*
> +		 * Set a OCORES_FLAG_BROKEN_IRQ to enable workaround for
> +		 * FU540-C000 SoC in polling mode interface of i2c-ocore driver.
> +		 * Else enable default polling mode interface for SIFIVE/OCORE
> +		 * device types.
> +		 */
> +		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
> +		if (match && (long)match->data ==
> +				(TYPE_SIFIVE_REV0 | OCORES_FLAG_BROKEN_IRQ))

This looks wrong. You added:

+       {
+               .compatible = "sifive,fu540-c000-i2c",
+               .data = (void *)TYPE_SIFIVE_REV0,
+       },
+       {
+               .compatible = "sifive,i2c0",
+               .data = (void *)TYPE_SIFIVE_REV0,
+       },

So match->data just has TYPE_SIFIVE_REV0.

> +			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
> +		else
> +			i2c->flags |= OCORES_FLAG_POLL;

These two don't need to be exclusive. It makes more sense to say
SIFIVE needs to poll and it its IRQ is broken. A lot of your other
changes then go away.

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
