Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5FBC61DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fqquxmply6GMEAJIsRk/F0YaCCiu7IHS6s80ha6Mzf0=; b=n0DYTPX8rBPSSQ
	yeMSean90X9ucKR72ncYkQFdmQnHkHPWiYESf5NBzmvvGteuJbLcgMWuUq839xrsMPuldMmnfqd6C
	YgNAXFmkvOz6Z0fRxnhP0H9aWXKU3ijSOOKKywX/2zWBMeWcV8JxY8weywSy6vIhbwp8rLwDy2Ta7
	D70djjOLftvOrRQ+8vAoB3NnE6gARm/BbfQ5QnUzYbEMyTp4y9tkwsl+05yW/F8bRPDv+8sK4kCBR
	jVSlubIO8NuqdJFnV4Jz5LMTOAWV4ORNONk/Y3kqPNKh46TCqvsVxPt7h0pS/BYG3OxI/oj1CSk2U
	KyWK9IEWlWkJeLEr71dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ola-00000008DPj-1Nva;
	Sun, 30 Aug 2026 23:16:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0olY-00000008DPZ-3tR2
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 23:16:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64B9C43A77;
	Sun, 30 Aug 2026 23:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74241F000E9;
	Sun, 30 Aug 2026 23:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788131803;
	bh=DtclEM6AxlSQtUjv+MTQdeh9Y9YSmjfI3qtdFkZx3xw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=J4TksJmv/us19UxyzNF7i3g1OEAuHbnoKlj2ihxQFR44uMVjAFzw+03nc95G45NSl
	 um45pNKpekAwTi087/yf1UajSX/3IVW9/5e2exELJG8NJu0n2xOYzadwDyU7OPyXeS
	 3eAa2nEkPVm1V4fkVkKw2xkf6kPOUp9kk06tnYbbGvGidgOpMu78rO1bYT9zuptdxt
	 Qyh3HBu7TVN1Y7pYz2z/vkIAm41RVgQKD5kHOQkfCF8G/ofyBk0+x+vmy/se8qJTsS
	 qoSn/fq1HRZTb1+pymuPTGMY/VZOwMmE42L18ojgRhTHU8T9TW17Lsa7lcib1anpQV
	 u12uwZ8aodczA==
MIME-Version: 1.0
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Janani Sunil <janani.sunil@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Kent Gustavsson <kent@minoris.se>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org, 
 Kent Gustavsson <nedo80@gmail.com>, linux-riscv@lists.infradead.org
In-Reply-To: <ao_z9QTJC_q8gH0v@ashevche-desk.local>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
 <ao_z9QTJC_q8gH0v@ashevche-desk.local>
Date: Mon, 31 Aug 2026 00:16:12 +0100
Message-Id: <178813177252.2788519.10940489053707901297.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=jonathan.cameron@oss.qualcomm.com; h=from:subject:message-id;
 bh=2eHbvetl6bVxEL9oNB/90RLmkJwO/yTkkqjW8VAVLDE=;
 b=owEBfwKA/ZANAwAKAVSFNJnE9BaIAcsmYgBqlLm9pxRlC7fEy2/vcPCiXMCjSkikzaEaADxH5
 j+amI5bJzuJAkUEAAEKAC8WIQRuKWazh4QGUpEmgbFUhTSZxPQWiAUCapS5vREcamljMjNAa2Vy
 bmVsLm9yZwAKCRBUhTSZxPQWiGcTEACtTY8a9Tku89MTO+xwmX4mV7OVf4l4sZfYUgNwYBt4moR
 P/lauImhnjaafxKvAnHs4LFNT/J1ybhqUwC9+WAUBQu5vnqN4IUtjr6nUUCdoVK8GVAgZ7wxxSt
 /aHHDp+VH2AiN5Na25AlQp77Yx8+NAaaEhlleZlwMOoVxH+OmpPyGdmh3PuuptHBR5HAgAv0GJt
 iDIjIqLi8RQCpFIGq6Z7wwUP8ngc62/WXfKPJkXguWKfJn4Vi97sSj9IoVUPAyo5THKv/GjI2JK
 SLQGbkgOE69+LwNby0RMyHNf2ngYcQTANJKhkuMYnVtXlDk1exe52rV1vCIZnWFMm6UJczT2YfG
 2Y8z2u/Y4kKftLSaf/Cja6ptN/BtdCaqNb87ohbo9xHMetBhzMD8oU1DRMkYWZwj3UXowYgYRQ8
 3xZiaUyAB1neL+1OYHhN4i+qhx+NEMlBMsBGArRvF1XpZIcz/IiI/mJK3AdwQrHUnFJKhIWvHMf
 kTPXhMsKgGD7XP2Su8n7EHZvTqW5X15xqC8yQGeMtDWx1inNFWajoJO2Ui4522VtWZ4hc6l0k4Q
 VcLWhRqYFeVDUFlwOWGFAQIO5eCHjxKKvkPc5aclNTsvxWRHklNE9DUkVDC1RF7rHIROLuqhNWP
 W6NSLYXXQbITJ4kOYMZXw5UUR1+GRIQCy7fZwJw==
X-Developer-Key: i=jonathan.cameron@oss.qualcomm.com; a=openpgp;
 fpr=6E2966B387840652912681B154853499C4F41688
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


> > +static int ad5529r_parse_channel_ranges(struct device *dev,
> > +					struct ad5529r_state *st)
> > +{
> > +	unsigned long channel_mask = 0;
> > +	s32 vals[2];
> > +	int ret, range_idx;
> > +	u32 ch;
> > +
> > +	device_for_each_child_node_scoped(dev, child) {
> > +		if (st->num_channels == ARRAY_SIZE(st->channels))
> > +			return dev_err_probe(dev, -ECHRNG, "Too many channels\n");
> 
> Okay, this actually better to be ENOSPC
> 
> > +		ret = fwnode_property_read_u32(child, "reg", &ch);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret,
> > +					     "Missing reg property in channel node\n");
> > +
> > +		if (ch >= AD5529R_MAX_CHANNELS)
> > +			return dev_err_probe(dev, -EINVAL,
> 
> and ECHRNG is here.

That one is getting rather creative even though I guess the description
does fit rather well.  So I don't object, but also feel -EINVAL is
probably good enough for an invalid property value.

> 
> > +					     "Channel %u exceeds maximum 15\n",
> 

J

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
