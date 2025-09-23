Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE11ECAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAmv+bTWwQFwSk6XXe5Is9+BJTUCsoVWaih85mANlYo=; b=GMhH0DaSBrkn/xWwypQKfNVltx
	ReOMsvIOBCBG9PjXCv64n1nGoE/EfUoB54nkCwEtFXJHEtj4XWwhwsVW6h3BA4H5Z9u2v2zfBaPbS
	4ibeBCYC3FG4ra9s7snR5h8DxK73+gXJGZ37HzKyx5IiUoHAlqju7vAKGJqp/BkWd6m1P08E4cIDf
	oiz72/ss+UbIO4goP+Twus+ldtDlE3chXuSJE9+lmPy5HFNyJWcvJnUAGoeIf4OBsR7AJ9fXjLwq4
	gYJg912Ssyyzsi2bvfFOBxHtCrSDZMmbakkIuB4JkTb/MIhhUxCnyGSC8Ps5SpeF+vRJemuEzMcKE
	BCcW6INQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18OC-0000000EdQx-2H02;
	Tue, 23 Sep 2025 19:09:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18OB-0000000EdQJ-1SnB
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:09:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7B1060258;
	Tue, 23 Sep 2025 19:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE91FC4CEF5;
	Tue, 23 Sep 2025 19:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654562;
	bh=7LS8gjNHsPEMZPMGHBYnZ5awE0YIkS+TnTm8xVhKxJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6KwAStQTZXF8JqqjgWhhau6i3uU5x4b1VW2Cz/5I/4vTOKvyJuamq0QLBRDzDyLy
	 xX57VP0hiq5pgzwudrA3tZDEBolW+niULpK3JKAnXV7+HaUGUvZfnIelCu+UpQmyz8
	 ZwNNH/zWRuKyLWrGOnePn6SXs+Qe/bBWcEr/Gp+XL7nSy7kOIPZV8D7zh7eyNsljF9
	 l62IknpQNLJTF1Jnl9cQMVGfljwIfwRZRq9t7tGMcZp2NwsOj5Li/ojII4cwd+a23L
	 Fm2N+j9iN3qjp3HJQlQcJMmi9NjIWEIL6X/ACNPiBp9/JdbuNn/M4Af1MvBycpEom0
	 7soy6ZKRhac6Q==
Date: Tue, 23 Sep 2025 20:09:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 11/11] MAINTAINERS: Setup support for Anlogic DR1V90
 SoC tree
Message-ID: <20250923-proofs-crumpet-2951df149529@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250922-dr1v90-basic-dt-v2-11-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-basic-dt-v2-11-64d28500cb37@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============4654595141890568053=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4654595141890568053==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QIhgSGAC/a8UPzR0"
Content-Disposition: inline


--QIhgSGAC/a8UPzR0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--QIhgSGAC/a8UPzR0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLwXAAKCRB4tDGHoIJi
0v8UAP95rgfYb/Q3MF8e0/ovh3F8y3LdFGV9FElTCwnkZg96+AEA818LkOuzpSVR
gbkzL4Q4bnvLwFFOiYyCvUVymLzeyAM=
=ZfIE
-----END PGP SIGNATURE-----

--QIhgSGAC/a8UPzR0--


--===============4654595141890568053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4654595141890568053==--

