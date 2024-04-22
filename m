Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA686C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 11:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFjmVCDY5L4wXliclDmmQsKcEO4w7BM1C9vYLCqyCFc=; b=eemIYNQDmUbMwFlYwh0xbz1Wt8
	5FjDP7gOhkZgttgUvvlcf1/HBFIgiYwWV6PQ0CuINAwziV2OSvb0jDjotu27BLajJXQz8eKEh+zXg
	U5cMOtnTB+ZZ8EMV9YbCRIsv9oRaCebSbKf66IXNeJg7gDjv2ZVkFTF8//hXEI8qgcoxoWNIlGSub
	Ca7Ke1elMZoY13rVnIDKr0m4kQBOlBKLiFlTDpk8IYL1nRDXOe2TiUa/cOBGQurfn7brV2I9L8D5e
	RgTGf8ZKIApSJWnrH6fXlY+9DyZCq1GPc6wBvRdjD1R07kottqO6W1z9HlCw8gk01jGPsnC2RWawi
	sLKxH1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrzK-0000000DO5S-1vur;
	Mon, 22 Apr 2024 11:37:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrzG-0000000DO4f-3TQE;
	Mon, 22 Apr 2024 11:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713785850; x=1745321850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JirxwaUTPZ7gRRTADFPsE4LALCUoW+coAPWl1mh0lv4=;
  b=RqinKOa3YBvrd2ksnI43a33yaJO0WTf/AwdFQ86Et6UmqVvKZdzFqWDf
   5fOk5XnXRZb6KHWxqS9WBdbhLBwFauOKeYw87iaM0U2xxP26nXrQNWEFb
   DI9APwTSQOIEJ+Yr+/kTXANn6s/A9lKi23U1DyWXyKEmYCQeL+DdSJSjV
   a8GWkRmb3WIRgoggzZBSqeqf6axfGreoQQxgBdTFHSpUE3BMr+hTqbeCD
   WA+D8vVE3+fvr23+N/0m3JWBvTf/uK4pcxFo+1O3E1CWVpyEW292DyPMe
   42kluKHE5k2z0yhC9udXY9+MCojDSeUswXNu4GsxKIxDRzDEZrLekFZ59
   Q==;
X-CSE-ConnectionGUID: RWC0UfowTpGbeC6DP7jNJg==
X-CSE-MsgGUID: E2DBmtQjS3e/5QeweITlcg==
X-IronPort-AV: E=Sophos;i="6.07,220,1708412400"; 
   d="asc'?scan'208";a="22099120"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Apr 2024 04:37:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 04:37:01 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Apr 2024 04:36:58 -0700
Date: Mon, 22 Apr 2024 12:36:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel
	<anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, Atish Patra
	<atishp@atishpatra.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Message-ID: <20240422-matchbook-unlikable-59987a8d8b1f@wendy>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
 <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
 <20240422-daylight-sassy-ff3b0d867fef@wendy>
 <032530b8-a26e-494f-bd9c-3e1661add5d4@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <032530b8-a26e-494f-bd9c-3e1661add5d4@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_043731_393926_DC23D767 
X-CRM114-Status: GOOD (  25.86  )
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
Content-Type: multipart/mixed; boundary="===============9098525752596147030=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9098525752596147030==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BQeFG0OJOWz1hKp9"
Content-Disposition: inline

--BQeFG0OJOWz1hKp9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 01:14:26PM +0200, Cl=E9ment L=E9ger wrote:
> On 22/04/2024 11:35, Conor Dooley wrote:
> > On Mon, Apr 22, 2024 at 10:53:10AM +0200, Cl=E9ment L=E9ger wrote:
> >> On 19/04/2024 17:51, Conor Dooley wrote:
> >>> On Thu, Apr 18, 2024 at 02:42:27PM +0200, Cl=E9ment L=E9ger wrote:
> >>>> The Zc* standard extension for code reduction introduces new extensi=
ons.
> >>>> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> >>>> are left out of this patch since they are targeting microcontrollers/
> >>>> embedded CPUs instead of application processors.
> >>>>
> >>>> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >>>> ---
> >>>>  arch/riscv/include/asm/hwcap.h | 4 ++++
> >>>>  arch/riscv/kernel/cpufeature.c | 4 ++++
> >>>>  2 files changed, 8 insertions(+)
> >>>>
> >>>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm=
/hwcap.h
> >>>> index 543e3ea2da0e..b7551bad341b 100644
> >>>> --- a/arch/riscv/include/asm/hwcap.h
> >>>> +++ b/arch/riscv/include/asm/hwcap.h
> >>>> @@ -82,6 +82,10 @@
> >>>>  #define RISCV_ISA_EXT_ZACAS		73
> >>>>  #define RISCV_ISA_EXT_XANDESPMU		74
> >>>>  #define RISCV_ISA_EXT_ZIMOP		75
> >>>> +#define RISCV_ISA_EXT_ZCA		76
> >>>> +#define RISCV_ISA_EXT_ZCB		77
> >>>> +#define RISCV_ISA_EXT_ZCD		78
> >>>> +#define RISCV_ISA_EXT_ZCF		79
> >>>> =20
> >>>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >>>> =20
> >>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpuf=
eature.c
> >>>> index 115ba001f1bc..09dee071274d 100644
> >>>> --- a/arch/riscv/kernel/cpufeature.c
> >>>> +++ b/arch/riscv/kernel/cpufeature.c
> >>>> @@ -261,6 +261,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[]=
 =3D {
> >>>>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> >>>>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >>>>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> >>>> +	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> >>>> +	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> >>>> +	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> >>>> +	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
> >>>>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> >>>>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> >>>>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> >>>
> >>> Ye, this looks exactly like what I "feared".
> >>
> >> Ok but for instance, Qemu actually set Zc* based on C/F/D. So the ISA
> >> string containing theses dependencies should actually also be allowed.
> >> So should we simply ignore them in the ISA string and always do our own
> >> "post-processing" based on C/F/D?
> >=20
> > I'm not familiar with the contents of all of these extensions, but I
> > assume the reasoning for splitting them out is that you can implement
> > them but not maybe not implement C (or something similar)? If that's the
> > case, you cannot always imply.
>=20
> Yeah, they can be implemented independently so we need to be able to
> parse them independently.

> However, the kernel currently requires C

No it doesn't!
There's a Kconfig option that controls whether or not we build with
compressed instructions.

> so we
> should always have Zca/Zcf/Zcd. But if that changes in the future, then,
> that won't be true anymore. Better keep it generic probably


--BQeFG0OJOWz1hKp9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiZLygAKCRB4tDGHoIJi
0rZqAPsH+rOY+xwtmy02hvEj5S0LCo5WHbH42moKe/rg2JsecQD9Efgn3/dHRehg
SrE0p8oOablre3zPC16fRvmLyILrMAw=
=iMqf
-----END PGP SIGNATURE-----

--BQeFG0OJOWz1hKp9--


--===============9098525752596147030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9098525752596147030==--

