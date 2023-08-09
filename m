Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A2C0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 18:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Tqc3ur4gIqGYfSv/zSnVTlgclgQOtvPOagd2XN0z70=; b=Xft6gyzaUTt1fvfptTO0KpwMAq
	pCS7+iRe0QzN4KEY4DB/ALfdHMtTNj0+oaORVzSPSvY3R3jHM8SDGgv5g7hrv3YNNblxa0iqVTIxa
	jDsePUqBeL6OF6Ac0uH5j9Ms8Hh7StczltwhD0Lj2uetc6bsY3LBRo0Xn3vK9RxgC8zO9p3RB6Lj8
	BeQp9EEIA46J7zHcs5p+R4g1VMzMdcqMfArWi+W2sdvNOzpakpj8vDf06ZU1mzSrhRkqZGM7K28VM
	ds70jn8IDlIx6xPlng4lK1K/3I7S2X/wQVq8b9cV8/bcX7y3ScAZ936HnAph8toPw8mtmWf//XMMw
	CgWM5+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTngB-005apM-0Z;
	Wed, 09 Aug 2023 18:13:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTng7-005aot-1i
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 18:13:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D31A36415F;
	Wed,  9 Aug 2023 18:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90998C433C7;
	Wed,  9 Aug 2023 18:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691604782;
	bh=AJklke8Rk2yCkxoMW0yIpdeYef4a9VK3P8+mHF2k5RE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuT2P3kcHdwmz2vVCXkhpxolYAR8t6tsart+HE5X20yYS3LdPcvZ/DUgObUgskGLY
	 Q2X5PGwOu4GIvGeTvARUZW86w9nxp7JsBy+iLfyxE7fuxxwlQOA16pgZa/onwWrzwL
	 wVwQSgY23GujyajPVXP/eAE29nOJgGblZilOF+lZiL6MtS4DqrkRP16t79AFV+7TBj
	 NMlqUrjXABYqNO9XPhStwAoBdatXYj0w1nGPudgmeDk0INK4AwcjIerv7JYhCIX1ed
	 TC7cnoqa5++Zaa0hmaa4gzu5PD7Cu0RdCXCq2O6tLX74cM9o1QnjjE8+xxm1ugf5Z0
	 AZCQhaFgsTmpw==
Date: Wed, 9 Aug 2023 19:12:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230809-disrupt-jersey-f2545c5903fe@spud>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-10-ajones@ventanamicro.com>
 <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
 <20230809-7aa41e2dd2fd2909f1266a20@orel>
MIME-Version: 1.0
In-Reply-To: <20230809-7aa41e2dd2fd2909f1266a20@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_111303_681363_3117F10D 
X-CRM114-Status: GOOD (  31.27  )
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
Content-Type: multipart/mixed; boundary="===============0604774872036632341=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0604774872036632341==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EaIIuuXJRpNQoP0F"
Content-Disposition: inline


--EaIIuuXJRpNQoP0F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 06:58:15PM +0200, Andrew Jones wrote:
> On Wed, Aug 09, 2023 at 09:00:35AM -0700, Evan Green wrote:
> > On Wed, Aug 9, 2023 at 4:55=E2=80=AFAM Andrew Jones <ajones@ventanamicr=
o.com> wrote:
> ...
> > > +static __always_inline bool riscv_this_cpu_has_extension_likely(cons=
t unsigned long ext)
> > > +{
> > > +       if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extensi=
on_likely(ext))
> > > +               return true;
> > > +
> > > +       return __riscv_isa_extension_available(hart_isa[smp_processor=
_id()].isa, ext);
> > > +}
> > > +
> > > +static __always_inline bool riscv_this_cpu_has_extension_unlikely(co=
nst unsigned long ext)
> > > +{
> > > +       if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extensi=
on_unlikely(ext))
> > > +               return true;
> > > +
> > > +       return __riscv_isa_extension_available(hart_isa[smp_processor=
_id()].isa, ext);
> > > +}
> >=20
> > Another way to do this would be to add a parameter to
> > riscv_has_extension_*() (as there are very few users), then these new
> > functions can turn around and call those with the new parameter set to
> > hart_isa[smp_processor_id()].isa. It's a tossup, so up to you. The
> > only advantage to it I can argue is it keeps the code flows more
> > unified.
> >
>=20
> I like unification, but I think I'd prefer we create wrappers and
> try to avoid callers needing to construct hart_isa[].isa parameters
> themselves. I'm also not a big fan of the NULL parameter needed when
> riscv_isa_extension_available() is invoked for the riscv_isa bitmap.
> So we need:
>=20
>   1. check if an extension is in riscv_isa
>   2. check if an extension is in a bitmap provided by the caller
>   3. check if an extension is in this cpu's isa bitmap
>   4. check if an extension is in the isa bitmap of a cpu provided by the
>      caller
>=20
> The only one we can optimize with alternatives is (1), so it definitely
> gets wrappers (riscv_has_extension_likely/unlikely()). (3) and (4) can
> also get wrappers which first try the optimized (1), like I have above.
> Actually (3)'s wrapper could be based on (4)'s, or only provide wrappers
> for (4)
>=20
>  static __always_inline bool riscv_cpu_has_extension_likely(int cpu, cons=
t unsigned long ext)
>  {
>      if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_like=
ly(ext))
>          return true;
>=20
>      return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
>  }
>=20
>  static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, co=
nst unsigned long ext)
>  {
>      if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unli=
kely(ext))

Why are you gating on CONFIG_RISCV_ALTERNATIVE here?

>          return true;
>=20
>      return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
>  }
>=20
> and then use smp_processor_id() directly in the callers that need
> to check this_cpu's extensions.
>=20
> For case (2), I'd advocate we rename __riscv_isa_extension_available() to
> riscv_has_extension() and drop the riscv_isa_extension_available() macro
> in order to avoid having some calls with RISCV_ISA_EXT_* spelled out and
> others that rely on the pasting.

> And, ideally, we'd convert most
> riscv_has_extension(NULL, ext) calls to riscv_has_extension_[un]likely().

> I'm also not a big fan of the NULL parameter needed when
> riscv_isa_extension_available() is invoked for the riscv_isa bitmap

Rather than actually act on my concerns about
__riscv_isa_extension_available(), I've been busy devoting my spare
time to playing MMOs with the excuse of not wanting to fiddle further
with cpufeature.c et al until Palmer merged the new DT property stuff,
but splitting out your case 1 above seems like it would really help
there. The NULL argument case is the one I think has the potential to
be a footgun in the face of config options.
Split out we can document that purpose of each function & hopefully
have one set of functions that deals with "this extension was detected
to be present in the hardware" and one that does "this extension was
detected & supported by this particular kernel".

I'll try to take a proper look at this series tomorrow :)

Cheers,
Conor.

--EaIIuuXJRpNQoP0F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNPXKgAKCRB4tDGHoIJi
0tqSAQC9VHI/s3xNgBl+dtzuA5mrB2tfuK8lpFIORu3OM3ovXwEAp/+ofBBGfKhw
w/pRBZ/OpCyRL+Ju+fdkI09QwVaBbwc=
=MD0g
-----END PGP SIGNATURE-----

--EaIIuuXJRpNQoP0F--


--===============0604774872036632341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0604774872036632341==--

