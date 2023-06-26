Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD4BEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjNDojJiw9ewqL7VH7KRG8NX+QMEgi12RZTWz0ZDuSc=; b=Zl32d11ycxGChVoYgMu2tPINQv
	+bRu3AQJW1XJD69Ss6PinuSjBF6o6Ho6zPVAvbfpmkkUXbqrGIVqL3dVdf2vT1CzJfmHxpT3xIxx6
	76P2w6yTAuzlCyA7sDlMmlsZrV/H3wOIYtmhfBNxM6931UPRZSID2mnyalpqTiO/ZrMD58GSv1Tix
	0LnmywwA/E8iUR6LgQS81FvHNsNANLrg572DnGtOWKdIUgg1KqGqYXRTJhDOMLsjSZwgJ1MbI+bVj
	g6Rqc8q1T/cU6mCCES+IsvCssg99HLQOgCjfUwONk5Ph/XtEoZ6VAcZ67hATfg78NY+FBvuhLQbdm
	A2A7MZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoV8-00AYQD-1O;
	Mon, 26 Jun 2023 15:51:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoV5-00AYPZ-1U
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:51:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD15F60EC2;
	Mon, 26 Jun 2023 15:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92307C433C0;
	Mon, 26 Jun 2023 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687794694;
	bh=cU5DSziNAOrXhpvgrl/54P8ukmcWLFJDRxZj1+C07pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEIcsGKJEiUuMAsVgngWJ09kq0Prk8Vkujv5K98yNtKPrwajkjYWIRoQ+SZ2sO1Nv
	 qIn29afaLaDMc9UCXW2icRn/mFa6GprGZFAScXGDH5A+PQ9Jv+1gInyRQsgZ4i/XCD
	 iaP2yaBYcLTkk+Pu7sYivagJqraj9OEV5Vw8YPuGD8KqmBlrr58WOnrik21/nZKC8K
	 bGgqmVxvV8fuvDeSmNmpiZT1qhUEJBbFAaXO4KajjeyV9RnngckTutcrzupp9eH1q9
	 CdeO8R+Mx1jKBx2d6Fh2M8fFWoR1XJTEXe0+k0KleXdttDl12MHZzRyfLgGT6mzCu0
	 pvYogUFZ4lxZA==
Date: Mon, 26 Jun 2023 16:51:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v1 1/9] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <20230626-dragonish-romp-9acf4846ae01@spud>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-silk-colonize-824390303994@wendy>
 <20230626-e3ea7beb39c584bfbf7ee836@orel>
MIME-Version: 1.0
In-Reply-To: <20230626-e3ea7beb39c584bfbf7ee836@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_085135_539283_9CEE860A 
X-CRM114-Status: GOOD (  16.52  )
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
Content-Type: multipart/mixed; boundary="===============3047937789575566389=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3047937789575566389==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FRGPr8JGNqOl1Avz"
Content-Disposition: inline


--FRGPr8JGNqOl1Avz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 05:14:15PM +0200, Andrew Jones wrote:
> On Mon, Jun 26, 2023 at 12:19:39PM +0100, Conor Dooley wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > @@ -333,8 +335,6 @@ static int c_show(struct seq_file *m, void *v)
> > =20
> >  		of_node_put(node);
> >  	} else {
> > -		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
> > -			print_isa(m, isa);
> > =20
>=20
> Extra blank line here to remove. Actually the whole 'else' can be removed
> because the print_mmu() call can be brought up above the
> 'if (acpi_disabled)'

Can it be? I intentionally did not make that change - wasn't sure
whether re-ordering the fields in there was permissible.

One of the few things I know does parsing of /proc/cpuinfo is:
https://github.com/google/cpu_features/blob/main/src/impl_riscv_linux.c
and that doesn't seem to care about the mmu, but does rely on
vendor/uarch ordering.

Makes me wonder, does ACPI break things by leaving out uarch/vendor
fields, if there is something that expects them to exist? We should
not intentionally break stuff in /proc/cpuinfo, but can't say I feel any
sympathy for naively parsing it.

> >  		print_mmu(m);


--FRGPr8JGNqOl1Avz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJm0AQAKCRB4tDGHoIJi
0gB8AP9iCRWLKExtLLeh6ETpNmcB/2kGTzWN4Odb8Z0n6C+fHQEAnKMQtHI5zAwA
7wiZ9pJqqpKM4N2JJI1eCwyfl2JjfAQ=
=OAfc
-----END PGP SIGNATURE-----

--FRGPr8JGNqOl1Avz--


--===============3047937789575566389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3047937789575566389==--

