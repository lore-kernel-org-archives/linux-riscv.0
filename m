Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A816CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcPqrisVmQOOxfTxth/D0vF3BicC/VNdt8fXa7OYmsM=; b=wxsUtNKqZTycu2o98kX+NrR7Rr
	cN8MhcHO1g4Q4LzBmwuH9t9CsnYEsvKvygIdFy9+G3fDJeHyOHDR/fzNtyYGjuBviI0vsfOLOSrbD
	1wb1bIfb3Oi6gVbBq50zp2lkFgmkHX83L4IkyOeqHrLO4SORKu7cSy+Y4TgY/7V/4auDLTcOCLEGM
	WMK8pGkXNUVpkvkAyDQhOfqJUBgvA2QH9XYm2k20OWXTM2khUKJpE7wVIKSh226tvEubP3Tmj4/kv
	CDLW5pAbDzYaeaLUO5iDU5luqwqoSjv8L+ZPJZAfAmDQ5Mv5AUJLr29IocRNIFRcFZM7gWrqtSCKC
	11RGUEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvtL-001672-2I;
	Thu, 12 Oct 2023 13:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvtG-001663-2D
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:38:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D7DE61E43;
	Thu, 12 Oct 2023 13:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438E3C433C8;
	Thu, 12 Oct 2023 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697117893;
	bh=LyXLM+BLH847hpyZZgL4fG3vMibdsMHe1dhJzWmCQw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gR7Oei5BreDpeduA48R4Zvx6IHONnM2IcYvX1GH6TBR3jhKjA2NUwPf3nxbzA23ig
	 FSZUyZ0wL3mGQZ/+8+/uaPuk3atMafhoMoNvs9zMGDALpwsPEEGxXnKInd227/MhD6
	 5/AnnbKVM7uAvvHV5olADucaZtRJGv2fcr561bBRscszRZmCl49hlxV+7rstNKlpvG
	 Bi6J7fp/g70/rvoUOR/TxPp+PeZs9Wq/+AVS/IjHUiB8+UIG2EQVPTM9RB8AA4WNG2
	 TyCAOQwu1JZ/05oWbAQyfjKOzFj2cWJP8bIXqGyFXN4nYitdknbojLxBD7N27tfrGR
	 nyPp0ZkTCSSmw==
Date: Thu, 12 Oct 2023 14:38:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v1 1/6] RISC-V: hwprobe: Clarify cpus size parameter
Message-ID: <20231012-riverbed-surprise-d5aa8adb6110@spud>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-9-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231011135610.122850-9-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_063814_766494_CEB27FF7 
X-CRM114-Status: GOOD (  12.59  )
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
Content-Type: multipart/mixed; boundary="===============9046771873216818944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9046771873216818944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h0vLsipc6U4JevBM"
Content-Disposition: inline


--h0vLsipc6U4JevBM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 03:56:12PM +0200, Andrew Jones wrote:
> The "count" parameter associated with the 'cpus' parameter of the
> hwprobe syscall is the size in bytes of 'cpus'. Naming it 'cpu_count'
> may mislead users (it did me) to think it's the number of CPUs that
> are or can be represented by 'cpus' instead. This is particularly
> easy (IMO) to get wrong since 'cpus' is documented to be defined by
> CPU_SET(3) and CPU_SET(3) also documents a CPU_COUNT() (the number
> of CPUs in set) macro. CPU_SET(3) refers to the size of cpu sets
> with 'setsize'. Adopt 'cpusetsize' for the hwprobe parameter and
> specifically state it is in bytes in Documentation/riscv/hwprobe.rst
> to clarify.
>=20
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--h0vLsipc6U4JevBM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSf2wAAKCRB4tDGHoIJi
0id5AQCgXP6WhGlBZYeGCxAT9lEqbLi0jQKJybVvi74RI2obDgEA4Ud/zCK+rJ92
8KgCs7iv46jImzpr4w3U0knzppHLGww=
=3Xuy
-----END PGP SIGNATURE-----

--h0vLsipc6U4JevBM--


--===============9046771873216818944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9046771873216818944==--

