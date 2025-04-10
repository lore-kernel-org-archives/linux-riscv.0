Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A73C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJEKWJw7coYC0LKk+t5hSKExb9oT3cwdIFR3986O0xI=; b=ehLljfuvvxNfU7lqzjeDCxD3do
	Reir8/Xszh3A9l/4SaftK4sWZOfigaPlFb9kjk6xOIKYeBJvLYOVSMFK3+DybKKIlulyRDf0QEOYB
	cA8NX6AYbQPXlCfY20XueALBUt8Rzzv2dx3nDGRGnDOqFX/c3hnpwlLAgXV6VmyPazj5hMUZCGEOH
	xYvtBk02vERgrEj1L4MgArGV3Wd9vE+cQbqLuLFV4Ij8FG6trZU7HHCrbLhI5KXe3ETPCdN5/IURr
	ZgizJ1bmpMd4+BRbEiU5OV4aUJOb/xc2im+UWTkWxcAX9rtc7N0/YNlchGZ0TAuwR3mEZdTQzY7dP
	WC/ceMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pw5-0000000AGCs-0k5o;
	Thu, 10 Apr 2025 11:19:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2p2d-0000000A4nT-1I2F
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 10:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF7D444109;
	Thu, 10 Apr 2025 10:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D3EC4CEDD;
	Thu, 10 Apr 2025 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744280510;
	bh=UQ1IvRSCRSbhc1Hlr/Yycuqw9SEYIVv6v4trUn6pPIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKQj9bswWywx7TJJoaEBwFw4KXtbt4h2DKmnIeM1Di2oNsLsyHlOSJzoMbrcVxsWQ
	 SJYjzRFc7FRBfbEeTKPs6cIGiIq68v8ntPgssbzdjujQ+ekt4oyTK5vh0SX6qcID3f
	 87tIuCNOQD0mz7Jho3a+sUGEkGa1jV6XBiZWlvRWWudj9RiFOU84Z3lPEZc8unBPJ4
	 slRnRW21p4BO2fZwjz84nTysaOmeWRsDw2d4e4HQxvN0ljewplIapkqDSiUjii4Cym
	 RBxyPxZPNZ+ZbDYZcjiWZS2n4YoYCmK2mLoWGWpTM05El7ZuHBTMyLz6dh00hAtCC/
	 JqfsAThVg6/Gg==
Date: Thu, 10 Apr 2025 11:21:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Allow for riscv-clock to pick up mmio address.
Message-ID: <20250410-squeezing-outcast-f717ff17817c@spud>
References: <20250409143816.15802-1-aleksa.paunovic@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20250409143816.15802-1-aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_032151_364157_61F24373 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Type: multipart/mixed; boundary="===============2352825984809580518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2352825984809580518==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tFc/ze0LDYRx+0Dl"
Content-Disposition: inline


--tFc/ze0LDYRx+0Dl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2025 at 02:38:55PM +0000, Aleksa Paunovic wrote:
> From: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>
>=20
> Allows faster rdtime access via GCR.U mtime shadow register on p8700.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

> +#if defined(CONFIG_RISCV_TIME_MMIO)
> +	gcru =3D of_find_compatible_node(NULL, NULL, "mti,p8700-gcru");

Firstly, this is an undocumented compatible, so you'll need to create a
binding for it before you can use it. Not much to say on the use of the
compatible in the driver without more information on what the device
looks like.

Secondly, the option you have added is generically named and described,
yet only functions on this p8700 platform. At a minimum, it needs to
explain the platforms where it is relevant, and probably also should
depend on the kconfig option that enables building a dt etc for the
p8700 platform in the first place.

Cheers,
Conor.

> +	if (gcru) {
> +		if (!of_property_read_u64_index(gcru, "reg", 0, &mmio_addr)) {
> +			riscv_time_val =3D ioremap((long)mmio_addr, 8);
> +			if (riscv_time_val) {
> +				pr_info("Using mmio time register at 0x%llx\n",
> +					mmio_addr);
> +				static_branch_enable(
> +					&riscv_time_mmio_available);
> +			} else {
> +				pr_warn("Unable to use mmio time at 0x%llx\n",
> +					mmio_addr);
> +			}
> +			of_node_put(gcru);
> +		}
> +	}
> +#endif


--tFc/ze0LDYRx+0Dl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/ebugAKCRB4tDGHoIJi
0rl/AQDbGzCkjJQEsHIRMxKSPxfqIETRiNCXHm2seBMv2mCWyAD/cx1SfocGoajP
MnAzkYvx/SxFsY7Ca6bk0h/1fuXEow0=
=giwb
-----END PGP SIGNATURE-----

--tFc/ze0LDYRx+0Dl--


--===============2352825984809580518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2352825984809580518==--

