Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F3C4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UO5t+su4xN1sOoq8v3ek5awVQmy2meJ7AyvIx59MaR0=; b=IvCClR1N9NXINvYxhV3CZrimwY
	GHJrtYh3eNOusJwSBGSVBqIe1XpDGlOaaLsdY0+ze/PyT5Adfd43ORZESk/RDWUoSNMvB2pzFpfab
	suejBqaDjUToW9RalpoRQYTIgFrRY+cyVDpSlDLOWYAx2AlWHUJcIF2oxnvm+bPins4vFYthn3tWY
	/xo9VlgsM8/vlHuzcJl+7AHp7SkTnn89c39q/o54Fu4aVoKxI8hknxKekIeBmbrdjO4y4enlZsKo9
	xnTl2wSsNvJgf0k7C49cg41NB0pgXX6WW1dR0W5mLmn82XtkA1jwE1msCEtUrbC2883irAn0fkbN5
	2W2vE/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rabZR-0000000GLtQ-2aqv;
	Thu, 15 Feb 2024 13:14:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rabZO-0000000GLsW-2hp4
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 13:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D815C61D96;
	Thu, 15 Feb 2024 13:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529DDC43394;
	Thu, 15 Feb 2024 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708002869;
	bh=aUWWrfsL8ZnO6US7lu0C+z2+ofPyZmFmbK5Cal70MlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYnpbPv0Jd/r16AM8nCmg/DMjAtayMYZjHFhTD2Q+754ZN2ljgeV1VDZG3MGZeTX8
	 +ZirYFi1DQaCj00GVwT/fEqDdY9bligPiF0Gj8VJIGxLn7eId+e9KKU2qd9+7CfCqI
	 lSybdqQjUIlDAAKKIZGNx15OiJzYYsnBc6AUOYez/sBBhYZDDU2/WV0cS/qmGwOl+Y
	 4lbv5JjayxylxdjSgbt0nJQ/n8YO8zHxATiMcYlKvFvDe4It03omd7MCz+u5ZduP0C
	 /ssjt8R++j2ddB+AwJyD8A3LmDprJkNmZ7EHq2hZJZBJnGokPsWhn0xXHe91BOzOJC
	 swfgXOdnpsbgA==
Date: Thu, 15 Feb 2024 13:14:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>
Subject: Re: [PATCH -fixes v2 2/4] dt-bindings: riscv: Add ratified
 privileged ISA versions
Message-ID: <20240215-icy-oblong-67adb68a4074@spud>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-3-samuel.holland@sifive.com>
 <20240213-88c9d65fd2b6465fc4793f56@orel>
MIME-Version: 1.0
In-Reply-To: <20240213-88c9d65fd2b6465fc4793f56@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_051430_754765_AD82CAE7 
X-CRM114-Status: GOOD (  11.78  )
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
Content-Type: multipart/mixed; boundary="===============2656336477929048408=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2656336477929048408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ty9sdf64Wa8pEu18"
Content-Disposition: inline


--Ty9sdf64Wa8pEu18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 13, 2024 at 03:25:44PM +0100, Andrew Jones wrote:
> On Mon, Feb 12, 2024 at 07:37:33PM -0800, Samuel Holland wrote:

> Note, QEMU doesn't add these extensions to the ISA string yet, but I think
> it should start, particularly the profile CPU types which should ensure
> all the profile's mandatory extensions are added to the ISA string in
> order to avoid any confusion.

Something to note about these "mandatory extensions" that are names for
things we already assumed were present - they're utterly useless and any
DT property should note their absence, not presence, in order to be of any
use. Anything parsing a DT cannot see "svbare" and gain any new
information, since the lack of it could be something that predates the
definition of "svbare" or something without "svbare".

Shit, but that's exactly why I deprecated riscv,isa.

Cheers,
Conor.

--Ty9sdf64Wa8pEu18
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc4OMQAKCRB4tDGHoIJi
0gBfAQDHitJRjjkm8BAASaylKf3zcVB6vWarMERcGPovak8WmQD/dIaz8rDrvtlD
sOoKf0i7vy+Ub2viaSLzs3SD3hV4Two=
=dUI9
-----END PGP SIGNATURE-----

--Ty9sdf64Wa8pEu18--


--===============2656336477929048408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2656336477929048408==--

