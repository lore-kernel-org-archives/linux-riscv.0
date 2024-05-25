Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918DBC25B78
	for <linux-riscv@archiver.kernel.org>; Sat, 25 May 2024 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhmr5Qxos6rCM4uwm9Ef6tTYmm84RnWIIE7SkVi4Fyo=; b=bMzgnYAEUXFmfXex0Z+Poh2GRK
	odju2uL82+GckZS/EPm5V2HEQDcXI/fpcuAZLNvFX9DGkQnwbEgXfYLBQbz8J6T/CpF4GH6VOBF4r
	rnKRm8S3sUYA3Sy2PAplncHXLV9BQ/bumAdnzPSc3WeWeZT0M29JaoKKiWvpb6Efq47kFW8bgRRr2
	f8zpD7M0b2MSJOoDjijrzx+iHMLIU5L82T9kYfM3/RlTaH0m1XwJsjNJ1CJdr39ZoLer2PITlla8g
	t3iY5vrO0oV20U/F9HYsaKALAKSrEbnNG9GLC+7o8lLW9WZ1uPujCfZY8EocEZzRl5iJhJKqjazpT
	BwIvGGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAqTF-0000000B06W-0ujc;
	Sat, 25 May 2024 12:25:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAqTB-0000000B05R-1ZU9
	for linux-riscv@lists.infradead.org;
	Sat, 25 May 2024 12:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2E4D6CE0690;
	Sat, 25 May 2024 12:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AFEC2BD11;
	Sat, 25 May 2024 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716639949;
	bh=uuutn1siWRfLN8VrmLQsvkar1/xh4in+lXCkVh75NNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBZou4/4P5uSEv7MlskTVJ8tOAnh1CurHxktslMywg/aVBTxLd0yHQnlopmMJOQZP
	 9zMUwcSPMfzhxw6XXGAdYuT3N+3jKIkfkckiDqEYN08hCCdm+3Z1z80IA4ejMcy4Mn
	 nFwy8nVkYRGJRhILFK4300UaJXoaOJnYYHRr+guvJKWFp1FSgP3coKXGkcM8ozRczF
	 KqJCWak29MjcrIDHjWsLkrXhlN8xwmMXWKDi17wVEp2Mz/uRFlp5i7nyU5GuAW0A4A
	 JQq2N9wY49GWimQQsKpgs5zVK7pwCryLU3ixytCWpc4w0NMJUntuT5C09cEfyBSG6J
	 h14wh0R4pNsKw==
Date: Sat, 25 May 2024 13:25:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Henry Bell <dmoo_dv@protonmail.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: RISC-V: add Star64 board devicetree
Message-ID: <20240525-shirt-scratch-6708b2a4f63b@spud>
References: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
 <1b55aad1-1442-41a5-acc6-16baab90c021@web.de>
 <caCBlFpvjmhO9G1A1_2qHImmuoGai2NoPYonB5RCVftq4zIrSxlP8Msh9z_FX9GwQXzfSrB40dRxy1zfxZesOJENeebWQsERa03sDvArzec=@protonmail.com>
 <20240525-dumpster-bootlace-10123081a6f2@spud>
 <b52685a3-127a-4367-b11a-54ab88467dcf@web.de>
MIME-Version: 1.0
In-Reply-To: <b52685a3-127a-4367-b11a-54ab88467dcf@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_052553_618137_7A8D3B0D 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Type: multipart/mixed; boundary="===============8352006716130370220=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8352006716130370220==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6WI4GTcOugy2KI8b"
Content-Disposition: inline


--6WI4GTcOugy2KI8b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 02:11:05PM +0200, Markus Elfring wrote:
> >>> Would you like to add an imperative wording for an improved change de=
scription?
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.9#n94
> =E2=80=A6
> >> I'm happy to change it, but was going off the format used in Conor's  =
Milkv Mars commit
> >> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit=
/?id=3D04a228aadb84d894721b13197649ca741f3018bc
> >
> > Don't worry about Markus, most maintainers (myself included) ignore his
> > comments on patches. The commit message here is fine.
>=20
> Would such a response mean also that you are occasionally ignoring requir=
ements
> from a referenced Linux development guideline?

I do ignore it from time to time, yes. Being a stickler to the
guidelines wastes everybody's time (just like this discussion).
That said, the tense used in this patch is perfectly in-line with the
guideline you reference. "Add Star64 board devicetree" is in the
imperative and the commit message body contains additional information
about the board's configuration.

Thanks,
Conor.

--6WI4GTcOugy2KI8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlHYyQAKCRB4tDGHoIJi
0oTUAP94LrOxy2p8XfaXuefNL2Vk1HswZhmUTF28/ERnU2emAQD+I1g497DfVS6G
WaJk05M15ZqUswocaw+gXzJOKt7XjAs=
=LQw1
-----END PGP SIGNATURE-----

--6WI4GTcOugy2KI8b--


--===============8352006716130370220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8352006716130370220==--

