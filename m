Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D3C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 21:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qayAp8Q2VB89d2nNs3eyPpxlF/2J09NAF/dQtUUfY0=; b=38XX6GxnarOqYfS+QjR64fy4jU
	WWiEahjj9KvtGJNYZ4kCIbkaiiQH2h1OUJuYu7491noOaM1o0BvyZyNdX7z6ZollniFWt5ndBAlmA
	XkepMokZHhZfN1vlxUDc6jNEbwCzrxXHuNGh/kgRY1iQBxNoxr5XqS8jnSwvOladYLSckYMNrF8cE
	Yo26jf+t0VxCGZekV/kkBG+fCwt57ZtiVqwujDEu7hmMFhsMd0nZCo6Xww9zngKEg2JGMpU7hF0Ux
	NGolv/6tPJN1i8Z756mqYA/MDHHgNkSktrSI+rWeHgqzYKcJfE6MfsBdnauKSIxysgQpKgqv3MxXn
	0ZKQ/M8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRggn-00GT74-9M; Mon, 13 Feb 2023 21:48:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRggY-00GT4X-7j
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 21:48:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 453D8B8191D;
	Mon, 13 Feb 2023 21:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553BCC433D2;
	Mon, 13 Feb 2023 21:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676324906;
	bh=dBzZ22jsdFdLdurrZC+H3eiRkSsrYNJRRtthTIGeCIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2XW7HexLTB5MVK0Hwhu22aA+t69bH1cBXSFHpSSqaAj+B2RC0bzXo7YfRou+xI2p
	 B6CQtYkUUg3Y1pd4fBhCG0ZY8G7OjTa+6np/+RNPvOV9rxH5v3rtPTWIHgihKfxrce
	 v240jfXFVHUvG1Ghumxjf7b755JvuUsL+jhxsf1gdfeik4Rhkdsi6W76RC/8EYHI8X
	 zxvAV0pXccwlgJZGMjuENyYfyRwhWIYXLk/sjJU7GyKG9aTyqfeLwEYucnPFuGw40e
	 suvWZO1KlLghebkoxIP+/wuuAxBUxYfw2LzoRSC2hLu/BVNwamDye0B3HMfeF4Ecg+
	 fgUiY3jT/GQhQ==
Date: Mon, 13 Feb 2023 21:48:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 3/3] riscv: configs: Add nommu defconfig for RV32
Message-ID: <Y+qwJYI28c2fxnHU@spud>
References: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
 <20230212205506.1992714-4-Mr.Bossman075@gmail.com>
 <Y+qUVbhFUrb289xG@spud>
 <cd0faa52-fda9-7b8b-7ce1-8ad33236c430@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cd0faa52-fda9-7b8b-7ce1-8ad33236c430@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_134840_090245_3BF7B7DB 
X-CRM114-Status: GOOD (  26.08  )
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
Content-Type: multipart/mixed; boundary="===============2607640115926615468=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2607640115926615468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mzztALEEGMKUoCod"
Content-Disposition: inline


--mzztALEEGMKUoCod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 04:44:29PM -0500, Jesse Taube wrote:
>=20
>=20
> On 2/13/23 14:49, Conor Dooley wrote:
> > Hey Jesse,
> >=20
> > On Sun, Feb 12, 2023 at 03:55:06PM -0500, Jesse Taube wrote:
> > > 32bit risc-v can be configured to run without MMU. This patch adds
> > > an example configuration for RV32 nommu virtual machine.
> >=20
> > There's a patch on the list (I think it came in after you sent v1) that
> > pointed out that the rv32_defconfig in the tree is not actually used if
> > you do `make ARCH=3Driscv rv32_defconfig`, but instead a make target is
> > used.
> Oh that's interesting. Why is it still int the tree?

See that's the thing - the patch was deleting the rv32_defconfig file:
https://lore.kernel.org/linux-riscv/20230205133307.1058814-1-guoren@kernel.=
org/

> > How would you feel about replacing this final patch with the
> > below? That way rv32_nommu_virt_defconfig would always be kept in sync
> > with the rv64 version.
> Sounds good! The only gripe I have is the nommu_virt_defconfig is not very
> minimal, but that's not my problem.
>=20
> Thanks,
> Jesse Taube
> >=20
> > Cheers,
> > Conor.
> >=20
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 7123511d977c..785d438ae5fe 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -173,3 +173,7 @@ rv64_randconfig:
> >   PHONY +=3D rv32_defconfig
> >   rv32_defconfig:
> >   	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 32-bit.config
> > +
> > +PHONY +=3D rv32_nommu_virt_defconfig
> > +rv32_nommu_virt_defconfig:
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config
> >=20

--mzztALEEGMKUoCod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+qwJQAKCRB4tDGHoIJi
0k4ZAP4st6xMRa7BA43WyY+2Q6Ct8iGSkxtiWTM2xjYgFkLVjAD/YtuwVzSWD8ve
u5yDuBXniGRnpj9FQ+iAnX9FD46z6QU=
=v6Ue
-----END PGP SIGNATURE-----

--mzztALEEGMKUoCod--


--===============2607640115926615468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2607640115926615468==--

