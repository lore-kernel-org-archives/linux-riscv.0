Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963C7C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfMyDAhe+EMdXlYCSddhjVmevkaHZjjWZ9s78vvqHqM=; b=tw9eOsr+lSvcI6W2pwUKZxvo3r
	alutRM4ejO3dhBOYcUjxA7bjlNAK42xQkz0SfsF2R7KqX5CS/8jdDzc2HB33uaLmFKv6Xy3YBBqsn
	ZA08g3YZE0fT/KV9h4KSjZBfD05Qc7x64R33GG47RzCAhcpzoAh+DLbNSGDFhIkD9yKqL3YMBqFaq
	Cz0uBEKjvfJf1sDO1jdu2J0RBpafGll5yPkZCwTr8hhQnheFSXEHGflUvQ5W87GZUSPtcdon/BI3p
	gxmCo5hjw0T44Mq+CDoIQJQV3zfKEA6+bHFesExa9OJNwyXLbwPY75EeSH0qyLZbZmJhuRjVJ3VUn
	JuXliavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVwGM-0000000A7co-1cFy;
	Mon, 22 Jul 2024 16:51:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVwGI-0000000A7c3-2cWZ;
	Mon, 22 Jul 2024 16:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CE1D7CE0B8E;
	Mon, 22 Jul 2024 16:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30007C116B1;
	Mon, 22 Jul 2024 16:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721667103;
	bh=JWfbQMZVlMkgBoxkVUfOEex3UFL5SXV6npk5rwEQY5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RF13hYxOY22CChFt0RirGNMtTsHDyPBzPcVkUbHWS5dIuL3prCfcuYyUpPgu6TFms
	 s30N8GzM7XmEyvBHJ8Ex2q9+/NbsnFoK6AYyMKg9g0Tpxf/xenQxTDVoH2K4QMgvoj
	 c0nenUYZ9kC/4sgjjDQf8pucbJeq+XXw6ilM1vmdTSjd+hWt5iG4HTlRjKdlEdyisU
	 XikVZMN5YrSNnNC9U3AIoQgnc3B2PMBuqo/lRyEEqIUndsQ8j05OmH0/9eZED6q+xZ
	 G8s4kP9cNAXPTPCyXA2Is1C/Mkw7hxo9emWh3PLM6W7H4HRWqN3rB+3YH3j2DrirXD
	 7qXP6RceUZRAg==
Date: Mon, 22 Jul 2024 17:51:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, greentime.hu@sifive.com,
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240722-seizing-mardi-5237466fcf83@spud>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-3-yongxuan.wang@sifive.com>
 <727b966a-a8c4-4021-acf6-3c031ccd843a@sifive.com>
 <CAMWQL2g-peSYJQaxeJtyOzGdEmDQ6cnkRBdFQvLr2NQA1+mv2g@mail.gmail.com>
 <20240719-flatten-elixir-d4476977ab95@spud>
 <CAMWQL2iWsxLJZZ3H59csJ376Hdtq+ZKjD92BtM9zhdXm+fh2=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMWQL2iWsxLJZZ3H59csJ376Hdtq+ZKjD92BtM9zhdXm+fh2=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_095146_856327_AA544737 
X-CRM114-Status: GOOD (  17.73  )
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
Content-Type: multipart/mixed; boundary="===============3903310433059127623=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3903310433059127623==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i7lBaJiME8pvvbi7"
Content-Disposition: inline


--i7lBaJiME8pvvbi7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 10:14:11AM +0800, Yong-Xuan Wang wrote:

> > > > > +        - const: svadu
> > > > > +          description: |
> > > > > +            The standard Svadu supervisor-level extension for ha=
rdware updating
> > > > > +            of PTE A/D bits as ratified at commit c1abccf ("Merg=
e pull request
> > > > > +            #25 from ved-rivos/ratified") of riscv-svadu. Please=
 refer to Svade
> > > >
> > > > Should we be referencing the archived riscv-svadu repository now th=
at Svadu has
> > > > been merged to the main privileged ISA manual? Either way:
> > > >
> > > > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > > >
> > >
> > > Yes, this commit is from the archived riscv-svadu repo. Or should I u=
pdate it to
> > > "commit c1abccf ("Merge pull request  #25 from ved-rivos/ratified") of
> > > riscvarchive/riscv-svadu."?
> >
> > I think Samuel was saying that we should use the commit where it was
> > merged into riscv-isa-manual instead.
>=20
> Got it. I will update the description in the next version. Thank you!

There's no need (IMO) to send a new version for this alone - but if you
have to send another version for some other reason then do it.

Cheers,
Conor.

--i7lBaJiME8pvvbi7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp6OGgAKCRB4tDGHoIJi
0md/AQCHwo+QPDHARtNDHNRq3twdF2e88mQDAlkAKW3vTkQzFQEAsTDuPgrPBZsr
zb5qyXjkbHHdxOvbc4DuItNy5t9OPA0=
=lVI/
-----END PGP SIGNATURE-----

--i7lBaJiME8pvvbi7--


--===============3903310433059127623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3903310433059127623==--

