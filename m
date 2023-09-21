Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B79DCD5BDE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehYhnksCjShpU5HFYx+8FBaDRtU8GcEDtQaKj7nmWbs=; b=4lQS1tmiilAybxoSkeD+jAZw9G
	VKsmlhnsLPyrhY4EOzakxYhz/5qvxHeaCfbVX6z2wBQjNX2IVhKa3Ht24dh/YeZvCbVEJ4l6lmAxR
	xOML3RRsjkTvwPzxOI9mSp/313SRwAkQtnaUD0u8qRm7+ht6tAbeOuBysjp9/zuRE3ib9OL3MZrff
	GIagcQwDpJ2xrY9g1XUtlAL50zIC6eZgmPMlQUEfk2Bmj5DTvnqQZGxfTSFdg4BFqQEfmt+rOmNmz
	YU6mVvw5DF//v+oOX3OwxQGox62SIvgIWMv6NF3afnZ1D8BKoZdkrwYevidGRZJQ4jSsMnDA1EiT8
	FgWSqLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjIS1-005yDV-3B;
	Thu, 21 Sep 2023 12:06:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjIRy-005yCa-1D
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 12:06:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 521DBCE21BB;
	Thu, 21 Sep 2023 12:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484CEC4DE17;
	Thu, 21 Sep 2023 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695297986;
	bh=ZKBejLxpxLiP18j3xN/sgh8MY7/Ts1j/7fzM5Nb1mY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pY3IDSRXGoG3UnWuDSwjo5IIoIuQv3Dp8HhxtdSqoNg06dpPB6csEpUbUaTr4W5Xn
	 iUHEvjjr35PPoC4yqvuWT1HzE7GBE0v70iDXacaXv0mO5fJPw6eNNSsanqKuoCTQuR
	 9cN18zojqgdLlsFFejBcMGSEdjM7+vfmzPkQ3pIskBVlIS8K+/PoIRpSAYA/d92Wvs
	 u2ITLuagYQWGH93mfQ118NaARWZRfPRbxxaPvUdJaQB6l392Az9TUNpG6RDeGiyF54
	 MOJc+igrStR2WnEyB9BnAHsSw9oicyCcXIVGl+oJlrItLAmpMQ+W2XKvUpiD1aqFu1
	 TAsZe7IIZbguw==
Date: Thu, 21 Sep 2023 13:06:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com, guoren@kernel.org,
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v2 09/11] riscv: dts: add initial SOPHGO SG2042 SoC
 device tree
Message-ID: <20230921-fdc47972b1d3caa685f2a164@fedora>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <ffe6a61a8879232aea7b86ff8aee5d681c6bd287.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-financial-declared-7b4b4baae517@wendy>
 <CAHAQgRBmUtyz-U+1Fu9qdvyhMuSzg+o4MMbTV9duUXsoSoPqUQ@mail.gmail.com>
 <20230921-d2db829b289c937081dc8a72@fedora>
 <CAHAQgRDLmKJQ1sp76q4s7P4E_=nYuw199ceGCR0LYeq3331tLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHAQgRDLmKJQ1sp76q4s7P4E_=nYuw199ceGCR0LYeq3331tLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_050630_774975_55CA396E 
X-CRM114-Status: GOOD (  24.87  )
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
Content-Type: multipart/mixed; boundary="===============3002245169936768245=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3002245169936768245==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3kYZRnlz9oHCd92h"
Content-Disposition: inline


--3kYZRnlz9oHCd92h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 06:27:09PM +0800, Chen Wang wrote:
> Conor Dooley <conor@kernel.org> =E4=BA=8E2023=E5=B9=B49=E6=9C=8821=E6=97=
=A5=E5=91=A8=E5=9B=9B 18:15=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Sep 21, 2023 at 05:56:28PM +0800, Chen Wang wrote:

> > > > > +
> > > > > +/ {
> > > > > +     compatible =3D "sophgo,sg2042";
> > > > > +     #address-cells =3D <2>;
> > > > > +     #size-cells =3D <2>;
> > > > > +     dma-noncoherent;
> > > > > +
> > > > > +     aliases {
> > > > > +             serial0 =3D &uart0;
> > > > > +     };
> > > > > +
> > > > > +     /* the mem node will be updated by ZSBL. */
> > > >
> > > > huh? So these are random numbers below? Either put something useful=
 here
> > > > or delete it please.
> > >
> > > The memory for SG2042 is not fixed, the bootloader will detect memory
> > > installed on board during booting and fill the actual address and size
> > > in the memory node. The comment " /* the mem node will be updated by
> > > ZSBL. */" is telling this.
> >
> > Yes, I read the comment!
> >
> > > We write memory nodes like this to make them act just as placeholders
> > > and the value is by default written as zero.
> >
> > Why knowingly add something that is wrong, rather than omitting them
> > entirely?
>=20
> We learn this from arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts,
> it writes DTS as following:
>=20
> ```
>         memory@0 {
>                 device_type =3D "memory";
>                 /* rewrite this at bootloader */
>                 reg =3D <0x0 0x0 0x0 0x0>;
>         };
> ```
> So you mean we can totally remove the memory nodes in DTS and make
> bootloader add it by itself? That sounds a good idea, I will have a
> try. I used to think memory nodes are must-have in DTS.

AFAIR, the ones for the d1 based systems (like the nezha I have) don't
have a memory node at all.

--3kYZRnlz9oHCd92h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQwxuAAKCRB4tDGHoIJi
0vvKAQCrC0C9bXbaFXJHj7tbnfJboS8Mfb3B4Jj75CM/Q4JbpgD+L0gLJUvWQidi
1Jm9pI5/wQNC7eDOP6U2fe3VvEgK5Ao=
=QS3Z
-----END PGP SIGNATURE-----

--3kYZRnlz9oHCd92h--


--===============3002245169936768245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3002245169936768245==--

