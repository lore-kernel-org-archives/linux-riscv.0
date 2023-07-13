Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D47C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUY4sbvN3RMRWtBncTDiYlQImPHZkDIUBOHNr7R4388=; b=NTWE+QNbqJXaODMSzibl9ZRt+z
	xIUI2mkfBwzr8lOkzr+SQwwL+7Hyl24stjCTzzH15D1ieAigjMyZ230v/VT2AfyI6v02v7gsvXnr9
	aR9eCiCBWPuOQ8ZeU3+GfTj/FnyAhIeeF/fvkBWv5Q4cmwFo8LQcM8RbBXgJwSaNnHvzCDMgXcTR8
	hgIvk5Sbga0JuXHAOxAYm5onhjMi5jioiaNGX0qOSi2oh7lSxs3HYjuzpczl7qrUUrZ6IMbDuW8OC
	ieOqMHpWbL+gl2U5gsfLHYLdyfnPhBMM+HJ+51EhtB3nWBo/bhrJCqlsV4jAaWnIkaNAX+PfS4GHe
	u/NLuuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzjz-0040OY-1T;
	Thu, 13 Jul 2023 17:04:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzjw-0040Nv-0I
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 17:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E61BB617F1;
	Thu, 13 Jul 2023 17:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C452AC433C8;
	Thu, 13 Jul 2023 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689267866;
	bh=eKvC7q4/BXxsKa5zqAPauiGC6yFdp2RPJNHydOHtKx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCg0NbMVUxptPPmJXgVKz50vFhKRh428YTAEfoNlYn48T6zMto8YlX5KMKEzNV/nB
	 4on3EJx7ywCo9x5GqO9qouaB5A4adHwKkjFrYRO3lSZX3pHFOuKW9UeM/8Sy4K7UqL
	 icAFr2PUdjUfZitkriRSpjRUBMXslTvY44fYekzVgMPVKDVg31jyo3xy0h1ZIyIBuN
	 ruGbkjrWFDoBVbG1+OMMiXp+vWEPI9gZCsZP1Rzx2DRHsw7YziZSEX3o6zU8Z223Ex
	 K2KST88CbvWK63UdECANXURSpDj6zyHVQIsZf8SVMsVYbKrcQOl6C4O7kXaa5yQ3YG
	 0SVCr7VNg9rWw==
Date: Thu, 13 Jul 2023 18:04:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: jszhang@kernel.org, guoren@kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <20230713-chive-undesired-269a54eb53db@spud>
References: <ZLAoIWX+qqWvucWz@xhacker>
 <mhng-40ca9d23-1074-4f5b-8ccd-e7e919f68928@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-40ca9d23-1074-4f5b-8ccd-e7e919f68928@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_100428_235553_270149B4 
X-CRM114-Status: GOOD (  52.54  )
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
Content-Type: multipart/mixed; boundary="===============5228754557200983227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5228754557200983227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="maK/bVNQuuSHUfzs"
Content-Disposition: inline


--maK/bVNQuuSHUfzs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jumping on top of Palmer's reply cos I had already started replying...

On Thu, Jul 13, 2023 at 09:56:34AM -0700, Palmer Dabbelt wrote:
> On Thu, 13 Jul 2023 09:36:49 PDT (-0700), jszhang@kernel.org wrote:
> > On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:
> > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > >=20
> > > The last merge window contained both V support and the deprecation of
> > > the riscv,isa DT property, with the V implementation reading riscv,isa
> > > to determine the presence of the V extension.  At the time that was t=
he
> > > only way to do it, but there's a lot of ambiguity around V in ISA
> > > strings.  In particular, there is a lot of firmware in the wild that
> > > uses "v" in the riscv,isa DT property to communicate support for the
> > > 0.7.1 version of the Vector specification implemented by T-Head CPU
> > > cores.
> >=20
> > Add Guo
> >=20
> > Hi Conor, Palmer,
> >=20
> > FWICT, new T-HEAD's riscv cores such as C908 support standard RVV-1.0,
> > this patch looks like a big hammer for T-HEAD. I do understand why
>=20
> Ya, it's a big hammer.  There's no extant systems with the C908, though, =
and
> given that the C906 and C910 alias marchid/mimplid it's kind of hard to
> trust any of those values for T-Head systems.  We could check for the 0s =
and
> hope T-Head starts setting something else, but I'm not sure that's a net =
win
> (we've also got the C920 in the Sophgo chip, which IIUC is V-0.7.1 too).

(In reply to Jisheng mostly)
It is most definitely a big hammer. And yes, we did talk about the c908
& its standard implementation of vector before submitting this. Unless
Guo can confirm that the c908 (and later CPU cores) will start setting
mimpid & mvendorid, I don't really see what the alternatives are? *
Whacking in a list of DT compatibles to blacklist? That doesn't seem
like something that would scale.
Open to ideas on that front for sure, smaller hammers are always better!

@Palmer, from what I am told, the c920 does put zeros in those CSRs,
so we are okay on that front.

* If they do do something other than 0s, the errata handling will need
  an update anyway, so the big hammer could be revised in tandem...

> > this patch is provided, but can we mitigate the situation by carefully
> > review the DTs? Per my understanding, dts is also part of linux kernel.
>=20
> That would break compatibility with existing firmware.  It's certainly
> something that has happened before, but we try to avoid it where possible.

(Mostly in reply to Jisheng again)
Sure, some devicetrees are part of the kernel, but not all are - they may
be passed up from U-Boot or OpenSBI etc & contain "v" in riscv,isa.
The intent of this patch (and Palmer's v1) is to make sure such systems
do not tell the kernel they support the standard version of v, when they
do not do so.

> In this case new T-Head systems that have standard V would just need to
> provide the new DT properties instead of the ISA string property.  We've
> deprecated the ISA string property already so that's what new systems sho=
uld
> be doing anyway, and given that this only applies to new systems it doesn=
't
> seem like a big ask.

Aye, AFAIK there are no extant systems with a c908 outside of vendors?
At least, from what searching I did I could not find a way to acquire
one... If you read the patch, you will see that there is in fact a way
out being provided & it is not a "no T-Head can never have vector"
situation - just slightly earlier use of the new properties in the
kernel than we perhaps intended.

Thanks,
Conor.

> > > Rather than forcing use of the newly added interface that has strict
> > > meanings for extensions to detect the presence of vector support, as
> > > that would penalise those who have behaved, only ignore v in riscv,isa
> > > on CPUs that report T-Head's vendor ID.
> > >=20
> > > Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-exten=
sion")
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > Changes in v2:
> > > - Use my version of the patch that touches hwcap and isainfo uniformly
> > > - Don't penalise those who behaved
> > > ---
> > >  arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index bdcf460ea53d..05362715e1b7 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -21,6 +21,7 @@
> > >  #include <asm/hwcap.h>
> > >  #include <asm/patch.h>
> > >  #include <asm/processor.h>
> > > +#include <asm/sbi.h>
> > >  #include <asm/vector.h>
> > >=20
> > >  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> > > @@ -334,6 +335,27 @@ void __init riscv_fill_hwcap(void)
> > >  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
> > >  		}
> > >=20
> > > +		/*
> > > +		 * "V" in ISA strings is ambiguous in practice: it should mean
> > > +		 * just the standard V-1.0 but vendors aren't well behaved.
> > > +		 * Many vendors with T-Head CPU cores which implement the 0.7.1
> > > +		 * version of the vector specification put "v" into their DTs
> > > +		 * and no T-Head CPU cores with the standard version of vector
> > > +		 * are in circulation yet.
> > > +		 * Platforms with T-Head CPU cores that support the standard
> > > +		 * version of vector must provide the explicit V property,
> > > +		 * which is well defined.
> > > +		 */
> > > +		if (acpi_disabled && riscv_cached_mvendorid(cpu) =3D=3D THEAD_VEND=
OR_ID) {
> > > +			if (of_property_match_string(node, "riscv,isa-extensions", "v") >=
=3D 0) {
> > > +				this_hwcap |=3D isa2hwcap[RISCV_ISA_EXT_v];
> > > +				set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > > +			} else {
> > > +				this_hwcap &=3D ~isa2hwcap[RISCV_ISA_EXT_v];
> > > +				clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > > +			}
> > > +		}
> > > +
> > >  		/*
> > >  		 * All "okay" hart should have same isa. Set HWCAP based on
> > >  		 * common capabilities of every "okay" hart, in case they don't
> > > --
> > > 2.39.2
> > >=20
> > >=20
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

--maK/bVNQuuSHUfzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLAulgAKCRB4tDGHoIJi
0ppqAP94c78xPflxPQXmgSyw+9+f1X0UBrHssAYag7Hz3rqT6gD+PdcW58TcyN+g
Nk+CE658+cbYgT6PLOd1C1QDy5NDwgw=
=37MW
-----END PGP SIGNATURE-----

--maK/bVNQuuSHUfzs--


--===============5228754557200983227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5228754557200983227==--

