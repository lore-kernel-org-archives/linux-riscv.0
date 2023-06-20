Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B29DEB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 22:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxWndaZZSWEhRVLclJm6eHo4brIvxe6gFfDVE7g7Ez0=; b=bvxrsUa+CBkI9lrg/tA2HTeH0i
	OaY7pFJE2wm4EVhTPthUsgCPsnLH78Azx+J+wTe1UppYDzhg2IA1psk/fF61sAWQNL546kY9IdEJj
	Bp0orKlIxA3J6t12xo8O/oK1zuSOqzj9gz/C6ueZ3EclH6VXFGteWUOmGyuTucTBaqkv9n1TFBRtu
	AeEK+OvWvuZjm3ZIAtgQyQN3EibOehC3FTy0ltwP38O391w0qGKCcU158Ipz7FoGbI8iGRYD0934u
	5a+yYrIFmvTwVnFdNcjov6QKY7UnNvSEInQzH0KciBNT2XvDFClF+K9N0KY2+Rwfe01QEyipe4PTN
	ckCbapFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBkGM-00CWpz-05;
	Tue, 20 Jun 2023 22:55:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBkGJ-00CWpK-0d
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 22:55:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7ECF4611B1;
	Tue, 20 Jun 2023 22:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6428C433C8;
	Tue, 20 Jun 2023 22:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687301745;
	bh=sL+llKy6MBaR/eUwxdHscc21DlU/nNSX6MzdvmC4oY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVlIZxgXZNEK+cyS+H5mIux7i+ZFZSDB7YnVOooKYOD54Bggg2CzFIOjUGRo/aZdJ
	 N7XCkCXp9huYAamUL6hCY4qj9Yy5dMQM7aPM5ru6yhZTLhXYzOyGm4VEY3lHe2/BYV
	 FZCslF7LBNHTJQpNhEs7x1oUBBxcCNBL7M0BoFouDotQGROLvj56erdA0zf5iKFIgg
	 6Va+nhGx3sr90oh5viVpniYs3peM6xy315cQ7Xi1oJr5LkqQsHQmRAd4TDphbvgId+
	 e5TXfD7wwAS1JvCRjLQiwhmu0D2hX6walnWrRWW0JV6mtVaKSMx/KlcTy3rGL0FBYM
	 wkGEmHEVQNU3Q==
Date: Tue, 20 Jun 2023 23:55:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <20230620-google-powdery-640c8d03d864@spud>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <20230617-duress-phantom-3da79e33f204@spud>
 <ZI8wEp52bpqaCHAl@xhacker>
 <20230620-catcher-jaybird-945d26a4f642@spud>
MIME-Version: 1.0
In-Reply-To: <20230620-catcher-jaybird-945d26a4f642@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_155547_278546_D877D73E 
X-CRM114-Status: GOOD (  17.64  )
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
Content-Type: multipart/mixed; boundary="===============4936481234377967607=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4936481234377967607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+Jk+U6Iaw+rqo4Jv"
Content-Disposition: inline


--+Jk+U6Iaw+rqo4Jv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 11:52:46PM +0100, Conor Dooley wrote:
> On Mon, Jun 19, 2023 at 12:25:54AM +0800, Jisheng Zhang wrote:
> > On Sat, Jun 17, 2023 at 07:20:43PM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
>=20
> > > I'll send it to Arnd as a "RISC-V Devicetrees for v6.5 Part 2" once it
> > > has been in linux-next for a day or two.
> >=20
> > Thank you so much for helping the PR this time.
>=20
> Just FYI, since I think only I get the notif emails, Arnd has merged it:
> https://git.kernel.org/soc/soc/c/c9a5aa0e53d0

Bah, wrong link - that's the one that pw bot told me it was, but I guess
it got confused by the fact that I had sent 2 PRs. Correct commit is:
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=3Dsoc=
/dt&id=3Dd8ece8b832276756d32c310fdd76835f8046071a

>=20
> Cheers,
> Conor.



--+Jk+U6Iaw+rqo4Jv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJIubAAKCRB4tDGHoIJi
0gs7AQCzsN6FosuWDw5ccsUpVbY/OJRy2E6qhPCpvuQuRxRNoAEA019WavBu8+m2
874m+pwDmhD3vGOrngQrKR/Qhnoy0As=
=RSDy
-----END PGP SIGNATURE-----

--+Jk+U6Iaw+rqo4Jv--


--===============4936481234377967607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4936481234377967607==--

