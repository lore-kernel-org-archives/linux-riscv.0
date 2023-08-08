Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D31C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gYEzoU3NW+/t5VDqTYdVTZmkWZk6cm4Zb0sZ8l9gN8=; b=KM/UmFa0Ls5zaOPaVZ90dlyl7z
	J0CsOcN4d09RMwFUo3iB69ka1naLkxn5yDogY7Ar3/2jCHINMqg0cCGWPGDrDP4sVzH4DUsvyCtt1
	y++3162rxmL6ebU0MzvIW+Nmi5lVdYBjqkhkmhcBzl14qhDDf98eLeBH9t3wv4mA8uUcbxByGIueB
	am6hv01Ky30OmTSzaVKex+sP/ew/ZLM4dS56ZjrQxSBL4kihQZwatIupR2xRJshn6rcCnJCX3h6ll
	kIu4qxuMnRWeLGj11yqZ6/bxUqduGEooeYfBAyA5aFsjUpSIEvoG3XqBrHBFnYnlTGbwYHYd8cw1I
	3xO88r8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIKp-0024N3-2B;
	Tue, 08 Aug 2023 08:44:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIKn-0024MI-0B
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 08:44:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49CB862462;
	Tue,  8 Aug 2023 08:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C263C433C7;
	Tue,  8 Aug 2023 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691484295;
	bh=V0JjdjWFu8BlALkRvb98EGszbrLZ7TsBsZIaq0wNp3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlJoo9863UPXmu6vUeNZZrupDqQMvlQtd/gwa+jI7UzoH7tQVnWI55mdW7GH2fNAy
	 geM9QPQ/FSDiOUIwuFk1Sjp6YhcqOEpaDtXkygPiGf1a3PADEkjCs1nDYDsZGtfTia
	 OsWh9lm+rh4LaGznlvpdJ1PO9dFuX9C53oNR3GscQsr9Yle/ABIUam8JSERftaFdgC
	 qf9e/lZUikS4GjY8tqCCViYu6HFe4TVq/CwTNKrkN7mFe6oKkENSHFJnrmAIbo/y6+
	 DrpL621Z16qIgO+EWd1uKkRSIu9NebLeeqVPDBZF+Yc1C9S6d0l/jNf9kkMMzj4X73
	 rboi9s6paiz8A==
Date: Tue, 8 Aug 2023 09:44:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: zong.li@sifive.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 1/2] serial: sifive: Add suspend and resume operations
Message-ID: <20230808-pristine-celibate-60957ea523c0@spud>
References: <20230808072625.2109564-1-nick.hu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230808072625.2109564-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_014457_137673_8FBE8D52 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: multipart/mixed; boundary="===============5985660572143528377=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5985660572143528377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tg8By4CLw6nciaNc"
Content-Disposition: inline


--tg8By4CLw6nciaNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 03:26:25PM +0800, Nick Hu wrote:
> If the Sifive Uart is not used as the wake up source, suspend the uart
> before the system enter the suspend state to prevent it woken up by
> unexpected uart interrupt. Resume the uart once the system woken up.
>=20
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Where is patch 2/2?

--tg8By4CLw6nciaNc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNIAggAKCRB4tDGHoIJi
0kjiAP9splKZLGeVPLX6Pjze+Q7jOtbYC3DyEPCQhvlQE23anAEA83jEjSG4Cz/0
RPCozvkWTm9LHI8WRpoHeTGj21egiAM=
=gbl6
-----END PGP SIGNATURE-----

--tg8By4CLw6nciaNc--


--===============5985660572143528377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5985660572143528377==--

