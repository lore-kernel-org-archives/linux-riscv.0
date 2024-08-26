Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19221C5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 08:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kI08QK+bFmErOrrrHwc9Asn3LBY1tTqkmfnOECoBeGg=; b=4+pj7eXM9ElMiLa2YBo0gnXiYz
	vt2miZFjArGdWRwHSp5HMHg6lzNC9syKmQbS7XcEACOz2lJ8YQzRcVfmkr7t/dh3pZ/25DFCiXuVQ
	TiwPILhvkvaXRXz1hhjl6s5K6HYexbwTng9yTnHli8NQ+EdQJ83Y0d5VzIbLoLv6eemrIf0QaYZX6
	PNga004XplIdFYFpbQHSL9a0G7LDC1tln0NXSlnqXFolaPHhChHZFnT+ww4qnhNDJwRHDcO0xs5wO
	kQIYFeO+CgwQc1PyxRlGjir4kcDL6RYmKvwfNO8SnWb7zTT7lEY5o1FEZ5tgM5iwyrA6DtPLp8Xg5
	/3DMNOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUtz-00000006RVt-2Njb;
	Mon, 26 Aug 2024 08:16:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUtw-00000006RV9-3eWW
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 08:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1724660197; x=1756196197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4WW4CyM+rbnvwxVN86jRTSoO/t/ASmHQGT1sgjvFjvs=;
  b=GtZhZm4t6IkzzPM7xxL22YwX4aEC2nQi3I4wDukAnyi+to1VKBi8v48v
   s+Dq42sA1bR5e902ltUs5uSw/D3vmmzQdrX7Np9qc4Ce2dXQdJQ7K1+8A
   YXXS3bLUlpO+4LKmoEssz/WwK/gDCMaj4+87y6wo22ualaa8QRXk0T9QX
   QtsuMzpXYyudtwkynAQ9qfaJDkjLfslFXq+IWkVdzX0JQxyL044vkli13
   PEVRiJWE1CD1ygw4YxETkOQdfz8li1GSJoyAzDxP+x4wDYFFECT54GhFQ
   EQPV7Uc7K6ehBTuASPIiohDIwX7adIwVvQSLyBVwR8SLAoMtQ284AXpWm
   Q==;
X-CSE-ConnectionGUID: XjNrtb/RRBGuMEly428M0g==
X-CSE-MsgGUID: 74r1OpGBRfmtF3EhsCzR5w==
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="asc'?scan'208";a="261824183"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Aug 2024 01:16:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Aug 2024 01:15:54 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Aug 2024 01:15:52 -0700
Date: Mon, 26 Aug 2024 09:15:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: qiaozhe <qiaozhe@iscas.ac.cn>
CC: Conor Dooley <conor@kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <samuel.holland@sifive.com>,
	<evan@rivosinc.com>, <tglx@linutronix.de>, <andy.chiu@sifive.com>,
	<cleger@rivosinc.com>, <ajones@ventanamicro.com>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Report error when repeatedly recording CPU
 hardware ID
Message-ID: <20240826-arousal-sharply-9aeffe1bd89d@wendy>
References: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
 <20240823-circulate-underarm-13406fd8cc44@spud>
 <18c653d4-e2d5-4886-bbcc-a2c87da7e8e9@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <18c653d4-e2d5-4886-bbcc-a2c87da7e8e9@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_011637_049748_A2F676F1 
X-CRM114-Status: GOOD (  30.59  )
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
Content-Type: multipart/mixed; boundary="===============6265121544601595935=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6265121544601595935==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mObjWQ5Ym9/M6aF6"
Content-Disposition: inline

--mObjWQ5Ym9/M6aF6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 10:41:28AM +0800, qiaozhe wrote:
>=20
>=20
>=20
> On 2024/8/23 20:57, Conor Dooley wrote:
>=20
> > On Fri, Aug 23, 2024 at 05:11:00PM +0800, Zhe Qiao wrote:
> >> In the of_parse_and_init_cpus() function, when the __cpuid_to_hartid_m=
ap[]
> >> array records the CPU hardware ID, if the same CPU hardware attribute =
has=20
> >> been recorded, an error report is issued, thereby ensuring the uniquen=
ess
> >> of the CPU hardware ID recorded in the __cpuid_to_hartid_map[] array.
> > Why is this actually required? On what system did you encounter this?
>=20
> This is not actually a patch submitted for problems encountered in actual=
=A0
> development environments, but rather a comparison of ARM architecture whe=
n=A0
> I was learning Linux kernel and found similar judgments on ARM architectu=
re.

Okay, it's good that you didn't find such a bad dtb "in the wild" :)

> In addition, if the same attribute exists on the CPU hardware ID and is=A0
> recorded in __cpuid_to_hartid_map[], the kernel may need to make a judgme=
nt=A0
> on this error.
>=20
>=20
> >> Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>
> >> ---
> >>  arch/riscv/kernel/smpboot.c | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> >> index 0f8f1c95ac38..698f9fe791f7 100644
> >> --- a/arch/riscv/kernel/smpboot.c
> >> +++ b/arch/riscv/kernel/smpboot.c
> >> @@ -118,6 +118,16 @@ static void __init acpi_parse_and_init_cpus(void)
> >>  #define acpi_parse_and_init_cpus(...)	do { } while (0)
> >>  #endif
> >> =20
> >> +static bool __init is_mpidr_duplicate(unsigned int cpuid, u64 hart)
> >> +{
> >> +	unsigned int i;
> >> +
> >> +	for (i =3D 1; (i < cpuid) && (i < NR_CPUS); i++)
> >> +		if (cpuid_to_hartid_map(i) =3D=3D hart)
> >> +			return true;
> >> +	return false;
> >> +}
> >> +
> >>  static void __init of_parse_and_init_cpus(void)
> >>  {
> >>  	struct device_node *dn;
> >> @@ -131,6 +141,12 @@ static void __init of_parse_and_init_cpus(void)
> >>  		if (rc < 0)
> >>  			continue;
> >> =20
> >> +		if (is_mpidr_duplicate(cpuid, hart)) {
> >> +			pr_err("%pOF: duplicate cpu reg properties in the DT\n",
> >> +				dn);
> >> +			continue;
> >=20
> > Why would we continue in this case? If the devicetree is this broken,
> > why shouldn't we just BUG() and abort immediately?
>=20
> This is because I did not find any judgment on this issue in the previous=
 code=A0
> during the analysis process, so I did not take more aggressive measures i=
n this=A0
> regard, but only issued an error alarm.

What do you think though? Should we continue to boot in this case?
If you read the function a bit further, you'll see that we abort boot
if there are two instances of the boot CPU. Do you think the same should
be done for all CPUs?


Thanks,
Conor.

>=20
> >> +		}
> >> +
> >>  		if (hart =3D=3D cpuid_to_hartid_map(0)) {
> >>  			BUG_ON(found_boot_cpu);
> >>  			found_boot_cpu =3D 1;
> >> --=20
> >> 2.43.0

--mObjWQ5Ym9/M6aF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsw5mAAKCRB4tDGHoIJi
0pydAQDwksW6fJQ8cOdxInnVkZnY1S/AuzbPympNSTcmPc//VwEArC1WIyAahQe3
N+HqM02gpI1HRcAN2opkFSyxOlbtLQA=
=EQVs
-----END PGP SIGNATURE-----

--mObjWQ5Ym9/M6aF6--


--===============6265121544601595935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6265121544601595935==--

