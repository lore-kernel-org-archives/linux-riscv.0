Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDFFC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 12:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h22+6lz5wazyYRE+LdFN5bTM7xtcXJNhx0GBU5mP5JQ=; b=O0GeGrpKS8nEFh8kZbugC6MVNw
	5aU9zHammkwJN0gmWvT244aA/mHs31mdKr39rC80uIRM1i/Z78gy07GuXyIpwm2WKlFmxAMaYzcbV
	wyM7Ktl2xpa0+AAj4P+pHe87nbRvU+aLoiayEacp3eGRbzWlvoCIJr8ogZHQgW2nZ+cq34cYLobA5
	NKMUOhOiGR7s5hR1y5cuyV+/cmLJUUcMT/f9FBuVrdd84DRbvnspbfa1YNir6CiOTG1fWs/OlNlZg
	CLbEjGyljSyJ236JTpZyPd3h53alnkn0sLaAvzRbWgNX6VG/iMeNZrUoZesAa4K9Ap5IuuXqDdFOh
	BY+Oo1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCg1Q-0017qz-Ij; Tue, 03 Jan 2023 12:04:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCewf-000qQT-4F
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 10:55:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 00660CE10CC;
	Tue,  3 Jan 2023 10:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02EAC433D2;
	Tue,  3 Jan 2023 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672743294;
	bh=sWxywAmA3iT6Hg1imz0WMwNxq0Cs4LLATsivcCc+QW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeVQqIlzGiVZWzBhGkkCBfpFlIBtW5EdfD1QOxvUUoWCxCHFILUCD4mAarM5gcO46
	 y4OOW9iEg8OPNI0T11JJXPCBfCQmiP9GaFIp2426HcSzddGmdZ1h7LIh21jU0hGx/L
	 CWNLtm8eYyyy48i0eG/rGdpbntrlskKqWEdVDOxpv5zSAAQAhdDx57nCn6+z4mnxhC
	 MBaRP5T9qN0ceAn7D2HGboPvY37X4x0CqFIyzvL8K+5Lo4FPDH5W9MOQSIg6RXsMsa
	 yz9beXa+40HSgZGspMcSPrrYBJmw2pPu58aPNvoY+dNuq9sMTyBaiv8Y6W2mSdfyPf
	 NFu/e0JZmUIRg==
Date: Tue, 3 Jan 2023 10:54:48 +0000
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
Message-ID: <Y7QJeOj+rDnXzhFm@spud>
References: <20221228161915.13194-1-samuel@sholland.org>
 <Y6yLMwhSypqp5+Ir@spud>
MIME-Version: 1.0
In-Reply-To: <Y6yLMwhSypqp5+Ir@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_025503_528380_E6A6A848 
X-CRM114-Status: GOOD (  24.69  )
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
Content-Type: multipart/mixed; boundary="===============1939741364640712510=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1939741364640712510==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uM3g/cThuDJq0xJr"
Content-Disposition: inline


--uM3g/cThuDJq0xJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 06:30:11PM +0000, Conor Dooley wrote:
> Hey Samuel,
>=20
> On Wed, Dec 28, 2022 at 10:19:12AM -0600, Samuel Holland wrote:
> > I want to convert the axp20x PMIC poweroff handler to use the sys-off
> > API, so it can be used as a fallback for if the SBI poweroff handler
> > is unavailable. But the SBI poweroff handler still uses pm_power_off, so
> > done alone, this would cause the axp20x callback to be called first,
> > before the SBI poweroff handler has a chance to run.
> >=20
> > In order to prevent this change in behavior, the SBI poweroff handler
> > needs to be converted to the sys-off API first, at a higher priority.
> >=20
> > This series performs the conversion, after accounting for the fact that
> > the SBI poweroff handler is registered quite early during boot.
> >=20
> > The first patch is a dependency for both this series and the PSCI
> > series[1], so I would like to get at least patch 1 merged soon.
> >=20
> > [1]: https://lore.kernel.org/lkml/20221105214841.7828-1-samuel@sholland=
=2Eorg/
> >=20
> >=20
> > Samuel Holland (3):
> >   kernel/reboot: Use the static sys-off handler for any priority
> >   riscv: sbi: Share the code for unsupported extension warnings
> >   riscv: sbi: Switch to the sys-off handler API
>=20
> Not what other stuff has reboot support, so I gave it a whirl on

I happened to see this today and could barely understand what I wrote.
s/Not what/Not sure what"

> PolarFire SoC & it seemed to work as expected:
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks,
> Conor.



--uM3g/cThuDJq0xJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7QJeAAKCRB4tDGHoIJi
0nXSAQDaMeufEd7ejOdgNH13SEKuhv7tu2IlGvzJWSdg2bSWWQEA3ffySTJbn0PB
mD3bZmsio+Kk5ty/XaAjoP6WUfFbHQs=
=ip+Q
-----END PGP SIGNATURE-----

--uM3g/cThuDJq0xJr--


--===============1939741364640712510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1939741364640712510==--

