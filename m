Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C3FC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 18:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgA2efilEgVVFYfsfciB8FImv/wQF7hxXJDOSUrpPig=; b=H6WEVu1+cvCkG1o8h9lFeziWMU
	7G2owFFx1hc0PvKQuE+oo/qB5WQfNfyFeKDfP8XIwNmtLKu3opGrdzorE/NCLE1gjTtuckqTSYHxi
	Tu0zQY0QYFoxhP+zutkRSG2aqpk9pxluFDA3wM7Bbrv8Miek46YZgL6fBc/90O0uQsYOguM5WQqMi
	fniDuYU3Mx7FSR7ty5xBiORowjxox2IzA1YUURoOKcbf95gegnO2z6ENELZJW+EEUMxfxnjC/Qq0p
	WyJBbk0U1jKzawSL8HnHdgm7pGkW9JuCnylYE9gP63kdbhemReybdo5mWgws5v0xeaVmV9mvH2yqq
	17qv0k9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAbC4-007DBu-46; Wed, 28 Dec 2022 18:30:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAbC0-007D9V-QL
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 18:30:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA88261582;
	Wed, 28 Dec 2022 18:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C18C433EF;
	Wed, 28 Dec 2022 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672252218;
	bh=8GdpfCPYNbZ7pONcybw0AZexxDzJ9PmxSxjOD45MToI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMN8sn2qVZcrzRNGqHFFHegiRkzijJ7lgl63Nluh/32moJDMxsjBBpdfOHtOU2m/P
	 JUZxv0u0XGMe/kTDCobfG+b7TcBZvMm0Q4s1a2Oha7ctEXj9ryy2aC97Mt2O9Qfz4p
	 EM4BdlRjung9oxz/0osT1n6rkrsrTazQ2xn77BQSgRROGcMA5Wh8s4mXvCSowlG+o4
	 8ZJcLZrcVfEyr0IZLvSdIEwTzpcRbGOGIXq4q/Sffb+OMU6WW4gPwa7Cz+haYYqKaJ
	 cm0n6r4+pJi0//NsLGHYXoaXer2sWhqyFJize9T7g27HkcJ+U31DzSwh0WR25lDlIn
	 4Iu49epuwIBPQ==
Date: Wed, 28 Dec 2022 18:30:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Petr Mladek <pmladek@suse.com>, YueHaibing <yuehaibing@huawei.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	tangmeng <tangmeng@uniontech.com>
Subject: Re: [PATCH 0/3] riscv: sbi: Switch to the sys-off handler API
Message-ID: <Y6yLMwhSypqp5+Ir@spud>
References: <20221228161915.13194-1-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20221228161915.13194-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_103020_935880_A5DCAADC 
X-CRM114-Status: GOOD (  18.45  )
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
Content-Type: multipart/mixed; boundary="===============0876298737658204877=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0876298737658204877==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ATLP0lEXvRX45tso"
Content-Disposition: inline


--ATLP0lEXvRX45tso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Samuel,

On Wed, Dec 28, 2022 at 10:19:12AM -0600, Samuel Holland wrote:
> I want to convert the axp20x PMIC poweroff handler to use the sys-off
> API, so it can be used as a fallback for if the SBI poweroff handler
> is unavailable. But the SBI poweroff handler still uses pm_power_off, so
> done alone, this would cause the axp20x callback to be called first,
> before the SBI poweroff handler has a chance to run.
>=20
> In order to prevent this change in behavior, the SBI poweroff handler
> needs to be converted to the sys-off API first, at a higher priority.
>=20
> This series performs the conversion, after accounting for the fact that
> the SBI poweroff handler is registered quite early during boot.
>=20
> The first patch is a dependency for both this series and the PSCI
> series[1], so I would like to get at least patch 1 merged soon.
>=20
> [1]: https://lore.kernel.org/lkml/20221105214841.7828-1-samuel@sholland.o=
rg/
>=20
>=20
> Samuel Holland (3):
>   kernel/reboot: Use the static sys-off handler for any priority
>   riscv: sbi: Share the code for unsupported extension warnings
>   riscv: sbi: Switch to the sys-off handler API

Not what other stuff has reboot support, so I gave it a whirl on
PolarFire SoC & it seemed to work as expected:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ATLP0lEXvRX45tso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6yLMwAKCRB4tDGHoIJi
0ivzAP9+SH0Lql0XKHnaLv07MiLUmZWgUzA9fyFMuC2SL6mJvAEA+nzYanZ4TgWy
B8EyY10df0N49zc5ohweBmmjHCZz3A0=
=7zvo
-----END PGP SIGNATURE-----

--ATLP0lEXvRX45tso--


--===============0876298737658204877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0876298737658204877==--

