Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C024C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysyBpGr+JQRSYRzpx26Yy2kSInXBIw/zmIN2sFNrPGk=; b=cnwhuJA8HbSI4ui/1kttd3j38z
	A7IEmHB7xOt4y9Xjnf9EV3C4ouf+1p7sCdknfqVHA1Z2Bfebp1pbfqtyrPkafROnM4awA0Al9VZ4p
	phWkV4qqD+3STofFkWe/kEtMsVtzm7f8vqGsJhH+CkwIN86mAkvbxkxdHyN6VCMaeXDcm+HDLc813
	ueH7De5cXlAUu4osjBb6sI665jdzUzQaGBAK1bQmlEOkZJ0QpV1zzRBCSiGDqs8anZ+4CSifPARou
	oxfeYJoLtO1N5vQ81pAjbEoT08jESKzKYfnSxaXsxMVOAimUlzo9ggI86pbyEkJEI2raYqJUfXPFm
	3sfvUkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIMr-005oxs-3D;
	Wed, 02 Aug 2023 20:22:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIMo-005owZ-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:22:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB73261AB6;
	Wed,  2 Aug 2023 20:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BFAC433C8;
	Wed,  2 Aug 2023 20:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691007765;
	bh=kJR5VYhsLcd26FRln9kp7D7T+g0liOZIpeMz7LbRKvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAsVJtmd+xwsfWAoq8Pxa8wmmHJv/sqOdYeyFmPkmEikyIRDrqBvetHVX4F27btYJ
	 zcRk4+X63UL4qPuIkpsGFt3evh6aOmjb1qUcM3zYlDJ1wF/BVYbtnPiF5oHhESxhj1
	 f53TGsl/hAFLGiivG++hzpnko6iqwnuAs507xcx6QCuLE5sL1TK6EBgmGXpVifXSHc
	 UWzW54g3h6bq1VxzK0FFTfEGGKN9oGCRKvB2e53bpW1noyN3+BnshlxSa2aB8Ceu0e
	 h4jc2Lh7z1C8YTKNl/6ir+bzfBSV7kxU+8DYZ58YHvthEFZo3wE1pHvDWXMeWP/5aB
	 FxidBj0fc1gEA==
Date: Wed, 2 Aug 2023 21:22:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: cpu: refactor deprecated strncpy
Message-ID: <20230802-overwrite-casino-491979427162@spud>
References: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
MIME-Version: 1.0
In-Reply-To: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_132246_543632_C22AD3BB 
X-CRM114-Status: GOOD (  12.52  )
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
Content-Type: multipart/mixed; boundary="===============2698655923771474308=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2698655923771474308==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ll5zcIRttVRYEd0J"
Content-Disposition: inline


--Ll5zcIRttVRYEd0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 12:21:58AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>=20
> Favor not copying strings onto stack and instead use strings directly.
> This avoids hard-coding sizes and buffer lengths all together.
>=20
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v2:
> - Use strings directly instead of copying onto stack with `strscpy` (than=
ks Kees)

Yeah, that is what I was thinking of when I decried it as being horrid.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Ll5zcIRttVRYEd0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMq7EQAKCRB4tDGHoIJi
0iONAQDvkdrvxLwjFA4k7Ta7UGh+90nAGAA+VslRU5pB4QrFTwEAxNmnJuahK1IX
UT6wu7/2wDjIFon1o7pctoFyaM/SBAs=
=eYZ0
-----END PGP SIGNATURE-----

--Ll5zcIRttVRYEd0J--


--===============2698655923771474308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2698655923771474308==--

