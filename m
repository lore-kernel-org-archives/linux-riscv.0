Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4720AC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 23:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zneCyTKT4dYJpsJhiaoZpOUK06wNe0BLX5sQM8DGxNs=; b=WaRGONvLPHefkl9HQM9dbID2YV
	TEsG7ufcvfFirrwvUgGAgfCslDLPiqOLymtQHcxcsn1IMcgVy9tfcEcklhxS9VnY9bRsdgx3ydnXe
	62LENNbd0muZQJvekEqXyTi8MseFvGZQt4NlEiWM2Bb/wAGqlvF/x2gvt6ZuWDgwcXkzMg/cSIODU
	L83zkkP+gpbAGAbyxeW1cM1V7aPTE1BugN3KtPrldL8CPJc5hKysU/J3ilX5c/dswNHLI3AulBQ/g
	PzR1WqN/dBj6HJjSDGe4QnBsvemFyk1AVBhBbYwiutU0Hn32EpvdW1AY2RtlS9oRom3RgL87eHHgL
	u/rSaiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmMih-0000000AbAZ-3R0B;
	Mon, 18 Mar 2024 23:48:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmMid-0000000Ab9t-3Ybk;
	Mon, 18 Mar 2024 23:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ECFBFCE0B9B;
	Mon, 18 Mar 2024 23:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F5FC433F1;
	Mon, 18 Mar 2024 23:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710805716;
	bh=Cn6JLaHFakVOrCPLqDt4/1WgZyxDmKrIjDcII8XUGIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpVtI+ro/2zMIR0B9qiL8hvLpHsmloDW2NP/k9jsl5O+ZLcT/YTJ/9xl5fZGzigqa
	 4lpgDM2qi1CtpYmPoucPaxFs7U0/Kt8EwqWaffnC/+6Ag9y0QO/Ims65lj9/r63FOD
	 H1EDkS9pEIRmYPLwcGmecNbYvcDXFLWifXXVnC8Cqj2MZsrZesWx8IDI/0u+7qZLjr
	 +Qo1KC35zJrrlY2zQeZaZrJxDEROIgq3ne5CsVYu/qaEIUvRoU/vqi+7SUJZcH3/bj
	 /9tnKZBIbo/mB853fNvZCRh1F2q8YFhoniUcov1Khxm3W96SCE1RZdI/SDjUIE/FiN
	 X2i+yqqk9INfQ==
Date: Mon, 18 Mar 2024 23:48:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <20240318-such-animal-bf33de12dc3a@spud>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
 <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240315-73aa13079ef83a4559869084@orel>
 <2de56d8b-bc78-428b-9c09-4729b269fa41@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <2de56d8b-bc78-428b-9c09-4729b269fa41@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_164840_331296_C7D4B243 
X-CRM114-Status: GOOD (  56.23  )
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
Content-Type: multipart/mixed; boundary="===============3259742864470856971=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3259742864470856971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7t9HXeunHB+b3F/8"
Content-Disposition: inline


--7t9HXeunHB+b3F/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 03:46:54PM -0700, Atish Patra wrote:
> On 3/15/24 01:11, Andrew Jones wrote:
> > On Wed, Mar 13, 2024 at 09:31:26AM +0800, Inochi Amaoto wrote:
> > ...
> > > IMHO, it may be better to use a new DT property like "riscv,cpu-errat=
a" or
> > > "<vendor>,cpu-errata". It can achieve almost everything like using ps=
eudo
> > > isa. And the only cost I think is a small amount code to parse this.
> > >=20
> >=20
> > What's the ACPI equivalent for this new DT property? If there isn't one,
> > then the cost is also to introduce something to the ACPI spec and add t=
he
> > ACPI parsing code.
> >=20
> > I'd much rather we call specified behaviors "extensions", whether they
> > are vendor-specific or RVI standard, and then treat all extensions the
> > same way in hardware descriptions and Linux. It'd also be best if errata
> > in extension implementations were handled by replacing the extension in
> > the hardware description with a new name which is specifically for the
> > behavior Linux should expect. (Just because two extensions are almost t=
he
> > same doesn't mean we should say we have one and then have some second
> > mechanism to say, "well, not really, instead of that, it's this". It's
> > cleaner to just remove the extension it doesn't properly implement from
> > its hardware description and create a name for the behavior it does hav=
e.)
> >=20
> > Errata in behaviors which don't have extension names (are hopefully few)
> > and are where mvendorid and friends would need to be checked, but then =
why
> > not create a pseudo extension name, as Conor suggests, so the rest of
> > Linux code can manage errata the same way it manages every other behavi=
or?
> >=20
> > The growth rate of the ISA bitmap is worth thinking about, though, since
> > we have several copies of it (at least one "all harts" bitmap, one bitm=
ap
> > for each hart, another one for each vcpu, and then there's nested virt.=
=2E.)
> > We don't have enough extensions to worry about it now, but we can
> > eventually try partitioning, using common maps for common bits, not
> > storing bits which can be inferred from other bits, etc.
>=20
> This is my biggest worry going forward. We already have a ever growing
> standard RVI extension list. On top of that we have genuine vendor
> extensions. IMHO, errata are bit different than extensions as there will =
be
> few vendor extensions in the future but many hardware erratas :)

I dunno, I think there's going to be plenty of both. We may not see (or
use) a lot of vendor extensions in mainline Linux, but they will exist.

> If we start calling every hardware errata as an pseudo ISA extensions, we
> will much bigger problem maintaining it in the future.

I've explained to you at least once already that this is not my goal.
Where there are genuine issues with the implementation of an extension
creating a "pseudo" extension is not what I am suggesting we do.
I have no problem with with the approach taken for the SiFive errata,
for example.

> We discussed this earlier during the Andes PMU extension series[1] as wel=
l.
> We have three types of extensions in discussions now.
>=20
> 1. standard RVI extensions
> 2. Vendor extensions
> 	a. Genuine vendor extension
> 	b. Vendor erratas which can be described as pseudo-extensions now

> Keeping all these within a single ISA bitmap space seems very odd to me.
> I think the feasible approach would be to partition the standard and vend=
or
> ISA extension space as you suggested.

Let's be clear - partitioning the space is unrelated to the detection
method. We can go ahead and partition the space and use "pseudo"
extensions or we can have a unified space but use archid/impid for
detection. Having a unified space is the simpler thing to implement
right now, but it totally does not stop us breaking them out in the
future. We could even gate these custom implementations behind config
options if bloat is a concern - but multiplatform kernels are likely to
enable all the options anyway.

> For 2.b, either we can start defining pseudo extensions or adding
> vendor/arch/impid checks.
>=20
> @Conor: You seems to prefer the earlier approach instead of adding the
> checks. Care to elaborate why do you think that's a better method compared
> to a simple check ?

Because I don't think that describing these as "errata" in the first
place is even accurate. This is not a case of a vendor claiming they
have Sscofpmf support but the implementation is flawed. As far as I
understand, this is a vendor creating a useful feature prior to the
creation of a standard extension.
A bit of a test for this could be "If the standard extension never
existed, would this be considered a new feature or an implementation
issue". I think this is pretty clearly in the former camp.

I do not think we should be using m*id detection implementations of a
feature prior to creation of a standard extension for the same purpose.
To me the main difference between a case like this and VentanaCondOps/Zicond
is that we are the ones calling this an extension (hence my use of pseudo)
and not the vendor of the IP. If T-Head were to publish a document tomorrow
on the T-Head github repo for official vendor extensions, that difference
would not even exist any longer.

I also do not believe that it is a "simple" check. The number of
implementations that could end up using this PMU could just balloon
if T-Head has no intention of switching to Sscofpmf. If they don't
balloon in this case, there's nothing stopping them ballooning in a
similar case in the future. We should let the platform firmware tell us
explicitly, be that via DT or ACPI, what features are supported rather
than try to reverse engineer it ourselves via m*id.

That leads into another general issue I have with using m*id detection,
which I think I have mentioned several times on the list - it prevents the
platform (hypervisor, emulator or firmware) from disabling that feature.

If I had a time machine back to when the T-Head perf or cmo stuff was
submitted, I was try to avoid any of it being merged with the m*id
detection method.

> I agree that don't have the crystal ball and may be proven wrong in the
> future (I will be definitely happy about that!). But given the diversity =
of
> RISC-V ecosystem, I feel that may be our sad reality.

I don't understand what this comment is referring to, it lacks context
as to what the sad reality actually is.

I hope that all made sense and explained why I am against this method
for detecting what I believe to be features rather than errata,
Conor.

--7t9HXeunHB+b3F/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfjSzwAKCRB4tDGHoIJi
0hjTAQDU4iC54GGVQ58RwoBxuNpru5MnUhSu1JGRrSiUc83oCwEA83inmGv2dOAL
hhn4SEc7b8EAwecO1yhS+VZqoKz/NAE=
=nUaP
-----END PGP SIGNATURE-----

--7t9HXeunHB+b3F/8--


--===============3259742864470856971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3259742864470856971==--

