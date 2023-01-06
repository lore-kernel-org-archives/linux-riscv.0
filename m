Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B607C5479D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 23:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUAZ0RhgH+J06TBnV5mztTEFoTdcIW1WtvyvQ4+neK8=; b=lPrCK1yyV134M2mKVaM1/wILaa
	RaeI6mS8MRQFFYu5h8wPxhIeS52FQVxtAue9t4LKcTQq8wiJVlVm9Gupo+VTj5WObuPhlEM2JFqMF
	uUFhTVgCOm6ByIzFzzpCsGR88VQlw9c1bCWmzZE/79Y1oEezgmWPMcEZarSwhvREUhhzv1OYfHuYF
	V9zvTZPvA94LzXu8M53UnXJ1aYZPHn+dXcKjBFMz7cFSXJY5kg4tGx4evPETJUU3YSIdt4nItSEus
	Ph6X5av+/tE5tNgfPPDqF1XIQ2z0a2vDtgVu9CvzM7RyHmVJmrLwMgY9Rk5mKrFqClbINa6EfGMoo
	PZ4IRIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDwSV-00FjWW-E4; Fri, 06 Jan 2023 23:49:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDwSS-00FjVB-Gz
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 23:49:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7C238B81CDC;
	Fri,  6 Jan 2023 23:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE83C433D2;
	Fri,  6 Jan 2023 23:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673048945;
	bh=Kzq2tlfGPQr0fgmnls2K0N6TO37vkS9PveZIdQUSA5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvBZEnjTKvt1+MQ/2U0lSDzK9fveRIQcTWkCZdUNJ/bEaOJp9jYeyBqIGkBDhuBaQ
	 lT0/Z4D/eycBC24N7aLjvfTkpWGClQ4hbxSf326i/rPJF3Eym920csAswsMipvzMre
	 dLBVbvA+ZO8fKKUGNoNqdYuopDTWBLkjdyk5vOBIHS3u/f42APyq69UxcGdZJB00OS
	 PGRh1vljtO6oZofqky7mydSqbyzuZOFxNOmzGXo1hFg4juMLRXYsgCivC4bw1JW86H
	 VzsEHdr2aJt1spcmTsCu08V4eGZgFDPHwYIWhwYxOZMl2ioQk936m0KFkTz7nKKydb
	 qpyC9BOmbfS4w==
Date: Fri, 6 Jan 2023 23:49:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 6/6] soc: renesas: Kconfig: Select the required
 configs for RZ/Five SoC
Message-ID: <Y7izbPKsN+wn5h+H@spud>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230106185526.260163-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_154908_725743_94902F5B 
X-CRM114-Status: UNSURE (   7.72  )
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
Content-Type: multipart/mixed; boundary="===============6366349132159847970=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6366349132159847970==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v1LPmyRPbeBSxE7s"
Content-Disposition: inline


--v1LPmyRPbeBSxE7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

FWIW:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--v1LPmyRPbeBSxE7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7izbAAKCRB4tDGHoIJi
0klAAP97oktxsaN4kInuxSaUJvtvvXt/XZX7Qmi6ZoSD7PODwgEAsiM+60J9pPE0
OrQO3VB6rJXbxSaCq1Q5Doo9Iky/0AU=
=2Hi1
-----END PGP SIGNATURE-----

--v1LPmyRPbeBSxE7s--


--===============6366349132159847970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6366349132159847970==--

