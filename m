Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33AACCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 18:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtQ/8axhFazqzCBcN9nVoJk/1kLSFI93GVM3x+bYmiA=; b=MVm5b5BnSM1Px8jJomCndfpfRL
	TmPPohggXnpoOBv3jeBGEN1V5z8FXt0t5hP9km0M31IMb1Lrh7Fb65ndJc7Mcq7wdG1qWy6W+dLLR
	i7CLV5UBDsDj0VmrO6fIrqVYxoeqf22CQ3Z/2PxgXwOtqMFz0ootYTWv2FPutAk2P105OG+4b8ego
	9XXAQL0spTgyG/hFtK14NzHtMQtD1dVYOwLmaSBCWLnj7Yb+XIQXierevEvaxvlTwnC8AFgqheGFy
	gOc8KgdZV5OawuGwwGX8/OY421FdkpCMsk2ZtKj6KVG6a8Dkw/jNAKhDfJL1qrVL17wavCaDrnnkX
	uevKmg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fIt-00000005zQE-2QQS;
	Tue, 30 Sep 2025 18:42:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fIq-00000005zPl-3weC
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 18:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB2DF40121;
	Tue, 30 Sep 2025 18:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19C4C4CEF0;
	Tue, 30 Sep 2025 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759257739;
	bh=AwClXOYIL3t1a+GcEAIFfJ5ozI19kjStSruDq1e6QzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3lbHwOiw/l6OtXSoVCd+MvPx2z/KJMMGsJmHIKetnAmrqrMnasM533hO/fTvkhzh
	 2pHQ5mWEKXvHA/8TcefUyGMS0IYrHQ7bgz1bsX67XgJMp1+Q45TKVV7m3tJ+iYYEar
	 cyqryGRRswWMzAL/Vdtyqis67qPoAmtG1J4YT3sEaMqKuqNVGyb2c/qzsrJ7ILOBxG
	 gKUbHTJy597H7jlVEyGhgZHI6nm1FKWxbj/JZKxocuIDV+RlrPP2mA28t+urgGbLIp
	 drpoe/dmDNZFZ1lNwJgRKwb9+BSidxSheYblUlNRSvGA2NsTZRte1lq6uSrysWNO4U
	 LcLBlBedLWiiQ==
Date: Tue, 30 Sep 2025 19:42:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>, Yao Zi <ziyao@disroot.org>,
	E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: starfive: add Orange Pi RV
 board compatible
Message-ID: <20250930-sloped-recluse-41f839700f8c@spud>
References: <20250930100318.2131968-1-uwu@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <20250930100318.2131968-1-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_114220_993849_9269CF40 
X-CRM114-Status: UNSURE (   6.50  )
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
Content-Type: multipart/mixed; boundary="===============8507392849209169531=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8507392849209169531==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+R1FBGQkGC0sH56x"
Content-Disposition: inline


--+R1FBGQkGC0sH56x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+R1FBGQkGC0sH56x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwkhgAKCRB4tDGHoIJi
0loyAQDpGBt5M5Bt9rdbp4ZweJ7+EI45IWFhPPwUfdR6Q9NnnQEAx5F8PPjO9K8X
I4bstGW4wkTMmwE0NHStZJHEMbSwXwQ=
=daU6
-----END PGP SIGNATURE-----

--+R1FBGQkGC0sH56x--


--===============8507392849209169531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8507392849209169531==--

