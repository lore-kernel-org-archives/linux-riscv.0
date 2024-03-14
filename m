Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0C7C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 20:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zytf94fsnoCxyTS9KgbXC+Tn896ov6YQjZVgX80fJ44=; b=2Z+5lbL/mpA7+QoI0H5FZcGLip
	Y3hbf5TXJ/nSD/vp5YaqCyNNEfSTxiAQ2zm9cRChFkTqp732Q799AzBEFHCNRmK7j+2Y9fZaRW8pw
	tCxfU68FmUsotLZaOJ32BChGfAZ6kbRJGax+WQN0spEt3HEOCiv3HWTTxAqCnOOow4h7Y5136Ikai
	CmlX6rba0vypwhKw+dZ3qLMBL2eNwmJRxGSXPKd3lhxTXksaDVYr8+9xISwiYfjPAQuxglq4eVy80
	EUzkGdO42qDhx4bG5xjEpwN7be+b/KzqxA3xFgd0tD74Cw9aeOo0j9+ah0bqRHOtVwsMhaHPQ7MjH
	xlPZV5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkrtH-0000000Fdy1-0Bbd;
	Thu, 14 Mar 2024 20:41:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkrtD-0000000FdxS-0KhQ;
	Thu, 14 Mar 2024 20:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3FF0BCE1E3F;
	Thu, 14 Mar 2024 20:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652ACC433F1;
	Thu, 14 Mar 2024 20:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710448880;
	bh=D8dmCbnX6rijB2nPz1wQDTif25zMAHPrUq0OSfJuNeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5j0NKIgtC9wYzEQDR7OqXRqnqwvYIK6xaMMZELt10g+TDIYs2sG/ZzPOC0RfzHLr
	 3d6iDw4Vn4IP8s8zK97INEis4zXyGyisQKNUnbfFoQh/eNtf9IkXAQCdn859mbKGNY
	 m2tHSJI4S/X1A/bxniT3FSCKD5w6I/0z6Yh0StWCLl8D/+4ojCS3V2fOEAAw4ICCim
	 LzOplpM0A0NYvBM+dbgg0f+rOd0AE8Bo2vZdBB90d5o0trWYOj5i+VgoE/uBiCbfup
	 SDpJkdBDWtb1TyvT08xT+mOwXXLKda6UdycdcRGdiFYXWrR9jRuxjg5iLObCjSZ48b
	 NSq7SnRX42hug==
Date: Thu, 14 Mar 2024 20:41:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Qingfang Deng <dqfext@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <20240314-pep-announcer-2d7f10ff8b65@spud>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
 <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_134123_509863_72B4FBDD 
X-CRM114-Status: GOOD (  47.41  )
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
Content-Type: multipart/mixed; boundary="===============7391554459685852469=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7391554459685852469==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7VnajYQ5dXc+P0Cg"
Content-Disposition: inline


--7VnajYQ5dXc+P0Cg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 09:31:26AM +0800, Inochi Amaoto wrote:
> On Tue, Mar 12, 2024 at 02:07:31PM +0000, Conor Dooley wrote:
> > On Mon, Mar 11, 2024 at 03:56:29PM +0800, Qingfang Deng wrote:
> > > Hi Inochi,
> > >=20
> > > On Mon, Mar 11, 2024 at 3:13=E2=80=AFPM Inochi Amaoto <inochiama@outl=
ook.com> wrote:
> > > >
> > > > On Mon, Mar 11, 2024 at 02:30:18PM +0800, Qingfang Deng wrote:
> > > > > T-Head C908 has the same IRQ num and CSR as previous C9xx cores, =
but
> > > > > reports non-zero marchid and mimpid. Remove the ID checks.
> > > > >
> > > >
> > > > Hi, Qingfang,
> > > >
> > > > IIRC, the existed C908 SoC (such as K230) have an early version
> > > > of C908 core. But C908 core itself may support Sscofpmf.
> > > > So I do not think removing the ID checks is a good idea. Instead,
> > > > I suggest adding CPUID of your SoC to this check.
> > >=20
> > > As of Feb 2024, the latest C908 revision does not support Sscofpmf.
> > > You may Google "C908R1S0" to see its user manual.
> > > But I think you're right. Even though C908 does not have Sscofpmf,
> > > T-Head may release new SoCs which do have Sscofpmf, and the check will
> > > break. I will submit a new patch with your suggested changes.
> >=20
> > If on an SoC where they have updated vector to 1.0 and implemented both
> > Zicbom and Svpbmt instead of their custom stuff they did not implement
> > Sscofpmf I think we can expect they won't move away from their custom
> > implementation soon.
> > I do agree that we should not remove the ID checks entirely, but I also
> > do not want to be adding an ID for every SoC that needs this. I think we
> > should be getting this information from DT going forward.
> > The DT parsing is done prior to the application of boot time
> > alternatives, so I think we could apply the "erratum" based on the DT.
> >=20
> > I'm also pretty sure that we can also modify the existing code for the
> > archid =3D=3D impid =3D=3D 0x0 case to set a pseudo isa extension so th=
at the
> > perf driver could do call riscv_isa_eextension_available() and not worry
> > about the specfic conditions in which that is true. It'd be something
> > like this patch:
> > https://lore.kernel.org/linux-riscv/20240110073917.2398826-8-peterlin@a=
ndestech.com/
> > Just without removing the archid =3D=3D impid =3D=3D 0x0 case from the =
errata
> > code. If you're lost after reading that, I can probably throw together
> > some untested code for it.
>=20
> I agree to use something to replace the existing check, but using a pseudo
> isa extension is not a good idea. There are two reasons:=20
>=20
> 1. Pseudo isa is misleading. As it is not the real isa, setting this in i=
sa
> list may make userspace think errata a feather.

If we wanted to suppress sharing this information to userspace we could,
but I don't even see what the harm is in userspace knowing.
I also disagree with this even really being an erratum in the first place
as they implemented something before a spec was created. It's not an
implementation of Sscofpmf with a bug. I don't think that calling it a
"real" vendor extension is problematic either, just I am the one calling
it that, not T-Head themselves.

> 2. Using pseudo isa is more like an abuse of reserved isa bits, which mea=
ns
> kernel may need infinite bits to handle the errata.

What makes it an abuse of a "reserved" bit? There's no rule on
disallowing something vendor-specific there. Given the amount of standard
ISA extensions that are being created compared to CPU errata, I don't
think that I'm particularly worried about vendor specific stuff being
the reason for infinite bits being needed either.

If there do come to be issues with the number of extensions we care
about, we could split things per vendor I suppose.

> IMHO, it may be better to use a new DT property like "riscv,cpu-errata" or
> "<vendor>,cpu-errata". It can achieve almost everything like using pseudo
> isa. And the only cost I think is a small amount code to parse this.

I suppose we could do that, but accounting for vendor specifics was one
of the goals for the property I only just added and that I am suggesting
to use here.

--7VnajYQ5dXc+P0Cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfNg6wAKCRB4tDGHoIJi
0pvxAP9f5n67FdcXaDeJLe8wvqIkMnLvLHJt1Uimlhexcor/lgEAkHeDx1gCVOz4
gSFJsa/+ha0YnGA/h8Ili4wHIx6rhA0=
=9+If
-----END PGP SIGNATURE-----

--7VnajYQ5dXc+P0Cg--


--===============7391554459685852469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7391554459685852469==--

