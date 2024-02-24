Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BCFC5478C
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Feb 2024 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRBuJacdm1pAIotaXgVz7HGYboWI4IeSXMFjbBOV8UY=; b=hnGB8K9zOH7oVMHuQDFhlg5TCc
	FLu8/qLwDrMpQ1HaHt94bhvlIn8GlMd//3r9cKwj17g1TMEClqs+hKoXJNxxM4VrR7MKflDcJs/4m
	tdJtx9rl/J1pjE3B+KTpvfDKc0Rza1JpQba5cOOVetC03czaUR5ARxZ5H8qNsgBcncwi5hpCHrpUQ
	XoSyFd5A5CtI/+vU+Arb0n6m2F9s/y6HxZQabyXAftz6hRusC/7BXk1Er7tr+hxvqlizTJROXkw6k
	CXgTbj1VxK89exSBqEeAVT+2QgUH80xww8KI5OhZZW7WXowMB5qJCXWPnyb2o1yBzZVsXAsg8xMdk
	Qga3u+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdxZi-0000000DUbW-00dA;
	Sat, 24 Feb 2024 19:20:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdxZf-0000000DUb5-47Wc
	for linux-riscv@lists.infradead.org;
	Sat, 24 Feb 2024 19:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E81CE60B93;
	Sat, 24 Feb 2024 19:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DB1C433C7;
	Sat, 24 Feb 2024 19:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708802436;
	bh=WCpuxvpHdc+sHl7FJrxaAQVhwIuaoeB4DsjQcbC1SdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKfy/F+8pDe2O0ayhIaMbRw0fDwN9SlFrnRzUbh2JiiUwcCca2kO8MPCX7Hl757oD
	 RGOSmhkKu6tp2VNFKyBK4xeDpOUCEt9N8xv+zazgGLUT4/MgkVXSg2YZGGSyUXnx6X
	 mvuwMv+omkiHjGgt2arauE7k4RyrbKkewY3oCQPu0Mhot1KowwQpkbTMPMXZ01DRcM
	 O290Yf+7sA5i/h2BGZpnz+v+2m+OjJw/H8UQCtuVnqWh9mSkmWGNZ8gKy9CQY5lxRp
	 xoOj3YvAGi0GbbdXedDRttC0ROcs4Xs5PDlVSBwRmmIpxZYqJnvc7GML+Y9LfyC02b
	 7CaDDfe3v00DA==
Date: Sat, 24 Feb 2024 19:20:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Alex Soo <yuklin.soo@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v2 1/6] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Message-ID: <20240224-smudgy-eldercare-d5d8640d9961@spud>
References: <20240220064246.467216-1-yuklin.soo@starfivetech.com>
 <20240220064246.467216-2-yuklin.soo@starfivetech.com>
 <1a11cee2-2ef1-4ce0-8cc1-63c6cc97863f@linaro.org>
 <20240220-bottling-reverence-e0ee08f48ccc@spud>
 <cafccf8d-b8f7-44cb-bc41-3c7a908fd1e4@linaro.org>
 <20240223002443.GA3877354-robh@kernel.org>
 <caea26e2-6598-4796-b199-4ee5b1b9cd30@linaro.org>
MIME-Version: 1.0
In-Reply-To: <caea26e2-6598-4796-b199-4ee5b1b9cd30@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_112040_110103_E839C9A0 
X-CRM114-Status: GOOD (  10.41  )
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
Content-Type: multipart/mixed; boundary="===============0833478929122370247=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0833478929122370247==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4X+rCrj80xZryIi8"
Content-Disposition: inline


--4X+rCrj80xZryIi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 09:46:53AM +0100, Krzysztof Kozlowski wrote:
> > I would like a solution though. The only idea I have is passing=20
> > SystemReady cert, but that's an Arm thing.

I don't know jack about SystemReady - I had it in my head that it was a
system level certification. I am wondering how you think that
SystemReady certification would apply to a whole binding (I can see it
being a per-compatible thing, but that would be a mess I am sure).

--4X+rCrj80xZryIi8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdpBfgAKCRB4tDGHoIJi
0tshAQD22weCRiyyz1UYMsSBhqsXWD+BLcY177azkS6FHp3EngD5AXLAtkUf/BSe
yPwvAzi01dGGRR6R9okzKdRy4Ln10QQ=
=6nkj
-----END PGP SIGNATURE-----

--4X+rCrj80xZryIi8--


--===============0833478929122370247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0833478929122370247==--

