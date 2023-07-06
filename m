Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FCEEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 06:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWC2mlq9jQu0srhD61z1O3DJVI1r/F+dIVd9sLercf8=; b=ig/lM694PRHxCeUTFEG3iOB7se
	c4C2PwviGF4uQuLb8Lv1bLuBVxMixvp5cINkAG9z9GfgGN7DTGYVMoOAiS/8T6nh+ypyVTvvN7a4T
	k8OEYKbQ5hNPNzutJz/2YHGqcXLDtlBmSXSnNqxlXrYP1Jdi9mzSOAZHqkCDS4tHCjDrcABhEtfoL
	eh+JNG8dVYd48YnGJcP1e9dqKCGyaUJjqicmIRA4ufRl2rrC2s1d7VdBL6v/K0+s2bq3MB6BvS1yb
	EUzsmED+FBK58vCmyFrPESlI2AvbLcTVx2qT9zcFH20QWAWpIorY4QQP3lC4bdn9j+FxcF44VwRLj
	PEpEiJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIkF-000gU7-0R;
	Thu, 06 Jul 2023 06:45:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIkC-000gSp-1K
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 06:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688625936; x=1720161936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YI3foU5MblPQyUbd2sUSOe4Ngn7M7sWkAvN3y52gY9Y=;
  b=izIol84PEC/XZx2Y8g5rUmS7chfxBt21wZaT2CWmtwXTMJqdq126EbxQ
   iBbNGjrVBY2QjGc91/75myUoBjfY8Lk/G4rOcZod49udAGDfvEFw7TMaT
   6e7t0N9CTIOo0SbCCBsVKyfTneV3fHOP5G4BTP9jx0trAemFwPxHTG+1l
   P/bUx2hVXC0odK++XzcrIfAm5CFmB4r8FMQ7isnfHrda9iS1+v2m3U5tt
   8gZrnZQaxbmHxf5Us/BnF/eFlAZrB5RILnihZCIntz6B4S8GgNBhWbWEy
   ZIs+SYpDnk0PR5MONf2DY3dZZ18Q9LjAXheVdOBvRC46kndj9piYrCGLj
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="asc'?scan'208";a="219119976"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2023 23:45:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Jul 2023 23:45:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 5 Jul 2023 23:45:12 -0700
Date: Thu, 6 Jul 2023 07:44:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Subject: Re: [External] Re: [PATCH v3 4/4] dt-bindings: firmware: Document
 ffitbl binding
Message-ID: <20230706-syndrome-wise-c1097518f2c6@wendy>
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
 <20230705114251.661-5-cuiyunhui@bytedance.com>
 <20230705-oblivious-unstuffed-8e028a5b243c@spud>
 <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_234536_523304_58F7213E 
X-CRM114-Status: GOOD (  23.66  )
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
Cc: mark.rutland@arm.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, jdelvare@suse.com, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, ardb@kernel.org, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org, paul.walmsley@sifive.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, rminnich@gmail.com, palmer@dabbelt.com, yc.hung@mediatek.com
Content-Type: multipart/mixed; boundary="===============0733912922969986096=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0733912922969986096==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UxRv2D6dZld+dL4w"
Content-Disposition: inline

--UxRv2D6dZld+dL4w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 11:43:55AM +0800, =E8=BF=90=E8=BE=89=E5=B4=94 wrote:
> On Wed, Jul 5, 2023 at 11:07=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Wed, Jul 05, 2023 at 07:42:51PM +0800, Yunhui Cui wrote:
> > > Add the description for ffitbl subnode.
> > >
> > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > > ---
> > >  .../devicetree/bindings/firmware/ffitbl.txt   | 27 +++++++++++++++++=
++
> > >  MAINTAINERS                                   |  1 +
> > >  2 files changed, 28 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/firmware/ffitbl=
=2Etxt
> > >
> > > diff --git a/Documentation/devicetree/bindings/firmware/ffitbl.txt b/=
Documentation/devicetree/bindings/firmware/ffitbl.txt
> > > new file mode 100644
> > > index 000000000000..c42368626199
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/firmware/ffitbl.txt
> >
> > Firstly, new dt-bindings need to be done in yaml, not in text form.
> > Secondly, you didn't re-run get_maintainer.pl after adding this binding,
> > so you have not CCed any of the other dt-binding maintainers nor the
> > devicetree mailing list.
>=20
> Re-run get_maintainer.pl and added maintainers into the maillist.
> emm.. There is some *txt in
> Documentation/devicetree/bindings/firmware/, isn't it?

There might be, but that's not an excuse for adding _new_ ones, sorry.

> > > +FFI(FDT FIRMWARE INTERFACE) driver
> > > +
> > > +Required properties:
> > > + - entry             : acpi or smbios root pointer, u64
> > > + - reg                       : acpi or smbios version, u32
> >
> > Please go look at any other dt-binding (or the example schema) as to how
> > these properties should be used. A "reg" certainly should not be being
> > used to store the revision...
>=20
> Okay, If so=EF=BC=8CI'll add a property "version" into the dts instead of
> "reg", just like, WDYT?
> ffitbl {

Firstly, I'd much rather you spelt this out, like "ffi-table".

>     smbios {
>         entry =3D "";

I still don't understand why "entry", which is an address, is being
represented by an empty string.
I also don't really get why you have not used "reg" to describe its
start address and size.

>         version =3D < 0x02 >;

Probably missing a vendor prefix, and the spaces are unusual, but better
than it was, yes.

>     }
>    acpi {
>          entry =3D "";
>          version =3D < 0x06 >;
>   }
> }

Thanks,
Conor.

--UxRv2D6dZld+dL4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKZi1gAKCRB4tDGHoIJi
0kPBAQC+/8gAglhv+DsGHS+G2SMUClIIP7J58SEWQ7XovHEq5AEA011nqKPb8Sr9
/KtHr/6v6qHXYUtkKGNwJwxU8cRl8A0=
=cxHv
-----END PGP SIGNATURE-----

--UxRv2D6dZld+dL4w--


--===============0733912922969986096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0733912922969986096==--

