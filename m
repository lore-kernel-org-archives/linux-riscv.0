Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AB9C79F9F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxhCfqFQSucR6CFhKCViXOK6q4AUylHKWLWu00UH5fU=; b=GXNLOWmStZy5PhVs9NdYuJGshw
	rZAKUCi/3/NjM1tUsWsI0Ol6jm8AtOwaxjTPXuiRksWqMWX1h8za4m/O5EQ9oIvpnnhxjlV5Oknfg
	/XHHXAt9EJ4FR96TzHBlZDM4fVwoPR2ywL9aQxrqxEnRs72LS38df83k7Gck2S7GtAOF5u8k/rWY3
	sXthIT2IlXmQ2aldzXuuIOakBpzAirIAvWrHHuJhZEUxwhqNTY1HcP5z2b0KEb2yS7OytWsVxUtYl
	iuFGcbnn1Z3kQT5zRXdVSSkVrrxA27Au50QlTMmP7wVXkXvOfrGpFZC6icjYdG/higMFD+nCwbVcc
	Fgsb32Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dYN-00000007Wma-1rkL;
	Mon, 07 Sep 2026 17:54:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dYM-00000007WmT-0n9q
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 17:54:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7072D437F1;
	Mon,  7 Sep 2026 17:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7681F00A3A;
	Mon,  7 Sep 2026 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788803685;
	bh=XyfbZA/ixpBmVjCPJ8nTfD+CjCeqlsu/hxKTUnWjh1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nyzjDXf1cIJSFEAtxTeSGXW4kGWoZRgawPAMk57DTnopUjTzTFBinHkRWSRa6HMvV
	 peo0k8Wct51By4/qlpVbl4sPMbzeIMG28c1NvhZebzbC/2njmk5P1IKo8wZoT4VDSC
	 x4LbcJMOdWvwsfnvhcDp65u62JixZ+ll+SCiRxOHxWIQGIRVWiOUUe/bjea8DQ7R+b
	 xjrUkLulWuRx8Gj2vWE7l0qCBunGLlau2Ay9f2gQ93P+C06aOf3YfyCWkao7oTNm9/
	 l9bud6j4+nvEWbp5INGppVn2ioOko9vN/dPYBmKwK81rC3pNCn9ngcxM6uhHDkgAWr
	 KPQcpXR/makYg==
Date: Mon, 7 Sep 2026 18:54:38 +0100
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
Subject: Re: [PATCH v2 06/10] dt-bindings: i2c: dw: Add compatible for
 UltraRISC DP1000 SoC
Message-ID: <20260907-purity-regulator-754568d732d8@spud>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
 <20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============1881823042908562566=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1881823042908562566==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d3s8oTptYL8UWlPp"
Content-Disposition: inline

--d3s8oTptYL8UWlPp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--d3s8oTptYL8UWlPp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap76XgAKCRB4tDGHoIJi
0tY0AQDAVilktDjyvug1a1XYy4Zo/VEoy9WNtWTxNVqZ7L4AnQD9Hg4Id7AX48uW
PvbTKH7j0iZeCl6p7nglpmQhyaj6pAI=
=/vVk
-----END PGP SIGNATURE-----

--d3s8oTptYL8UWlPp--


--===============1881823042908562566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1881823042908562566==--

