Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE4DC388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 16:46:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276DD2074F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 16:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gbrREvGi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jz1yGbLm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276DD2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/ElMQGwpO3j9vg55Nz7rIEMlHsFMYEws5h+tr77RT/8=; b=gbrREvGifOCsojgmpKPYbslTB
	NePo9bgmyAJAZBmZe42zM00q6xVnyxhxsW0wwdgilQLJQMA+9gnjnoF3ZtEXgA87gz4u8HuHsWYR+
	vWde2Ie0rAYI/ryz5aJSoL9s1WkOR74GMr86KhZLDYFQJOjBWTJGWgpPY8TcDA0gymgUHRra40RZP
	HLQo9vvTcCS3a773e+fs3lIvy+sEeKHKywkATHGPt7PcSxcshYK5Z14R3cTtLcVsQX6TPoFz/nZro
	WMcyGJrhnW3LrQEfUywHc8nucNTwXiR8xqw3Bl5MrpeEtBEnpvhKS0JlRnR05f6Kp1F8sTWVBIoCW
	mjRGO4xWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcAIs-0004sQ-VF; Mon, 09 Nov 2020 16:46:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcAIq-0004rm-VH
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 16:46:01 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8992E2074F;
 Mon,  9 Nov 2020 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604940360;
 bh=Hc1kUA8u+G3SRCoMavf4BNrfi7w15jVZjdFjmr6NKhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jz1yGbLmYqLVDaBDD5wfYnkDkVR9A33JWI1LY91jZJ7j4fGmATeOam5nwB1bcjD+Z
 LoeO5DbCmPHvqpdpTTFvKSKqXi3RGT6Uo5dAi5PYcQ702IdUjdw4awZ91O/XNwME2t
 6ZGvHa6wu9XovDgmpvYhoN1OIg4EyQ9byx3ELLkI=
Date: Mon, 9 Nov 2020 16:45:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109164546.GG6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
 <20201109141422.GD6380@sirena.org.uk>
 <20201109144808.mvttq2f6st7xd7sm@mobilestation>
MIME-Version: 1.0
In-Reply-To: <20201109144808.mvttq2f6st7xd7sm@mobilestation>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_114601_128149_991BA2F2 
X-CRM114-Status: GOOD (  26.03  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============4976994219594881745=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4976994219594881745==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Content-Disposition: inline


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 05:48:08PM +0300, Serge Semin wrote:
> On Mon, Nov 09, 2020 at 02:14:22PM +0000, Mark Brown wrote:
> > On Mon, Nov 09, 2020 at 08:47:10AM -0500, Sean Anderson wrote:

> > > There is a recieve-only mode, but it is not used by this driver. Perhaps
> > > it should be.

> > I'd expect it'd perform better, especially on systems that are
> > apparently struggling for CPU bandwidth like yours seems to.

> Well, it might seem a good idea to use that mode, but there are multiple problems
> you may get in implementing it.

> First of all the Receive-only mode is having a limited number bytes to receive
> at once. It's just 64KB. So in order to implement it you'd need to split the
> bigger transfers up, and feed the DMA engine with smaller chunks one-by-one.

That at least is handlable, even if it's only by falling back to
transmitting when the data grows over 64K.

> Secondly the Receive-only mode will make the DW SSI controller to constantly receive
> the data from the SPI bus and to put it into the Rx FIFO. So your DMA engine will
> have to keep up with extracting the data from there on time, otherwise you'll
> end up with Rx FIFO overflow error eventually. The problem will be actual for the
> DMA engines/system buses, which are slower than the SPI bus speed, second for the
> DMA engines with no hardware accelerated LLP traversal support (like on our DWC DMA
> controller). The second problem can be also fixed by splitting the transfers up as
> it has been already implemented in the spi-dw-dma.c. But the first problem can't be
> fixed, but just workarounded by limiting the SPI bus frequency so the DMA engine
> would keep up with incoming data traffic.

I'd have expected that a single duplex mode would lessen the pressure on
at least the system bus - that's the main advantage, and might help the
DMA controllers as well depending on why they might be struggling.  From
the comments in the code there's issues on some systems with TX and RX
running at different rates which would go away in single duplex cases if
nothing else.  But yeah, it's not going to just fix everything.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+pcjkACgkQJNaLcl1U
h9CTEAf+LO8XubB/p+WOZdoLkRQLzS9jVKMHXs0H0rC1r9p2z2zyenxdNF7lwWrQ
XvvSKHF3gVb+aZVaAqFaFz0kGL0TMKkd+vu6Q38Ueb+MD7KUOXNF7ckSZ1ASv+td
Y4YLdX/ISBO5KcXCMZ8McdKtan2wu+X/Qx5uv3vTyG8O+RJKct+Kr65xux7yE2I6
WqEPl/0tY3GcRBsdWxzaoLxorPgyBfprsj8jIGukk0+6QZtMo7ovGZlqPXBVd9Ma
xMMw6AGys9Wq2+HNi/iRoimYhNEqQ5jFOIweOluVNhWaQ1+2ULmMKRqOmBuykYN2
vILe13vdCLSb3PBUF7SPgNbUpdQEpQ==
=vWha
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--


--===============4976994219594881745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4976994219594881745==--

