Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25E9C79F99
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwSZtLIeWTgkLaAQZGNs6DkiI3Cvw8w+hJ8jp8S+sRA=; b=aC5/V28RZfF49z315keVoUmXJn
	p1TsnfNa+ydtxIuqfy4RvKILips9avDSfXC0r5d27qTYj//1yEQAZz6Pmta1OdI34t5qqKAjoshsT
	WpBpzzvGhdt/d3P5TdjbzZLNb3IfYs5s5R8USKesTKMxdFog4dWe0o8zIz02YnIVA18fkFgZwdyk1
	FPvYfT61hP5CJu+gu0g2O/ErXUUwWL4/lkuk3p7PWc1HazEnP8msfflA2ZcasjsNUyF9hVW7NwdVN
	jgK+yWWkXwFdbr8zZk5/0UaJU8TjCM256nUK7uY3CUqz529RLrk8+R6DB258p6x1kPAoSx4tmbHac
	EfJl/ZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dYy-00000007WtA-2Xgg;
	Mon, 07 Sep 2026 17:55:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dYx-00000007Wt2-3Lao
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 17:55:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DCBB4368C;
	Mon,  7 Sep 2026 17:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4B81F00A3A;
	Mon,  7 Sep 2026 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788803723;
	bh=huMcG0o28dujEbJ1tdSTmTg5VDxN0/FcYXM4+rca4bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZKN64uk/wYAGT3JfcBa2PdhXCIOwnK41pd3f/LAbGxWnlfeRslZ1S8QdkDhJ0mUvQ
	 mpSZWZImQIzqrXqeljoowxH1GDarEA0fF829GriJIanqFGbKnTbIhHgKRZNjKKlV/F
	 R8LoaL5SHQ0jTnXNRAh0KEZlIaQtO4WCG0zS8zu70x0pWNLkpw3FFLNGEcINXVL7DJ
	 KHgI/ortFfwR6Gm/SL9hCxGvpqCihQEbc9twboTTMqLBp1dew4t0izCnW+EmtR0BJ+
	 HHVHVai1HnGyMRwJS5U27443ilcUjDYTha3cPKSM8WG1Be5qnVD/bMMnRg9EJd273M
	 vr+fLcu75+22w==
Date: Mon, 7 Sep 2026 18:55:16 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 05/10] spi: dt-bindings: snps,dw-apb-ssi: Add
 compatible for UltraRISC DP1000 SoC
Message-ID: <20260907-swarm-tipped-1ced3b29aeb0@spud>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
 <20260907-ultrarisc-dts-v2-5-5eb4c97477c5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260907-ultrarisc-dts-v2-5-5eb4c97477c5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============4913586251706148043=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4913586251706148043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DXYn/o3Hfo5bTITl"
Content-Disposition: inline

--DXYn/o3Hfo5bTITl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DXYn/o3Hfo5bTITl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap76hAAKCRB4tDGHoIJi
0kfBAPoC5wZaISLp5Yx3SsPADTEU9Xy/OV/PXUZM7irbbrji+AEAsd6cByxKmMur
XzjS9K+pTyv/kLxw1tytrxzGV+7Wiwc=
=LNh0
-----END PGP SIGNATURE-----

--DXYn/o3Hfo5bTITl--


--===============4913586251706148043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4913586251706148043==--

