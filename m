Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC90C6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZnIHIxM8eLDTYhPiEbvRM8KSLv1jfBZuJT5rg6+6Ts=; b=5CLSgMG/p7VcIhFqu1Yw8VZz3w
	QvfLurSEkqKkVLht9IA/iYgGM3uvDGdMWMnwE/ICFDM9RTTyakNqmawNQAxauEtFBR0QIz10FcL1+
	IbonuwZDiHuG2o9WmMZNIjnm5L8nD2ks672q07fAkpMG4DPD69tMatXD/IKzBVkclthBhiFxbEHD0
	bHb01rXsnlgXZaKMy3lHtU3OIsCyKPcQ8Tt5+kp/W6+tyZbSqg3wYWyEH3vbBkpaa/LBdEXeJ5+vG
	Sc0iQQ6C6BVUfjGm0MWgw6ZQh5rP6RFWbGmkWoqKmrSDwr3VZj8VfhbCsNqNVDsmBpsvjNeOkMOB1
	dOYTSdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdkY-002Lsy-8B; Tue, 07 Mar 2023 20:17:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdkV-002Lsa-Tn
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:17:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7406C61535;
	Tue,  7 Mar 2023 20:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C27C433D2;
	Tue,  7 Mar 2023 20:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220245;
	bh=APTDxyKPgvvzyaQVDMc+JlcB244tKfRI6rVCuPSmtqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfv4ekpPO9LNV+1A30TDqDOkPqvjgRSwkasSOm/kkwOY2oSNy2GIys7EOxIaaLOvy
	 /XU/yOdb3dsyeisrMhIxJN08HneJwyCxnPN/Xsp7ELWriglwiv0+4FlWQW+06G2NcK
	 7zoKtf3ffZ93KyayOxqpRIE55ZQYaF8pMzG6RVnTWN84VFw9LtFo7+g/GNtKEkW6pr
	 JCiSSbhh9PdXJTItXPrrnaZLDnGhPWDX597nPUj0oigxqG0uJfhV1E8iTWeSoIGOaF
	 X2GTjghPx8qYwPa1r++3ovwEGzawuo9Wk6dMwP/jQyhCxv4OHc+lEHoNi+N0g7SONv
	 Jnv5NNxdXczmw==
Date: Tue, 7 Mar 2023 20:17:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	Chris Hofstaedtler <zeha@debian.org>
Subject: Re: [PATCH] RISC-V: fix taking the text_mutex twice during sifive
 errata patching
Message-ID: <7a36c00d-01ca-4f40-8786-1ed9d1599956@spud>
References: <20230302174154.970746-1-conor@kernel.org>
 <CAMuHMdU7oV4PcVDHOugq8TFn7bw4Q3DEpjCfcTpVJZLkC9LKOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU7oV4PcVDHOugq8TFn7bw4Q3DEpjCfcTpVJZLkC9LKOA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_121728_042418_8F5E603B 
X-CRM114-Status: GOOD (  19.51  )
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
Content-Type: multipart/mixed; boundary="===============0711911268378110904=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0711911268378110904==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="elw03qJzeX1EneTt"
Content-Disposition: inline


--elw03qJzeX1EneTt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 09:13:01PM +0100, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Thu, Mar 2, 2023 at 6:45=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Chris pointed out that some bonehead, *cough* me *cough*, added two
> > mutex_locks() to the SiFive errata patching. The second was meant to
> > have been a mutex_unlock().
> >
> > Reported-by: Chris Hofstaedtler <zeha@debian.org>
> > Fixes: 9493e6f3ce02 ("RISC-V: take text_mutex during alternative patchi=
ng")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch!
>=20
> This fixes the crash I see (with "earlycon keep_bootcon") on StarLight,
> and which I've just bisected to aforementioned commit, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> You may want to include (a part of) the crash log below in your
> patch description, to make it easier for affected people to find
> the fix.

There was no crash log when Chris pointed it out on IRC & I never asked
if they had hit it in a running system.
If there's a v2 for whatever reason, I'll incorporate the splat.
Apologies for the inconvenience caused by my boneheadedness!
I'd hoped that this would make Palmer's second PR, but it was not to
be :(

--elw03qJzeX1EneTt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAeb0QAKCRB4tDGHoIJi
0n00AP9qBqXhkJx+r+oMrFVJYtRI65vuEfEfxOiOyEYbhAkkEAD/Z4OtYrLQwh3I
kd1CPeNU9HWHFbXTtVuPY+oNPEZgkAY=
=H4ue
-----END PGP SIGNATURE-----

--elw03qJzeX1EneTt--


--===============0711911268378110904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0711911268378110904==--

