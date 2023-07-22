Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C8EEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/h0ZY1EU52LsIDZqgxv03TMrEkRWiNq/kvny+KdGU4=; b=InqRN5rkf+SBGV4osEBiuwMcWo
	pHnvR4vRuSDLQaDP33J9+QacU9LEw+2j/utpcOTBhX6NguinTngGcVYoeEWFryQb8zutlKHS3/uJ0
	//DZCnc7E2uqapCdr5ZZxPDNtCPcqPEMc1SpI6/M8lTZ3NpPwSQYfVWDwhx69mywuLaqREYITDkLC
	WNYPnOqI9EfFWwLWxZQSbD8eHCY2W+HkHDgJSc9+40mbHyaJ9Gcyvz8B79IzUG7gC3bw1Ys5SUGe4
	EtsxhsbArWLlgcJi8suO7I/GXqzNma1jZj7UtScvYlPFoH4QSdqETEypOmT28jOJAlIRds1aIlvMD
	Fq3woQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAn6-00GaFx-0W;
	Sat, 22 Jul 2023 11:28:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAn2-00GaFR-2d
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 11:28:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C32A60766;
	Sat, 22 Jul 2023 11:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4395C433C7;
	Sat, 22 Jul 2023 11:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690025323;
	bh=Y5BPhjcGyHjtCHq9n0zq3tHaD9VyEznW0MQSKwZgL6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bflBivKYQFupgU/m46Z9TtYAjTkmPMOIBlgxiphcc2rJ/Fw7S8JShp8WMBtMh5u/T
	 HjwyW+3nub5hADLcMqfGUVbJjimSfqrE5H3+uGtxhs2pd271m5mHF2eHBbEpRisAH5
	 qryzB6JcjbTlsLDUEyOlncXi+ff6E7usy8gcnmP5WZfrj3g+TDgHOtkpZm1TzGB79J
	 Y/l8pYX+w4P+EqCpD/8izjlelnGx50dtPMZtfaH/f4Z+m3r2tC0DakRalM0b5wo2gF
	 1ZAJ7A90Vo/wQG79V33YCi+OA7dcj+jmD7FrBunGKU1jaW5cMmgfklxzeCpjRM9X9e
	 Y5CtSY3WlGLUQ==
Date: Sat, 22 Jul 2023 12:28:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] RISC-V: fix the comment for ISA string workaround
Message-ID: <20230722-playlist-arrange-5b58ee25ee68@spud>
References: <cover.1690006695.git.research_trasio@irq.a4lg.com>
 <a7d3db75ba6f3bdd6185ff1574c9a71a14a95126.1690006695.git.research_trasio@irq.a4lg.com>
 <20230722-smog-establish-ebb3eaa5e9e9@spud>
 <d7dfcb4e-d8a8-7b90-aab5-9be0fc3c9027@irq.a4lg.com>
MIME-Version: 1.0
In-Reply-To: <d7dfcb4e-d8a8-7b90-aab5-9be0fc3c9027@irq.a4lg.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_042848_961871_4FC6A552 
X-CRM114-Status: GOOD (  25.45  )
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
Content-Type: multipart/mixed; boundary="===============7810573172057266527=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7810573172057266527==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5fzAzfrSW/S0cNjN"
Content-Disposition: inline


--5fzAzfrSW/S0cNjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2023 at 08:22:25PM +0900, Tsukasa OI wrote:
>=20
>=20
> On 2023/07/22 19:52, Conor Dooley wrote:
> > On Sat, Jul 22, 2023 at 06:22:38AM +0000, Tsukasa OI wrote:
> >> From: Tsukasa OI <research_trasio@irq.a4lg.com>
> >>
> >> Extensions prefixed with "Su" won't corrupt the workaround in many
> >> cases.  The only exception is when the first multi-letter extension in=
 the
> >> ISA string begins with "Su" and is not prefixed with an underscore.
> >>
> >> For instance, following ISA string can confuse this QEMU workaround.
> >>
> >> *   "rv64imacsuclic" (RV64I + M + A + C + "Suclic")
> >>
> >> However, this case is very unlikely because extensions prefixed by eit=
her
> >> "Z", "Sm" or "Ss" will most likely precede first.
> >>
> >> For instance, the "Suclic" extension (draft as of now) will be placed =
after
> >> related "Smclic" and "Ssclic" extensions.  It's also highly likely that
> >> other unprivileged extensions like "Zba" will precede.
> >>
> >> It's also possible to suppress the issue in the QEMU workaround with an
> >> underscore.  Following ISA string won't confuse the QEMU workaround.
> >>
> >> *   "rv64imac_suclic" (RV64I + M + A + C + delimited "Suclic")
> >>
> >> This fix is to tell kernel developers the nature of this workaround
> >> precisely.  There are some "Su*" extensions to be ratified but don't w=
orry
> >> about this workaround too much.
> >>
> >=20
> >> This commit comes with another minor editorial fix.
> >=20
> > Which is what?
> >=20
> > The new wording is fine by me though..
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> 1. Use of plurals ("letters" and "bits")
> 2. Second "'s' & 'u'" to "'s' and 'u'"
> 3. Spacing after the first "'s' & 'u'" (before "(QEMU).")
>=20
> It feels they are too minor to separate to another commit.
> At least I should replace the commit message to "other minor editorial
> fixes" and... should I clarify editorial fixes?

I dunno, I just wasn't sure what you meant.

> >> +				 * Workaround for invalid single-letters 's' & 'u' (QEMU).
> >> +				 * No need to set the bits in riscv_isa as 's' and 'u' are
> >> +				 * not valid ISA extensions. It works unless the first multi-lett=
er
> >> +				 * extension in the ISA string begins with "Su" and not prefixed

Re-reading I noticed this should be "is not prefixed".

> >> +				 * with an underscore.


--5fzAzfrSW/S0cNjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLu9ZAAKCRB4tDGHoIJi
0gBZAP0TGqfp7Y/VWn8WDeV9vZhX6ycdFoBx1+mO6WfYHlL5FQEAmNXjjIBYiCmH
sRLqdHYVKzAhx+uyt4ZDCCSHd4aOogk=
=4clw
-----END PGP SIGNATURE-----

--5fzAzfrSW/S0cNjN--


--===============7810573172057266527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7810573172057266527==--

