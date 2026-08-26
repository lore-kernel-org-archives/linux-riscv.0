Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04FCC61DC2
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qU760iYiF7dSzQSjWfHo3Lfn65d1EnVhRecE/xMaEQ=; b=4+sTgoOwAjNo+khkSZeAt7B6V6
	ELraxzpj1gruvij/AgrrvUqZqIzZQuMNXJklQ2AuguAFXIUgsXs+kfxvEvTuwkLTw71WZ9yIhWFG5
	/R1+c5DQA9DoZ5abvt/Sg8wNTuQ73NorGFnu9u2XLDO0BMX98poPBkVHBWYAENH//JtFIfmtMOcpQ
	jD3vXOw+o1wydOmuIYnEdM1svHkQD6NNFObhHMATGhyfWqDNZellNFrNNk7OXmSRAcZxdd30Q+f3s
	Ve8AovyJyKYSo+HQG9cte7R5zZUPaL/usZEH9155hJEAMnv1DmVYzgYzdwX3l7DBj8rYUm3TiKUK1
	hW7q1TCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9b0-0000000293d-40za;
	Wed, 26 Aug 2026 09:06:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9az-0000000293X-47cL
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 09:06:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E99F742D67;
	Wed, 26 Aug 2026 09:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5671F000E9;
	Wed, 26 Aug 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787735216;
	bh=5Zp9HVJGLJXFioAWmyLaqG8DBEM9eunnr/XLWmrWKqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTGCPmH1YwFWcXRbvM+YXFZr87qYLjoZdA2/ox+EUR6b9fAA6Q551yKKQsNYV3/yl
	 CJmk/6Y0nzoL9PKvOHdXv4COHUtfve8dpZIzk7Sy/DRhbuwO+Sfq3/GS1grxQd2rk5
	 pB0vXBRpq09Xa3r7NCasJ204I0z4vwNDodkcL1B9dF4VdU+pznoQ7kEijQE7sUPFyE
	 poJKOCyA9DCeTXYC444robNUku8AxLZHVEX6a7M4fFlRRfaRIX/V32t/2isC29uy6y
	 EC6fw8Q41ddp0UaOt35Gqz2zJJbTaEELD1+q1fR/pme29LI3TI7M1TbA4gWHGnPv/K
	 hDmjpQtRZ8rHA==
Date: Wed, 26 Aug 2026 10:06:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Ivy Lopez <skunkolee@gmail.com>, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: hwprobe: fix has_fpu() to require D extension
 only
Message-ID: <20260826-coherent-foe-41863a83bc80@spud>
References: <20260825191950.42614-1-skunkolee@gmail.com>
 <mvmfr01l96m.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <mvmfr01l96m.fsf@suse.de>
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
Content-Type: multipart/mixed; boundary="===============8291195538548012727=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8291195538548012727==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="evfZneV6jjhPu/de"
Content-Disposition: inline

--evfZneV6jjhPu/de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 07:53:05AM +0200, Andreas Schwab wrote:
> On Aug 25 2026, Ivy Lopez wrote:
>=20
> > The kernel never supports F without D, since D depends on F. As such,
>                             D without F

|The kernel never supports F without D, since D depends on F. As such,
|has_fpu() checking either extension with '||' is incorrect: it
|reports FPU support when only F is present, which is not sufficient
|for D-dependent state save/restore, and weakens
|RISCV_HWPROBE_IMA_FD semantics to "F or D" instead of "F and D".

Thinking about it, this whole thing really is not right.

> The kernel never supports F without D

This is actually correct, the kernel itself doesn't support doing this.

> since D depends on F

But this is not the rationale, the rationale is simplicity of
implementation etc.

> As such,
> has_fpu() checking either extension with '||' is incorrect: it
> reports FPU support when only F is present, which is not sufficient

And this cannot happen, because the kernel will not enable F support if D
is not present, it clears the relevant flag during devicetree/acpi
parsing.

> for D-dependent state save/restore, and weakens
> RISCV_HWPROBE_IMA_FD semantics to "F or D" instead of "F and D".

The reason I would cite for changing the is matching the expectations
set elsewhere in the kernel, rather than impact on userspace or
behaviour, since F without D is not possible so there's no potential
impact here at all.

Cheers,
Conor.

--evfZneV6jjhPu/de
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao6srAAKCRB4tDGHoIJi
0iABAQC7qU1KJAa0TNawlU7Zt7hFd/iodzc7RI1QT19YcqvKtwEAsG8sUebC6w8O
0RcbM2eEtgPYhDRzz9r4+C78M/8psQE=
=9uBQ
-----END PGP SIGNATURE-----

--evfZneV6jjhPu/de--


--===============8291195538548012727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8291195538548012727==--

