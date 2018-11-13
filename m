Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908E8C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 22:38:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F45B21780
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 22:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WaPlRop/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="b5rsv2bG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F45B21780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QAQ0wI6TIKQ0syyR5LKghUijufGwPGDLyZRlT9IEDB8=; b=WaPlRop/HkmKngyyssYL6iBhz
	huOXBlAqYXKoYu5Jw2rjBwqr1FcMNgznnrvpR72VUmUuBn4Rnv1tsiOGeI/6vayTfng3pryHL/JmL
	acx3Ycv6+9HvL7OjSk2PVt7/70UHCKseW8BqGRT5g/Abm1jTYmXuQ/alMl7VMBlgWiqg+8n63WSi3
	nLF7mSdr1GKL8s0H2wSNEVzQgdUlQ/srSeZZqE5KM2IM04BHE23RwVGGA5ZTu5nm1MpRyGmzQN/L2
	V+Zy4v9rW/PM0tjbWTr0rTrG8qrQUw0OMqxoFuo/62K6gOELvsiQQuMa8TC4DkRu+lN2HlSC4uYuZ
	14LwXqFtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMhKZ-00075j-SN; Tue, 13 Nov 2018 22:38:47 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMhKV-00074q-NJ
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 22:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FRDSffouTrTRxXmIGdA+uMp4NWeufgJXyoHM30q2deQ=; b=b5rsv2bGfg+kFwyUEuaqrVva2
 paHcxBVc0XoIog1Z/pCHzGTfUFrTr0BhmifUw61d/hkNNSLSbhswO+TbA8AHbGc6SHyQB0+f1Cm/w
 fXDPFmiL9r8cBAoAziNVwWM5Ar0U8WhcqNfBgbVEhkADx7Xq2OlvhthlzL8hnL65vxDhY=;
Received: from [64.114.255.97] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gMhKG-0002hr-9b; Tue, 13 Nov 2018 22:38:28 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 5BFD7440078; Tue, 13 Nov 2018 22:38:22 +0000 (GMT)
Date: Tue, 13 Nov 2018 14:38:22 -0800
From: Mark Brown <broonie@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [RFC PATCH] spi: add driver for the SiFive SPI controller
Message-ID: <20181113223822.GN2089@sirena.org.uk>
References: <20181112142736.15009-1-kernel@esmil.dk>
 <20181113183527.GG2089@sirena.org.uk>
 <CANBLGcxF-WgsBVFHf4jGRR+Ox2vz=ewzhwGP1CZX-R5HpDAVBg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANBLGcxF-WgsBVFHf4jGRR+Ox2vz=ewzhwGP1CZX-R5HpDAVBg@mail.gmail.com>
X-Cookie: No Canadian coins.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181113_143844_670406_1D5E39DA 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8805375282602284790=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113223822.iHZe-1CyR3V-RTDk1k_1oOMtX8ZxRYdmroQBi-OPrUE@z>


--===============8805375282602284790==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HxQt9wRz9wbL5Edg"
Content-Disposition: inline


--HxQt9wRz9wbL5Edg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 13, 2018 at 08:48:43PM +0100, Emil Renner Berthing wrote:
> On Tue, 13 Nov 2018 at 19:35, Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Nov 12, 2018 at 03:27:36PM +0100, Emil Renner Berthing wrote:

> > > I know the discussions about the sifive devicetree compatible
> > > strings haven't come to a conclusion, so I'm sending this as
> > > an RFC to get some feedback on the rest of the code.

> > I've not seen any of these discussions or earlier versions of this
> > driver so I've no idea what's going on here :(

> No, sorry. This has been discussed on linux-riscv for other drivers
> like the uart. See my last answer.

> > > +Optional properties:
> > > +- sifive,fifo-depth          : Depth of hardware queues; defaults to 8
> > > +- sifive,max-bits-per-word   : Maximum bits per word; defaults to 8

> > If the hardware isn't fixed yet making these enumerable from the
> > hardware would be good...

> Agreed, but unfortunately this is already in the FU540-C000 chip on
> the HiFive Unleashed board sold by SiFive.

Pick an unused register you can read safely and define that value to the
default :)

> > > +/* for consistency we need this symbol */
> > > +#ifdef REG_FMT
> > > +#undef REG_FMT
> > > +#endif

> > We do?  For consistency with what?

> Below all the register offsets are defined as
> REG_<register name>. This is is a pattern I
> copied from other drivers, but here we have a
> register called "fmt" - hence REG_FMT.
> If you have a better pattern that doesn't clash
> with REG_FMT please let me know.

You shouldn't be using such generic names for your internal identifiers,
add a prefix to everything.

--HxQt9wRz9wbL5Edg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvrUlsACgkQJNaLcl1U
h9Dh5Qf/VUw8Ra+KYUjDwFvhBTQ/WLhdXFh/koVtPuDeo/mLnyehCCyuEv/oSrll
0udob665plGSH3CYnEz4V9b5tmNdSJxp07aKox6x89MFVLEX7uvGcKBn3H5fWEs2
DVuySHjWrLqii2wO0CMIfOl36cv98tXKrY266JrfjDcOf8hCb/anRAo3kVpWjWb4
Xsu1swOFX21MIYzQvoSveObgSveQq6uKuvBZMlcBFvCMUVY3Nmz7txmmJybH/2Dt
1i2G85fW+vNQCnQMziZGIEcrZHimx+xUeW3gofnpedoiYMAFcJ90il6N2tGal4HV
791AgaI0CuowfiED5NUNrWxpANZX9A==
=XS6h
-----END PGP SIGNATURE-----

--HxQt9wRz9wbL5Edg--


--===============8805375282602284790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8805375282602284790==--

