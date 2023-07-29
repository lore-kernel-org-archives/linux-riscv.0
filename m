Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB9CC001E0
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 10:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOL4iGL1a4NRaNXJ1maR6RInHPLmJPLmIyQWnD58ABA=; b=P1SRIwRYxHRT9f9TZtkdUNSe1q
	SnqqmZ6lYTb4ZyizqEC/qViZU4TVqoZtioAsqv8YyG/DyVubI1o4L2HHyidFfccdSynt/0ihUnJCS
	X7XJxmOEsjYVYZx9ary+dvDnAyjDSYahy+p5jTF6/2in2Y4A8UxE1zH2zxlo06+8TLDtMfikW+MBi
	Gw/psHPB6oMq6318UCOQVxMkwkCJ5msRwhtzUgIrimJInGLoeDheatfsvxry6sSrBvl79NifKfPuB
	DxnaZ70aJFd2di/cTXqx9nxLx0+xLx22ZPZuc9iLGJl1n0jshcrkpEZBK7CXBFy776kXYOY5NcogA
	iFEhUO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPh5Q-0073Zy-2v;
	Sat, 29 Jul 2023 10:22:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPh5N-0073Z8-2H
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jul 2023 10:22:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D918660B75;
	Sat, 29 Jul 2023 10:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17586C433C8;
	Sat, 29 Jul 2023 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690626128;
	bh=tuPIbqBr52wBKVdl98uVAm315Bxepe8VF8Jh0dVoqb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwhY0I23bb0OBrElDNY7q4V16m1Dk1fvyOEhfxoyucmPHcRYYvQoy355fEf6vkp1y
	 SWlM2CawNSmu6LVeyHstxjcTpVkPZaeUEIeXDKlbfldqSolDua8y27o/K6Iex4n5pS
	 nqQsNPzpoXm+rk1SOIWCEb1S+oo5x3ZBUk1U2bmmHoGkjY1FQ2jKlqyVQD+D++4dZD
	 Rz996sqdPI0BacfTb8eEj6IAAkJNaVRbTrFERGp4R+NyQQPR0iAyEfyDZaLopEeyv8
	 bCtqVflq8SMtKWagzi+7RXmP7DuKmx19c6s5+bsnysXpu0UhIBKY1ARmUDiAEj591q
	 Ho7YZGgfaTYcg==
Date: Sat, 29 Jul 2023 11:22:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] watchdog: Enable COMPILE_TEST for more drivers
Message-ID: <20230729-twerp-avert-70577ff7d952@spud>
References: <20230728195022.1198555-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230728195022.1198555-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_032209_803827_281F7762 
X-CRM114-Status: UNSURE (   9.23  )
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
Content-Type: multipart/mixed; boundary="===============3359793051621497771=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3359793051621497771==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="niFHKtW+E1+3Tf0J"
Content-Disposition: inline


--niFHKtW+E1+3Tf0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 01:50:21PM -0600, Rob Herring wrote:
> There's quite a few watchdog drivers which are easily enabled for
> COMPILE_TEST, so let's enable them.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Passed allyesconfig builds on arm, arm64, x86, riscv, powerpc, sparc

Doing its job I suppose, the riscv patchwork automation stuff has
spotted one new complaint for allmodconfig:
stm32_iwdg.c:77:19: warning: unused function 'reg_read' [-Wunused-function]


--niFHKtW+E1+3Tf0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMToSwAKCRB4tDGHoIJi
0hUuAQDTDOhDkjqpoQL8kgJdY0n07+K7LrUs4Nbwjsrj8p+LOQEA3agQW/XkUhV+
5EP8xSOUmR8kGeU3oQXbtv0VPb0kkgM=
=hMX2
-----END PGP SIGNATURE-----

--niFHKtW+E1+3Tf0J--


--===============3359793051621497771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3359793051621497771==--

