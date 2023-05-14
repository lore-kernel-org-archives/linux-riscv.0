Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA92C7EE22
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 18:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLrmtrkDPHeFC9o8cauvYz6E1Qcukzq255J7FFHX6Gw=; b=fYB9wjKJe7PXrK4XxameLGus0T
	6qxFBm52xPePCRXJuBfS2DGbH9bk9xR4Pw4PX3bIEo+VifhY0mUzKcI07/gtahqegQBpaxQBYvYxd
	3FyYJr7uCvm3VLDFRc7eImfVoAVAzVPaa+BlXIhpG91KeFNIBQdsslkrMEIB8Pnv8IRmbMdiWtkxZ
	tDB/1j3PXaYzVmWtplq/SARExZ4esCujvT9+Srmp5ttdzyETQGLU0HYC9d5vmJwXS8GO9EPBEH/aB
	yz3RQSJBuGbSwPbeDifsX+WbupGY3ceImZXIXJvTMtr47KVTxSYZFH8bL5J9MY+E/lYzOozK42PPS
	0M5qjUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyGd7-0004HF-2l;
	Sun, 14 May 2023 18:39:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyGd5-0004Gs-2Q
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 18:39:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CB8660C8A;
	Sun, 14 May 2023 18:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423EFC433EF;
	Sun, 14 May 2023 18:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684089574;
	bh=0qXKkwNgm6r8LyU3fLXnR/zhU9ezOkHvW6g+/vQsORQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZN0yKtHCAVyLMwWTyWR2il5idn3KVri9Dkfgi3FgoqH4LUvPSKfFS3njmzMdJv7bi
	 8GxNaqYWiDext2jk8UEk8IxirT0OfC+aDvAGODzjkSgEZHzoTFVCm3rKw95dG7PLKU
	 07g3QH7ah/bGxGAcrZk0a60PHmHueegY2myFlwP11ze1n6YqqNNQG5t8ozSYZUqfCx
	 LjGtP+5UnDd6Wymf1/Ui7Jc3XcFdIwwPPUr+A/kin8rPf31XRLWkiX+brZbu2TkUio
	 0oWlJoxCH+86JhRe1knEU4z0y0ulqdZoSTpc/J9BVNvbvD6zSE8DTMTfC4p5iCqbNE
	 ZJhcn07dyo2mg==
Date: Sun, 14 May 2023 19:39:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 06/10] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Message-ID: <20230514-kinetic-backlog-b9573ae06507@spud>
References: <20230514165651.2199-1-jszhang@kernel.org>
 <20230514165651.2199-7-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230514165651.2199-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_113935_850927_3767551B 
X-CRM114-Status: GOOD (  11.88  )
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
Content-Type: multipart/mixed; boundary="===============0231857422076475285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0231857422076475285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jd7+Ni3EpcRTOoVW"
Content-Disposition: inline


--jd7+Ni3EpcRTOoVW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 15, 2023 at 12:56:47AM +0800, Jisheng Zhang wrote:

> +title: Bouffalo Lab Technology SoC-based boards

I know you're only propagating an existing pattern, but the "SoC-based"
looks rather odd!

> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Carrier boards for the Sipeed M1s SoM
> +        items:
> +          - enum:
> +              - sipeed,m1s-dock

BTW, do you know of any other m1s compatible docks?
I couldn't find any other ones via Google, so maybe it is just worth
swapping the enum here for another const.
Either is fine by me though.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--jd7+Ni3EpcRTOoVW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGEq4AAKCRB4tDGHoIJi
0gALAP9Ok3alh7NIJMaSq8fKkKGEXm45QwG/nxQVUVvv5NFqIQD+NT/UaDdpRQ9b
AtE7/sESaeGevB6XmhBXdSnfDb6n3Ak=
=aXIX
-----END PGP SIGNATURE-----

--jd7+Ni3EpcRTOoVW--


--===============0231857422076475285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0231857422076475285==--

