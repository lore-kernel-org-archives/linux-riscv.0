Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB24F606A331
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0cwXf098;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RBuPLtZq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rwOkNKpy67Qx905aWlLbc2FUlnl6mgEd0KjI7FwPNDI=; b=0cwXf098DHjngHu+dhwV+hJBZR
	y0XXtLnFt/ZjsQKQwwjFEIqJK60VBPjtendzpkDQ1vtfhgqpSr+CHDlcpYW6VGmXWM9NoQIRWo0TY
	loeuVCQcMStRSPoQaZlsKPU4ZUUVHKWUNrqLCwzi8O3TqFobflkMyc6UbAFjt/4TdidJoALmj/Ln5
	xQA1khWxE0+SA3YksSshOeflt5WJIPt/sPcUSVtUEA2g0IGwrmaAdldoThYSBCcEJTqqFFlSAEAj6
	MWblWOjsDLCFYiW7T/tt8p5YUBiISTV316dRJf9vfWQOZ1sl1bYsExzUQLrMNhQoHqKa8zQ1+eqxw
	ULLLJe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSFZ-00000001Cfb-39eZ;
	Mon, 09 Nov 2026 16:29:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSFT-00000001CeX-45ej
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 16:29:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 829B84E4152F;
	Mon,  9 Nov 2026 16:29:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46E7760051;
	Mon,  9 Nov 2026 16:29:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 227C410328531;
	Mon,  9 Nov 2026 17:29:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794241769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=EsTOtg1wHLEo0ZTusjGA4+BpHgdpiqnkxhcG+EozUhY=;
	b=RBuPLtZqrGZ04Eym/pFeRTwd2DLY3KznOpoqdIOi4bmj0gCgBXibiaQfcp6sv3S6QyBDut
	IiiwqzlfMxGQJ3YcFzwSh8BMBdVVRsIRgqsSfpwO0cIvBF9OcXiaZmR9B8mZKcCtw6N13/
	AQGNnLkKN7EnCQUKsT/LfZAvCUCwWtVpsadHLcatmEuhJ8TVtp7lLCgN1m3xjF9xiL6vwa
	HMAh6p0bpQbpVJRu0ggsgIIPPHbWNJEQZ6VCp91TeLVl/sbxkZSvjZ1cNZ11+a72h3h9kV
	6yTfWwM5jGTq0XStRQCtBvpRFJdZUCNAIFXqLD7rzyzHPL5FGkdNsu3eVhefnQ==
Date: Mon, 9 Nov 2026 17:29:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: E Shattow <e@freeshell.de>
Cc: Owen O'Hehir <oo.hehir@gmail.com>, linux-rtc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>, Conor Dooley <conor@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 2/4] rtc: Add StarFive JH7110 RTC driver
Message-ID: <202611091629193b8f049c@mail.local>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
 <20261108212826.15890-3-oo.hehir@gmail.com>
 <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_082936_169323_DD2BEBDD 
X-CRM114-Status: GOOD (  13.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 08/11/2026 19:12:58-0800, E Shattow wrote:
> > +static const struct of_device_id jh7110_rtc_of_match[] = {
> > +	{ .compatible = "starfive,jh7110-rtc" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, jh7110_rtc_of_match);
> > +
> > +static struct platform_driver jh7110_rtc_driver = {
> > +	.driver = {
> > +		.name = "jh7110-rtc",
> > +		.of_match_table = jh7110_rtc_of_match,
> > +	},
> > +	.probe = jh7110_rtc_probe,
> > +};
> > +module_platform_driver(jh7110_rtc_driver);
> 
> I note that JH7100 does not mention RTC in its datasheet. Does JH7110
> RTC have any commonality with JHB100 and if so then would rtc-starfive
> be a more suitable name for the code filename and module?
> 

The filename has to be soc specific, else we will end up with
rtc-starfive.c, rtc-starfive2.c, etc... when the vendor choose to change
the IP.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
