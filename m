Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55492C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yAtOhFI/TbpCL7nf4SktjyzYEqF3wIOZKL7OfI4lOU=; b=4m+zrVJF/9XLwbFBX22hw0D2rv
	6zG+BE2fccUe6KVDWL9wPNT8l8GLAkAbBncLS+go+uPTLIkwFkfbC3hrrqZnmTap1Bw04mNS1IkkM
	YSxZAqrAlFb4DhncvS7KDKp7DxQrDF4Jp11m6QOvoFAlrWhDJdCBXx5Q80ZlZunvgE0PQRRMMfWds
	pod8PgRTG1tJAE6DsgD82R66OnVqwoqX4V9lvgS8yK6hVEfOycPCOzO3fUv4u+cwZb+2sDvlPiujJ
	MG0sOmyVbvNOoYN7aCyY4MpuvJcGWYZTPbCuPaeqei+Aiqc62FARnPATIiYbLPlGULJHXFmW01Nd5
	n94sLO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzBd-0000000HAVM-3NeO;
	Fri, 01 Mar 2024 09:28:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzBa-0000000HAT4-3uRc
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709285290; x=1740821290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l7/w/M9Qg8/uTF4RCzKi8u0Y/0s8UezyrPjWXYLzReY=;
  b=nxN47rxPVmDfIEvUR+LLuVx1RJ4TmJ1/C+HgAUgxgp71d+1yU0Q4qGI5
   AQAA+eVCGD9EUXfzE4GIjBzeii3ffyuMAxUIMVv8BcRRIuy7v5gTsaJqI
   /4qdSW79m+Gh9sYe3ayswUQUHJmaiYzx2EHzqYAAZzarbf82x/rBPRLGQ
   9Oc72DsQhax74wGocSUBW46yUP8OTU7mR0QS3cCYz8q4xa6Vdb5Kf7ZRW
   72bvRVPa01fdqnOTWutOoWyOx8OzZBnoy1hccdtjWVmElh+I2eoZSMJYH
   T4fCsgJKKnmethqU7OZjH8LF6HsDBIPmap7Wk0tOkOYV7P7JrtDEsK/i5
   Q==;
X-CSE-ConnectionGUID: ygVnSIYfQEKFz2nIe+wEow==
X-CSE-MsgGUID: v34koBgySemG9lkf8xSESQ==
X-IronPort-AV: E=Sophos;i="6.06,195,1705388400"; 
   d="asc'?scan'208";a="17056042"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Mar 2024 02:28:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 02:27:44 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 1 Mar 2024 02:27:41 -0700
Date: Fri, 1 Mar 2024 09:26:58 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Set unaligned access speed at compile time
Message-ID: <20240301-reload-gristle-b417fe02f980@wendy>
References: <20240227-disable_misaligned_probe_config-v5-0-b6853846e27a@rivosinc.com>
 <20240227-disable_misaligned_probe_config-v5-2-b6853846e27a@rivosinc.com>
 <20240229-company-taste-daa305961e3a@spud>
 <ZeDO4CVOi6q4u8Lt@ghost>
 <20240229-dolphin-pennant-eef41ce44043@spud>
 <ZeDZnIemm06yU4KF@ghost>
MIME-Version: 1.0
In-Reply-To: <ZeDZnIemm06yU4KF@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_012811_199221_D56880CB 
X-CRM114-Status: GOOD (  23.13  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============5277043725294184606=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5277043725294184606==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OWPJFMUiteII9XLr"
Content-Disposition: inline

--OWPJFMUiteII9XLr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 11:23:08AM -0800, Charlie Jenkins wrote:
> > > > 1 probe: probe at boot time, falling back to emulated if not perfor=
mant
> > > > 2 emulated: always emulate it in the kernel
> > > > 3 slow: don't probe or emulate in the kernel
> > > > 4 fast: Your current fast option
> > >=20
> > > Emulated doesn't mean that the kernel will always emulate the unalign=
ed
> > > accesses. It means that the kernel has the ability to emulate them. It
> > > will only emulate them if the CPU traps on unaligned accesses. Kernel
> > > code can choose to forcefully align an address it thinks may cause an
> > > unaligned access, but that's slightly different from emulated.
> >=20
> > Sure, make option 2 "don't probe at boot time, emulate it in the kernel
> > if we trap". I suppose in this case though, to get a correct output in
> > hwprobe you'd have to still attempt an unaligned access at boot time to
> > see if you trap but it will not perform the speed test?
>=20
> Are you trying to cover the case here that the kernel is compiled as
> "emulate unaligned accesses" but the kernel isn't actually needed to
> emulate unaligned accesses?

Nope, the case "don't probe at boot time, emulate it in the kernel if
we trap" which is replacing 2 above.

> Seems like if the kernel is compiled as
> such it would make sense to report emulated with the assumption that if
> the kernel isn't emulating it, something else is.

Or maybe nothing is emulating it, we don't know. Feels to me like it
should report slow by default, given that's the option you can infer the
least information from, and then report emulated on trap.

--OWPJFMUiteII9XLr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeGfXgAKCRB4tDGHoIJi
0md+AQC9ln9J1hgmg38Hb8NELNWiEuurKRN0vtr8/lu8ceH4fQD/RjZiXsoMUXMx
e4Gjfj0VS2ezNPwHU685ZVn5/3sqogI=
=dmRT
-----END PGP SIGNATURE-----

--OWPJFMUiteII9XLr--


--===============5277043725294184606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5277043725294184606==--

