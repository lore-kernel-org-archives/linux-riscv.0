Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79263C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXtY895tAWNZgKLa5MQ4K0A6IXGQSoHrLTMcK2BzFHM=; b=jJM1FnFurdKiKsXBU7NluTa1+C
	Qle5I6hvMwfR5a5T425Fc3kGEjweGGzRF5+XfJKZF1wB5/UgzwxcDAJ+O4MslK3o2mjeMENzVMatQ
	sCboP8fALE1TCAOMyZbL3wa+AUiyZ4FYXrvp973h0/KZpNLKbLcDA4Y51U/FJHTlAKQ3qEMjcDjd2
	C6tdz4PstCwL5ucW8ddybwu949H5KTHYtJdg/PBlUugP1g2fHSDT3JJ3MdLNcQVeBUvu6zGbq+6Fy
	TZ29EIhnNUO2qazfZwqWcN1k2x9rzU0XicJHfNzWD1uS0k4rTR7yGpssx/m3t9gJkG4Qmw23Qdsyx
	gWBQzy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRiH-003xqI-1e;
	Tue, 09 May 2023 18:05:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRiE-003xos-33
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 18:05:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30429629BC;
	Tue,  9 May 2023 18:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB86C433EF;
	Tue,  9 May 2023 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683655521;
	bh=Tdj/22kgA8XkFoA986JPGYnfWwEcnwTjUAalnblqCYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tj8rEfD8bzoP3ENFKkSFpA1LpSIJGrsf+RXdNrYIADnUN+NMZGhCT2IEPRUyBPrja
	 eqxRN5d7VgGo0SC5AX6Lk0khulo2GSo8RLS8umt1fKU44FyknV8dUzIsIvx374hh06
	 0BMTJAP6QOSzEYMiEEZDLEtgxA1EL3cjqwKRNzxIt6h31s7Xfh2BI1+dVxMDywkLFR
	 umJTE/5AVlKQRBYOdSGi6KW4dFZP1YlUFhIpAa3TYIg3iCPFwrO0B+6gKnFS+0rhvv
	 hLSgQC1RNqvq5dHpzsKAbFrBarlyE8dY/BM7pQyk2oHXWEc7BuKxyBNOOLIJE0ntEC
	 iFd572OME5hsg==
Date: Tue, 9 May 2023 19:05:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
Message-ID: <20230509-overheat-pliable-00d60523637e@spud>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com>
 <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_110523_022348_EC387C46 
X-CRM114-Status: GOOD (  14.10  )
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
Content-Type: multipart/mixed; boundary="===============7682995983362515547=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7682995983362515547==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cgSWW3RzfwlIKhhN"
Content-Disposition: inline


--cgSWW3RzfwlIKhhN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
> Hi Conor/Emil,
>=20
> DT overlay is used to describe combinations of VF2 and hat.
> Do you have any comments on this patch ?

Up to Emil :)

I seem to recall that he said at the linux-riscv sync-up call that we
have* that he was not in favour of overlays for hats like this.
I'll let him confirm that though, I might very well be misinterpreting or
misremembering what he said.

Cheers,
Conor.

* https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff2=
6bb3@palmer-ri-x1c9a/

--cgSWW3RzfwlIKhhN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFqLXAAKCRB4tDGHoIJi
0qBCAPsE8YwhVOhYQs79hkq8MKo8na1XocNJROiloe+mcYefYQEA354Svch8qplg
cy1NtrkXNW4PClswD2VNVAVe/IphjAc=
=UgFO
-----END PGP SIGNATURE-----

--cgSWW3RzfwlIKhhN--


--===============7682995983362515547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7682995983362515547==--

