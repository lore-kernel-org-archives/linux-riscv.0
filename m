Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19FCEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qozPXCoQd4TYoN5J3Sz6BMhQEGCWVBItWfuu5EqKG+Q=; b=g5jQvRcGOz8aISkd2Ta3rd/U/o
	6VqcQDQBafQ2HeMemF9d0ezMIRnaNlca8m2x0Et3h0T4CsbwOJ/Qw1D5sVASlkrQSTM0w980LMWxG
	w9mq/Nz6zLzxwnCNk1e+6e5cp/4heQ/LLyZUWdmQgQLg08msccsX4cnVyTyvUYD/vO7on8LYK/giO
	0GcTa3HZ0aDVNyiXsZ04rMxpuKm5/eFOq3u3IOOKS3CBdxo4mCqetFM+/0ObLwnSG7FkEJ4Mcox05
	sly/Y8gIBQAlctN7PEuQfGAby4uTcsy9vWpNOrGGMfD6R9jaEBucNps2/udUUkYigxFvTmLCWDFg3
	fD8JOjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGMFK-00Ay9I-26;
	Mon, 03 Jul 2023 16:17:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGMFH-00Ay8V-2T
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 16:17:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48D3960FB7;
	Mon,  3 Jul 2023 16:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8564C433C7;
	Mon,  3 Jul 2023 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688401066;
	bh=+Bq3JLFaUMp7p3qi8SQ1dlGHIw95+wCB4rs20s4VRW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hE8PSV7vCPY1sRrahmYRcyhHUDComDD9WUhrexjV8B+2CEmoIVgHKUtxgjOT0t+cB
	 X2D5ZJ/N6dcVdlFQc1fHvftckHKLU6+NgQFSIXwXXlM0EnTbxKOyLwAZu5eC4EDEVC
	 fjkk88htp6kmNvEFUJAT+fdMBSiZr2y2uZBsi+S5eknytQJMPx6MoyVznJtqJCeO3h
	 z6i+3x7civpHfTe52ogtRMod0BGAWsnw0cwuhTcPZ1MKbvC7aO9dc9dozGBWpuaKOe
	 2bXp/InTEwdnNqYk9YFgfdGgkD2hJc6M1SS9RIGgNsAKdzq7p5COjmriXueN1cztLA
	 jYUHI3mt0YlKw==
Date: Mon, 3 Jul 2023 17:17:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 04/11] RISC-V: shunt isa_ext_arr to cpufeature.c
Message-ID: <20230703-bronzing-declared-5d568cb47339@spud>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
 <20230703-steadying-skintight-d5b7c108551c@wendy>
MIME-Version: 1.0
In-Reply-To: <20230703-steadying-skintight-d5b7c108551c@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_091747_846613_84261C0F 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============2320640828548435133=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2320640828548435133==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lh8iUyMcp5focI2k"
Content-Disposition: inline


--Lh8iUyMcp5focI2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 11:27:56AM +0100, Conor Dooley wrote:
> To facilitate using one struct to define extensions, rather than having
> several, shunt isa_ext_arr to cpufeature.c, where it will be used for
> probing extension presence also.
> As that scope of the array as widened, prefix it with riscv & drop the
> type from the variable name.
>=20
> Since the new array is const, print_isa() needs a wee bit of cleanup to
> avoid complaints about losing the const qualifier.
>=20
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

=46rom v(n-1) that I forgot:
Reviewed-by: Evan Green <evan@rivosinc.com>
https://lore.kernel.org/all/CALs-Hsu5yA7eBPOFQkmd94GR+15wuFkbYbYSg4RubmkdQD=
yi8g@mail.gmail.com/


--Lh8iUyMcp5focI2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKL0pQAKCRB4tDGHoIJi
0qgWAQCn/gTJHGIdLaZp94S5M6Qofeq/lQTJIbQxgUdoPPehwwEA7w1NKhjBffQw
RcGneVD3M9Hz23g411ZhT0AEAUM9ewY=
=h4pX
-----END PGP SIGNATURE-----

--Lh8iUyMcp5focI2k--


--===============2320640828548435133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2320640828548435133==--

