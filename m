Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7A2C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 21:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bNyiW9YzSngkvfqXGKFMf4sNvyZ9oBPNnrTMMSsoHM=; b=YvAAq/zFWHrfdYKXX3G1JiDbaR
	0ln3gSiU47gGOUHIQDSu1zWE1f0SuxuC20mWhyU9FMag0VReZycfjLgabKAUq/nBKKAnEFr6Yu8h4
	jx5ctCNWug4TyqIfxleYFfqwLHyzIo2llf79TCDjN1mkfgjyCE/BUPQBqlNgqOM65JscN9tbWJ7xX
	FAi/3/gJXdvQlmDBBvxq9gvIv1IZ5cNj+8IjsJBBNI3fvE0jeuEL0TPi0V9esF7zK/XFy2NqckwzL
	aSmCtj4atLQ1aSqlXhY4jdP14l+NAtNjffpPqU4pElXKPpcaQQ6f3nuh1KJiF5hGvAWepFz9Ts6yK
	8x2+1MEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfoE0-0000000FMhr-2sZM;
	Thu, 29 Feb 2024 21:45:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfoDw-0000000FMfy-3a5T;
	Thu, 29 Feb 2024 21:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2644160EBA;
	Thu, 29 Feb 2024 21:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9021C433C7;
	Thu, 29 Feb 2024 21:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709243149;
	bh=G4EYkzPzFZ97EhbBfqtvrgTbhgg2qWPt+odKPoorlmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9/CjJ8MOWWmJ77VMYivZMauQoKvUZky6TY1nilZ/ZH+J4l+3gH4vhVrEjDUmgAP6
	 iTyd+A2kT0zdOhpzMbCpeKuawtG1hXwkF1OmrfbDy8bWOuauKzcnU4EDtBTWYK9njK
	 rXp9msPg34jWdRG61D8CFJhzoWUmuN/823DH7FEhm9kePll/FcPWSlm+9q1lV2NV9S
	 eojbqeNA6LFj4wleY/5QkiYVW9FItDzWhabFF86uEdJAqtkjVER2a5ZBOriDDJ2t4G
	 9UqXiZTiMf9DBU0eiSIZ+/uwHTcL7ODurX4VIUJc7fvquTvcD55TuVqfWW/EO371it
	 2irBvLnw8Y3WQ==
Date: Thu, 29 Feb 2024 21:45:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 33/38] kselftest/arm64: Add a GCS test program built
 with the system libc
Message-ID: <c710a6b1-cf58-4e32-ada0-c0b256a62b2c@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
 <87sf1n7uea.fsf@linaro.org>
 <9b899b4e-7410-4c3b-967b-7794dac742e4@sirena.org.uk>
 <87ttlzsyro.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ttlzsyro.fsf@linaro.org>
X-Cookie: Marriage is the sole cause of divorce.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_134553_012139_54ADBB0F 
X-CRM114-Status: GOOD (  17.74  )
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
Content-Type: multipart/mixed; boundary="===============1192565824708457373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1192565824708457373==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ic7W6qvciabkElL"
Content-Disposition: inline


--+ic7W6qvciabkElL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 11:24:59PM -0300, Thiago Jung Bauermann wrote:
> Mark Brown <broonie@kernel.org> writes:

> > I believe based on prior discussions that you're running this using
> > shrinkwrap - can you confirm exactly how please, including things like
> > which firmware configuration you're using?  I'm using current git with
> >
> >   shrinkwrap run \
> >         --rtvar KERNEL=3Darch/arm64/boot/Image \
> >         --rtvar ROOTFS=3D${ROOTFS} \
> >         --rtvar CMDLINE=3D"${CMDLINE}" \
> >         --overlay=3Darch/v9.4.yaml ns-edk2.yaml
> >
> > and a locally built yocto and everything seems perfectly happy.
>=20
> Yes, this is how I'm running it:
>=20
>   CMDLINE=3D"Image dtb=3Dfdt.dtb console=3DttyAMA0 earlycon=3Dpl011,0x1c0=
90000 root=3D/dev/vda2 ip=3Ddhcp maxcpus=3D1"
>=20
>   shrinkwrap run \
>       --rtvar=3DKERNEL=3DImage-gcs-v8-v6.7-rc4-14743-ga551a7d7af93 \

I guess that's bitrotted?

> My rootfs is Ubuntu 22.04.3. In case it's useful, my kernel config is
> here:

=2E..

> https://people.linaro.org/~thiago.bauermann/gcs/config-v6.8.0-rc2

Thanks, it seems to be something in your config that's making a
difference - I can see issues with that.  Hopefully that'll help me get
to the bottom of this quickly.  I spent a bunch of time fighting with
Ubuntu images to get them running but once I did they didn't seem to
make much difference.

--+ic7W6qvciabkElL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXg+wQACgkQJNaLcl1U
h9DZxgf/UlqOshXqv9IbI4UXiot4QEsHhZ0uPw/+cIwJW0LPVndUMhKWjgagc3yv
HwCf2QQxjkRQTOAeO7dsMdW9WhMBi4cPzta19y3Z9rkAn8XuQM7LXg97WIQDNp7O
3ommNUjVAxq47zUvZhrQC18uzEb8WggdwNqJhcgn4mo/2GwN9uZp2xEZt1CRjZuk
9BOCuvR8dqbQvTXBik+7OZ45roOoTCLl8XUrmPk6VAlcK+DcBoDFt9jm9tgdG6zb
1Ua3jh2YvNe6s/qM5auYh/qB/V6wlz4n5yT0zvnhbC5XXzhaHkjV1/We3jerpisD
2teyFuaDxTwqX+5D8D871wwBTD3IPg==
=WDVJ
-----END PGP SIGNATURE-----

--+ic7W6qvciabkElL--


--===============1192565824708457373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1192565824708457373==--

