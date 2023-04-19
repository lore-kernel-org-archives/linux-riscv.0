Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7357CC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVjMQBv5t5o6GVi316rXyjajkzGHAB3GCzfbVHmiJZg=; b=KFsvg9UbdaoZY0l4tFWgvzhwM1
	lfsGr7s4VrFS1c1l1zsockz60Zd46pKfnjBo1R9uvCDKipcHmyEVsCCZ5gBWCOVRElCXv6ipAkZTE
	DzD4HgRoYdfw95/vHaYcaHBwjDPJTOZ+BxSSo4xHfUZAwxIJvpRkbZi3+XNalqwmIo79FxNa9WGMt
	9/pZWOqfxjU07uJD13kRKjRFDKip3lQwaPq7jaxvxScBfhdOQS/B5jSk+A0SWjT0jBo4fzuctwLaz
	m3dLf7/Kf7o6A2n7n9KXNlgniNEJZH89G+U538uUdGRJ+o3LfzfWnqO2IrHZ8PuR2xk+R8NJQUe05
	i7278lKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppAsf-005vok-05;
	Wed, 19 Apr 2023 16:42:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppAsb-005vnV-2j;
	Wed, 19 Apr 2023 16:42:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09163640F0;
	Wed, 19 Apr 2023 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFAFC4339B;
	Wed, 19 Apr 2023 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681922520;
	bh=tReW7C9sVdS5veC+b6p1YOEOaM31kSZ2ndBBqxpTlaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIZYBgpE3onPjIOTOWDQF273d4MoZWjV3MA54x+OGdiPeSjPbz1VbeZOtFKLxE9OR
	 DIaKn8IAFL6+suNVigy0z3NFc9PWDDKprCBXyXjvqQn8hAYBT8TUOMyDbDqV+Vff9n
	 SxMKd14Uil/HoCoa/2wtRtZUiTPvAx+wRsMPVylPHxZiaSxPeoUisqimV9qlCMH5dc
	 yluhnm7OcKlWwAgxOtSai9ke2GCrSN9Mo0DniIRLV3bKXMxL3nuuk6idm7VD8QDwA+
	 Ev1pmUNWAeeCdSHBhiAGlcLMBuhFe2t2/cR71pe9eDbUyEZYE9B7Fv2wDS/oMd+FEb
	 JxWuzy7PHButA==
Date: Wed, 19 Apr 2023 17:41:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <20230419-manned-rephrase-3c87ca95b434@spud>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
 <20230418-earthlike-estrogen-a8ca785b382a@spud>
 <stn3ql2b5s6fkfo7udn4dcylyidbayiodfqvccrbgno2vylqwt@bi2ft2lv6crd>
MIME-Version: 1.0
In-Reply-To: <stn3ql2b5s6fkfo7udn4dcylyidbayiodfqvccrbgno2vylqwt@bi2ft2lv6crd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_094201_960730_615C4953 
X-CRM114-Status: GOOD (  32.82  )
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
Content-Type: multipart/mixed; boundary="===============0313229867730457908=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0313229867730457908==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X5sJ1JNaMx+gQV5b"
Content-Disposition: inline


--X5sJ1JNaMx+gQV5b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 10:24:27AM +0200, Andrew Jones wrote:
> On Tue, Apr 18, 2023 at 08:02:06PM +0100, Conor Dooley wrote:
> > On Mon, Apr 17, 2023 at 12:33:51PM +0200, Andrew Jones wrote:
> >=20
> > > +static int pv_time_cpu_online(unsigned int cpu)
> > > +{
> > > +	struct sbi_sta_struct *st =3D this_cpu_ptr(&steal_time);
> > > +	phys_addr_t pa =3D __pa(st);
> > > +	unsigned long lo =3D (unsigned long)pa;
> > > +	unsigned long hi =3D IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)=
pa) : 0;
> > > +
> > > +	return sbi_sta_set_steal_time_shmem(lo, hi, 0);
> > > +}
> > > +
> > >  static int pv_time_cpu_down_prepare(unsigned int cpu)
> > >  {
> > > -	return 0;
> > > +	return sbi_sta_set_steal_time_shmem(-1, -1, 0);
> >=20
> > I'm not really a fan of this -1s without an explanation of what passing
> > -1 to the ecall does.
> >=20
> > >  }
> > > =20
> > >  static u64 pv_time_steal_clock(int cpu)
> > >  {
> > > -	return 0;
> > > +	struct sbi_sta_struct *st =3D per_cpu_ptr(&steal_time, cpu);
> > > +	u32 sequence;
> > > +	u64 steal;
> > > +
> > > +	do {
> > > +		sequence =3D st->sequence;
> > > +		virt_rmb();
> > > +		steal =3D st->steal;
> > > +		virt_rmb();
> > > +	} while ((sequence & 1) || (sequence !=3D st->sequence));
> >=20
> > Call me a bit anal, but should we yoink your:
> > | The supervisor-mode software MUST check this field
> > | before and after reading the `steal` field, and
> > | repeat the read if they are different or odd
> > and add it here so that is it immediately obvious without reading the
> > SBI spec what is going on here? Or it is a case of "go read the SBI spec
> > if you have questions about what the kernel is doing w/ SBI stuff?
> >=20
> > (sidenote, s/they are/it is/?)
>=20
> Thanks, I updated the spec for its v3 posting. Before posting v3,
> I'd be happy to take more comments on it over on its v2 posting.

I did read it last week or whenever you sent it, but didn't feel
qualified to give an opinion on the content nor did I notice that
grammaro.

I'd have replied there, but I was too lazy to dump your mail from there
into a format readable by a decent mail client. I should just sign up
there with this email address instead.

> > Guess both of my comments are in the same vein, but would make
> > at-a-glance understanding easier IMO.
>=20
> I'm inclined to say "go read the spec" for everything, since the KVM
> implementation would otherwise also require several comments which
> duplicate the spec, but I'm also OK with adding the comments you've
> suggested here. I'll do that for rfc-v2.

I don't really have strong feelings, the magic -1s can be explained away
with a define so they're sortable without cogging stuff from the spec.

--X5sJ1JNaMx+gQV5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEAZ0wAKCRB4tDGHoIJi
0vbgAQDISxnAIOmYE6U2mAnAv0R3yqJif3i4OCV6YCrAC+9nWAEAnjpnssPZYQwq
gmNPWYv+1foDTNdy84mEAs+r2v9n1g0=
=d9LD
-----END PGP SIGNATURE-----

--X5sJ1JNaMx+gQV5b--


--===============0313229867730457908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0313229867730457908==--

