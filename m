Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCF7C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 21:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fsothd7u2uqfDdCkGkAkjQgoOJdmtpqpuzNZM6y2rrY=; b=NGGQRnSze3pLaS1MW8FkOAFsNh
	QRxq19soNB5FkUVy/2Tro5/tpof0UyAW5R7e+qfwVlyUutnkqo+xBZgGW0CjoPWVZk5SriD3hoD8W
	cRSjMiCpaXqzVnaC6qBSqOIU33+PcS1DIHETv+zB4QQZ4xJoRrWOTwNTvz45QsDf5USeCy841QD7t
	cxYaftQg0+Du0yuIOrzrNp10t4GxqvrnUl2kdX7oKXpU5W3bCAtNa8Wh/V/ZauheRQ6t6Dak6O5M5
	peiHG+8xL9FlDVw1clKlOqPib/yK2XlCih/z6M+TDEH0vSD0s05Pa9nBnsnlDwzlAJOeIwjQFes8H
	HOK1xeTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjz3-00000006515-0H0S;
	Wed, 24 Apr 2024 21:16:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjz0-0000000650W-387Q
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 21:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ACBE61CAE;
	Wed, 24 Apr 2024 21:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326ADC113CD;
	Wed, 24 Apr 2024 21:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713993409;
	bh=csLxox6RscW+c6LkKg2RdajfWhoK7Y54fzPaNFEKYxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emCY6B6Y0owF0am56b0wjisC3Bj4AZHrs5iWTwj/S4iAEW5IS1i839JPmcRfdexfm
	 BFLTmCnjrzm66z27S2eCcl0mNXS6pMyWZyE1FBXJp3IXoZJhAgvs4s3+DTk/2zQBit
	 mRF13e8E5jKiYoICAyWRZnHkc6oY3L08YjCNerdqOn1gGAoc4JuR2XFQwMwfxWnOWi
	 gctRfTui+DmFdxbpfBo/jsk6vpyA6HrrdvsdoGjEsc5XuX9WjcHlsS21NP4lIxnT6K
	 O9h10pIcjK6Zi9dxccvhfbFH8uKZ0SslmbsIiP3c9EV83lxLZYNST5s49qINzddVya
	 47wSoiETgdG6A==
Date: Wed, 24 Apr 2024 22:16:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clock, reset: microchip: move all mpfs reset code to
 the reset subsystem
Message-ID: <20240424-gander-alibi-87f6e1896381@spud>
References: <20240424-strangle-sharpener-34755c5e6e3e@spud>
 <722f31da34e5e1cfef05fb966f6c8c96.sboyd@kernel.org>
 <20240424-glazing-handsaw-4c303fef4f7e@spud>
 <46c9baab4b3a834c27949b99668a9c30.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <46c9baab4b3a834c27949b99668a9c30.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_141650_891169_473CE4A9 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7624307687670134766=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7624307687670134766==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rbfJg0xHpBdUC0yM"
Content-Disposition: inline


--rbfJg0xHpBdUC0yM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 24, 2024 at 02:09:44PM -0700, Stephen Boyd wrote:

> Am I supposed to pick this patch up?

Eh, you'll probably save Claudiu a single patch PR if you do, there's
nothing in the clk-microchip queue at the moment & I wasn't going to ask
him to pick it up until you or Philipp were happy with it, given you two
were the ones that suggested the change.
I say go for it, unless you want me to respin for dev_get_platdata().

Thanks,
Conor.

--rbfJg0xHpBdUC0yM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZil2vQAKCRB4tDGHoIJi
0sAjAP0ao7UwNnwNRRlpKl3kZOBuF3y6vTA9c7kh1pzq6jU/lQEAnbYOT43YE2pW
eS+ibtJvV8+Qxx5zQpXBg2TQSx/BngA=
=Oa8E
-----END PGP SIGNATURE-----

--rbfJg0xHpBdUC0yM--


--===============7624307687670134766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7624307687670134766==--

