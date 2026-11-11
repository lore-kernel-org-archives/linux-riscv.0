Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBAE606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Odt1gml5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hm9lgrJn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y6fhiziiXpWlcmQY0Il7nt7MBlqJRTUylEDXf9rk4uM=; b=Odt1gml5B0GQMNFBV7FTZq62ln
	taSHU2I0j3PjftAVp1Aj5UzrTVOf64h8EiUEMYrHlCenwmLJ6Be8lXGmFBYBm7c1LSUZefDmybbY4
	mzezW5bkzbw+SM/Qn4xc6BF57n6Bd6MuhN30sMskH4W0cMNfMXPKqOorfDMG1lhic16lsjZRSpBBh
	4QxHARk9VkdV8r06ifyT/Q8IrcxKCq8t0OwHd4G49MI7cQLTJ1EzOHcmuBvsUZfwx11j+nCa19kxz
	nlMtr57MCp7Hs8+JoGxRegjiX3NYuziqlWFoaZxqTkSebmEPWZJ9z2cAKtb0HgAUPYMo5GrYdaj2a
	UP/xUhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5OD-00000006KNS-3kGg;
	Wed, 11 Nov 2026 10:17:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5OC-00000006KNA-2DcG
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 10:17:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05BDF41849;
	Wed, 11 Nov 2026 10:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2941F00A05;
	Wed, 11 Nov 2026 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794392231;
	bh=N/X7j8m9JuRsdMto75QMtxa5SQ+n1wl38wZeDHSpd9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hm9lgrJnhDRUGoFi9cz6Cs7YbLNl3qS4sjTyjUUCdfvvtot7z0DKZlJA0KH6vBLsk
	 FqFBhbXAMC6cefKkcP8uLtPIMle6wwHLxz1dTEps3g2F+yDKxhTWTCgTI461h0SSOv
	 jx5cYWvaP/uwOaAOkofdOUfvrq4bRS5XF6nqMSRId6NKR4PRfr5+VUEeO+YeETtv/N
	 01gnvNodReMLV3vyUf9NJiCMNTW+M29gGH2uIjoS5Sjabb+onrLnvbiJf+PcXAWGeD
	 1PguTNHVD1CWUPFu6zig0vbBoMUCz47mXpNfzMzxQ+koodD/F1uvpG1ViicxafInyK
	 hqhc5GuU3qh0g==
Date: Wed, 11 Nov 2026 10:17:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, junhui.liu@pigmoral.tech,
	aleksa.paunovic@htecgroup.com, chen.wang@linux.dev, dlan@kernel.org,
	guoren@kernel.org, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <20261111-paralyze-ellipse-dfc194dbe39f@spud>
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-5-joel@jms.id.au>
 <20261109-jester-zestfully-a664203cfbd1@spud>
 <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>
 <avQFhoMuUGhASMla@inochi.infowork>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <avQFhoMuUGhASMla@inochi.infowork>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9006211132210589390=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9006211132210589390==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sue3xVkYI4vJFlWk"
Content-Disposition: inline

--Sue3xVkYI4vJFlWk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Aleska,

On Wed, Nov 11, 2026 at 02:21:44PM +0800, Inochi Amaoto wrote:
> On Wed, Nov 11, 2026 at 03:34:26PM +1030, Joel Stanley wrote:
> > +cc people who might know more about the various hardware this binding =
supports.
> >=20
> > On Tue, 10 Nov 2026 at 05:59, Conor Dooley <conor@kernel.org> wrote:
> > > > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.y=
aml
> >=20
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - tenstorrent,atlantis-aclint-mtimer
> > > > +      - const: riscv,aclint-mtimer
> > >
> > > So, what are we doing about thead,c900-aclint-mtimer.yaml?
> >=20
> > Once we agree on this binding, I planned to submit a change to bring
> > over the devices that implement the common binding. I can do that up
> > front instead.
> >=20
> > >
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: mtime register
> > > > +      - description: mtimecmp registers
> > >
> > > For example, I note that you have mtime and mtimecmp in the opposite
> > > order to how the mips folks have had to add the mtime region to that
> > > file:
> > > https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htec=
group.com/
> >=20
> > This is the order OpenSBI has used since v1.0, when support was added
> > about five years ago. It reads mtime followed by mtimecmp when there
> > are no reg-names:
> >=20
> >  https://github.com/riscv-software-src/opensbi/blob/v1.9/lib/utils/time=
r/fdt_timer_mtimer.c#L79
> >=20
> > QEMU also generates a dt with mtime followed by mtimecmp, and without r=
eg-names.
> >=20
> > The MIPS ordering works because it specifies reg-names. OpenSBI uses
> > reg-names to parse the reg property so it would continue working, but
> > u-boot takes index 0 as mtime and ignores reg-names.
> >=20
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: mtime
> > > > +      - const: mtimecmp
> > > > +
> > > > +  interrupts-extended:
> > > > +    minItems: 1
> > > > +    maxItems: 4095
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > >
> > > You've also not made reg-names or interrupts-extended required.
> >=20
> > That was intentional. A mtimer device without harts attached won't
> > have interrupts (opensbi supports this), but I haven't come across a
> > system that uses it this way. I have no preference here, what do you
> > think?
> >=20
>=20
> I think reg-names is required. The spec archive does not requrire the core
> implement both MTIME and MTIMECMP. So using reg-name will let the DT pars=
er
> does not reply on the order and leave the room for MTIMECMP only devices.
>=20
> interrupts-extended should also be required, it is kind of weird for=20
> a zero-interrupt timer.
>=20
> > > I think we should swap the regs around and make these two required at=
 a
> > > minimum, but also "initialise" this file by renaming the existing fil=
e.
> >=20
> > Bringing over the other devices sounds like a good idea to me. And I
> > appreciate the spelling.
> >=20
> > The nuclei/anlogic boards document mtime[1] support:
> >=20
> >  - nuclei,ux900-aclint-mtimer
> >  - anlogic,dr1v90-aclint-mtimer
> >=20
> > K3 has a mtime register (at 0xf181bff8, by experimentation on hardware):
> >=20
> >  - spacemit,k3-aclint-mtimer
> >=20
> > MIPS has it, as per their patch[2]:
> >=20
> >  - gf,mips-p8700-aclint-mtimer
> >=20
> > Note that MIPS have mips,p8700-aclint-mtimer in opensbi.

/sigh. Aleksa, can we sort this out please as part of whatever revision
is made to the mtimer patch in your series?

> >=20
> > T-Head has no mtime[3], just a set of mtimecmp registers. Sophgo are
> > unknown, can we assume it is the same design as T-Head?
> >=20
> >  - thead,c900-aclint-mtimer
> >  - sophgo,sg2042-aclint-mtimer
> >  - sophgo,sg2044-aclint-mtimer
> >=20
>=20
> For T-HEAD, IIRC all the design share the same layout. C9XX use the same
> layout for both C906/C910/C920. Sophgo is just a SoC vendor, not the
> core vendor.
>=20
> > There are two options for T-Head:
> >=20
> > 1) Leave it in its own binding, because it doesn't have mtime registers.
> >=20
> > 2) Use this binding with an optional reg property for the mtime
> > region, which means putting the optional part last.
> >=20
> > If we go with 1 we can preserve the mtime, mtimecmp ordering, matching
> > u-boot, opensbi, qemu. If we go with 2 we put mtime last and make
> > reg-names required.
> >=20
> > The current K3 and Anlogic current device trees would need an update
> > to their reg property to describe mtime when adding the riscv
> > compatible.
> >=20
> > I lean towards 1 because it reduces churn in firmware.
> >=20
>=20
> I prefer 2. as the ACLINT is designed for modularity, it should=20
> tolerate one that does not have MTIME.

I think we need to make reg-names mandatory and permit free ordering of
the reg entries and make reg-names mandatory.
QEMU will need to be changed to add reg-names and U-Boot changed to use
reg-names - I think neither should be controversial, since no hardware
actually implementing this device follows the qemu/opensbi ordering.

Maybe the right thing to do is:
| items:
|  - enum [mtime, mtimecmp]
|  - const: mtimecmp
which forces mtime to be first when there are two items, not really
problematic given there's currently no devices with two with a binding
that need modification given the mips thing is not yet merged so we can
update it to be like this.

Maybe for safety we abstain from retrofitting riscv,aclint-mtimer to the
existing devices (although I still think they should be merged into one
file) so that they don't run into U-Boot failures.

Cheers,
Conor.

>=20
> > > My ~assumption~hope is that all of the devices in that file have
> > > implemented the aclint spec at the -rc1 revision that we're citing he=
re.
> >=20
> > (-rc4). Yep, we can move the majority of the compatibles into this
> > binding. The T-Head family might be the exception.
> >=20
> > Cheers,
> >=20
> > Joel
> >=20
> > [1] https://doc.nucleisys.com/nuclei_spec/isa/timer.html
> > [2] https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@ht=
ecgroup.com/
> > [3] https://lore.kernel.org/all/IA1PR20MB4953D36ABE26822B62415500BBBBA@=
IA1PR20MB4953.namprd20.prod.outlook.com/
>=20
> Regards,
> Inochi

--Sue3xVkYI4vJFlWk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavRAoQAKCRB4tDGHoIJi
0gTXAP9ELbYxeOwSmQohVlFcT3ty4svQ4li+2LpJo6wg/0mqAAD/VLFPXq8qG4/K
wTCOmvyzoyRqXEQLNe3VztCWsfTswAg=
=yCLK
-----END PGP SIGNATURE-----

--Sue3xVkYI4vJFlWk--


--===============9006211132210589390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9006211132210589390==--

