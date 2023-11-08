Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA585C0018C
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHA3jF2RyFv972uJ2fI67yjEwuuhQoi4dHzBYHeYySU=; b=obeGjQA1a3uG0G0RLiMMuGx4nU
	/ptLDpqBLzdZYnimgaEFyWVMSTX9ZJjeXQNmYertahAHwm9kdP4ZBa2fEVSWIsk+lz48fQzho3kqV
	ITUthk2DIDEFkRo/w/Eg16ype5vARdKT0rh/V5/tpkQGCpaTjm1fdIqQPk9gTECKXzXq5KPK5lLe+
	fMIZQRPBmCqWo/1WjGQhVmOntrgqJMaz9RU0T0YseWEKhMcxHmbFG6wGc27C1JgbF5+v2z2V4saQt
	uqHzafamKoMLzE7z4sN5EaRZh5eNiUMQTpRBTlB5hfr1CwUSdzfol55COjtATdbbCB+4OExLV4Vck
	GIX/4jRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kyr-004FW1-1n;
	Wed, 08 Nov 2023 16:00:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jzl-0047GC-1F
	for linux-riscv@bombadil.infradead.org;
	Wed, 08 Nov 2023 14:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XgIGzvjQwC3VHbaj+K9sbTBgxu8Wh/4Iq6MDe/oBd8o=; b=eTT2PNsXGaAAE/DEGKnh7kCDjg
	VAy0M5eAhHooCVVECAhnSjsfQ5F0HgJ6Gx420wqGzoRXB0PNAf+ieYZiCjRG89ECjm0nZQSdM0zFL
	p59DAeGpp3pJMwyD1uEzhvJTD5ZdyMqjK2Tt3muKQR4vb99ZU8dNsG1BxD5EldToDU9ZeS32sytIj
	30XDF9VW+yR1yjBFxJErOkGi+nyXEsug4394tE2utNVIUPKeyoY0y55sg9HVhvapywOXsXaItvzqD
	Sd/oHvSPaaxPHh19rgbza4uR/0nmV5geklhyIoSkJWJ0q0xPjJ5Usbi5LUAGAyFdEpoOF7/XPJICG
	5gBOaL4w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jzh-00DZ2E-3A
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 14:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D8DD615FF;
	Wed,  8 Nov 2023 14:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6465FC433C8;
	Wed,  8 Nov 2023 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699455440;
	bh=LKL1hs/khI8hKTDotLj4TlzooB07x3t7D/CuzzZG+Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3j5TevN8fsXBPvYnztlof7HiDniQcTKHv3coqsz0QT785G+eoPCtqqMYWpbFO96M
	 gMvkHunctwfdJGhNwCe8dw1uq3Yxe5U9MJ3CYnAM4u2jwcGEtl5NnZSs1PNQJTdjzj
	 qv1n3tARR6K9+GS2VGWHJS/G/+j7qLxDQg/RFlUal9qLJVdqA1pCnOGhrkpsKjIfR4
	 3AZi5nGl5SRtY9i92JjRacjWwn2fyh9kLusChllojkFy1489ygIO8+CGvotGnX8rcZ
	 JVOwoZxO4xvjiKsPRZgJTqaqAV9w0BFyxaEvM/rSYEudhIiDJ2x2sDxIINRNh4+0ji
	 +R8XiS//Kmy4w==
Date: Wed, 8 Nov 2023 14:57:15 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v3 05/20] dt-bindings: riscv: add scalar crypto ISA
 extensions description
Message-ID: <20231108-grower-handwash-63526d449e9c@spud>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-6-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231107105556.517187-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_145726_320017_87A1D869 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Type: multipart/mixed; boundary="===============8910429386059347443=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8910429386059347443==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IXI5peX4j7nYK3nr"
Content-Disposition: inline


--IXI5peX4j7nYK3nr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Tue, Nov 07, 2023 at 11:55:41AM +0100, Cl=E9ment L=E9ger wrote:
> +        - const: zkr
> +          description:
> +            The standard Zkr entropy source extension as ratified in ver=
sion
> +            1.0 of RISC-V Cryptography Extensions Volume I specification.

So the topic of the seed CSR came up on the U-Boot ML in the last few
days:
https://lore.kernel.org/u-boot/20231107212431.GP6601@bill-the-cat
I think we need to document that having zkr in riscv,isa-extensions
means that the CSR is accessible at the privilege level to which that
devicetree has been provided.

--IXI5peX4j7nYK3nr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUuhugAKCRB4tDGHoIJi
0jq9AQCA7EiDhuy9EermqoTOWmWVVqY7W1Mxzc1nVYddhZ9YVAEA5v5PcwTZ0QpO
ppUXycCAScJGAc/3pFd+DuL0WqaXxAc=
=fV9h
-----END PGP SIGNATURE-----

--IXI5peX4j7nYK3nr--


--===============8910429386059347443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8910429386059347443==--

