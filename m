Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B316C5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPM8MvCy2TvOog8EwruUUiFQDXA+q8kzye0YDpsy8UI=; b=IaYzNxLHcyzX/Ix+wA0pnCf6VK
	dKSS/29KXXiHPnxJL0tKnEiCMY8/xAFXIxp/kfayDgjLgb2CGGFG/fsJMt09vrYSgPkPOaYgcYV7s
	qreZ8OIrQ9vserfQZE8WzgdXJLhjmD9o4hjXE2CYtliPL9/zjWHjEKVO6YYCXchauTM92pCiJ9hXJ
	eyy3RuqnANyD+gib4PFdMstRn1OkR9+vCJTH7NF3tB1MkYXFRricac9fGrUpLaEwqVv3fLCH3Qcyx
	qaZDUWWUjjVelW8O6lpgEUF9cXwkVFacg3njUldkRkbh6qEPgl+CrzuQSU5B8FNEfcnIwzMGmudJu
	Mf3h1G9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirYD-0000000AOdM-1fpv;
	Tue, 27 Aug 2024 08:27:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirYA-0000000AOcj-1697
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 08:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E434A416A2;
	Tue, 27 Aug 2024 08:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5BDC8B7A1;
	Tue, 27 Aug 2024 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724747257;
	bh=1rkI4WrRPDAwhoBOGEVwC57pHpopfqFDDT7/hRpJzqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Twy4yVBq4eCjHpx5uL77VoG3+vIPFlZxx8KMRhrbne1H+70TI04S50mj9XoTxZMv7
	 iFrZ6Cywk6J3dIoYbVzP4ew2L+sK38EvkSAFSiFbADLEhTc1qdmrGuRlsrpucKfVL1
	 aesWVGMebsYWX5kDKA0E4ZAn3n6qTRW6ZMJhT69rGnij++8TWFGiuDFUtaVr8tR+UC
	 fmQBZz9a7dopQHdnDXi0IgHqzoPYmhrIPVRzk6ApLzhvRd0p7a8KQK27Q4p8fKO1N8
	 P1AwvoBK16Z4K2inHHCl0fhpUVcF2BLHffXA4wAluT073/Lmw5f/icl07ISW5LKMen
	 penIzHL3HXe+Q==
Date: Tue, 27 Aug 2024 09:27:32 +0100
From: Conor Dooley <conor@kernel.org>
To: qiaozhe <qiaozhe@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	samuel.holland@sifive.com, evan@rivosinc.com, tglx@linutronix.de,
	andy.chiu@sifive.com, cleger@rivosinc.com, ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Report error when repeatedly recording CPU
 hardware ID
Message-ID: <20240827-brink-dinginess-a50cccba3bc7@spud>
References: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
 <20240823-circulate-underarm-13406fd8cc44@spud>
 <18c653d4-e2d5-4886-bbcc-a2c87da7e8e9@iscas.ac.cn>
 <20240826-arousal-sharply-9aeffe1bd89d@wendy>
 <0157d961-1124-43c8-ac40-53e4986dbbf9@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <0157d961-1124-43c8-ac40-53e4986dbbf9@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_012738_450377_2DE83C3E 
X-CRM114-Status: GOOD (  34.93  )
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
Content-Type: multipart/mixed; boundary="===============8816639092920972843=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8816639092920972843==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4kBnFeiL0axLL0iM"
Content-Disposition: inline


--4kBnFeiL0axLL0iM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 09:39:30AM +0800, qiaozhe wrote:
>=20
> On 2024/8/26 16:15, Conor Dooley wrote:
>=20
> > On Sat, Aug 24, 2024 at 10:41:28AM +0800, qiaozhe wrote:
> >>
> >>
> >> On 2024/8/23 20:57, Conor Dooley wrote:
> >>
> >>> On Fri, Aug 23, 2024 at 05:11:00PM +0800, Zhe Qiao wrote:
> >>>> In the of_parse_and_init_cpus() function, when the __cpuid_to_hartid=
_map[]
> >>>> array records the CPU hardware ID, if the same CPU hardware attribut=
e has=20
> >>>> been recorded, an error report is issued, thereby ensuring the uniqu=
eness
> >>>> of the CPU hardware ID recorded in the __cpuid_to_hartid_map[] array.
> >>> Why is this actually required? On what system did you encounter this?
> >> This is not actually a patch submitted for problems encountered in act=
ual=A0
> >> development environments, but rather a comparison of ARM architecture =
when=A0
> >> I was learning Linux kernel and found similar judgments on ARM archite=
cture.
> > Okay, it's good that you didn't find such a bad dtb "in the wild" :)
> >
> >> In addition, if the same attribute exists on the CPU hardware ID and i=
s=A0
> >> recorded in __cpuid_to_hartid_map[], the kernel may need to make a jud=
gment=A0
> >> on this error.
> >>
> >>
> >>>> Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>
> >>>> ---
> >>>>  arch/riscv/kernel/smpboot.c | 16 ++++++++++++++++
> >>>>  1 file changed, 16 insertions(+)
> >>>>
> >>>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot=
=2Ec
> >>>> index 0f8f1c95ac38..698f9fe791f7 100644
> >>>> --- a/arch/riscv/kernel/smpboot.c
> >>>> +++ b/arch/riscv/kernel/smpboot.c
> >>>> @@ -118,6 +118,16 @@ static void __init acpi_parse_and_init_cpus(voi=
d)
> >>>>  #define acpi_parse_and_init_cpus(...)	do { } while (0)
> >>>>  #endif
> >>>> =20
> >>>> +static bool __init is_mpidr_duplicate(unsigned int cpuid, u64 hart)
> >>>> +{
> >>>> +	unsigned int i;
> >>>> +
> >>>> +	for (i =3D 1; (i < cpuid) && (i < NR_CPUS); i++)
> >>>> +		if (cpuid_to_hartid_map(i) =3D=3D hart)
> >>>> +			return true;
> >>>> +	return false;
> >>>> +}
> >>>> +
> >>>>  static void __init of_parse_and_init_cpus(void)
> >>>>  {
> >>>>  	struct device_node *dn;
> >>>> @@ -131,6 +141,12 @@ static void __init of_parse_and_init_cpus(void)
> >>>>  		if (rc < 0)
> >>>>  			continue;
> >>>> =20
> >>>> +		if (is_mpidr_duplicate(cpuid, hart)) {
> >>>> +			pr_err("%pOF: duplicate cpu reg properties in the DT\n",
> >>>> +				dn);
> >>>> +			continue;
> >>> Why would we continue in this case? If the devicetree is this broken,
> >>> why shouldn't we just BUG() and abort immediately?
> >> This is because I did not find any judgment on this issue in the previ=
ous code=A0
> >> during the analysis process, so I did not take more aggressive measure=
s in this=A0
> >> regard, but only issued an error alarm.
> > What do you think though? Should we continue to boot in this case?
> > If you read the function a bit further, you'll see that we abort boot
> > if there are two instances of the boot CPU. Do you think the same should
> > be done for all CPUs?
>=20
>=20
> Yes, I saw that if there are two boot CPUs, a BUG will occur. For all CPU=
s,=A0
>=20
> if there are two CPUs with the same attributes, I think a bug should be g=
enerated=A0
>=20
> directly. This will attract more attention than issuing false warnings, w=
hile also=A0
>=20
> reducing the difficulty of troubleshooting related issues.
>=20
>=20
> These are some of my opinions, I don't know if they are reasonable to con=
sider.=A0
>=20
> What do you think?

I think that BUG()ing here would be reasonable to do.

--4kBnFeiL0axLL0iM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs2N9AAKCRB4tDGHoIJi
0vSFAQD02Hl7HYzSRaEa2s1RMLlAvYZPFnLpJ2EbtfSnT6OziQD/eHtYk4oC4gjY
C7+qRESu3N+O5q0+llc+uESyupemiAM=
=zOcg
-----END PGP SIGNATURE-----

--4kBnFeiL0axLL0iM--


--===============8816639092920972843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8816639092920972843==--

