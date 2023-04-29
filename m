Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BA0C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tC3Pr3Af8KzrV2MULNv4afl1HwsSzzLatUrw3Timf48=; b=s/opZUnGNaXqPgzvVD7sSzcasm
	wXBeZ/YI5zbVfA1OTZ0edEz9kbiNM7j4kgDoblxmzOJQyLco6U7pDj0a4FgGxf/E0bLGZYauIcIhB
	xyU+TDWCU5+zdWlLbhsbx5KHGQdz/zLqVm4Ocl3yvlUNruymDt1DpV9VE58n4ynfe1CZ4givZ4t0L
	przCwDjjylafkGichU3xD1Bz60D0+B8baLyOt3PE64L7ol4XIXBvTdnwPstUyIzk+PAJAo07EBgfc
	2Ok75W/A/6uQVbaOgz9+pqcoc+fza0qOElb3XJ2fcg2h6v5NhExjKH+NlDX10KDd9G6c7oyfmk9jw
	K3dAslGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pskpn-00CmBR-2g;
	Sat, 29 Apr 2023 13:41:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pskpl-00CmB7-07
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 13:41:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9626360BCB;
	Sat, 29 Apr 2023 13:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C77CC433D2;
	Sat, 29 Apr 2023 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682775712;
	bh=EXu6FfEAE8w0PeZ/4bIC/qJzukeBN06i+Cd+ygsFoqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c30rjtUgt1NrwSzSXSWctYjLb2j5JHIiGd5E0eWyb6hksFSL6bBo5QnCiQOksxk8k
	 aZrw352o6KVb1OzzB3NLCD45JsbH4Tb6LgowvO4s9H7RoONDXtcw4H9CZiXK/UbVjR
	 WruvpqPxIrxMIzBTUKDs+uJr1UvI+Rz9h17R+ejsZlO7GvggkqAo9yh+VDLPIL2cp5
	 zjvRLGr5QLJiFyy1ubiTGgSbksfPyQqv4qzeT85tFpG2mFYs5J/1KFsd4o9oWSLp+a
	 DiWx67143PHVTCm4I/CdR1nwn8/pL0A9ejEJ0+9IhQ8J8eztq3z/i3dKl8ZEUQnxTo
	 MpmF2jxf58FTg==
Date: Sat, 29 Apr 2023 14:41:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 1/3] RISC-V: Add Zba extension probing
Message-ID: <20230429-frostbite-sterile-21f9b67f7ecc@spud>
References: <20230428190609.3239486-1-evan@rivosinc.com>
 <20230428190609.3239486-2-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230428190609.3239486-2-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_064153_114762_85948D8B 
X-CRM114-Status: UNSURE (   7.65  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============6006956486270720649=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6006956486270720649==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LbDMCsnXWTZfnITt"
Content-Disposition: inline


--LbDMCsnXWTZfnITt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--LbDMCsnXWTZfnITt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE0emgAKCRB4tDGHoIJi
0pL0AP9Xx0RXAm2fso8MPqZC97jTiyA3uEEnwhTbKDD0ndBw4QEA2KNAE8eXCDgI
4+uDnjD5UMm0/2IE2eIGCIBOru/o1gs=
=coJn
-----END PGP SIGNATURE-----

--LbDMCsnXWTZfnITt--


--===============6006956486270720649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6006956486270720649==--

