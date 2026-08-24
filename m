Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358AEC5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpmzz3fFaUl4b3VuwMIBqZI0twG+Ac2Y/Tr9h/S0viE=; b=UCU6cOcnjrDYUT81YffqAXx9Vr
	pQP7RY8yMz0650oCzU8R5nr6+YQAr4KSl42xzz98H8AhrWIP4ONeiLULwUq/zmPEKaLngaKp/5LCD
	AY14q4mdc/Fd8qmbNnlfjXD90kaMOlH4xi4rhWQwkwKaPBN/jo1aTnKCQu7UCFRPJ6nus2M4OtgHM
	Rn/LCFFghbCCOQ3NscsvFaGoyvBtitRQYMocTSlBa3Gmj8p9hl7KYLPMvOmp4u8nmA3ffbsgTsVwE
	tWfYgN1oLD3ICPhk0YAAXC+7aySzYhm5BXWRvQZZpkjZhfZxEgcd9W+Q4yehTE7ffBjm9fw0eN4AX
	Lh8skdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY6C-0000000H74d-2eD8;
	Mon, 24 Aug 2026 17:04:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY69-0000000H731-3L33
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:04:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F8936013A;
	Mon, 24 Aug 2026 17:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A1F1F000E9;
	Mon, 24 Aug 2026 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591077;
	bh=eOctFNVYXBRARRaVpu4TxCSxy1tNvkqzQ5/ke/gDYtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jWTQudvWK66CYNUzMgjH7VHhX2MsEGzxuubvd4Mm0rGtkMt1E9I+giFyCvSETW2A2
	 AjFCZOTNs/PZt1R3ZLSxKZXkg8bSBCVwDKKeHY+Rw0olkhQdBeIALPIKfXMOQ0njaG
	 QYSqGNaiYNI5OeZOzvJEpOBX2MoRxhvSz++/tLAZ0JojPisBZxsFkqbFLjH2PKNDtM
	 Q1uS2fTogpSwVnWrC7kZaPXhPMdL0/cpQLNbNwYP6bVxj7r9wxSjYqLQyz4czvP+wz
	 JQmtd4nueFDaaBiIxkitejemCLs5GuUA1LwNvpc39r+RTBXPL9dQqZTo+Gou4J31wt
	 fY58JwTs5njHQ==
Date: Mon, 24 Aug 2026 18:04:28 +0100
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
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add UltraRISC DP1000 board
 compatibles
Message-ID: <20260824-jot-sasquatch-afd27ab7a971@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-4-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-4-61ab7aebe9e5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============8049796106380494289=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8049796106380494289==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BoJl5+mnOUJj8iig"
Content-Disposition: inline

--BoJl5+mnOUJj8iig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--BoJl5+mnOUJj8iig
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox5nAAKCRB4tDGHoIJi
0uZvAP4rzlPBiKn2gNnekoclojDzRT+Vapurk8Q83Eag38mGYQEA1uZjGdEAjsD6
jJXWn0LR/bXUSX0xrmxgHUXKH5TgVgw=
=3wea
-----END PGP SIGNATURE-----

--BoJl5+mnOUJj8iig--


--===============8049796106380494289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8049796106380494289==--

