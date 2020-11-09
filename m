Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C9AC388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:21:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09BC206C0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lBFZUMiy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IN9SWXh1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09BC206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Khhzh7PMYCG4WJqhwp77VnHIR+UUtVGmwMWsHlamEgA=; b=lBFZUMiylQ3PZK2I9Z58BHtsY
	LDnO2uNAiwjo0X5WmsNS2L513oRyGNGRJQsgUI5p5jZCV+82d0RlTV6xzoB46SM0MtUSJON1UaIkg
	7UQO0vDcMQth+lrYT2LUH1M7a7U62X5Z5FkoCocXOGoa8Qb217h9zAO/9KPflgbvLZ5p7RLTueUxV
	NAqJgF1zT7e7i1q6eHZFTvR/Lod/m2etTpDjFywIuCf2g6Gb1WtoxWLOgg4jHAe5DiSrPDbl/izB9
	IDvJwa9aD4wa5HpwuMjDkvb8C3c8OY5aOSNNxvL68tj0WTJk8LmEC7VngUIAQyUFfYPA3XON+jhXu
	at9MQHuBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcDf6-0002pB-Vo; Mon, 09 Nov 2020 20:21:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcDf1-0002oF-Ef
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 20:21:11 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 082B7206C0;
 Mon,  9 Nov 2020 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604953266;
 bh=Zq7Fbdn0fFFAbEzszqLGpAfUjcAlRNEacTRppqvU97c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IN9SWXh1Sb4hz8tVxGQ/oDkR/oGcLVgf8+gtHulU7q2TLM+Xuk6+8l8WAeeQNmUa1
 E9Fq4Bmd7n8EAneNIiWhrywuN9PXo2HE4+ENwhfhQFl8o4i7oWt8VMdMjdIR/wiaKN
 /74VblrzwN9/HrbQXKoBYVGmCGuLAhEk661967vY=
Date: Mon, 9 Nov 2020 20:20:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109202052.GL6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
 <20201109141422.GD6380@sirena.org.uk>
 <20201109191909.wfuwpddng4rdn4ca@mobilestation>
MIME-Version: 1.0
In-Reply-To: <20201109191909.wfuwpddng4rdn4ca@mobilestation>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_152107_759281_03BFDCDD 
X-CRM114-Status: GOOD (  28.52  )
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
Content-Type: multipart/mixed; boundary="===============5935183554438839605=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5935183554438839605==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ucfHZChuBC0NsER/"
Content-Disposition: inline


--ucfHZChuBC0NsER/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 10:19:09PM +0300, Serge Semin wrote:
> On Mon, Nov 09, 2020 at 02:14:22PM +0000, Mark Brown wrote:

> > I'd expect it'd perform better, especially on systems that are
> > apparently struggling for CPU bandwidth like yours seems to.

> CPU-wise. RO-mode won't help in that case. Moreover it will be even
> more errors-prone for the systems with small CPU bandwidth. As I said

Right, these are two separate issues - one is that the client device
has requirements on the transmit data at times when the driver isn't
defining what should be transmitted, the other is that the controller
driver is using full duplex mode even for single duplex data.  I just
happened to notice the second issue while reviewing the change - there
shouldn't be any code for setting the dummy transmit pattern in the
driver in the first place.

> 2) Rx-only with atomic CPU utilization. In order to make sure that the
> CPU keeps up with fetching the data from the Rx FIFO, we have to
> disable the local CPU IRQs while performing the Rx-only transfers, so
> to prevent the Rx FIFO overflow while the CPU is doing something else.

...

> So in all other cases for normal CPU-based SPI-transfers when
> GPIO-based chip-select is available the safest solution would be to
> use a normal Push-Pull mode. In this case we have no risk in getting
> the Rx FIFO overflow unless there is a bug in the code, which is
> fixable anyway.

I'm not clear why we would have issues with the FIFO overflowing in PIO
mode, especially with a GPIO chip select - even if we're forced to tell
the controller how big the transfer is if we're using a GPIO chip select
we could just tell it we're doing a series of FIFO sized transfers?

> Another possible solution for the problem would be to fix the SPI core
> so aside with tx_buf being set to the NULL-pointer, a client driver
> would provide a default level or some specific value being put to the
> SPI bus on Rx-only transfers. If an SPI-controller is capable of
> satisfying the request, then it will accept the transfer. If it's not,
> then the SPI core may try to convert the Rx-only transfer into the
> Full-duplex transfer with the Tx-buffer being initialized with the
> requested level.

We do have support in the core for creating dummy data buffers for
controllers that can't do half duplex - that's the SPI_MUST_TX and
matching SPI_MUST_RX that I mentioned in my initial reply.  Currently we
always zero fill transmit buffers, the expected semantic is that if the
client driver isn't supplying data that means the device doesn't care
what gets sent and it's not clear to me that it isn't sensible to just
keep that like I said earlier, I don't know how common it's going to be
to need this since most half duplex transfers generally are half duplex.
The whole point with the SPI_MUST_ flags was to remove the need for
controller drivers to open code handling this, it was adding
complication and supporting configuration of the dummy data feels like
it's adding room for things to go wrong.

--ucfHZChuBC0NsER/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+ppKMACgkQJNaLcl1U
h9Bl/wf+LmhUIrwON5He000PAqXl4x2HO04etQKUTjL0S47CfSlurpLTYmYtZx5C
sH6UGjL+b5Dz048YX19u1CD88lSB8LkdnJ9g7ZA19KtygVvdd8b1xHgqahj8+3iH
q0ZADr5mk0Oz5yk79KdsrmMLNrCUTb/dWVWrkSBu0vRBvdImrryJ0nKw8n7lPY+W
J7dFf1fIcZzBVHlSqvTYVVCSd4AIJ16VgZ71qmM+X1Kk0Hn44R85ycq3zNHsng/U
zSUsiZ16/Pf88j3JKM09LAK6qxY6wuyxDHoLjEH/G9HaP03vy3Zh8AuH7Ez2bea/
7a7cILotDDLgKmpOzqRpRCbuUthu1A==
=dMkR
-----END PGP SIGNATURE-----

--ucfHZChuBC0NsER/--


--===============5935183554438839605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5935183554438839605==--

