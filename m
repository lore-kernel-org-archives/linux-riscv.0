Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6BC2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faYnf4U1ZIBEhz40R2pOO5QWk6mTeL2jEJ8F0Gq2AL4=; b=e2N+yAvh2DWwxRETTpzgcrDKgY
	nbQmx/6XTi7N7Sg1laiaQrfCFkc0yLlNWgTD7iN17VPy8J7G8VShjILDGFSkgGy6HgZFbpatj4HZS
	LwzOyLBGzknC4Z72fwLo5uUyRFLt64/LJddQjM/S/YpA+mtsGEnHzExewYxAvT56sWnA3JsOHGgGc
	D8iUkZrmNbWbA1PK13Wum+BnNRqYAfVUmsOVMD5Ziw3M6yMmQRKIkiBZzNzA+8ulOsGoEMjzGnFq2
	OvKmgMYp5GSoQ37tP5lgoopUggkzo1yVvQyoLxAuY5gAMsluVrF3xM2r4wYLLia37t26crRW8Dz4Y
	pUrcLwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgwq-0000000GQDp-210u;
	Mon, 24 Jun 2024 10:29:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgwn-0000000GQD7-46W6;
	Mon, 24 Jun 2024 10:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719224958; x=1750760958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wNeAG9yIK0CZl4N/ZkvXzvReYFJ5z22Ul9DecMcs2k4=;
  b=IWOldgPxb05WC32Dk3n7xkRRloMl9FIpt7uaNVJe5nSPUhmzN063N2b9
   MGNe/eECpd23yS7jkc/fZTx5RU7VqUk14rs/pEdaJ9t2RnHH8pJfRe5Zu
   kjFZGSk3r1PmLMP0huasx+xtX87Phlly1rlawquJWbsy7IFZUAPiDfTj3
   gEyQnRZ4Umwcdj2MRLxg81Pg4PK7npfO/K9FiIZMYW4fUcQ2WiGNQRsNr
   8c4Oa89tKzG9EL4pTH70srslB8unm6kw9NH/QVs0vLzL0rphlUwG6u6Ls
   842Bng7TYTTFSYCWoZeYQMYskIlUrkUuzrYM/4VSaVBAht/bQU+Ew9mYq
   w==;
X-CSE-ConnectionGUID: waFIp9S2RTGCYk7TOATuyQ==
X-CSE-MsgGUID: TZMuc6vpTuuD6P8hbW5QIA==
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="asc'?scan'208";a="28414746"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 03:29:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 03:28:59 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 24 Jun 2024 03:28:56 -0700
Date: Mon, 24 Jun 2024 11:28:41 +0100
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
Subject: Re: [PATCH v7 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Message-ID: <20240624-remission-dominoes-9f22be5ba999@wendy>
References: <20240619113529.676940-1-cleger@rivosinc.com>
 <20240619113529.676940-9-cleger@rivosinc.com>
 <20240623-cornbread-preteen-4ec287aa165c@spud>
 <c59a8897-34a1-4dc3-b68b-35dddf55c937@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <c59a8897-34a1-4dc3-b68b-35dddf55c937@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_032918_053177_D80D663E 
X-CRM114-Status: GOOD (  23.35  )
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
Content-Type: multipart/mixed; boundary="===============7716231827916266071=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7716231827916266071==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="022xOD13U5wpppzg"
Content-Disposition: inline

--022xOD13U5wpppzg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 10:24:51AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 23/06/2024 17:42, Conor Dooley wrote:
> > On Wed, Jun 19, 2024 at 01:35:18PM +0200, Cl=E9ment L=E9ger wrote:
> >> The Zc* standard extension for code reduction introduces new extension=
s.
> >> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> >> are left out of this patch since they are targeting microcontrollers/
> >> embedded CPUs instead of application processors.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  arch/riscv/include/asm/hwcap.h |  4 +++
> >>  arch/riscv/kernel/cpufeature.c | 55 +++++++++++++++++++++++++++++++++-
> >>  2 files changed, 58 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/h=
wcap.h
> >> index 18859277843a..b12ae3f2141c 100644
> >> --- a/arch/riscv/include/asm/hwcap.h
> >> +++ b/arch/riscv/include/asm/hwcap.h
> >> @@ -87,6 +87,10 @@
> >>  #define RISCV_ISA_EXT_ZVE64F		78
> >>  #define RISCV_ISA_EXT_ZVE64D		79
> >>  #define RISCV_ISA_EXT_ZIMOP		80
> >> +#define RISCV_ISA_EXT_ZCA		81
> >> +#define RISCV_ISA_EXT_ZCB		82
> >> +#define RISCV_ISA_EXT_ZCD		83
> >> +#define RISCV_ISA_EXT_ZCF		84
> >> =20
> >>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >> =20
> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufea=
ture.c
> >> index a3af976f36c9..aa631fe49b7c 100644
> >> --- a/arch/riscv/kernel/cpufeature.c
> >> +++ b/arch/riscv/kernel/cpufeature.c
> >> @@ -111,6 +111,9 @@ static int riscv_ext_zicboz_validate(const struct =
riscv_isa_ext_data *data,
> >> =20
> >>  #define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _=
id, NULL, 0, NULL)
> >> =20
> >> +#define __RISCV_ISA_EXT_DATA_VALIDATE(_name, _id, _validate) \
> >> +			_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, _validate)
> >> +
> >>  /* Used to declare pure "lasso" extension (Zk for instance) */
> >>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
> >>  	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> >> @@ -122,6 +125,37 @@ static int riscv_ext_zicboz_validate(const struct=
 riscv_isa_ext_data *data,
> >>  #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _val=
idate) \
> >>  	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _v=
alidate)
> >> =20
> >> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *dat=
a,
> >=20
> > It's super minor, but my OCD doesn't like this being called "depends"
> > when the others are all called "validate".
>=20
> Ok, let's make a deal. You review patch 14/16 and I'll make the machine
> part of you happy and call this function validate ;)

I generally avoid the hwprobe patches intentionally :) I'm not even
expecting a respin for this tbh, I'd like to just get it in so that I
can do things on top of it.

--022xOD13U5wpppzg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnlKWAAKCRB4tDGHoIJi
0qTZAQDW6NkBEEY0BpVBm4oazaou8r5axQXRsRokUPZuDY/Q/wEA7XbMZLRFekMt
ZYMxRfkbyf9XPgmg2W/WvyHnahDlhA4=
=Ozsy
-----END PGP SIGNATURE-----

--022xOD13U5wpppzg--


--===============7716231827916266071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7716231827916266071==--

