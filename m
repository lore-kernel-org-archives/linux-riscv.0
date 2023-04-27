Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AD7C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 10:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoeoL0UnhPdl9ImqvS8GTIiDT+C16C7x3sHQf4FuJBg=; b=ZZgIY4+iVJCmYaDRsokwHQnAfc
	oJ/sM+4lr7VfNyHvq4ecx2G+KCKmRdLaahLkvHdXfGw2qyW0ba3aQLr0HEWKxJERz9vuaVVzWbmIY
	IZJvpjDEhValMI/0NTZ9N1UD56bTqFY9mty4CoOqzTBXegdEPMWsONUL8IYyHWDExt9ZLqXVffKmT
	9EtmkWMlUxeotS+2zKnieu5ZK6VMGqL42+7Fg8cb09D7f5VGcEnRLOmkcj8gnKwJkCutMZVR8i7OY
	G9TlV8216LoOVhld68fobe7YFza8Lj7rOxT7g3ED5u+LjL5K4I6ckuKhr0tUOG+LdWAY9No7tTVrX
	rJZmBVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prz0K-006KC4-1C;
	Thu, 27 Apr 2023 10:37:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prz0H-006KB4-1W;
	Thu, 27 Apr 2023 10:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682591853; x=1714127853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q22iismVzrorof4SSh18jebbXjbzWKSjUqul9A49BgI=;
  b=XaUZivXG8NNe49bwJ1df/xj2W16ff4AW0XgkT2xjVpMjeYfpxQM2zz+J
   k2DdgPqWfioeRasMR/wvCwnJOqMPirXlJ5NNsyPUNHSrY4eIXG2fjz+F2
   eCtXQjulUY+/ggb0Gp+ab0Xa8XfeBDiliimvgpj0fxYR15aGxxOCRoRlt
   7TDEo5sYeETCEKSGqwZxdYNf7D1MjC/L03JsN/KMzzmBd+DB/NCHQHpne
   QhB/lPpMVkawayEGc2b+o+/O8gTfZ0ZVUh6eBkzTnAKXwF7k9qZC7Ekb1
   fYqyt9MuzQGfjofdwOuIzNZ+aV3kAHXbpObYnqb4H6nFNmCnVvyRrZ7WL
   g==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677567600"; 
   d="asc'?scan'208";a="212561833"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Apr 2023 03:37:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 27 Apr 2023 03:37:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 27 Apr 2023 03:37:27 -0700
Date: Thu, 27 Apr 2023 11:37:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<kvm-riscv@lists.infradead.org>, "'Rafael J . Wysocki '" <rafael@kernel.org>,
	'Will Deacon ' <will@kernel.org>, 'Daniel Lezcano '
	<daniel.lezcano@linaro.org>, 'Mark Rutland ' <mark.rutland@arm.com>, 'Atish
 Patra ' <atishp@atishpatra.org>, 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>, 'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>
Subject: Re: [PATCH] RISC-V: Align SBI probe implementation with spec
Message-ID: <20230427-aflutter-emboss-6892d7097915@wendy>
References: <20230426172254.70342-1-ajones@ventanamicro.com>
 <20230427-property-barracuda-631a14371df0@wendy>
 <ryknbllu75eliur7v6tzei6jvqgwayuhej5icobxxrqwabymhz@lnnqmlrqxvex>
MIME-Version: 1.0
In-Reply-To: <ryknbllu75eliur7v6tzei6jvqgwayuhej5icobxxrqwabymhz@lnnqmlrqxvex>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_033733_572463_F0F18FF7 
X-CRM114-Status: GOOD (  41.39  )
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
Content-Type: multipart/mixed; boundary="===============0394622321375447699=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0394622321375447699==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qg7yZ7Ul34x+puxW"
Content-Disposition: inline

--qg7yZ7Ul34x+puxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 12:17:02PM +0200, Andrew Jones wrote:
> On Thu, Apr 27, 2023 at 10:42:11AM +0100, Conor Dooley wrote:
> > On Wed, Apr 26, 2023 at 07:22:54PM +0200, Andrew Jones wrote:
> > > sbi_probe_extension() is specified with "Returns 0 if the given SBI
> > > extension ID (EID) is not available, or 1 if it is available unless
> > > defined as any other non-zero value by the implementation."
> > > Additionally, sbiret.value is a long. Fix the implementation to
> > > ensure any nonzero long value is considered a success, rather
> > > than only positive int values.
> >=20
> > Does this need a fixes tag (or tags) then, since we could easily return
> > a negative value as things stand if the SBI implementation decides to
> > return 0b1...1 for success?
>=20
> Nothing is getting fixed when only considering the current generic opensbi
> platform, but there could be other SBI implementations Linux isn't
> handling correctly by only considering success to be greater than zero
> or by truncating the return value from long to int. I suppose that
> possibility does warrant a fix tag, which would be

Yah, I figured that something like opensbi would do the "sane" thing
here, but there's no accounting for taste and all that.

> Fixes: b9dcd9e41587 ("RISC-V: Add basic support for SBI v0.2")
>=20
> >=20
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/sbi.h        |  2 +-
> > >  arch/riscv/kernel/cpu_ops.c         |  2 +-
> > >  arch/riscv/kernel/sbi.c             | 17 ++++++++---------
> > >  arch/riscv/kvm/main.c               |  2 +-
> > >  drivers/cpuidle/cpuidle-riscv-sbi.c |  2 +-
> > >  drivers/perf/riscv_pmu_sbi.c        |  2 +-
> > >  6 files changed, 13 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sb=
i.h
> > > index 945b7be249c1..119355485703 100644
> > > --- a/arch/riscv/include/asm/sbi.h
> > > +++ b/arch/riscv/include/asm/sbi.h
> > > @@ -296,7 +296,7 @@ int sbi_remote_hfence_vvma_asid(const struct cpum=
ask *cpu_mask,
> > >  				unsigned long start,
> > >  				unsigned long size,
> > >  				unsigned long asid);
> > > -int sbi_probe_extension(int ext);
> > > +long sbi_probe_extension(int ext);
> > > =20
> > >  /* Check if current SBI specification version is 0.1 or not */
> > >  static inline int sbi_spec_is_0_1(void)
> > > diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> > > index 8275f237a59d..eb479a88a954 100644
> > > --- a/arch/riscv/kernel/cpu_ops.c
> > > +++ b/arch/riscv/kernel/cpu_ops.c
> > > @@ -27,7 +27,7 @@ const struct cpu_operations cpu_ops_spinwait =3D {
> > >  void __init cpu_set_ops(int cpuid)
> > >  {
> > >  #if IS_ENABLED(CONFIG_RISCV_SBI)
> > > -	if (sbi_probe_extension(SBI_EXT_HSM) > 0) {
> > > +	if (sbi_probe_extension(SBI_EXT_HSM)) {
> > >  		if (!cpuid)
> > >  			pr_info("SBI HSM extension detected\n");
> > >  		cpu_ops[cpuid] =3D &cpu_ops_sbi;
> > > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > > index 5c87db8fdff2..015ce8eef2de 100644
> > > --- a/arch/riscv/kernel/sbi.c
> > > +++ b/arch/riscv/kernel/sbi.c
> > > @@ -581,19 +581,18 @@ static void sbi_srst_power_off(void)
> > >   * sbi_probe_extension() - Check if an SBI extension ID is supported=
 or not.
> > >   * @extid: The extension ID to be probed.
> > >   *
> > > - * Return: Extension specific nonzero value f yes, -ENOTSUPP otherwi=
se.
> > > + * Return: 1 or an extension specific nonzero value if yes, 0 otherw=
ise.
> > >   */
> > > -int sbi_probe_extension(int extid)
> > > +long sbi_probe_extension(int extid)
> > >  {
> > >  	struct sbiret ret;
> > > =20
> > >  	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
> > >  			0, 0, 0, 0, 0);
> > >  	if (!ret.error)
> > > -		if (ret.value)
> > > -			return ret.value;
> > > +		return ret.value;
> > > =20
> > > -	return -ENOTSUPP;
> > > +	return 0;
> >=20
> > Why not make it return -ENOTSUPP for failures and 0 for success instead,
> > as it does not appear that any users actually care what the return value
> > is, once it is not an error?
>=20
> Just to prepare for theoretical new uses.
>=20
> > Concerned that it'll look weird to have
> > 	if(!sbi_probe_extension(foo))
> > 		print(foo is available!)
> > since it looks a bit weird that the !case is success?
>=20
> No, that's pretty par for the course in the kernel. I'd just prefer
> that sbi_probe_extension() be a simple wrapper around the SBI call,
> one that doesn't change the SBI call's return value semantics.
>=20
> >=20
> > If so, perhaps it could just return a bool instead, unless of course I
> > am missing some pending user that make some decision on the actual value
> > returned here is.
>=20
> No pending user that I'm aware of, but it's not too awkward, IMO, to
> implement this as the spec says, so any pending user that comes along
> will be happy from the start. If a boolean function seems better for
> everyone,

I don't really mind which way you do it to be honest.
I see reasons for both wanting alignment with what the SBI spec has &
for returning the simplest type that fits the usage.
Both are better than the current, potentially buggy, implementation.

Can put a
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
on it either way.

--qg7yZ7Ul34x+puxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEpQVgAKCRB4tDGHoIJi
0iW5AQDA6w/HwQfBlJ8IYgZ6pRa8AtyEEGnChoPyFmJIuxy/vgD+PACW8U70qITR
biI8X+NAOZhU1cXwFj+2ckS05sIJhgY=
=QJlL
-----END PGP SIGNATURE-----

--qg7yZ7Ul34x+puxW--


--===============0394622321375447699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0394622321375447699==--

