Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F6AC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoa/7EVK3t+xlFcac1z4qmN8ctRNDTTqcwqnsMWKolI=; b=jJ6VgsENuZOURSkFBAoHx537q7
	u2eL3XSowgCKs34MoRcbENtK8o6BsI0ULCCKbVdS+SRFddEmsmPc4l4akAD0RzBrnOyuQmRrYfJwJ
	RsS2FBhbbtm2q/n8aXYM1pgyFeLYLUVRXCOKVLOxqGz7z8yoyVZHyTEDqLWw+Ulifcu74euIMEebY
	2Sb6clHwCXYQIIjcPxxwxDDSs9yg8dbPgIO2rWfqWWm0VnpfFdZ0OLXp8iIgb5nI699p/gmns33E1
	18Baj2sVwtkNh0EqrzjqTXLwuWXY9rY0pHWWjx+m0w3Q7zkkPGce1gotxvDpQA0VGXC9u8X2Tb0w4
	qv+k+I6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1qtm-00Dw1t-2G;
	Wed, 24 May 2023 15:59:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1qtj-00Dw0a-2p
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 15:59:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4352963EF8;
	Wed, 24 May 2023 15:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C36C433D2;
	Wed, 24 May 2023 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684943974;
	bh=5372x0NwtP9OuIkf3bXPiuvz3HjwcgvBpj2LWuqXpl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NImesrJ+ptmRyEad7hwasI002O4sWYW+CbD1X9oK5s7FyN8O3MOIQrJ7I+9kHtfnj
	 jAVdE0C3chkYsPmnll030YFAn+P6q/8tyTlBuMvFLhTT1I/l47MxPq4ZCeI1kcLJ8z
	 Icl+LQTkpvXylwgIK82PYpyKo/WehzjcyTL62wmJcLvQQqv7xBz1rjdKvsCJ0gJiMp
	 Lu8SdOtM+8ZjIPK9mavF1ywA5bJ7lwTvMAfJcf3s52kX+Gsc/pKTiAVWaD3E3i+njL
	 lvgxFqQQ4ooSJGktcKuv6nMPn5/xnB/FfdY2SAbHvla4oK1Yq4bWXh/KDWBFMhNHvh
	 cdAjToE+LRcCA==
Date: Wed, 24 May 2023 16:59:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230524-rocker-uphill-0cfdab27a3f4@spud>
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy>
 <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr>
 <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <20230524-wasp-charm-fe5c5478957a@spud>
 <CAHVXubjhti9reD8oCh3Jm97tvFdUGi9ShYnm0NhQU4ZYVgU6HA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubjhti9reD8oCh3Jm97tvFdUGi9ShYnm0NhQU4ZYVgU6HA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_085935_951901_5CBE455C 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, robh@kernel.org, Alexandre Ghiti <alex@ghiti.fr>, jeeheng.sia@starfivetech.com, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, palmer@rivosinc.com, leyfoon.tan@starfivetech.com, Conor Dooley <conor.dooley@microchip.com>, mason.huo@starfivetech.com, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============6601733781457778313=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6601733781457778313==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fpr9FumDr9m9Nw35"
Content-Disposition: inline


--fpr9FumDr9m9Nw35
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 03:57:20PM +0200, Alexandre Ghiti wrote:
> The reserved memory regions are *currently* not specified to be no-map
> and that since v0.8: the culprit is commit 6966ad0abe70
> ("platform/lib: Allow the OS to map the regions that are protected by
> PMP").
>=20
> So to make sure we are on the same page:
>=20
> - from 0.1 to 0.7 =3D> reserved memory regions were marked as no-map
> - starting from 0.8 =3D> reserved memory regions are *not* marked as
> no-map anymore
>=20
> Hope that's clear!

Yes it was helpful - thanks.

--fpr9FumDr9m9Nw35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG40YAAKCRB4tDGHoIJi
0h12AQDRekzfK51Hw9OBc1W5MAlPSn5sT0eZA/blzdGjhlJVvQD/TyuBHKkjWtVC
NayJSPKdj8ioC9UTvr0eodxsCuo40Qs=
=pEnp
-----END PGP SIGNATURE-----

--fpr9FumDr9m9Nw35--


--===============6601733781457778313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6601733781457778313==--

