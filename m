Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969F7CD4F5E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJNUo7Cj0Gixj6LFS3u8hun29m5ejzfb3Kldrd3Jq80=; b=XMEsqSRysafg6Aki0MpCGXS1Ki
	XXdntSKskU0UfCc1/8s8kkyvwyZTms7ZTo5O8bSHo9YQ8j7oqQT4TeXEsejYwfN92VyhuqTgiReAX
	NG0uyTvJMF7LryaBYlvUFWvbif+QvH9iij9lKvn+eVo6RMj8K9ajSnMOz57cywMVsmF1FNRoVgHWw
	RQFhc7+IIx+CWMt+INP8nkDcyvNe72z/DJSGoWxFJzxj6V6o31RvQzHm/VYacE2P88nOiESZor+qb
	Ut3SVlrCcpJn7Ou4l9geJyl620OgbgvZGil0UwHylGZwqWuEOD2Kfl8UTw+EiFMEvT9qyzjpJAtuZ
	brjVu9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Yq-00000007SP5-2yRD;
	Thu, 21 May 2026 10:23:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Yp-00000007SOV-0jSz
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 10:23:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80308601F4;
	Thu, 21 May 2026 10:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB85C1F000E9;
	Thu, 21 May 2026 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779359006;
	bh=1XLqmK+7BKBioELVqL+LxlYtx2Up1tgCbtIMoH8w3eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WwFAbBK2L35QJ8/re4MZfzHQF9H2m72u/cs6v8IxUrZTF8vAYwp6o7UevOuI4IVZh
	 rwJbqcQPFLl5EWdwmICIi++lFEbSMeUYbzJ41xvzN3Hn2Ilfnd+1wnW/44Yi3aipvs
	 o1mRIm+dw6AtyjvOqEvh4e9scoQ0g3f5okiOwzGrXTZFH6bVYtaf7X6L7nfvEcO302
	 rArmtkH3UD9or+ifvfGS/tMhU1dPiAda0zaJjKme7FtKgG2Fohp53zXRh3hHrOwbIx
	 NDo23AUktY5L6YmWPvcT/Z6u9H7gHCsW/3QH47kQdPZ7eIY7PdOx3iQARRqfvg7RrN
	 BNWG0mjivn42Q==
Date: Thu, 21 May 2026 11:23:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl
 support
Message-ID: <20260521-trusting-busybody-15315a5955b7@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-brink-dealer-d0610c0dbc7b@wendy>
 <177935715446.943957.13292482270209644157.b4-reply@b4>
MIME-Version: 1.0
In-Reply-To: <177935715446.943957.13292482270209644157.b4-reply@b4>
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
Content-Type: multipart/mixed; boundary="===============2761399710632249473=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2761399710632249473==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qI5PxH+3C51E5Bgx"
Content-Disposition: inline


--qI5PxH+3C51E5Bgx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 05:52:34PM +0800, Jia Wang wrote:
> > Additionally, these pinctrl patches should be sent standalone to the
> > pinctrl maintainers, they're likely to go through lots of revisions and
> > a different maintainer applies them.
> >=20
>=20
> Just to confirm =E2=80=94 for v2, should I completely remove the pinctrl
> binding/driver from this series and send them as a standalone pinctrl
> series, while keeping only the pinctrl references in the DTS?

IMO yes. And cite a link to the pinctrl patches in your cover letter.

Probably you're better off submitting v2 of pinctrl as a higher priority
anyway, since a) the biggest changes are needed there and b) the dts
changes depend on a clock driver/binding being created.

--qI5PxH+3C51E5Bgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag7dGAAKCRB4tDGHoIJi
0pEhAP9G/MtfS0MgoId8t3zIL/SxwWheoiCd4xseOlXWShSEhgEArKIHxRB+JF6M
YzhEFU7vbS7mw+u51coQ+plNB5d+YQY=
=esTN
-----END PGP SIGNATURE-----

--qI5PxH+3C51E5Bgx--


--===============2761399710632249473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2761399710632249473==--

