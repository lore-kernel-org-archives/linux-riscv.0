Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A36EE49A0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFHXtO6XNJJiP0BGVU918CF/AtHfaeEvTCN2irfEis0=; b=tkZBC/tDtD7OJvhEvrOq0MvZjq
	JSACooKnGL4UHCG/vNZugNL55DbxFAaSlwxUzzBK2GkFz0Umwn4K5ljTCWx1RaKGaEMk51d9MhQ1a
	nQegU4vi62eqak8q50/h7WQLll/EDR8Tp4gnGPaXsdn7xJRj72azf1i1egYvp7kHuxfTKXOdRz1iA
	4oRgFyiWQ8sWfkiTqXp7XT2xkh5ITUBu1erDMZ3VwmXv4fNHHgJt50qgaVCf3g8lxqxBhxaojnCjZ
	9T/FEFN0uCOAcqgeOjjdJc5tvWkem/GiESP+hAPyWDbknW3glpQasLcEU3ZE8OcHLauzJpRuA2pbW
	AEd32ksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmQ3-000U1Q-0e;
	Wed, 23 Aug 2023 11:53:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmQ0-000U0j-1B
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 11:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692791580; x=1724327580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P+msHyqhyTgIowePgGmJTm4oqKwwJ9h/OkrOjGnPZWA=;
  b=lZTmF/ps3y+hAwtoTgP5tZgzU86vzoXqNyzs5n+w2GSWUfP86h+sBLO5
   xKt0HLMSOF9xffvP4q9VG//7y8vVPM3DMJh+VSVr2t4F5VwkDnLWtVXBF
   vrHpdsJTMFjPS7BNwAdlbBB7MxyJ5BSU6cbg7Rf3uBQ/TSl2UfpMflh0o
   sLO81x/JYEJYSln/Pk7HN1bsJLyZeLSh6yB0gItT49gK6T0RGlg5mHc1D
   /txLonSQXqrC3oTQIOEfJF55CgUs5kbfkfBozI62TaMRRThm/l6W5iTF8
   pQ9B3Kkh+7aNN3iaS4yg+rYD9ycTqMDkgK7Zw+2lnxHrLdYlDwOrlJYX2
   w==;
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="asc'?scan'208";a="231293047"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Aug 2023 04:52:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 23 Aug 2023 04:51:57 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 23 Aug 2023 04:51:54 -0700
Date: Wed, 23 Aug 2023 12:51:13 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <patchwork-bot+linux-riscv@kernel.org>
CC: Mingzheng Xing <xingmingzheng@iscas.ac.cn>,
	<linux-riscv@lists.infradead.org>, <conor@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<nathan@kernel.org>, <ndesaulniers@google.com>, <trix@redhat.com>,
	<bmeng@tinylab.org>, <guoren@kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <stable@vger.kernel.org>
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230823-captive-abdomen-befd942a4a73@wendy>
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
 <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
In-Reply-To: <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_045300_585700_F850FC00 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Type: multipart/mixed; boundary="===============5111707435949431870=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5111707435949431870==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W7NS5WMbXWdulCbP"
Content-Disposition: inline

--W7NS5WMbXWdulCbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 03:20:24PM +0000, patchwork-bot+linux-riscv@kernel.=
org wrote:
> Hello:
>=20
> This patch was applied to riscv/linux.git (fixes)
> by Palmer Dabbelt <palmer@rivosinc.com>:
>=20
> On Thu, 10 Aug 2023 00:56:48 +0800 you wrote:
> > Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default ISA spec to the n=
ewer
> > 20191213 version which moves some instructions from the I extension to =
the
> > Zicsr and Zifencei extensions. So if one of the binutils and GCC exceeds
> > that version, we should explicitly specifying Zicsr and Zifencei via -m=
arch
> > to cope with the new changes. but this only occurs when binutils >=3D 2=
=2E36
> > and GCC >=3D 11.1.0. It's a different story when binutils < 2.36.
> >=20
> > [...]
>=20
> Here is the summary with links:
>   - [v5] riscv: Handle zicsr/zifencei issue between gcc and binutils
>     https://git.kernel.org/riscv/c/ca09f772ccca

*sigh* so this breaks the build for gcc-11 & binutils 2.37 w/
	Assembler messages:
	Error: cannot find default versions of the ISA extension `zicsr'
	Error: cannot find default versions of the ISA extension `zifencei'

I'll have a poke later.

--W7NS5WMbXWdulCbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOXysQAKCRB4tDGHoIJi
0umKAPsHfU8Vxgef4+lOhFoGQMmuEDZ660fUifAWXoqFaCjwlQD/dLrrEsJhYReV
cosGU4uWW2+SuNH9+QHMozew2ttVyAk=
=9H5F
-----END PGP SIGNATURE-----

--W7NS5WMbXWdulCbP--


--===============5111707435949431870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5111707435949431870==--

