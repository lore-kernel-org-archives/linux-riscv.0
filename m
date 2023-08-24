Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E53C6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IShmvrGLXq44+gMtnjlgGjUlG0V0IGvUhujS8F3lalY=; b=tScmpd1ig3VXMiRLPCqKnTsOGU
	8734dzFrC7oxvrsBdE6GLKBHL611Lgz0VcRfq0G7PDPp/indLj+K/U51cBEXZG9/dJDPzdo3uGc/8
	/nNpj7UteUhzIJXb42wIiIcpbsNpe8X3ut9fDSomaeTgOu2VfDPS6snsL69wxc1/0peha30hY1Mkw
	CQfWsU/GXYG0iI57DRY8viTnMI9TXbvtnE1bF3Ab5AmF0B1PJJTeblFS1cmNGShpibhXJcoKldz9R
	JqBAkyrynO6x6kq+91QrmOAPBev6jYLsdrI7ssX0wQEbqrU14Bqv5AuFI+/Gt+7+9fiX1ymszHPnI
	GzI1Hhrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZE8v-003Wvz-0U;
	Thu, 24 Aug 2023 17:29:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZE8s-003Wv8-0l
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 17:29:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78F9465603;
	Thu, 24 Aug 2023 17:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29445C433C8;
	Thu, 24 Aug 2023 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692898148;
	bh=ghRdRcGD6Zug4JH4WZSKpEnQQeHP4GXO2/WksfI2krQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/EPbYoEUukL4BdYBq8IJzC8snLgg1+7uk0faFESOje7l8YnEN9NJ6HfYGr3H0087
	 ATFdN2I0Qv22jdHVILcsKKExKUoT/EE88YRt4Hw/p/QSyr84ygLqPBzHf4gPTydti0
	 /O2acf/KS1j4w4gEKtiWJsCeJ+8/42Rtookpt5vUMhi838ZtG4py8JYSv7ubtobLs+
	 fp65THK0H2QNX20DQXrf+EXBKYKmNWaH1pvaKk8PFtYh+e4B/Pcx8LTaRJuAfF1Zcz
	 Hb1F6wSAJQBpX8G3bhEskeKSgFM/1xSJUU9uVwS0MlxXAT46yjxOl5J0E6POhQDc22
	 2rr6R/j/U89JA==
Date: Thu, 24 Aug 2023 18:29:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230824-exploit-spectacle-ecedd91e9075@spud>
References: <20230711201831.2695097-1-evan@rivosinc.com>
 <20230824-factual-jawed-2dddd2cf2bdd@wendy>
 <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_102910_365293_818DEFAE 
X-CRM114-Status: GOOD (  48.48  )
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
Content-Type: multipart/mixed; boundary="===============7318625977748778237=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7318625977748778237==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A0HvG2oTz26T9fPz"
Content-Disposition: inline


--A0HvG2oTz26T9fPz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 09:18:16AM -0700, Evan Green wrote:
> On Thu, Aug 24, 2023 at 5:20=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Tue, Jul 11, 2023 at 01:18:30PM -0700, Evan Green wrote:
> > > In /proc/cpuinfo, most of the information we show for each processor =
is
> > > specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> > > compatible, and the mmu size. But the ISA string gets filtered throug=
h a
> > > lowest common denominator mask, so that if one CPU is missing an ISA
> > > extension, no CPUs will show it.
> > >
> > > Now that we track the ISA extensions for each hart, let's report ISA
> > > extension info accurately per-hart in /proc/cpuinfo. We cannot change
> > > the "isa:" line, as usermode may be relying on that line to show only
> > > the common set of extensions supported across all harts. Add a new "h=
art
> > > isa" line instead, which reports the true set of extensions for that
> > > hart. This matches what is returned in riscv_hwprobe() when querying a
> > > given hart.
> > >
> > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > ---
> > >
> > > Changes in v4:
> > >  - Documentation: Made the underline match the text line (Conor)
> > >  - Documentation: hanged "in question" to "being described" (Andrew)
> > >
> > > Changes in v3:
> > >  - Add some documentation (Conor)
> > >
> > > Changes in v2:
> > >  - Added new "hart isa" line rather than altering behavior of existing
> > >    "isa" line (Conor, Palmer)
> > >
> > >
> > > I based this series on top of Conor's riscv-extensions-strings branch
> > > from July 3rd, since otherwise this change gets hopelessly entangled
> > > with that series.
> > >
> > > ---
> > >  Documentation/riscv/uabi.rst | 10 ++++++++++
> > >  arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
> > >  2 files changed, 28 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.=
rst
> > > index 8960fac42c40..afdda580e5a2 100644
> > > --- a/Documentation/riscv/uabi.rst
> > > +++ b/Documentation/riscv/uabi.rst
> > > @@ -42,6 +42,16 @@ An example string following the order is::
> > >
> > >     rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> > >
> > > +"isa" vs "hart isa" lines in /proc/cpuinfo
> > > +------------------------------------------
> > > +
> > > +The "isa" line in /proc/cpuinfo describes the lowest common denomina=
tor of
> > > +RISC-V ISA extensions understood by the kernel and implemented on al=
l harts. The
> > > +"hart isa" line, in contrast, describes the set of extensions unders=
tood by the
> > > +kernel on the particular hart being described, even if those extensi=
ons may not
> > > +be present on all harts in the system. The "hart isa" line is consis=
tent with
> > > +what's returned by __riscv_hwprobe() when querying for that specific=
 CPU.
> >
> > Thinking about this again, I don't think this is true. hwprobe uses
> > has_fpu(), has_vector() etc that interact with Kconfig options but the
> > percpu isa bitmap isn't affected by these.
>=20
> Ugh yeah it's kind of a mishmash isn't it. hwprobe_isa_ext0() uses the
> lowest common denominator for FD, C, V, but per-hart info for
> Zba,Zbb,Zbs. Given the interface, per-hart info seems like what we
> should have done there, and the FD, C, and V were my bad. The good
> news is we can define new bits that do the right thing, though maybe
> we should wait until someone actually wants them. For this patch we
> should just remove this sentence. We can also correct the
> documentation in hwprobe to mention the shortcoming in FD,C,V.

I'm not really sure it's all that much of a shortcoming for V or FD,
since without the kernel support you shouldn't be using those extensions
anyway. A hwprobe thing for that sounds like a footgun to me & I think
the current behaviour is how it should be for these extensions.
It not being per-cpu is arguably a bug I suppose? But I would contend
that we are conveying support for the extension on a per-hart level,
with it then also gated by the kernel supporting V or FD, which is on a
system-wide basis.
Any other extensions that require Kconfig-gated kernel support should
also not report via hwprobe that the extension is supported when the
Kconfig option is disabled. It just so happens that the set of
extensions that hwprobe supports that are Kconfig-gated and those that
require all-hart support are one and the same right now, so we can kinda
just conflate the two & use has_vector() et al that handles both
kconfig-gating and all-hart support. Until something comes along that needs
anything different, I'd leave well enough alone for hwprobe...

> Palmer, do you want a spin of this patch or a followup on top to
> remove the above sentence?

It's not actually been applied yet, right?

Do you want to have this new thing in cpuinfo tell the user "this hart
has xyz extensions that are supported by a kernel, but maybe not this
kernel" or to tell the user "this hart has xyz extensions that are
supported by this kernel"? Your text above says "understood by the
kernel", but I think that's a poor definition that needs to be improved
to spell out exactly what you mean. IOW does "understood" mean the
kernel will parse them into a structure, or does it mean "yes you can
use this extension on this particular hart".

Thanks,
Conor.

--A0HvG2oTz26T9fPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOeTXwAKCRB4tDGHoIJi
0orLAP4kzJ6Q9T5h9rycveczuufvHYqgBrGPMezLQOxqGBxxIQD+PBIa9CJdSnD/
DLfjGDpw20OddIa0bsIJXxWBKRnhRA8=
=NcS1
-----END PGP SIGNATURE-----

--A0HvG2oTz26T9fPz--


--===============7318625977748778237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7318625977748778237==--

