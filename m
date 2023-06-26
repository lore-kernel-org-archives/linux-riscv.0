Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B3EEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2N5ou3Af4emdCTmrFhH4+NkLnTaoTa/8Rakxd+kd/rQ=; b=wYzehBjc+8nQbrNs7u4OHFhleF
	+EuzE0Ef8tbCYaGDeDOWWMczLvi5NqmLvtSXRa7TyrVZ0CwUjvT9sSzNSZANehV4lWFYznpTWyObs
	I3ABjwEGijDtjxon1MgsIh0QSZeySlEExPSeCfJRqqjyzuyDWYIZT0WiroEI2Mcr11OYflHKWgriI
	Gy+En4n9jtKAAj80+lmbzJrih+DKrXQtTEHprIbz8oxc5ZqQg19hGfYMRNr1nPLHXYHryLVodgLiI
	L1mfxBpBMEPWKccaLT/EwdZNh8NcuQVmMBPaDQNDotgL6gu+m9fAbhDczHmux+a4bGp1xj3SEE3WB
	Warpzcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDot0-00AceV-2o;
	Mon, 26 Jun 2023 16:16:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDosx-00AcdP-2p
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 16:16:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F95E60EEB;
	Mon, 26 Jun 2023 16:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BFBC433C0;
	Mon, 26 Jun 2023 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687796174;
	bh=/iE/mdrFZ8SKthRa8x308zaIEO82vNYA2gw6ycABPNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQWDgI8Hj7lQNISM1z6icdXlreFAk1suAVegJRGogbCl0du7p8lBH+V/dtMB95/V2
	 DW2X5kfdEZXDoqwaZpZheXYI/EIXN4s7GSZbhID3LwcMBU61sxcFxnV7DDbvFRCfRM
	 5vfh6hbbnsFCANjiAZKQCXm1P99MKHwFL0kVAyehEhwMzgJfUwmMvEQ9tC4gi2Jfv3
	 526UWKnUNKagtMIxWYRhVA9gzGvr9ZuDj3MFUYeGImw9j6C+oEbiPo2FBA1cGCucSO
	 i2q7EE9cXHRCAtkyw18xzwDxqWy6V6JTCw/K5pkrdj8bQoyI9odv9tKphIp97jcEoU
	 eL851uwjcGmPA==
Date: Mon, 26 Jun 2023 17:16:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v1 1/9] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <20230626-ragweed-whenever-5b22e180dcd1@spud>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-silk-colonize-824390303994@wendy>
 <20230626-e3ea7beb39c584bfbf7ee836@orel>
 <20230626-dragonish-romp-9acf4846ae01@spud>
 <20230626-4fb963235f3ab08383a6d9ab@orel>
MIME-Version: 1.0
In-Reply-To: <20230626-4fb963235f3ab08383a6d9ab@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_091615_992794_3A560079 
X-CRM114-Status: GOOD (  26.74  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: multipart/mixed; boundary="===============5320758913386599471=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5320758913386599471==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jMse1ygduPkCUrcY"
Content-Disposition: inline


--jMse1ygduPkCUrcY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 06:05:40PM +0200, Andrew Jones wrote:
> On Mon, Jun 26, 2023 at 04:51:29PM +0100, Conor Dooley wrote:
> > On Mon, Jun 26, 2023 at 05:14:15PM +0200, Andrew Jones wrote:
> > > On Mon, Jun 26, 2023 at 12:19:39PM +0100, Conor Dooley wrote:
> > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > @@ -333,8 +335,6 @@ static int c_show(struct seq_file *m, void *v)
> > > > =20
> > > >  		of_node_put(node);
> > > >  	} else {
> > > > -		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
> > > > -			print_isa(m, isa);
> > > > =20
> > >=20
> > > Extra blank line here to remove. Actually the whole 'else' can be rem=
oved
> > > because the print_mmu() call can be brought up above the
> > > 'if (acpi_disabled)'
> >=20
> > Can it be? I intentionally did not make that change - wasn't sure
> > whether re-ordering the fields in there was permissible.
>=20
> I agree we shouldn't change the order, but moving print_mmu() up won't,
> afaict.

D'oh, I'm an eejit. Sure, I'll do that for v2. Thanks!

> > One of the few things I know does parsing of /proc/cpuinfo is:
> > https://github.com/google/cpu_features/blob/main/src/impl_riscv_linux.c
> > and that doesn't seem to care about the mmu, but does rely on
> > vendor/uarch ordering.
> >=20
> > Makes me wonder, does ACPI break things by leaving out uarch/vendor
> > fields, if there is something that expects them to exist? We should
> > not intentionally break stuff in /proc/cpuinfo, but can't say I feel any
> > sympathy for naively parsing it.
>=20
> Yes, it would be nice for ACPI to be consistent. I'm not sure what can be
> done about that.

Print "unknown", until there's a way of passing the info?
Speaking of being an eejit, adding new fields to the file would probably
break some really naive parsers & quite frankly that sort of thing can
keep the pieces IMO. Ditto if adding more extensions breaks someone that
expects _zicbom_zicboz that breaks when _zicbop is slid into the middle.

--jMse1ygduPkCUrcY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJm5yQAKCRB4tDGHoIJi
0oSJAP9DZr4lbIRf+EuOJgKIQKEp7BEpNK9BQbDD0GJ9UftDEQD+MwGzlvSN+V3L
QSl86QHkdGu8v0hD14oLc7nu5jyINwU=
=olyw
-----END PGP SIGNATURE-----

--jMse1ygduPkCUrcY--


--===============5320758913386599471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5320758913386599471==--

