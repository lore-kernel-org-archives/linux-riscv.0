Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75278606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2sXEWxdM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BC9igApA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ni0QtYjZxwsaY7cvM2Q7tXhMV+FhOs5NT27oZbYkL5Q=; b=2sXEWxdMFCPEy0Ae5w6SN1seJ+
	kGLSe7X/LnTAfUomvkKGAUWLHkVNwXLs+ylbvB9wWIKEnOsMafFup6bxrclcY0uG1sq7bMTk8BTU6
	Fl0OlYXyEK38En4v60ufcunDNvy7DXoUpuph4dQ/MIyxvAg8VDICg33a4rxBS7oJCzBmQcknmVif7
	iNbV+0bCkLTTkhya/bbA442jqOEI7xPewk1BHY/orxqFfpbsPrwh//g4yDznfJLylb3YtFQZkdVEZ
	ESG1Crh9oBO7LtkXuJc9AaPXtDebWt0be6YLD9Fi8YfGIySzZ50xWZn/RcZ2Uh135H0fvQt42wV/H
	MCtVVmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP7f-0000000DTJp-2T0w;
	Fri, 06 Nov 2026 18:57:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP7e-0000000DTJh-2NQ5
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:57:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C8D760052;
	Fri,  6 Nov 2026 18:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C0C1F0089F;
	Fri,  6 Nov 2026 18:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991429;
	bh=9X5cmDvSvndpVWlAMMG2RJrYEa7fV2+mmO9l1RBVXRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BC9igApAJ3+oyHsxdq+SDOgT6VdDnvjBSt5D9UQvL1/KhstaKCoQsfii2EIwATVOs
	 4vELkPWAEySLtBDwORpyDGZFWUHmu+VE/lpDThwJgu6X+/Jdyhta5gyIKbLjiN+xsr
	 75FOvEsKh3UWIsQEFANOKdAbaVWYFH8XgdzYH6QTaExqsGFMEzbMhyagzp9VBTptAQ
	 Y/tqoGsB6UD7EnPiHyfqkqaxt3bmoiu/7NRtobfJp7+7f3lIsv1Tat0CP15FkMTzAT
	 d/wVrspiNJ0goHMsuRUtmF2o2XiOBDnhS8dHu+PHkF2/6KaJSpeDit7aEA5IOHgIoY
	 qboWJk0I7c1Rg==
Date: Fri, 6 Nov 2026 18:57:05 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: dlemoal@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: RISCV: canaan: Deprecated (oficially) the K210
Message-ID: <20261106-valley-frustrate-b7708435b786@spud>
References: <20261009-ee797bb64a30cf907f583aca@squawk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261009-ee797bb64a30cf907f583aca@squawk>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3657593129134746024=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3657593129134746024==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jbBY8uOWPqvIAK05"
Content-Disposition: inline

--jbBY8uOWPqvIAK05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 10:29:53AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Two years ago, at LPC, the only known user of the k210, Damien, gave his
> okay to delete the platform from the kernel but this never actually took
> place. Deprecate the platform now, marking it as broken so that users
> will have to explicitly re-enable it on updating their kernels.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>=20
> Another patch written during a talk, but it's simple so suuuuurely it'll
> not be broken, right?

I've applied this for 7.5 with a modified commit message to note that
there are two users.

--jbBY8uOWPqvIAK05
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4jAQAKCRB4tDGHoIJi
0hluAP9t/Spm2kQMtxMqbyXXRHRGTQLtsI/cTnf2UGsXIGRF1AD/froMHarwdz0o
Pb1vRvJjDQoKPtcTvDL0lEZ8bl3K9wY=
=oIMy
-----END PGP SIGNATURE-----

--jbBY8uOWPqvIAK05--


--===============3657593129134746024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3657593129134746024==--

