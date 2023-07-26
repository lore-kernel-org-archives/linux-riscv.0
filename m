Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648E8C001DF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xg35RYXcaLOVCPYoPEMxm6RwtmnherZHRVob6kRv8N4=; b=2yc1p6aoTO3Ey0B1TQzoWzppuH
	GRyxSXa/GZDMY7W6XomD1uWPbo9vouqwRacr+ySmVSlBig8JwR/wmlD3bonAkjhVjh/Ala+QxEASM
	pno1SGSAH9VGoLgaalHYXuDFRhPUjnt9pl6uGG8QqrF6ZHG4CrrYpFHBv4Vf0+D+zLTGnYOTxNqjE
	ruhqZ+jFHFy5vHm856n7H7UDcoeCXsEOKs++F6GHaCC8CB6+Hr2qXxUmVKN0ExU7TgRRm7X5JzJnQ
	pxGzEVPBB81WjvotA6xWyPZnPeo0Ly6N21jgdaRr483onCePRkW/k80mLdAJGa9052zUZSnC+7HQb
	evVYFkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhyW-00B6ol-0R;
	Wed, 26 Jul 2023 17:07:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhyT-00B6oH-2I
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 17:06:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3894061BE3;
	Wed, 26 Jul 2023 17:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C16C433C8;
	Wed, 26 Jul 2023 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690391216;
	bh=fMYXNdoiIoaRL/EnGo2yFFqRB6RkoO8zd0fcn+Mf9Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dV3n4erkz0VQ4mdemBTAGuaPlrCwrruwcJTa+HWosp9WfSfFMCUiHlRID41EbeqWK
	 wx0L8j8NFZmQV7SDlF9klv3GpJUUpbb2YvkaILtcCPxtuKzvu55HDXM/wKasSo6+C+
	 0b+4IRps+1EU3qn8JgFYE/dVnUfQIv7hXETsxGKpQZehNFnQ2OruyOA8QReI8W8Lb6
	 EFJ0ktQz6SdmwEfgA4kTd/IbH4kALW5hxSs2+EuRxdqDkqiToT/cSof/4DpM3Oz9w+
	 umbqJFm+2QbIuq+44n6K818d3Q12SLPYzc2D5vBYIApDNtK/xMV/ZugvUz8Ubj0MOm
	 9L7Iao7P05kMg==
Date: Wed, 26 Jul 2023 18:06:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, evan@rivosinc.com,
	jszhang@kernel.org, heiko@sntech.de
Subject: Re: more /proc/cpuinfo & extension support related woes
Message-ID: <20230726-operation-prenatal-cedfbc1bbc40@spud>
References: <20230725-friction-enlisted-7acb7c3c03bf@spud>
 <20230726-44005036239541a139fe7b2e@orel>
 <20230726-ransack-life-8b71c7c0542b@wendy>
 <CAK9=C2UBubVnj669mfKrw21fsHjDLMjiBVE_Go6e9zS-cPDqRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2UBubVnj669mfKrw21fsHjDLMjiBVE_Go6e9zS-cPDqRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_100657_833643_B4ED7F0F 
X-CRM114-Status: GOOD (  40.08  )
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
Content-Type: multipart/mixed; boundary="===============4831450305037758374=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4831450305037758374==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MFjGx2LKSY+Xf6Uw"
Content-Disposition: inline


--MFjGx2LKSY+Xf6Uw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 10:07:52PM +0530, Anup Patel wrote:
> On Wed, Jul 26, 2023 at 4:11=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Wed, Jul 26, 2023 at 11:04:39AM +0200, Andrew Jones wrote:
> > > On Tue, Jul 25, 2023 at 06:19:36PM +0100, Conor Dooley wrote:

> > >  - The kernel will combine information from one of the two bitmaps li=
sted
> > >    above with other information, such as config information, to decide
> > >    when / if an extension should be used by the kernel and/or exposed=
 to
> > >    userspace
> >
> > Right. This bit (or rather two bits, since I view the kernel and
> > userspace bits here separately) is where we are falling short. I think
> > hwprobe's limited users do the right thing, but we're not doing this for
> > /proc/cpuinfo. For the in-kernel users, grepping shows some suspicious
> > looking things, but how many are problematic I do not yet know. As an
> > example, does
> > static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
> > {
> >         u64 henvcfg =3D 0;
> >
> >         if (riscv_isa_extension_available(isa, SVPBMT))
> >                 henvcfg |=3D ENVCFG_PBMTE;
> >
> > work correctly if the SVPBMT Kconfig option is disabled?
> > From a quick check, `isa` here is set from the host ISA
> >         /* Setup ISA features available to VCPU */
> >         for (i =3D 0; i < ARRAY_SIZE(kvm_isa_ext_arr); i++) {
> >                 host_isa =3D kvm_isa_ext_arr[i];
> >                 if (__riscv_isa_extension_available(NULL, host_isa) &&
> >                     kvm_riscv_vcpu_isa_enable_allowed(i))
> >                         set_bit(host_isa, vcpu->arch.isa);
> >         }
> > so if the check passes for the host ISA, it'll pass for the guest ISA
> > too, so henvcfg will end up with the PBMTE bit set. I just haven't yet
> > checked what the outcome of this will be, but I figure not good?
>=20
> Why is the outcome not good?
>=20
> Guest need Svpbmt to support pass-through devices.

It was an example of a case where something is using
__riscv_isa_extension_available() where the behaviour of the kernel
w.r.t. this extension changes based on a Kconfig option being set.
I get why a guest wants to know about Svpbmt, that's not why I mentioned
this bit of code.

> > > (it'd be good to have a consistent API for these types of
> > >    checks which combine extension presence with other information)
> >
> > I figure the best option might just be to make the
> > __riscv_isa_extension_available() into this to avoid disruption? The
> > vast majority of users of that function want to know whether or not it
> > is safe to use the extension on that hart, not whether the hart itself
> > supports it. In fact, outside of Evan's per-hart stuff in /proc/cpuinfo,
> > do we have any users that would even want an API that checks the
> > "unfiltered" versions? I'll have to check the users to answer that I
> > think.
>=20
> Each guest VCPU will have its own ISA bitmap so KVM needs the
> __riscv_isa_extension_available() to check VCPU ISA bitmap.

That's not the unfiltered list though, you've assembled this specifically
for your VCPUs based on what KVM knows it can offer. It's the harts in
the host kernel that I am mainly talking about here and, in particular,
the behaviour when NULL is passed as the first argument. Changes can be
made to how __riscv_isa_extension_available() in that regard without
impacting KVM, which is mostly what I meant by "avoid disruption".
Either way, AFAICT, KVM doesn't offer vector support when
CONFIG_RISCV_ISA_V is disabled or fpu support without CONFIG_FPU (AFAICT).
Other than Svpbmt, those are all that the filtered list would remove from
the host isa bitmap anyway.

Hope that clarifies things,
Conor.

--MFjGx2LKSY+Xf6Uw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMFSrAAKCRB4tDGHoIJi
0mkdAQDewFfwQ/BQYCYfBsb78IaE+ImvrL9PRGqXvqFWfmm2zwEAkKiY+JNepsQI
OIH9jTHKDX9sjAi6wExvQVltM/7EKgk=
=7L0i
-----END PGP SIGNATURE-----

--MFjGx2LKSY+Xf6Uw--


--===============4831450305037758374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4831450305037758374==--

