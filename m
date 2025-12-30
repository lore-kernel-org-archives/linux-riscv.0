Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF5AEE498E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S21kG5eSz8xMye8GYMD4WOVgJ2TYrraeUYaNhVi6sSY=; b=aqf1urX9hst5EwCU/Lz84+Tvx1
	OiMv7XtiAAZO4QaUNbAHhLjKzQSp4vx0mP2wDip209KTYm88NSKrGn85Er9uPqhmmuPFT3gXLCJhZ
	HW8wwlJtjDXScGWnvtV1JDuLaZESzG5ede/v8TNhLC2rdTREBZnKS1LIoz/swF5hxhBhuLp7jt3Ob
	M35dKjkS3zATAt6bve2kHqATShjbVIAaBjWRS6l0JVQGBlGvw3SiTE4RIt690a05s40niObc9k2a3
	AFq7Ra56gt44VbWLVVOXoTQxYEG3P119O9igSls75e/UV4xS+hn8vbGKUPtpuYm0Xs3wuG2cjCuAh
	6j3Xk5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadQi-000000057Pr-1Fsd;
	Tue, 30 Dec 2025 17:22:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadQf-000000057PX-2tZR
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 17:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4428418C8;
	Tue, 30 Dec 2025 17:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB942C4CEFB;
	Tue, 30 Dec 2025 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767115360;
	bh=Nq4eJiscCSUjJWXnlK8KVH+lfFVCQ3hTMfu5rY2MBRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hE3cbSfI8mSOPtVbdyFudBIGR8EJtvSMWIxTZSpFUJVbgVToufldtftaPt7mTaFG+
	 20SPOxO/jHi94w4Zh3dju5YFCq6XTK+CH0cUv16D6W8QhNaPTJ6xqTgzIx9UXjjkQ/
	 NWRiMITIGr/JHCta/CP6IsiVx1k7MJe7V+R6hnJqSURx+3lsJQ5t38LzWdCApd2lI9
	 VYXcuc+x0EHPvGvsjK6HEfz8ZxpEUmcO0/g7qPVCE5UqS8DkhDMacDfNrvbpcLKJ72
	 ftl0XXH56DDMK6cNKlV1iPhmIRZADu6kv+xRoa897FehEvFwrQ7QOOoyXW7fB8Bjq2
	 LMHKwEzK1+Ybg==
Date: Tue, 30 Dec 2025 17:22:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
Message-ID: <20251230-outing-discourse-723547cc14da@spud>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
 <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
 <20251230021306.GA3094273-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251230021306.GA3094273-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_092241_769267_AA095661 
X-CRM114-Status: GOOD (  28.04  )
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
Content-Type: multipart/mixed; boundary="===============2056909957314027295=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2056909957314027295==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6T7N+P1CP7qWF7aZ"
Content-Disposition: inline


--6T7N+P1CP7qWF7aZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 08:13:06PM -0600, Rob Herring wrote:
> On Fri, Dec 26, 2025 at 03:28:47PM -0600, Alex Elder wrote:
> > On 12/22/25 7:04 AM, Guodong Xu wrote:
> > > Add description for the Supm extension. Supm indicates support for po=
inter
> > > masking in user mode. Supm is mandatory for RVA23S64.
> > >=20
> > > The Supm extension is ratified in commit d70011dde6c2 ("Update to rat=
ified
> > > state") of riscv-j-extension.
> > >=20
> > > Supm depends on either Smnpm or Ssnpm, so add a schema check to enfor=
ce
> > > this dependency.
> >=20
> > I have the same general question on this, about whether it's really
> > necessary for the DT binding to enforce these requirements.  The
> > RISC-V specifications are what truly defines their meaning, so I
> > don't really see why the DT framework should need to enforce them.
> > (That said, I'm sure there are other cases where DT enforces things
> > it shouldn't have to.)
>=20
> Does the specification have some way to check it? What happens if a DT=20
> is wrong? Are you going to require a DT update to make things right? Or=
=20
> the kernel has to work-around the error? Neither is great. So having=20
> this as a schema makes sense to prevent either scenario.

The reason this whole mess exists is because extensions got redefined
after the kernel port was merged and the bindings defined. This is
almost all a hedge against there being future redefinitions. For now,
and hopefully forever, this will just be a list of extensions with
citations to their relevant documentation so that we can say "this is
exactly what this means". The added bonus is avoiding messes like people
implementing development versions of specs and claiming support, because
that just becomes "your devicetree is wrong".

The dependency stuff exists because it is far too easy to miss something
in a list of 30+ extensions and dt validation can reduce some of the
complexity required when checking what extensions are supported.

> > And now, having looked at these added binding definitions (in patches
> > 07 through 11 in this series), I wonder what exactly is required for
> > them to be accepted.  For the most part these seem to just be defining
> > how the extensions specified for RISC-V are to be expressed in
> > DT files.  It seems to be a fairly straightforward copy from the
> > ratified specification(s) to the YAML format.
> >=20
> > Who need to sign off on it?  Conor?  Paul?  DT maintainers?
>=20
> I generally leave this extension mess to Conor.

And generally I do without that much back and forth, just so happens
that a couple of the ones in this series are the less simple cases to
deal with.

--6T7N+P1CP7qWF7aZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaVQKWQAKCRB4tDGHoIJi
0ruvAQC9BigE9R61JyhJdX+DbP3aP9RL8kQil3NqsFlUy1u7zAD+NHwDjf6ZDeRL
rXlytHW0eR8tJlt4hbSavsCcP8lVPwU=
=yKDh
-----END PGP SIGNATURE-----

--6T7N+P1CP7qWF7aZ--


--===============2056909957314027295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2056909957314027295==--

