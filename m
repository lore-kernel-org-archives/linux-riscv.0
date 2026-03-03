Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E75EDA6B9
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/3bQudUuwIQOhQIPlF75iNt2q49Rqo7Utozf29/gpE=; b=FhJTD4ozuepsxs8uydhvn2KKqZ
	xgcxQdITdzxChrTFaZUOMTn0CXAK6gEwtwCezkyRI97lkEzTx7vHkDlkF3JOIKPW0GLCr628f5D2S
	fIfc3El/5fHcu6sgFl6Mk0qDScSGKgRO4UEuYP/E7CEGV/i+xR9FA0zVneydnKPZh1W5LdNYf2+SY
	+/4PBqg9rE6JEXV9xcI2KWVcJZxTLnBEkUbDKip26vomZ+2o8lQm+sixDstLvYMcfsCPI3SsQqSNo
	Chu6T75X85KJ+ojNdSe2qWHmPf67ZNrmQpW4/w3xqxJmGbZSoCICP1tx+2jazJl9aps0F1L/nuPlT
	ZpaE8Bpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTO3-0000000FdVK-0RAq;
	Tue, 03 Mar 2026 17:18:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTO1-0000000FdUs-0mkf
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 17:18:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD7334441E;
	Tue,  3 Mar 2026 17:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA8AC116C6;
	Tue,  3 Mar 2026 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772558299;
	bh=2EwOl9X8rGmzKbFeYz5dMIhg7IdHyxKIF8yZ/8i419c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+KddYcPdyxLWyI2kho0GPcLfUYmGnBvTMI8hDQYyfKn9e2YGVSsTdP9tfEKb0JPa
	 XfUGwPxYEiUhS/JgYwNkyAT/XEvK67tchcXl4zTRpcslcDqXR5BmDQhqyxagUDjF6e
	 Mcg/Lygz/NfUqggpBNzMe4jgvZ96a0lpk6HrmnoaoTdH+uwf9lEasYwJdzMOJ/88NB
	 NDFJIUglgFf3FLeIClWDutWFGqEvALrg8Pfl8N9Eisaln20crzWZunjFjivO8mcMCg
	 EceP00FiIkl+F7UwVQtBJtqUuwEJ2+sdUSk8z+uvTvqMwXrARB3oD6vqD55OdP/wwb
	 C++45dBf7S1qQ==
Date: Tue, 3 Mar 2026 17:18:15 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] dt-bindings: timer: sifive,clint: add pic64gx
 compatibility
Message-ID: <20260303-obsessive-explode-70ba51a1d68b@spud>
References: <20251117-sadly-scrap-4671550cd78d@spud>
MIME-Version: 1.0
In-Reply-To: <20251117-sadly-scrap-4671550cd78d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_091821_244647_D74303B9 
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
Content-Type: multipart/mixed; boundary="===============8371182436444877131=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8371182436444877131==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b23RY4XFIHCh6JOP"
Content-Disposition: inline


--b23RY4XFIHCh6JOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 03:29:54PM +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> As mention in sifive,clint.yaml, a specific compatible should be used
> for pic64gx, so here it is.
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

I've taken this with the dts that depends on it.

--b23RY4XFIHCh6JOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaacX1wAKCRB4tDGHoIJi
0hOeAQC6fWkh1G93xOzZIYEVwVbzb1p9N08tPL17ETCf1hO9egD9EsDAEcXuwjRZ
BisqK3u9JcQmNymBYonduqC8/0oDjwo=
=ljGp
-----END PGP SIGNATURE-----

--b23RY4XFIHCh6JOP--


--===============8371182436444877131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8371182436444877131==--

