Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76060C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwgNd103bma3wj7xWpPej86V9lQ0kLCyyExch99JzkA=; b=LJu4M47gzE6Yj7Or+cjoizHsNM
	RGiNNa//CsPxmPFFehla2qWwp5nCRQsglPJqlYnM+5DucGwnxkc3lZurIKf+IJyXXW1mr0mH26ic+
	69LzyPMIQX2+t02JL4bxNFtXZHt/L+bTLfF3AGClW2f9sOTlhqTMxdTDRE0cWUKWnWoe+8WWUUScW
	F2v2Sd8x/Pz/W2uWyfPktuVWNFMMjnigdK+SfGLoM108PU4Lc57OIqp9J+a5UElFXKsnedmuWY9zP
	aLm/0vSWQnyrXmzU9MDNkpBsaHKjUr1jqixXxtUh8XZnp+eVxwdyw+BbVBhPMVUxLTqehyJka+lTA
	KAVnOG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUVb-00CKEh-2J;
	Fri, 12 May 2023 15:16:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUVZ-00CKDt-1A
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 15:16:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9E6561901;
	Fri, 12 May 2023 15:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D97C433D2;
	Fri, 12 May 2023 15:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683904596;
	bh=ItBiuuoHk339tQKWgm8j5U2FpP7r7TgrlJGgcZEAbvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndHJVMMFETLe4lDExw6SIPL4nw6NLJcGJJx1VGPch4V+IeIlg4iU7wCQj/jq2u91C
	 ejH7bJNnnC0Mli8l16zNL8JdbwzRdsZepRinXMNYliQIPfwM7LzErYv+IgxaPF81xd
	 ifh3YRh+xbqVDoqsDHp6cYIcV+L5b8t39x6U55hY7gZYGCHnFQIYSce5UsgWFgZGya
	 LfZeDk5WDtj2QQTZQKJY+guBXsLxBNPWUdcn3/m6dzWrEe3Pg7IN9x33UUfdJytdVh
	 N7w7OwHu7UxHEE665vCtHighM3z125RfaHlkg8XrPV29UXV02lFkytwCmpfkBURRSo
	 bMkqlaye2SY/g==
Date: Fri, 12 May 2023 16:16:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <20230512-garage-slacked-d16268c0726e@spud>
References: <20230511141211.2418-1-jszhang@kernel.org>
 <20230511141211.2418-5-jszhang@kernel.org>
 <20230512-spouse-pang-87f2e579baa2@wendy>
MIME-Version: 1.0
In-Reply-To: <20230512-spouse-pang-87f2e579baa2@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_081637_439888_15ABD615 
X-CRM114-Status: GOOD (  16.81  )
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
Content-Type: multipart/mixed; boundary="===============1786967545986787963=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1786967545986787963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kv6NHahiFFm1mD9D"
Content-Disposition: inline


--Kv6NHahiFFm1mD9D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 02:58:49PM +0100, Conor Dooley wrote:
> On Thu, May 11, 2023 at 10:12:11PM +0800, Jisheng Zhang wrote:
>=20
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinu=
x.lds.S
> > index e5f9f4677bbf..492dd4b8f3d6 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -85,11 +85,11 @@ SECTIONS
> >  	INIT_DATA_SECTION(16)
> > =20
> >  	.init.pi : {
> > -		*(.init.pi*)
> > +		KEEP(*(.init.pi*))
> >  	}
>=20
> This section no longer exists in v6.4-rc1, it is now:
> 	/* Those sections result from the compilation of kernel/pi/string.c */
> 	.init.pidata : {
> 		*(.init.srodata.cst8*)
> 		*(.init__bug_table*)
> 		*(.init.sdata*)
> 	}

Ahh, I see what has happened. This series was made on top of
riscv/fixes, but none of the patches are marked as a fix, leading to the
automation testing this as new content.

Sorry for the noise on this patch.

--Kv6NHahiFFm1mD9D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF5YTwAKCRB4tDGHoIJi
0gywAQDm4p8mpPMSf/YkFLVJPL1Yi98TnShIx2mbVU6fteJ8bQEAzVE38AtBXSBu
Jffr2efCJuttkQXrA/O97rbQmBfzJwk=
=rZde
-----END PGP SIGNATURE-----

--Kv6NHahiFFm1mD9D--


--===============1786967545986787963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1786967545986787963==--

