Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2CDC001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 09:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImYID7YUCMQbB/yPNHQF7ALMemsduDfrTA9wOKpM6tI=; b=exA12TDwGDvkim08aItOa6NoTv
	7gGc8NInMSikannHP53gUmGJFgUXX7n716hbQKnKAHnyKxUrTF7d9Z33q+xAQvVMVuzljbQg3NaOs
	LniCVRUDq3oOCOYSgx8swJKvELdKjkSThCS5j9haYV56jjkyPyQLg8DCv/3SPW3l5qg1AYh8v8gEL
	v4djp5E9UEKvEsZGNLZQoOYJPBBgA7NkQN1i+PAkrfiLZ+QLYTMf71cMGefdCpUwAH1k9tlqPs48Y
	2bg+/b1mHsF39smbwOMphwTzTtHI8SfufOlT04QPaX7nyN7zhf+3WAREmZyP9Wgqvr6k7I+dzhBKQ
	lIPX6txw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8VZ-004Wz0-0F;
	Wed, 02 Aug 2023 09:51:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8VW-004WyZ-1l
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 09:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690969866; x=1722505866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vzNzAgti1mALKRkB7nhHCwcw9iaYKtu7Mwjj/hXtAh8=;
  b=DXgC8ff2kBG/J/03X6UidT8Cg7I5+Tn9vxzFvHjSL6u39JJ3J0B7rIgf
   LeDnDxKqp+nf8HivzmPd8Ew6HZhCEK9iMWku8u9WvfknfKebwnIkV0k15
   lU+hUBT2NewnCH4cDZSssKiinxDbaMnrPF3zG5hEVHtuB/csxgFdJhLcB
   v5LxpA02h4HwOAXpltqm25paHKvBopvSAxOZXWHHNgp/lLfoAWNHLPzs8
   oKzZpxigsRB9S1H0kJnvJBiVhNJo5JCWwGxlIKS/V3lN/vRphxniwN24r
   xIUHrnAPXuLqpTYalReDEg8XS8P62hRS4QXi7j/fqw/5oFfgXIqypsLBF
   g==;
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="asc'?scan'208";a="164455134"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Aug 2023 02:51:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 2 Aug 2023 02:51:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 2 Aug 2023 02:51:01 -0700
Date: Wed, 2 Aug 2023 10:50:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: Minda Chen <minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>, Dao
 Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Mason Huo <mason.huo@starfivetech.com>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH v1] riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace
 zihintpause
Message-ID: <20230802-tightwad-squeezing-bcdded12330d@wendy>
References: <20230802064215.31111-1-minda.chen@starfivetech.com>
 <20230802-sharpness-spoon-f9b8804fb66f@wendy>
 <d64874cb-8628-a6d2-d2f4-8af4d0ebf8b2@starfivetech.com>
 <20230802-seismic-gallstone-fca0f4b17076@wendy>
 <c42bd997-8795-8bf7-eee1-3ac8b153371a@starfivetech.com>
 <2023080253-headache-moneybags-a833@gregkh>
 <20230802-decibel-unshaved-fde1cfba2d20@wendy>
 <2023080255-stomp-smell-43ae@gregkh>
MIME-Version: 1.0
In-Reply-To: <2023080255-stomp-smell-43ae@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_025106_773270_BD8E74F7 
X-CRM114-Status: GOOD (  21.84  )
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
Content-Type: multipart/mixed; boundary="===============3359930640145449626=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3359930640145449626==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7mmglFYMmxEffWC0"
Content-Disposition: inline

--7mmglFYMmxEffWC0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 11:42:59AM +0200, Greg KH wrote:
> On Wed, Aug 02, 2023 at 09:52:45AM +0100, Conor Dooley wrote:
> > On Wed, Aug 02, 2023 at 10:33:27AM +0200, Greg KH wrote:
> > > On Wed, Aug 02, 2023 at 04:17:51PM +0800, Minda Chen wrote:
> > > > On 2023/8/2 15:48, Conor Dooley wrote:
> > > > > On Wed, Aug 02, 2023 at 03:32:15PM +0800, Minda Chen wrote:
> > > > >> On 2023/8/2 14:54, Conor Dooley wrote:

> > > > >> Thanks, Conor. I found this just by inspection. I found a issue =
that vdso.so call cpu_relax
> > > > >> cause application core dump in kernel 6.1.31. I need Samuel'patc=
h to fix this. And I search the log
> > > > >> of processor.h found this issue.
> > > > >=20
> > > > > That doesn't look like it is fixed in later stable kernels (we ar=
e at
> > > > > 6.1.42-rcN right now I think). It sounds we should ask Greg to ba=
ckport
> > > > > 0b1d60d6dd9e ("riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=
=3Dy")
> > > > > to 6.1. Does that make sense to you?
> > > > Yes. 6.1 is lts kernel. Starfive will use this kernel for a long ti=
me. Thanks.
> > >=20
> > > What is preventing you from moving to a newer kernel version?  All of
> > > your kernel changes are already properly merged into Linus's tree,
> > > right?
> >=20
> > Regardless of their reasons, "vdso.so call cpu_relax cause application
> > core dump" is something that we should fix in stable kernels, no?
>=20
> Yes.

It doesn't apply cleanly as a cherry-pick onto linux-6.1, so it'll need
to be submitted. Maybe Minda can do that, since they've got an already
tested version of the patch. Failing that, I will.

--7mmglFYMmxEffWC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMom4QAKCRB4tDGHoIJi
0ic9AP9ecnH7XK0svOPmGN8QdpCH7CToY7UNWnokQhm/lLP35AD5ASAuSUm4fkdF
mj9dosTVhTn+FzFakG4X8lLMnfEMwwM=
=5zWd
-----END PGP SIGNATURE-----

--7mmglFYMmxEffWC0--


--===============3359930640145449626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3359930640145449626==--

