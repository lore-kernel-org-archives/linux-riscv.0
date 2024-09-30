Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BBCCE8349
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7rq8cEfH0grjSBfd9kleFJxGLbkgq8GgSmsdzQYiDU=; b=FufDy5y3QDCUhcXMUW5G661Lw4
	WjgYl/J4dX50VINPjzbqCt1Wesx3rHeLkVlzMljF6u57cw0gJV87di9FS7UALrarhrKfmhn+5h8mO
	MqrFhzYxVw28+lVSazXpQLi1JXlhzRb4x84AydzuU4Ya+b/GT3c2Pp1396Wrt7Q4Al9VWUM3snIhg
	nbhysB2QSsWtIHLHJ4R7Z6WHuzdsk81nzl0vBdKsNzb4Ln8Qr4WlAMGJo9jGCakKeWlpl0ms0deX7
	xahclwmZPWmT/dZQ8AVB6IX1yPVgMcl9NgOY0TNfII8BFTIRpzH47/+G/yXlwmefIusNaNxJ+vrKr
	bnQGp/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAU-0000000HTAK-231Y;
	Mon, 30 Sep 2024 14:14:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGr9-0000000HP0M-0Swf
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05F95A425AA;
	Mon, 30 Sep 2024 13:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9C0C4CECF;
	Mon, 30 Sep 2024 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704470;
	bh=d7gElJyf7D9ksXwAIpophG5Uqbgtl7nqygwS91dUJ38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJXUfV7cCMSkCaK5VN1ykIgI6bvWdDJfSG4mh1k5Hr5NeY/xi9qatMjlr3Ud077uv
	 LSX0khtMy9DyBRAaoLTeNoU6DOx5PIXX1qHipQIaiNHaZ0HA5M+LJQYKq+t4deHzQd
	 6dVO+ffGD+oMUrgIaGE2PD0Y8D+q0IxWw7u427cphbu3aqHEN4SOZZvi6JMXvA45xe
	 12L5azxtBta4vRmon85LlA4ttUv9tcfjUv49zpQDyMWzYbEn+WAyAXlW+cLc9UMHPV
	 Fihnc1GI9xwrbVOuprYjw71PEspjD/geJxVVkcwviChiJu/Pa10M+voCQ1WfGurHGQ
	 asCWbvZ8mgTAw==
Date: Mon, 30 Sep 2024 14:54:25 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 15/20] dt-bindings: riscv: microchip: document
 the PIC64GX curiosity kit
Message-ID: <20240930-knelt-sway-04060e0ee22b@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-16-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-16-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_065431_531152_8A0A8655 
X-CRM114-Status: UNSURE (   8.13  )
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
Content-Type: multipart/mixed; boundary="===============4212723284160072354=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4212723284160072354==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7QH427KuhNWnm3Mj"
Content-Disposition: inline


--7QH427KuhNWnm3Mj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:44AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> Update devicetree bindings document with PIC64GX Curiosity Kit, known
> by its "Curiosity-GX1000" product code.
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--7QH427KuhNWnm3Mj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqtkQAKCRB4tDGHoIJi
0s9QAQCk+iAJ6+t1MuQmVPsS7UwIejIRLvJZBRC44V9oqc7iUQEA6iSPYqHZ0Byj
a5bXIew4y2/U/Gbw6YuzeCkNzT4jOAY=
=IK+Q
-----END PGP SIGNATURE-----

--7QH427KuhNWnm3Mj--


--===============4212723284160072354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4212723284160072354==--

