Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D22606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uNamtvkr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anQ8uJbK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gv0xmYPte+c2kLS6XmqoJ3MvLk5h0QeXCELwysLzBnI=; b=uNamtvkr7bVWJYB6SRBVb+ROEL
	j2u2NwLDYTP59+ChhVEdUjCdY5Uqj8naOA4tfGBcCHeank5jMzP723Ln/jAva/Avw3bb7XAOHJ4Ja
	s7RWxSsuMMpU/EGeIBCEHFoAPkPZT3oGLGi6bJq31gDH49i4mrUTdNswlWjSjaKnjmQWxm/RHnd9P
	S8GLBAoffKH4nelh3LPpW7B6up6VAVhEUr5hdyqaasCLaDHR+LbLPAG8Z8Pm/USSqzUK7abt09pe1
	ID5Jy5Kydl/rT7WBtpBFCVy1Byju7Kl1Uwa7/YIH5C6uY2XcH5Dzp8OMi+4lrXozVeh7tbZE2m5xy
	zz48mtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYu8-0000000AncX-2Elg;
	Thu, 12 Nov 2026 17:48:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYu7-0000000AncB-20GE
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 17:48:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F17F40766;
	Thu, 12 Nov 2026 17:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DCA1F000C4;
	Thu, 12 Nov 2026 17:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794505687;
	bh=dJGiQetIHbX3as0TuDaMvVbVCAeT6MoF+8H6BEDLMFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=anQ8uJbK8rPg585XVLaNrJkPYarEORnUTJwMzHfRUoE9iLw/md2ZNg/Qu7P7KucXS
	 UH3FsxQWthpGXaKvGJRc9x+68SImM5CwX1R08wUgwddecPu6cYOpWwGaJ+vRs2xnyU
	 3d2s1cdRDBV3q+5N+HN3+Ulk4FDerSNlImbKorsF4pFEZo4M72UCP2XPX9ImKSB7DD
	 TcsxksvFkHLXDwKQWWQvAzxA80z+/YDnCGq6zMw0pFCttcLaN3Ul7ZYetDHriS+FZd
	 zMtwh8qy5DVJOg6iUvH+9W1p0gilWBZu5xDTNXIhJK0yM2aMs+EmySqNit+zVQDt08
	 +Rwu0L9ri857g==
Date: Thu, 12 Nov 2026 17:48:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"asrinivasan@oss.tenstorrent.com" <asrinivasan@oss.tenstorrent.com>,
	"chen.wang@linux.dev" <chen.wang@linux.dev>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dlan@kernel.org" <dlan@kernel.org>,
	"fustini@kernel.org" <fustini@kernel.org>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"inochiama@gmail.com" <inochiama@gmail.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"junhui.liu@pigmoral.tech" <junhui.liu@pigmoral.tech>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"mpe@kernel.org" <mpe@kernel.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <20261112-nutty-sculpture-79ef0610ab4f@spud>
References: <20261111-paralyze-ellipse-dfc194dbe39f@spud>
 <1605ed3f-8078-4ea6-a3a5-b4a3227c0961@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1605ed3f-8078-4ea6-a3a5-b4a3227c0961@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3225602844185786644=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3225602844185786644==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmXmMzYYtSgWjbEt"
Content-Disposition: inline

--zmXmMzYYtSgWjbEt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 03:44:24PM +0000, Aleksa Paunovic wrote:

> >>> MIPS has it, as per their patch[2]:
> >>>
> >>>  - gf,mips-p8700-aclint-mtimer
> >>>
> >>> Note that MIPS have mips,p8700-aclint-mtimer in opensbi.
> > /sigh. Aleksa, can we sort this out please as part of whatever revision
> > is made to the mtimer patch in your series?
> Right. I was hoping to address this in a separate OpenSBI series
> by extending the corresponding drivers with the new gf,p8700-* compatible=
s,
> without touching the mips,p8700 ones that are currently in use. Does that=
 work?=A0

Pretty sure that Rob said not to add the "gf,mips" compatibles for
things that had "mips," ones already and I would put this in that
category.

--zmXmMzYYtSgWjbEt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavX7zQAKCRB4tDGHoIJi
0nbAAP9WAex5D/k3nhtu5yovuBxVX6b+28SKurpmeRZBcoJL/wEAwnhPWFVHHAF7
IFlKj4079gOnDxMitVEtHvPcOupclQk=
=E7RY
-----END PGP SIGNATURE-----

--zmXmMzYYtSgWjbEt--


--===============3225602844185786644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3225602844185786644==--

