Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA4C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouMOa9N2P5H3L9pz+FQDUfMV6hfKIsrV1xcLpkOP+uM=; b=GkAJTzOETKOAiCXHJ3ASn/MQuV
	13Xx3IRY2iybtF9516ntx4b9NFYaH+SBu0cuMTmDjkjPbY12zot0ObQcaEiC1sDH3lLX7hwAtYjOI
	vBLnkZqyoEigcM8Ny3M+nGWyF7tiR2qwBPZvRidSqpov1qyZMrGuPAgPlC5icVGQlqKYb7D7VFiIJ
	k2lSDTT0lsxcKLneqXOKoykazN0TWgnkmH31OOC9s+fV6jHuCbdF/A4YwEiZzE291iZVUYH4ZOjkr
	GDSb3qzCdfCju2WjQ6FjUwXgjrr8yXcWZd9qwD+8Q+HYJRCrgOKHajJTpwLhynTW1WuqzJCJCi5eQ
	KKTZaqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5Iz-0000000G8dv-2qWM;
	Wed, 17 Apr 2024 13:26:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5Iw-0000000G8aP-13cW
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 13:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DEE48CE12FE;
	Wed, 17 Apr 2024 13:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C13C072AA;
	Wed, 17 Apr 2024 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713360383;
	bh=w8uH1uC90pKNqDMwT9Mn9CCiXOobtxADD5T7dibtAsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZSCN7u6SkYaxUSJzCB/i4EK5A/1Gjo7xq3b6Prtto8XIhB1uz2NQs6t1pUZxSwYI
	 E+nyJf0R0MUkCn5lwop+V/XLzOGqG0Mlct4X/eitypu864zXq4uzy8/02Fp98alg0v
	 WwrmrOpK3wG/uc073F3xo7pDx+MN79xxwYDyvL4EhSiP2pBseJA/MHr/BGG46Pb3A4
	 rDVhOCnPyIhY95gcJF7+vytWw4s36/pKCYOSVFlRTWqXiQUxnCeleIsh6SEJrQCzec
	 bXptlvEQCIhcTS6v7wMZU0wgXKzyE4YmSPV/RtQ2dpdH+sNW3/gqwqOhFR2/A25Wet
	 k/6VAs6aW3lwQ==
Date: Wed, 17 Apr 2024 14:26:19 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-clk@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clock, reset: microchip: move all mpfs reset code to
 the reset subsystem
Message-ID: <20240417-unsaid-pried-782d191d5d3b@spud>
References: <20240415-democracy-risk-419b0250a432@spud>
MIME-Version: 1.0
In-Reply-To: <20240415-democracy-risk-419b0250a432@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_062626_535974_2696D251 
X-CRM114-Status: GOOD (  10.61  )
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
Content-Type: multipart/mixed; boundary="===============1235920875937101055=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1235920875937101055==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MMbT+sOwNjC5Vmgx"
Content-Disposition: inline


--MMbT+sOwNjC5Vmgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 11:04:57AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Stephen and Philipp, while reviewing patches, said that all of the aux
> device creation and the register read/write code could be moved to the
> reset subsystem, leaving the clock driver with no implementations of
> reset_* functions at all. Move them.
>=20
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

There's a couple checkpatch issues that got in without me noticing. I'll
send out another version with them sorted tomorrow.

--MMbT+sOwNjC5Vmgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh/N+wAKCRB4tDGHoIJi
0kDRAP0Q+hA60Sezil6YNcjZRMNQOLImQFaXe+C0NyznIyQhbAD6AqrQm9N3mcxO
qWQgDrSG3K4RRNh6JXFotQj5m53h5gc=
=mcgc
-----END PGP SIGNATURE-----

--MMbT+sOwNjC5Vmgx--


--===============1235920875937101055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1235920875937101055==--

