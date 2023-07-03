Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A430AEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGNlBji6xWlgkPdWLaKqTxmBJByVLSp+z52aXHPnLCM=; b=3bu/Oeik1U9GrCLXxmoT83jhA5
	rYzhB7Y4o8XYAmOThPUBOv2fxeg98um1MsteV7+63Dnf74fpG+coH/nYrYcOYejB/JcOzZVZG12rL
	VG7nH+OwCm09gwX7TTSk36600tj+wKX+9wBNovQqGytt5+4ZvLFKCVHvftfS/ooY+e3aAimiuLpna
	2H2gEWiiqXOPx1apbY5SjC0O7blPmJ1M4QCu524LbmtIPBI5hJyOFp6HShOs0xDupf7OivVeUEv2x
	0Pi+Hhq1MNplaQwILjyBdfsdCDct8qePMNSFYPveFSQSZriP0emPNwwuD0Qpxk4+slp/riQ2PEdyn
	/luQzn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGKSz-00AkSf-1M;
	Mon, 03 Jul 2023 14:23:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGKSw-00AkQm-2g
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 14:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688394227; x=1719930227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+L1E/N9RqavBPrenoP9G4WVhEe4u338kfR3kCGQlQfA=;
  b=iME/dBxcdfjgbBuAbCbLFzycOklSFk4MDHX36GGXzT4N1dqdyLv9LK21
   X4VY9185E/TEXKWijVj8F/zbbteSdlw0xbB6FoPuHgYA6zHjQfo+hbXEN
   q+U1ciCW6A83MjSSAuX43QVgdlNIwaI8WssHUH4jlVi+H6PPNyDLrzcmm
   On/V6jXC8WyRhvquE3UxoUgivbVuLzhNb0MrEf+yafzMCZ3ofL3Z9QxVu
   Wzcn2YYf7HHh2gvtrxjQLZigzHyxEgKR1/xfCkw23mCrK6nJ2x2YsxDQ0
   K5R1Box6Nkp9Ta3lRIzarZoIVFck/zql7CmMzUJ18TpmQY52ek9msXIW4
   g==;
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="asc'?scan'208";a="221805980"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 07:23:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 07:23:40 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 07:23:36 -0700
Date: Mon, 3 Jul 2023 15:23:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>, <ardb@kernel.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <rminnich@gmail.com>,
	<mark.rutland@arm.com>, <lpieralisi@kernel.org>, <rafael@kernel.org>,
	<lenb@kernel.org>, <jdelvare@suse.com>, <yc.hung@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <allen-kh.cheng@mediatek.com>,
	<pierre-louis.bossart@linux.intel.com>, <tinghan.shen@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<geshijian@bytedance.com>, <weidong.wd@bytedance.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
Message-ID: <20230703-operation-mankind-778882d8d350@wendy>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230703-71f67eb66a037f5c0fb825c6@orel>
 <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
 <20230703-6ac90a2de15f1017bc0ced74@orel>
MIME-Version: 1.0
In-Reply-To: <20230703-6ac90a2de15f1017bc0ced74@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_072347_029866_D9AF4E57 
X-CRM114-Status: GOOD (  14.04  )
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
Content-Type: multipart/mixed; boundary="===============8196348068994393267=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8196348068994393267==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E+2R2X9wOGgH+Gca"
Content-Disposition: inline

--E+2R2X9wOGgH+Gca
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 04:17:07PM +0200, Andrew Jones wrote:
> On Mon, Jul 03, 2023 at 09:30:10PM +0800, =E8=BF=90=E8=BE=89=E5=B4=94 wro=
te:
> > On Mon, Jul 3, 2023 at 9:01=E2=80=AFPM Andrew Jones <ajones@ventanamicr=
o.com> wrote:
> > >
> > >
> > > (This is a reply to a non-existent cover letter.)
> >=20
> > This has been discussed many times with Ard, Please refer to :
> > https://patches.linaro.org/project/linux-acpi/patch/20230426034001.16-1=
-cuiyunhui@bytedance.com/
>=20
> There's nothing in that thread that convinces me this is a good idea.
> Indeed, afaict from that thread, Ard nacked this. It was only when it
> was suggested that arch/riscv would own the code, that he stopped
> complaining about it. I wouldn't call that an endorsement.

In fact, he expressly said that it would then be up to the RISC-V
maintainers as to what to do:
	But please check with the RISC-V maintainers
	if they are up for this, and whether they want to see this mechanism
	contributed to one of the pertinent specifications.


--E+2R2X9wOGgH+Gca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKLZywAKCRB4tDGHoIJi
0lN2AQDpIYP//3WSQfuOdQ5ge5coGys/iiBPLD9RjiOuc+OMJAD/bZh8USr333vM
nyvylIQXi4vnoVBU3XUmLLWvRqRzpgE=
=n7aW
-----END PGP SIGNATURE-----

--E+2R2X9wOGgH+Gca--


--===============8196348068994393267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8196348068994393267==--

