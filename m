Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4866C5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3WAq8wUlY9vTtZnfXzlsthmK5NHQSaKsfVvYbVCZuo=; b=dmBFpM9EjhlZ92FJu5ofzBhyKA
	kzCEYlX4GX0T7sosZckAv6YfrZ++Eq1KW9iYMv33pdJ/+++QGVByBS4u5PQcJxegHpDPdJvslt4t0
	jiwZHWWaCE46CIYot9NHF7WfG6LfIZNJLQXa2pF11lBysIV0SNG7Ao/AjYiepZf0Fttlr8kDxAItg
	cs2qykqynelohL51eBX1y5ibOSYA6gcPRzaD3gPjuKo9qhX9IVvQ4v9ueNT2nytvhK4jjozPtVQyj
	l9gC/Xg5SY7/mFbFZDpjCv5A9ligZxWQna8vOrHmYKING7uP4dWjydgVMaxnBxji9UGTI7avruVdi
	oKZ2YpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY8j-0000000H7b9-1ndv;
	Mon, 24 Aug 2026 17:07:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY8h-0000000H7aa-1ieo
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:07:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BBC5409E5;
	Mon, 24 Aug 2026 17:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC361F000E9;
	Mon, 24 Aug 2026 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591235;
	bh=MMXLxj6l9m9aVfmKoNsruLV9NIaNZdeX3U02TYk7stM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TT47BvnyiuYe1DkXIwhnimIyDLJVmVloCdmFb94HUpIuAhnzflwBIWQWdSXfcVETd
	 UNSevj+ciCNoLKZL0GSSAMPQLZ2dTbmKuIQm5OsEAgewDqD+c+yJWYfAK/ZIiNnhc4
	 TFTXJi7wWVgBkmW3vLTa2QBr1Xk+496IkleGVYMrjWm8rj7hIYTTOOd7DRN5IgWzBq
	 S70DzEmw8kP9CrX07u99G6GEdWqdLGLDYYbb8TcKjxC1EBrlckDFmflGiT69/h20HG
	 vPwJnyuikWywcmDFWf8yR050jNuEf5Kw9CR5WNrjcPTTeB4BrBpmrhSnKK4S43FAgM
	 FZJaSlr6AdY1Q==
Date: Mon, 24 Aug 2026 18:07:07 +0100
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 06/12] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for UltraRISC DP1000 SoC
Message-ID: <20260824-paycheck-luridness-6de48a00a262@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-6-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-6-61ab7aebe9e5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============2851408939029345069=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2851408939029345069==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MTTZHrZBlz9/orUf"
Content-Disposition: inline

--MTTZHrZBlz9/orUf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--MTTZHrZBlz9/orUf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox6OgAKCRB4tDGHoIJi
0nCpAQDM2nG7nEb5NpeKUA33Zz4XAoDHlfujQ1cvl1x6OZ51uwD+Jyb97LwqJX3y
yuJJv9nbbHMTj2TvxKz/ix14mM6+dws=
=LDwq
-----END PGP SIGNATURE-----

--MTTZHrZBlz9/orUf--


--===============2851408939029345069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2851408939029345069==--

