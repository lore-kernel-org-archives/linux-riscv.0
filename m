Return-Path: <SRS0=NEFo=63=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60218CA90AF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 May 2020 14:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2012064E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 May 2020 14:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jiJuL+SP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0MdU5zsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB2012064E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LhTGtE9aNa1E4aGG1scaA3MumgE7alH63VhjMVYVGyY=; b=jiJuL+SP4ZOr58lMbJJ5YCx/l
	jeBtQZX+xBd1yup7qsWHNbh3AIRKeIlXnniIZGpQoYBGDXErjC6vfXMOj8a1Si1kznatjIvbzEFfw
	HPgHX/xnK4OqpQ3ECMC7lrBzGOszWWVsEmA2mqi0hk0XifUK9sQPgsJ7mxWfQ/cRyMjjRugYz2aXE
	UouYSKpP13C4AmOU5JXXbWEjAZA5o872WwMC+maJUeMaGTsFNsrrO78ZguWInbqocUokpGD58RXO6
	qGZYvY/0iOtZ+gJU8GVdnzWU9U6qN2SYC6yNdwXJ3/jpJkXvqolp3BFZU1Q19I3tFuikTsV9FBz5J
	a4Z7Paxow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYs04-0001Ir-0R; Wed, 13 May 2020 14:04:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYryZ-00006q-AC
 for linux-riscv@lists.infradead.org; Wed, 13 May 2020 14:03:18 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A18692064E;
 Wed, 13 May 2020 14:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589378590;
 bh=Eufhx3dlqqgouxXOOXWIHlrYL0mU5lBnSfOCmIEp3Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0MdU5zsTd7ve9RlyN3XfHy/AJ43Nj4J4J62DwwgSTzTcA8x8VxoDauR/tEsXmcv7q
 NJ6UyyO4gjb2WaPXu01c6Y8jNGvZwZMdKq7Xhbg3rNxR6otHnF9G5IlB1aQ+fVnwxd
 tuOOeeuhw+QHhj+kPL4w7M336rEi/oQ8bppMd8Qw=
Date: Wed, 13 May 2020 15:03:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] spi: dt-bindings: sifive: Add missing 2nd register
 region
Message-ID: <20200513140307.GG4803@sirena.org.uk>
References: <20200512204543.22090-1-robh@kernel.org>
 <158937185132.39109.17103954100758193517.b4-ty@kernel.org>
 <CAL_Jsq+KfngSTEnP3eh6Zr9H4GUuSbyZCGXs=skbwQK0j4ZJnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ulDeV4rPMk/y39in"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+KfngSTEnP3eh6Zr9H4GUuSbyZCGXs=skbwQK0j4ZJnA@mail.gmail.com>
X-Cookie: Long life is in store for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_070311_390907_81E19520 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--ulDeV4rPMk/y39in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 08:02:14AM -0500, Rob Herring wrote:
> On Wed, May 13, 2020 at 7:10 AM Mark Brown <broonie@kernel.org> wrote:

> > [1/1] spi: dt-bindings: sifive: Add missing 2nd register region
> >       commit: b265b5a0ba15b6e00abce9bf162926e84b4323b4

> You missed my ask for an ack. This is a dependency for patch 5.

Ah, there was no cover letter.=20

Acked-by: Mark Brown <broonie@kernel.org>

--ulDeV4rPMk/y39in
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl67/hoACgkQJNaLcl1U
h9AiNAf/VxSFKe5eGeiXNh8NQ9o1DuI+ryYYh8J5t4bHHaX/ukfZxOjzM1emHxVY
dK91QCGiu/6HrZOrx7SNr/ZsJaSqIHg7le2mJWvu4g6uJ/SaPTKCGjUfL5gPeG28
FHa34V2fwOUoRil6nEiHnvrbQTQQmtwMw13zeYi38ltLK6qchlfCmFT7gjiYHmtm
netlxcnM2YKr/vblKt1hnDTffvAs2THEpNh8lJ0bA7IBEWsdRPH8PVROjIaBQpME
JzEW1cFXZTEeuuiNkYS1GMk/ShIxSiD19aAhfOzbomVXqMjenusxBN1jAd5VfoA2
9TnqOxwFFTKo84Gi3jhJlFaTkx5IRQ==
=KsV3
-----END PGP SIGNATURE-----

--ulDeV4rPMk/y39in--

