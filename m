Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8850AC7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3zNKjkjIi9cZfzcM/00HcoOJED8miVnIbrz93EIW4w=; b=OQRG+xWg/NXusiEHXUCuHPmLzY
	NXw56AlOsL5YhRP2BA5XD1klPI1rYMy9Cs0wbJ5/vGECF8UF1lwhx/Ti70mjQapF5ssQ/KoKhzbLC
	zj65fHrSMRUeySSJcakCj+iRs3BH4YUKiNm3zrML+0+qwX3HFt4Yd7DNzmrqr81Te0o3Xs9Fk4oz0
	zK1ewG/v813QOkNL5huOp6NE1CC3/RhkxXqZxu6qe01GNZjyH40Eqw2mQY/tlT3/pSFo3u+RL5GTv
	JTMCr1e8u6o6waISRtjiT040Uf4ELobcF98wlU6GMU9Ng/tl/jWNpOD90B3pUREnXMnGVmFGKzvbt
	cczqSYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ICY-00Gssx-2G;
	Wed, 31 May 2023 09:33:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ICV-00GssJ-1P
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 09:33:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB4A861A60;
	Wed, 31 May 2023 09:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C835C433EF;
	Wed, 31 May 2023 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685525582;
	bh=XISfOmDoHo/PggMpWabfnR8Ct4u+Z8yT8F7SXJAhFUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sn3Z7p7/p4mZNoxn+l33H+9F9jVYrk6OZ7clua4kRA5qMs3f8QQXqX9xv2deQR6hK
	 rcXYdWnWPiFH6WOlESxeJX4dBU9k202Z64Tc+j+xeUufCh5XqfvkOWWtY3o8OkfUpU
	 NcznGYCPh0CP8HHXtCqijnQ2AzjcA4vQgsZKPW8heDicsdkrEmfEFCICR1m5PP8dcI
	 gi3/4x/U53l+mlr2ucgi9b+QlpoyPe943g2nFshUFkEmYLbCv64mLLlEYw+CvGvSo6
	 YJjNZMGLL/4BxAWX4RVJ2DZU2konmNeEAT1PRmHKeT62Ii6fymSN4dNe3rrG2fcFBP
	 uSBWpMPpigCIA==
Date: Wed, 31 May 2023 10:32:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-ID: <20230531-staff-pampers-0250f7f6026a@spud>
References: <20230528-uneatable-earpiece-3f8673548863@spud>
 <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
 <20230529-skillet-quarters-3fbc3b6edb3a@spud>
 <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
 <20230530-polka-trifle-7ccd7a093099@wendy>
 <92d4aaa8-a1ed-74e1-3a22-df9be1ca1e4a@ghiti.fr>
 <20230530-hatchery-unifier-64d7a2ffe0d0@spud>
 <CAHVXubgG31moSNOe3fRqFzUSJK9tRWKH1KPP_BO7wRNC4WzxTQ@mail.gmail.com>
 <20230530-atrocious-control-bcb37de558fc@spud>
 <0068add0-8949-11b7-a864-2ef8bed00809@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <0068add0-8949-11b7-a864-2ef8bed00809@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_023303_559909_411DBCF7 
X-CRM114-Status: GOOD (  26.60  )
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
Content-Type: multipart/mixed; boundary="===============3188196119593763701=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3188196119593763701==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="szZMQ2+zzCU5WCM/"
Content-Disposition: inline


--szZMQ2+zzCU5WCM/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 09:26:27AM +0200, Alexandre Ghiti wrote:
> On 30/05/2023 22:22, Conor Dooley wrote:
> > On Tue, May 30, 2023 at 08:04:17PM +0200, Alexandre Ghiti wrote:
> > > Ahah, I think we found the culprit!
> > >=20
> > > With CONFIG_RELOCATABLE, vmlinux is actually stripped from all the
> > > relocations (so that it can be shipped) and vmlinux.relocs is what you
> > > should use instead, since it is just a copy of vmlinux before the
> > > removal of the relocations!
> > That probably makes us both eejits for not realising sooner...
>=20
> Ahah, TIL a new word, thanks :)
>=20
> >=20
> > Tested-by: Conor Dooley <conor.dooley@microchip.com> # booted on nezha =
& unmatched
> >=20
> > Thanks for your patience here Alex.
>=20
> So I checked again if the -fno-pie should be applied to mm/dma-noncoheren=
t.c
> as I suggested, but actually no: errata/thead/errata.c never reaches
> riscv_noncoherent_supported() in early boot (you can see how 'fragile' it=
 is
> though and why something needs to be done...).

I did make sure to check this patch itself, without the additional bit,
to see if it was needed.
But yeah, it is going to be super fragile - do you have any ideas about
how to circumvent that?

> Oh and I realized that I forgot the Reported-by from Andreas and the Fixes
> tags, so here they are:
>=20
> Fixes: 39b33072941f ("riscv: Introduce CONFIG_RELOCATABLE")
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>=20
>=20
> Thank you too for your patience and your quick answers!
>=20
> Alex
>=20
>=20
> >=20
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

--szZMQ2+zzCU5WCM/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHcUSQAKCRB4tDGHoIJi
0oYkAQCQnpZ3oYYSGawZSziJAqO73JKXioqPdpYxRcmvxcz0vwEArb/YovzhDv6x
1XH3hAojhz03Lc56v3vGFi8ybOoVzgE=
=s138
-----END PGP SIGNATURE-----

--szZMQ2+zzCU5WCM/--


--===============3188196119593763701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3188196119593763701==--

