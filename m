Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514CDEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/s4MMiLfKkmGn4Qea85ANNiolzBWQZvKgk1LYQnY0RQ=; b=f/tKX9i0kQqla5Iii1kkylfDV9
	Kxbzal797QALtoLQ1Q1Jwt2HcZarKWUSgcbs9Ey9+OJ8UeNnRjg8U39XTbQHXQ9zJS8ugcAs1Or2F
	GYk4Q0JQ9ZgqgwhbR6e4T9GwcGYQeXxvv4WSV62mLFwjMwjtH+f//28cJvJSQqe9u1COyINz1mrRz
	1GEoapyTlzWVdzgFpB2DJswhb9Rmjp8RZjQPN7oTMFGtJkc2YA9fSEw4smW07+w+x3UplyMnzyZGh
	kxjyi0/8oISyyUZ2ae4h8jVYiiJCUhhgoR4ryJ3geOUnLJ5EVQexadZU93rVMvEOziJcwgiyKb3i4
	jQz91HTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDolZ-00AaJU-1x;
	Mon, 26 Jun 2023 16:08:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDolW-00AaJ2-1N
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 16:08:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E14DB60E17;
	Mon, 26 Jun 2023 16:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD41C433C8;
	Mon, 26 Jun 2023 16:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687795713;
	bh=YtBxDgCSo52EnCezN1xP/GLTHgcQBQ/UTGIq1c7iU7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0cu9j7LYBWo5mX66CE2FbV41OSFcVyDdRYJkFWjFGvX1J6J8QUyCspssz5N0nwf5
	 mslVgIguao52pzHAfLvCU0FkwJlMksclNp7nQcnSN+uoYw3WnslJOZjQ496MkISJrs
	 wy/xylfHyjouzqpPt0pOEMR4rsomvo2Z1sY49fZiAPa+3BCMS6sbtiUnKq2OWkYqo8
	 dXDZeeLXB1gPenQ5jECRySGGd0u/JdEWoZ3wzbtdu0k1PKDX0F87HG/cAByLK7z/mR
	 KcIFOI/5ej+B7rbdlliOhOTLAXlb9TZ4l3yKQhwe8QVSptwIkTzjuELeK+ylxb/bcX
	 +r5e2ulfWVpTg==
Date: Mon, 26 Jun 2023 17:08:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v1 2/9] RISC-V: drop a needless check in print_isa_ext()
Message-ID: <20230626-jitters-spiral-68e941d0ad3f@spud>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-skydiver-frown-659b982a43ad@wendy>
 <20230626-67e571e6d9f02c28a09dab33@orel>
MIME-Version: 1.0
In-Reply-To: <20230626-67e571e6d9f02c28a09dab33@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_090834_544769_FB27C146 
X-CRM114-Status: GOOD (  27.24  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: multipart/mixed; boundary="===============8169784806443951667=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8169784806443951667==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UAbBwUXwcEUwpL43"
Content-Disposition: inline


--UAbBwUXwcEUwpL43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 05:19:08PM +0200, Andrew Jones wrote:
> On Mon, Jun 26, 2023 at 12:19:40PM +0100, Conor Dooley wrote:
> > isa_ext_arr cannot be empty, as some of the extensions within it are
> > always built into the kernel.
>=20
> This is only true since commit 07edc32779e3 ("RISC-V: always report
> presence of extensions formerly part of the base ISA"), right? If
> so, it might be nice to call that commit out in this commit message.

Per my last mail, where I commented on the origins of some of this code,
there were no multi-letter extensions when this code was first added.
When the first multi-letter ones did get added, it was Sscofpmf - that
doesn't have a Kconfig symbol to disable it, so I think this has been
redundant for a long time.

Apart from the ones I recently added, there's a fair few others that
are not gated & should always be present.
It's probably not clear from the comment, but this check is for whether
the kernel supports extensions, not whether the system it is running on
does. I guess I should expand on that in my commit message.

Thanks,
Conor.

> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 742bb42e7e86..01f7e5c62997 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -233,10 +233,6 @@ static void print_isa_ext(struct seq_file *f)
> > =20
> >  	arr_sz =3D ARRAY_SIZE(isa_ext_arr) - 1;
> > =20
> > -	/* No extension support available */
> > -	if (arr_sz <=3D 0)
> > -		return;
> > -
> >  	for (i =3D 0; i <=3D arr_sz; i++) {
> >  		edata =3D &isa_ext_arr[i];
> >  		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
> > --=20
> > 2.40.1
> >
>=20
> Otherwise,
>=20
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>=20
> Thanks,
> drew

--UAbBwUXwcEUwpL43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJm3/AAKCRB4tDGHoIJi
0lvuAP9Wwmh7CDmYVwCrwm2QnFlvh2auna7EZPvP8MVubcvyMgD+JhXPQyKqs2g1
Myse48aBIwDuIggV5cCfMWtC7cfUJgY=
=KSGS
-----END PGP SIGNATURE-----

--UAbBwUXwcEUwpL43--


--===============8169784806443951667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8169784806443951667==--

