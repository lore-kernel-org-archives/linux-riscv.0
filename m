Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321C3FEC0EC
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 17:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/1uh5NXE6UEOfp1vlWOO0gb0/TSpqX9tcHnFwamwN4=; b=cH01DdDHflTuhStodwTjNOcVH0
	I22J9BiamBYYkWPJ8BaT9LRqGL/QQe7Avct0nVxzm76bhXd8tzi9t7ZMaHZRXEPp2uQ5gPA0ntpPI
	ogxPq2Jm8JoQbSo9ZfaaAWnVptL6jyQsXIVDb1EEGMqyaxLmMcxEtG3LJaINzk9cQQMRZd2c7NeNE
	yOewV++OspitKR/tKGg/99tePJbNAByGNZZsUMt12MndOk1RoxuTaJhrZ8iLiJ5eqeL2yND+yu7HU
	EQ1kbjf7rxNvGuRENKljnPWj2EOtG8NXdv3dYJ6MAJcH4TM0NsYnLScjQZVoWg4TTp3qpkx1lA453
	yfcK5V7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55so-000000021bS-2TzJ;
	Tue, 24 Mar 2026 17:49:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55sn-000000021bM-2hpR
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 17:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C32AF600AC;
	Tue, 24 Mar 2026 17:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D022C19424;
	Tue, 24 Mar 2026 17:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774374576;
	bh=P6CGa5PVaMof53EJnc/g5F3lxqSTKqEjKLDeUbeIEQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZ7okAZvzXoZlJdnFoy5gkgve+n0JCiGqjEdWscu0+i0fo7hEq74jtgvLdfYrETg4
	 jE/M7OEA8PvOfcUGOBonmgTUEuQT4si45Ad3dnREsJk5YOdtYTSBWqjyJNSJz+xYdG
	 UZpkDubxJBgU1R4sGJEn5RKayktuOj775WlCga6A9VHuXW7WheE6/51FSKK7kt8f6+
	 bC2JTcpHKJsqbEVp4L8RDf+Ke6WpdQESV6cUCYkoFMhGx7ETfl7QnRZlsom48Wf6Aq
	 zHHz13ycpLhT7BRd8X7flTomUeHympcSqstlni1fssQ67L87roMn7uk8NO7TGJkBBw
	 gm14L3RL++Nnw==
Date: Tue, 24 Mar 2026 17:49:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
Message-ID: <20260324-marshland-stretch-cc21ae7fdc2e@spud>
References: <20260316060328.1173634-1-ganboing@gmail.com>
 <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3630329243437066397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3630329243437066397==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VG78Oqy1pPQ6mjx/"
Content-Disposition: inline


--VG78Oqy1pPQ6mjx/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 04:08:33PM -0700, Bo Gan wrote:
> Hi All,
>=20
> Any suggestions/comments on this?

I'll get to it at some point, just busy sorry!

--VG78Oqy1pPQ6mjx/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacLOqwAKCRB4tDGHoIJi
0oReAP933a6p+CD1qNpOIbLbNSQ5Y9tHlbaabrnfLZrKwvMNUAD/XXmlLOeKBLgh
ipUx/vkgnh4p5eodwkoKB57ytGcaswQ=
=hzvl
-----END PGP SIGNATURE-----

--VG78Oqy1pPQ6mjx/--


--===============3630329243437066397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3630329243437066397==--

