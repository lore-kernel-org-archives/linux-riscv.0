Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADC2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pQ5rBmmhtHt8JYskxaina+dyNDtpBYWixX+xsyR+eA=; b=hL/vuENa7x8fRI8KCDshUri9pN
	nujtPoTiCAy5AAD9o8poH8Rv5kemmycaiXdnbge+RJnTwOlbnyZbhspNCbkU56+5ADY8ZBZgzIAGo
	JTAzQ7VenDFgsRRJ75j4C+0xZqOChaWKHhMoXZPuq5RYYr8hnU1BeIteoNMgN0H06jLnhbVoGzdoO
	jEXtt7I4GHUM08fvU4HMgId7OtrA/RWuENsvvU1/6rsTAALpcmM+/OT+pyyCgOG2nUZoPGFo77pzL
	ChijZOS2WCd3l3fI/EoubxZM+5urS9Z1dfzh2WRbmIbCTlkdIII0cUDaBfAcHcJfpEQdn/xeCCt1p
	22BvUmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyANO-007UWJ-33;
	Wed, 01 Nov 2023 12:31:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyA9z-007PDt-0O
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 12:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15E7D61210;
	Wed,  1 Nov 2023 12:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D35EC433C7;
	Wed,  1 Nov 2023 12:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698841039;
	bh=0XiE9wAIOR0erJx7O94+qZoOgDxDOxtAfewenZYLjyg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ccCwoW7UeaoXS522nwOfhiWRYCpvw2jP75vXK/g2bDmydqNvvcr8AGNV1r2MIKmBH
	 J89pe6l9MDxDrpDLOtSA724evgXX+PIs758yjV57NW8RyhhunTnzVMFM4rXtKMPR/H
	 4p6AEX8jjUgMVAK/5D5L2lORrd9IWg33KSj63p+5LR4/4XEylwT7plJRhiBVNODsBd
	 03NpWwa14h4Ih1+Q4vvwUXModFTSVafuVrG3/1iei+3xC+HhO750mOpDEt/s5n3d67
	 nrBzERz/zUS27szwT2ynB/1HpNu8UfQDW57p4fSRMcIlhBCA/eRaSqclEoLJ+3JNSf
	 YuU7hCEYiergA==
Date: Wed, 1 Nov 2023 12:17:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: geert+renesas@glider.be, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	soc@kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: split cache ops out of dma-noncoherent.c
Message-ID: <20231101-reseller-encourage-385ad0ef4012@spud>
References: <20231028155101.1039049-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20231028155101.1039049-1-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_051723_203991_F02F70C4 
X-CRM114-Status: GOOD (  11.21  )
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
Content-Type: multipart/mixed; boundary="===============6229958474672471378=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6229958474672471378==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wb77gT0vPt2mw1+g"
Content-Disposition: inline


--Wb77gT0vPt2mw1+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 28, 2023 at 05:51:01PM +0200, Christoph Hellwig wrote:
> The cache ops are also used by the pmem code which is unconditionally
> built into the kernel.  Move them into a separate file that is built
> based on the correct config option.
>=20
> Fixes: fd962781270e ("riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend=
 on RISCV_DMA_NONCOHERENT")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This fixes two different sets of built warnings reported by Randy.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Wb77gT0vPt2mw1+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUJBywAKCRB4tDGHoIJi
0rxSAP9lbdAnkwfEHgZV5dwAEwuLkR1+sg5y15mNNZyzxmzC1AD6A55uZ4D7wNtH
/Afv7AVITV+9NF9O/Mw6xCpOtb/s5A8=
=THGL
-----END PGP SIGNATURE-----

--Wb77gT0vPt2mw1+g--


--===============6229958474672471378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6229958474672471378==--

