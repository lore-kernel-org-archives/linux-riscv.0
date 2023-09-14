Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A1EEAA40
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB3y1/AB7X8ccmcBVINJx1PBJtq1gB9Q8dhzJxT7/QY=; b=FlZK3XGRax/ny0Vdbh6SmiBa/a
	26voPXyXqy8jIeYpxd0lOAFsBRfO3MaUlB3idVd1itgN6YaYu14Z9aSV/Wbl+qwGR5mSHnUu2oQLY
	1ZExBBOtwkcmH1KZBsqQgTMlI+eV2jG1UYdNtgqfbFje+A4AbKFetji2STBTDvDVthKziCjrMIzzJ
	PoRXxlRx13lS6HahtcksZamb9XCA9kQgq+r5Ao0RIUH8M+O/kK93eaHSMw7yYRYJ749lDD7JIIh37
	0hqieYSPbLRMiAAtvB10jVt0zyCPjfSx+jN6dzcLUvtRDi5fzWSkLyBIbHTXXSRBIHm/P3xQ1G5pG
	cQdZqzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnAp-008c4V-1I;
	Thu, 14 Sep 2023 14:18:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnAm-008c3O-0E
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 14:18:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B7AC0CE26FB;
	Thu, 14 Sep 2023 14:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE83BC433C7;
	Thu, 14 Sep 2023 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694701100;
	bh=O0Vdo75uGuQ70r2R2tPq6kz4JrAy5xHqML/ZtLJgtv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmAOOQtmHbVUufqL3SindTElEfz7B4/drHCv7tui7JsAlw3gKPsTtr3iHKt3MeeK9
	 HgbLY9d/0tE3N0sIXPQNuf5kjviENlSUtiK7v24bq3uvjZsXjwLQHZngjOINy65MSa
	 BPz5FeozhwN+XhFRal2oHtg++2DC+veSc10+M848z0xgnq5eoMHLmaDivQ58/v+qft
	 TMYboF0fIU9XV0M3tormeFx4M/s4qrXbmZEomLZn6cKnU4LdGIlAcTWWGOudsWHSA1
	 lzYnZ4vG9t6ESnD0AF/CWFhNAjWQgRfYu+36UCly8mTZ3CpQshY1G+qF4ivVRsEU40
	 ZDk2Cf+eRZkew==
Date: Thu, 14 Sep 2023 15:18:14 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Samuel Neves <sneves@dei.uc.pt>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] RISC-V BLAKE2s Vector implementation
Message-ID: <20230914-squad-ripping-e8c98e2d336b@spud>
References: <20230912115728.172982-1-bjorn@kernel.org>
 <20230914-roaming-plunging-948c78d9831c@wendy>
 <87pm2kap1p.fsf@all.your.base.are.belong.to.us>
 <20230914-float-uneven-7cd1a18b3978@wendy>
 <87zg1o3kpd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87zg1o3kpd.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_071824_453061_BBBA6B36 
X-CRM114-Status: GOOD (  20.62  )
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
Content-Type: multipart/mixed; boundary="===============4013658974914627673=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4013658974914627673==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BoFtOlqfEEGc0sg6"
Content-Disposition: inline


--BoFtOlqfEEGc0sg6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 04:15:10PM +0200, Bj=F6rn T=F6pel wrote:
> Conor Dooley <conor.dooley@microchip.com> writes:
>=20
> > On Thu, Sep 14, 2023 at 02:59:30PM +0200, Bj=F6rn T=F6pel wrote:
> >> Conor Dooley <conor.dooley@microchip.com> writes:
> >>=20
> >> > On Tue, Sep 12, 2023 at 01:57:22PM +0200, Bj=F6rn T=F6pel wrote:
> >> >> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> >> >>=20
> >> >> Hi,
> >> >>=20
> >> >> This is Andy's kernel mode vector V2 series [1], with my BLAKE2s
> >> >> AVX-512-to-RISC-V translation patch appended.
> >> >>=20
> >> >> I've tagged it as RFC, since Andy's series is still not in-tree yet.
> >> >>=20
> >> >> It's a first step towards a Vector aided Wireguard! ;-)
> >> >
> >> > This has the same problems as Andy's stuff & doesn't build properly =
for the
> >> > automation. What is the plan between yourself and Andy for submittin=
g a
> >> > version of the in-kernel vector support that passes build testing?
> >>=20
> >> I'll synch up with Andy! I'm not even sure the blake2s patch should pa=
rt
> >> of the "in-kernel vector" series at all.
> >
> > The in-kernel vector stuff should come with a user, otherwise it's dead
> > code :)
>=20
> Sure, just so we're on the same page; Patch 3 (Vector XOR) is a user
> from my perspective, no?

D'oh

--BoFtOlqfEEGc0sg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQMWJgAKCRB4tDGHoIJi
0mSZAP9QxZxEOa2w5PdNwZc4V1YJq0no6zTaa5YmzIbEImXKBwEAzXGzM8jb/VBR
mo1rZ4gmHUV8MTurBVpK8FYf9j+bLAo=
=vx8E
-----END PGP SIGNATURE-----

--BoFtOlqfEEGc0sg6--


--===============4013658974914627673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4013658974914627673==--

