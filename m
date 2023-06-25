Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A51EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4vHMzsFqGacqeqye/6he3oolN12VxWcu+LZP7zUkF8=; b=5DEot+UtUYseJFUlEObcqTaD6U
	HUdwwJCxyfoejT663b9jDXAb3F8WfKlEacZALzMrnokRe0k7zSpaFHJLXQ4jZZCLDDVXOoEVhietT
	qi5VneyjhZ7Qk9Taa/fPAHjVpRsrTYraW2PnsVt2ljneiHrn3jbk6K1hVKTZRIEGou6o/W+KCTdNG
	gCXEKNcgqMcHgysiqqKnQsxlEBq3B6uqvTn2kIMekkbzfjMwRAnbJIUrXRrH2t8PWaePmf0hm6Wuk
	JdHtQytiap95Y5Gj7AX3jFlCQlIqV7RU/R0XaWO0Y0hWlTzOQzmlWBsXMq0slX8QPGuc3Oo/EAOXV
	D2o5IkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQY6-0087jG-2k;
	Sun, 25 Jun 2023 14:17:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQY3-0087il-2z
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 14:17:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C618B60112;
	Sun, 25 Jun 2023 14:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1899BC433C8;
	Sun, 25 Jun 2023 14:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687702622;
	bh=I1vcyxhtcISQlL0P8GpCG/D7laU7l1dOUyg/BCWm7Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIXuK+6xoktZaHi1lCvzVPzqpy3FLZCqMNeaAwkfVAzPzpCkEEllpR1r45R1RuHaT
	 TuR9ZxQV3ntaoajXWZ5csZsXQ8dFVwKNPbKRWyqDTBbCQPhFuMQMDqM9sw87OOeHr8
	 VqTfy3+rejxZGE7qpp7RnPEG86QcnFiMj7qviz+jm+DTbheRP/q5yjyhQgyssB0qY4
	 UuS2SjtdbHolck0il8DtZCLHpKRYstNVWeE8BCAQRcL92XcW2NH4e3L2ZjVqzy4CVB
	 wv3yrX6R1YtvGvf/GK8f0/o+VXcfPKZiVZZoQRo5k85S8ZEwpffCSlvSEg0tI26MLS
	 wVCEdQAzLYJtg==
Date: Sun, 25 Jun 2023 15:16:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	robh+dt@kernel.org, frowand.list@gmail.com, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, mpe@ellerman.id.au, arnd@arndb.de,
	rppt@kernel.org, samuel@sholland.org, panqinglin2020@iscas.ac.cn,
	conor.dooley@microchip.com, anup@brainfault.org,
	xianting.tian@linux.alibaba.com, anshuman.khandual@arm.com,
	heiko@sntech.de, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 0/3] Revert huge-paged linear mapping and its related
 fixups
Message-ID: <20230625-squire-hulk-d28483ab5ef7@spud>
References: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071704_034924_76E638D5 
X-CRM114-Status: GOOD (  13.14  )
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
Content-Type: multipart/mixed; boundary="===============4725714666906938625=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4725714666906938625==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z0/mXjtX89gmKaoG"
Content-Disposition: inline


--Z0/mXjtX89gmKaoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 25, 2023 at 10:09:28PM +0800, Song Shuai wrote:
> We have encountered these two issues about huge-paged linear mapping sinc=
e v6.4-rc1:=20
>=20
> 1. Bug report: kernel paniced when system hibernates[1]
>  =20
> OpenSbi [v0.8,v1.3) set the PMP regions as !no-map, and the commit 333506=
8f8721=20
> ("riscv: Use PUD/P4D/PGD pages for the linear mapping") mapped them in li=
near mapping.
> The hibernation process attempted to save/restore these mapped regions re=
sulting in access fault.
>=20
> This issue was temporarily fixed by commit ed309ce52218 ("RISC-V: mark hi=
bernation as nonportable").
> But as Alex's RFC and Rob's response stats in another thread [2] ,=20
> "Hibernation is only one case. Speculative accesses could also occur."
> So this fixing commit seems not the perfect answer to this issue.

This is a misunderstanding, I was not attempting to fix the issue, but
rather buy time to fix the problem properly, without regressing support
for hibernation when we do.

Cheers,
Conor.


--Z0/mXjtX89gmKaoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJhMVwAKCRB4tDGHoIJi
0uGBAQC/QRJPIKKal1mDLC95zDLv81ngF6w3fK8jXGP+B9V4pQD9GCV8MCsnF1th
HIFQcwNPiG7Zw5sBVtBjgefc18iGcwI=
=cAQy
-----END PGP SIGNATURE-----

--Z0/mXjtX89gmKaoG--


--===============4725714666906938625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4725714666906938625==--

