Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E2DEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2ULRhqauUYpEPLnWA49tGVPXlI/4uB9wmq2rRkfFAM=; b=1pw9PZvTGDm/H8fmr4x45/GkVn
	XOQyGO0VTHbIL/ffOcz0vlXedNRtjBtgRZidVOMFZ9UgOggd0MWqHr9g0C6GdLdSq75Us9U/DCOZ3
	7lOXOhkFBusmRfqgdWOX4z1dRg912hV+B1Jq6sHzjViOk7PTHHRu4Aw2pVPI6mbMRYsGeB4Uj4Dpx
	zVetQ25x3odZWp5fETW8ZMja+ghb5F8bNRXKaITSpCNUCm+gdqXLgEeenig0LupmRDzzP/YG6CIPb
	zmDvRGaJQjmhmknqRwE8ks92IhakAIvxFUY5bxYRSOkwkjqmhlkNgFV8LXM2cNUzlVlAo2hGvheYA
	wGg4Jxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2m6-00FRAj-0I;
	Wed, 21 Jun 2023 18:41:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2m3-00FR9d-1h
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 18:41:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D57B961657;
	Wed, 21 Jun 2023 18:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F37C433C0;
	Wed, 21 Jun 2023 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687372906;
	bh=6KYc2c7oOXRFu/RZ/MRT/iHTPpfsspYLvcXsDKK4hIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGDacF/ao4XnsWMMhLyxJ/uT4j5P7EXb4aQf6lEEUMhsmXn70wxs3di7suICOdVtl
	 ekD4+GH1CSJujpJh3ZzPklVMoJXRZwQgXQPMdm1axhHl/zfNBhmCZaxyFNdBoce7KF
	 cSA2Gifa8WlgJvXjBwVrDz7PiGevwvy6VsSIJMBXlYvEmDnEoog9T8ZgY0JdV6BTAq
	 REBNkULqbbUuNJ9ImJZR8aPHk8QiktVVBRXgFq1ljZfvDJjEv/mp/mYh70YkMEVont
	 4Kv81FZaPzeyd54oLvqq0p4WoBpG6NV28rX8S94/ead3rPrrSAHXKRk8ALqc46eUGa
	 g/tL0sAA9/bCw==
Date: Wed, 21 Jun 2023 19:41:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	wefu@redhat.com
Subject: Re: linux-next: Tree for Jun 21 (riscv/errata/thead)
Message-ID: <20230621-sandal-jogger-5dd9618daa85@spud>
References: <20230621145917.3635a2f1@canb.auug.org.au>
 <14aa23d6-b4c2-190f-0d6c-22a82befa04d@infradead.org>
 <20230621-playoff-wireless-0dcfce9711ff@spud>
 <ab38f6af-cb68-a918-1a63-2e7c927a8ffc@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ab38f6af-cb68-a918-1a63-2e7c927a8ffc@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_114147_618467_6FB01B14 
X-CRM114-Status: GOOD (  13.81  )
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
Content-Type: multipart/mixed; boundary="===============2035344338550568489=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2035344338550568489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n8FVmxrgiZgPXLh3"
Content-Disposition: inline


--n8FVmxrgiZgPXLh3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 11:40:31AM -0700, Randy Dunlap wrote:
> On 6/21/23 11:31, Conor Dooley wrote:
> > On Wed, Jun 21, 2023 at 11:25:14AM -0700, Randy Dunlap wrote:
> >> On 6/20/23 21:59, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20230620:
> >>>
> >>
> >> on riscv 32-bit:
> >=20
> > Is XIP_KERNEL enabled? And if so, does this fix it?
>=20
> Yes. and Yes.
> Thanks.
>=20
> for your patch:
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Great, thanks Randy. I'll do the needful.

--n8FVmxrgiZgPXLh3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJNEZgAKCRB4tDGHoIJi
0jlTAP4/F12XTZhuHgwt102bym8iyOdB1MY/FBYlYRfBpSwHgwEAzZvzJlTGAENb
KBXx9mVrEzkGqnq1LlGiSrhthEc7TQk=
=Um3f
-----END PGP SIGNATURE-----

--n8FVmxrgiZgPXLh3--


--===============2035344338550568489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2035344338550568489==--

