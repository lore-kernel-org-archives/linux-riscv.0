Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC80DCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlrYw1fBjBOKVDFoDKCzGWqIGqE4JuqfqPWcy/K2uYM=; b=OfNFCokPjJcXGT6gFxpBGRlBNb
	6YmYqPfRVV11uVMZsttpRmSodvgxl7nY11ApczRA7lJQgfFdd6X8kMkPdoHkWfdVxNRFp8NWLpGgQ
	ruT7kfTQkYU0jPo/EkGRN0I8XJkLO8nY7Jsab5UNCRnpxIiAtJLjcJ+FaSzrwFv/UnaCTG+AiO3PJ
	r8mao02rzFRvqLzta6CznPRlcyHqrqOqEYrX79KSsnJzmm5Urx7bLM1XZwceGlqJgQzGVZNUpHbJ1
	D3DMbbIlAxuWs18+KdBT0ovrlZ2ztxSaIkWS1lmWUwUQPRJQUuVgBrT+1u9Bi8WjvS93SLI39yu2j
	2+3RsfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqqwx-000Acr-2v;
	Thu, 12 Oct 2023 08:21:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqqwu-000Aax-0y
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 08:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10DC4CE2736;
	Thu, 12 Oct 2023 08:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25227C433C7;
	Thu, 12 Oct 2023 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697098896;
	bh=Gbx9yfCnmX9XPEWtA3eMET7ED2JBqtacGUNnM+M3sUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSTyKbjJSfkctBl/8rEzb6uSsYNnvHThaeZ65b1J2phjEEUdXBs63FfwoR4/T7ZgL
	 nyhJ6Upa6VjXMs2ucaqDRAUUepXE5tQAqAdlkyTpVTfx4T18BXHj5sEn/zsbNRLDLH
	 ZYbfqcntJd1n+Z4/oh5mgR0zje/yOS0K28y1LMqiX2EWMacsEZn1exsst57byvHu8u
	 vB3nTH9XTuwVbTRMuIkd+9WLqQIODGAWcnVISTavrfVCaVf7QK2T0m90Mv/Hy7b5Y7
	 zfokr+XUcLMDqy21mccRs902ed7naf1G7q/SJh8Rj8BKH64i6uWFQ/yYDw61ZM7aIq
	 A+Uz8ZoPF4wvw==
Date: Thu, 12 Oct 2023 09:21:31 +0100
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
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v1 00/13] riscv: report more ISA extensions through
 hwprobe
Message-ID: <20231012-clanking-imagines-150a7c05f3f8@spud>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <11d6a463-4e00-4407-9d93-2f9d190c4be3@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <11d6a463-4e00-4407-9d93-2f9d190c4be3@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_012140_530423_CD893060 
X-CRM114-Status: UNSURE (   9.75  )
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
Content-Type: multipart/mixed; boundary="===============8743910247674232521=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8743910247674232521==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aGJy53Fkev1PgtWs"
Content-Disposition: inline


--aGJy53Fkev1PgtWs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 09:15:46AM +0200, Cl=E9ment L=E9ger wrote:
> On second thought, maybe it would make more sense to squash all logical
> commits together (dt-bindings, hwporobe, etc) with all the ISA
> extensions in each. Tell me if you think it would be better.

I don't think there's anything wrong with the current approach.

--aGJy53Fkev1PgtWs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSesiwAKCRB4tDGHoIJi
0laUAPwI/1+B1oBExxGb6yOySNlV+rOwyauBbfAYtcc8BdmIfgD/SyUb8fpdpCva
Svh9QuookDdoT6A+W0p/GzyEYZwIUAI=
=rZ0m
-----END PGP SIGNATURE-----

--aGJy53Fkev1PgtWs--


--===============8743910247674232521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8743910247674232521==--

