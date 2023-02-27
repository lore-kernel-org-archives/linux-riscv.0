Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE58C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkbLLsNVNKnnusTn8lBh9AgRfmtok/T7DwYhumzLm6w=; b=cIFQumkBr0zEY/fvLwlr3gNFOr
	PLG1grp204bNadMVHYvxF145axKSPtYpj6Q5dLSaARi9A3gWCrycDTGP+lv4T9eafZd3lA8FPd0JY
	BzumHH5NpxwKuOaSFV4DV6nqxiCkXjX/fdBi1UkanKzdy8NnFz6xZKEP84omWRLoIPI1//UWkgEp8
	605gYjUjOUgJrEsetIQs2yFubokATqpieLNWdpeXDwJu6EQXcI15OOAChxBRff7rx8V3kCmm5b6PQ
	cBKT0eAlIVabKLEzSyWTaL3KLS/wN3fNcyF0eDRJ0TDYI9XLZFJef0CzzBihRf9FzBmYyYqgIiAGT
	x8J/E4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWd3N-009efw-IP; Mon, 27 Feb 2023 12:56:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWd3K-009een-Da
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 12:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677502586; x=1709038586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SYzO1Z5QiAchp6VlN8dlhG1cZc1ViNp1xpnQxa5rYlA=;
  b=Lvt7f00nIn6WDQuq65wpdpnSziTl4tVh5ddN7NbP1sJIX0dN6i/pRaoz
   pFTF8Og6zMoamMrXWsb6O/81S0h2lkuAk6QWYKfcye/CLBmGhzgBczd/c
   NVusHR9+5shQP97DsOCCCjGFvrAfulY3XFFhhvDGWXY+zMnTue1dm8O0p
   2GHscYqvWTqvJ43YMYXsVYbOsuReQgtNM+trmUSmd6x1CgxI4Hpc1PEES
   6AeToXvs6xtjbEJWs8IXpd3VU1dvh8s99ogI3ti7a6mUe0zFnAcvW9kMN
   NTjK1SAfY4oxVphcJrZZ7CLE+O1sQmg0iy1Ci1cEskB5yv45lH86v7+kp
   g==;
X-IronPort-AV: E=Sophos;i="5.97,332,1669100400"; 
   d="asc'?scan'208";a="202388109"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 05:56:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 05:56:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 05:56:21 -0700
Date: Mon, 27 Feb 2023 12:55:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <corbet@lwn.net>, <alexs@kernel.org>, <siyanteng@loongson.cn>,
	<robh@kernel.org>, <palmer@rivosinc.com>, <leyfoon.tan@starfivetech.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
Message-ID: <Y/yoWt+Y7n8/A6m9@wendy>
References: <20230227105941.2749193-1-suagrfillet@gmail.com>
 <Y/yagE7jfRGo1FgY@wendy>
 <CAAYs2=jSt9=d=N98DCVvtNA9FE6KcVYVdHPG-wpuDPknBFUndQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAYs2=jSt9=d=N98DCVvtNA9FE6KcVYVdHPG-wpuDPknBFUndQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_045626_483093_CF25858E 
X-CRM114-Status: GOOD (  18.05  )
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
Content-Type: multipart/mixed; boundary="===============4467811860326279993=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4467811860326279993==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wnAnL+HDoyre5KCO"
Content-Disposition: inline

--wnAnL+HDoyre5KCO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 12:40:45PM +0000, Song Shuai wrote:
> Conor Dooley <conor.dooley@microchip.com> =E4=BA=8E2023=E5=B9=B42=E6=9C=
=8827=E6=97=A5=E5=91=A8=E4=B8=80 11:57=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Mon, Feb 27, 2023 at 06:59:41PM +0800, Song Shuai wrote:
> > > This commit 7d2078310cbf ("dt-bindings: arm: move cpu-capacity to a
> > > shared loation") updates some references about capacity-dmips-mhz
> >
> > Not requesting a respin for this, but mentioning commit 991994509ee9
> > ("dt-bindings: riscv: add a capacity-dmips-mhz cpu property") is
> > probably more relevant as a justification for this change.
> >
> Thanks for your correction, I'll pay attention next time.
>=20
> I have a question about the patch you mentioned:
> The patch uses cpu_scale per_cpu variable to store the CPU capacity
> through arch_topology,
> But arch_scale_cpu_capacity() interface seems not defined to deliver
> the cpu_scale to the scheduler
> In contrast, arm64 defines it as the topology_get_cpu_scale() in its
> arch/arm64/include/asm/topology.h.
> Is this an oversight or a particular purpose?

Intentional oversight I suppose? It wasn't my intention to do anything
other than document the property that people were already using in
their devicetrees (and finding bugs with!).
In retrospect, perhaps it is better if I un-review this patch until
we know it is plumbed into the scheduler properly?

Ley Foon Tan is the one that found the RISC-V bugs with this property in
their devicetree, so perhaps they've already done the work here?

Thanks,
Conor.

--wnAnL+HDoyre5KCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/yoWgAKCRB4tDGHoIJi
0lWMAP9MODOvtDm5vvcJ/DtkXxIsbk5s7zLjS+U2FljJQmwtiAD/bGwqZS4S3cwB
OaA5EaPDOFOMmnwePguHgv/seh1dFAM=
=ZDSm
-----END PGP SIGNATURE-----

--wnAnL+HDoyre5KCO--


--===============4467811860326279993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4467811860326279993==--

