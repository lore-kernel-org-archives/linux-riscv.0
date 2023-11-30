Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5EDC10DAA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=388U2RSNf7fe/zDfXun4lBtJgbLF9ir4rb7hV6Zts0s=; b=iicyVRA9tPTfjP1os/AB1zpPUW
	JMGuAyn7YB4xJuzY7IBVGSo1O8/GF1w3P2fKPyIuaFpC+h947hXS76hFuwVCO7Na907TDDpWJCAPa
	lZkotyffE0WMN+QT4k0Vcp/NkFFHqG64pAFsjCaYbbPnJyaMvWWQ/rqBp573WAoJmrG2lD6Edyk7v
	YXvAht/8OglzAseFLF+l+ekTFA1+9rONXKlDzTRaqLempMdwML/3UD4CIkhlx0FdwJCFkqxkwGNbN
	Hk6fvncBtet2+yRsbiuL9TRZNFxtbBLybjnM2FBlpklXuHgsxFYXanesakkvOo4DW57wMOsXHSpfS
	iarhxWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hfw-00B3No-2z;
	Thu, 30 Nov 2023 14:05:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hft-00B3Mi-2g
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 14:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 87060B83A1F;
	Thu, 30 Nov 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A523BC433C7;
	Thu, 30 Nov 2023 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701353148;
	bh=0bBErjRDq1tShxa+ZQUxMiiFY8Sr+lLm/nr9F9U95/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQmWMW3nBQO9dm1t/E18YFK0AnC/mglah74K64IGkrwM+j4yLwR6VQVurr1fw3ijq
	 k4D9jrismUB8XR0M1yk1ExdoDewlZr3JnimtmuoqgdkxLAHJKb9kuVZ3PmQ6e3BXGr
	 sNK9Xhhbt83YR8B+qjw3DEbwsJ6Ft4wodKo0abZ4K4CpJ4qz0d3PtuYB67jf0MY/ND
	 ca1X5w4rtUvOmJ5QudqujjGyT6e2I/0rnqsqoaj94ylZWqPUFsfbr4wFmUeUoNjfcx
	 N7QA8QdrliZQqaNsZD/m2Aya2rHJtwhYPDFFofPs9G0rQwPgMjFrB6+fK6LpfxIT5x
	 8szHutp8RX+rA==
Date: Thu, 30 Nov 2023 14:05:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v1 2/8] riscv: dts: starfive: Group tuples in interrupt
 properties
Message-ID: <20231130-droop-reggae-3f1ec3809a77@spud>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
 <20231126232746.264302-3-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20231126232746.264302-3-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_060554_013507_BF13B17C 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2975973757709514537=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2975973757709514537==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GDqc2Ost9zQQcBe6"
Content-Disposition: inline


--GDqc2Ost9zQQcBe6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 12:27:40AM +0100, Emil Renner Berthing wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> To improve human readability and enable automatic validation, the tuples
> in the various properties containing interrupt specifiers should be
> grouped.
>=20
> Fix this by grouping the tuples of "interrupts-extended" properties
> using angle brackets.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

This one is missing your signoff Emil.


--GDqc2Ost9zQQcBe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWiWuAAKCRB4tDGHoIJi
0kjFAP98CAuQRyqCQFxRXAWKKidu4wFen/Zt8TMkwHgIbaZloQEA5D/IV6QDjol+
X0TG+1sqJS12THdiw2HGwLlcbBYKngk=
=mWd2
-----END PGP SIGNATURE-----

--GDqc2Ost9zQQcBe6--


--===============2975973757709514537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2975973757709514537==--

