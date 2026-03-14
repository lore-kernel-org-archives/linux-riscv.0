Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4CE10706D5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWGYPMsEe5xSuKObGBOyvjkrchONlxBnDfgbFpVQanY=; b=0QPw7B5CrxU7m2F7ON9x1lw0ik
	O6FfkayJ1anst4m6nPlpFbj5YcH3QT9+uchPmx7IN35wAz8l1SyqBj5nnBkDgyTcnhREbPS6IyGRS
	+OnpAoU9FJOtl+Ov6LKneBQs4H8OZnJ87PnkhcGrwuWZco+YYYx9hT/BUKLOMO6xwNo5xcGqm7Lep
	cjz7S2+GdjN12sioQ7gvPaPcRvq/kX8SUBNwzv4FXVRVbvMZ5GGBl971dX4PZy+L2o0MzjsfUKIIl
	TvAVrrVEL/j3s1Gqsq6BIkcKysAPgzHAsQcTZU34gb4o+dCHSZQdRD7xXNRpOFYhXZkVJSoHrZS1f
	W9WYhNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nvn-00000001piC-0n2T;
	Sat, 14 Mar 2026 12:17:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nvi-00000001php-1EWO
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 12:17:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80BD7442F0;
	Sat, 14 Mar 2026 12:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAC3C116C6;
	Sat, 14 Mar 2026 12:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773490637;
	bh=qJN0XXCAFaH6VkPmE666UHy9EHp3KHZV4dMoKW+Qfz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzkVT062gMhnk4qaERql+mwsd79l6a1zlNM7tZT9ZLpvvmwtM7l6GzAs0fG+KYDCf
	 GnxB9EVnaG5/XzTtge/XmWhi5g6v+WlCpbHgn9sKhRcdjiDe/NfjXPf1YMQFFw+wC1
	 2I6FJH/2LenPCD7kBnbGjFTeVMDBCfkttqWYn9SAqNDuCdJYWzfh+bmcykLAaI51uq
	 4yVSABdemLJetaVLt2j7SV/3esrCm7UDrzDvpb5bCV1wrtJAD1nCmfzHIlO/ivwFxp
	 d15R7U6kvNmEB+aRWtrr4KN1I4Sils/8oZdsmjbYBMKZLvrlRvv2HER5yCSoqg5SsL
	 wSvRq+XSGghyg==
Date: Sat, 14 Mar 2026 12:17:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/6] riscv: Add a custom, simplified version of
 Svpbmt "XPbmtUC"
Message-ID: <20260314-subdued-morally-f20a84fd446c@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-2-ganboing@gmail.com>
 <20260313-visitor-majestic-1a6888dc57b2@spud>
 <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
 <20260313-spiny-duration-702fff6bca17@spud>
 <ba44e0ed-9a6f-4d4d-b3bc-a6e0bac19940@gmail.com>
 <20260314-errant-gnarly-dcca92457051@spud>
 <9592ecf2-8410-4df7-9b2c-17564426240d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9592ecf2-8410-4df7-9b2c-17564426240d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_051718_391799_4EB04D78 
X-CRM114-Status: GOOD (  22.54  )
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
Content-Type: multipart/mixed; boundary="===============4536818182561032797=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4536818182561032797==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iDS3O7h7qtVz8IgK"
Content-Disposition: inline


--iDS3O7h7qtVz8IgK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 10:06:42PM -0700, Bo Gan wrote:
> > To be honest, I'm not completely dead-set opposed to a property that has
> > the bit positioning, but any property being added for what is
> > effectively an erratum needs to pass a high bar when the info could be
> > gathered in another way. That the eic7700 one depends on firmware for
> > what the bit may be is points in your favour, since firmware variability
> > is part of what dt is there to do. The jh7110 is points against, since
> > it could be fished out of the errata handling code.
> >=20
> Even for JH7110, I don't think it can be handled through the errata. It
> describes the errata of the core (if I'm not mistaken), and there can be
> other SoCs using the same core with the same archid/impid, but maps the
> peripherals differently, and the UC bit position doesn't apply there. I
> think you are probably looking for "SoC level errata" handling. It's not
> there AFAIK. Hence I guess both SoC cases point in favor of the dt prop?

I dunno, nothing wrong with checking the devicetree during the errata
"probe" code. Checks are not limited to imp/arch ids, can do ecalls etc
etc in there too, so looking at the root compatible would be possible.

Either way, if people like what you've done here generally (because
coming up with our own use of PTE bits could be controversial), and a
custom property of some sort is to be used, you need to provide a good
justification of why it is needed in the commit messages because you're
setting a precedent of being the first "extension" conjured up to suit
linux that would need that kind of functionality.
Need to demonstrate that it describes an aspect of the hardware, and
isn't being conjured up to configure software to use one out of several
possible values, that it may even be able to determine heuristically
=66rom information already provided in the devicetree (like the root
compatible or a completely described memory node).

--iDS3O7h7qtVz8IgK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabVRxAAKCRB4tDGHoIJi
0sKCAQCFcLXaxPOsQWiEZYssCaXCDw8Ikdz/ax1iXfKfagutMgD/TE4w73XgMNvH
GeXGGZb5eOooB27gJKL5sMKOn2nx1A0=
=c0jS
-----END PGP SIGNATURE-----

--iDS3O7h7qtVz8IgK--


--===============4536818182561032797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4536818182561032797==--

