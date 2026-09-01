Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BC7C624CE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 01:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjCqzCxo7IPMAOGjTZfGUR6upveK0zy9VmYwl5BO3Nc=; b=YK6Od6raXslVWX
	XvGyn7Vu76yJI+AokdUTa6N73M9ZxGg7Ywgla+Wce6TaTdrDH+SiXnCWisxAbIvNjGXcDjui/CDzg
	CKn383V65CO/djhr6tAWT67LN6qmE4rrtLQUxXs1Xr5SqGMNvbRcPAvJ+M1EjKwDEEuVmxL8+MhVj
	SNkS0H7A+HFSRRUuZmRit7VEUx5xjTxzPIl7ukNxqraHo6UBv0ghZot+6+S1K+GOH+pkXfSweQQZ7
	otmdiVfn4PJN/4S9YBUXJzZER7VqUYakjWpCO3hfLjjHt8RtAEGyL8ZDtARn+2OYTQ1Q/1WjubVEP
	AlpHWQtVXOH1TVK2Y9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DS2-0000000AoRh-1Ef4;
	Tue, 01 Sep 2026 01:38:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DS1-0000000AoRZ-0Q2j
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 01:38:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20095602C3;
	Tue,  1 Sep 2026 01:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8071F000E9;
	Tue,  1 Sep 2026 01:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788226691;
	bh=BrIiRFWtczkZQEdzjQfU9/6RPpw/i2QrGgvd2I+VXzs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NcdeswUltGsBhID6VXv/iVFj1j2VSDPdMjVwIMYNjhwk+qAL2m3Tij7x+6lPct52V
	 SylHxgblCs1CbxzFhF8XlDug85XelzDJLFy160Rku11eEmBe4+WC1r0gtgBDo1wjCW
	 x5qSDPmUVvrCjoVld7nDbuS42ebeC00QMNv1qn16e+WtUR1+ChiHq7xFlpOgtbKd/O
	 sSaVkW2mE0F0U1nSRH8GojV62Ia0ow3GVB1GI1z/udq+g0gbx0k71n75x4279cw3VA
	 AtYvM7tXgXg2RalTE7wO6M0MVuN2EAL7i8HzPqKURD42lhfpD0WTcaiA3Cc4XdE4xq
	 GnBZ7Ep70PC3w==
Date: Tue, 1 Sep 2026 02:38:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Janani Sunil <janani.sunil@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, Marius Cristea <marius.cristea@microchip.com>, Marcus
 Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>,
 Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>,
 linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <20260901023805.20abc542@jic23-huawei>
In-Reply-To: <apUo4afCh5LhUqIO@ashevche-desk.local>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
	<20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
	<ao_z9QTJC_q8gH0v@ashevche-desk.local>
	<178813177252.2788519.10940489053707901297.b4-reply@b4>
	<apUo4afCh5LhUqIO@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Mon, 31 Aug 2026 10:10:25 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Mon, Aug 31, 2026 at 12:16:12AM +0100, Jonathan Cameron wrote:
> 
> ...
> 
> > > > +	device_for_each_child_node_scoped(dev, child) {
> > > > +		if (st->num_channels == ARRAY_SIZE(st->channels))
> > > > +			return dev_err_probe(dev, -ECHRNG, "Too many channels\n");  
> > > 
> > > Okay, this actually better to be ENOSPC
> > >   
> > > > +		ret = fwnode_property_read_u32(child, "reg", &ch);
> > > > +		if (ret)
> > > > +			return dev_err_probe(dev, ret,
> > > > +					     "Missing reg property in channel node\n");
> > > > +
> > > > +		if (ch >= AD5529R_MAX_CHANNELS)
> > > > +			return dev_err_probe(dev, -EINVAL,  
> > > 
> > > and ECHRNG is here.  
> > 
> > That one is getting rather creative even though I guess the description
> > does fit rather well.  So I don't object, but also feel -EINVAL is
> > probably good enough for an invalid property value.  
> 
> But missing property message propagates the fwnode return code (which will be
> EINVAL IIRC). So the above is not about missing property, it's about wrong
> channel. Note, I have checked uses of ECHRNG in the kernel, and many of them
> are fine with the suggested one.

Fair enough and works for me.  We can add this to the list of things
to tidy up if we happen to be touching other code that deals with
wrong channel numbers.  Not something we want to generate churn though
unless there are far fewer instances of this than I think there are!

Jonathan

> 
> > > > +					     "Channel %u exceeds maximum 15\n",  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
