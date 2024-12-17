Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F341E77184
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67JRvP0AegAqarZ5XlMiabt09/84QBJ+oxj60gtUzS4=; b=I9w7BPU8knzBQZKZ59QW7RaL6J
	3GldilkIk01UTPbOg/QHs2gvlgyTw3Ri7OOJNgd2DJ0603+YoUa9rW8SRp89+cA3gvWKojY6bR4/v
	3ouxXZXZZRqfHXLwJVw80737aSK098A85otGIzSboeGDAPgDx//xA+6aedVAIUYXS7ZigGZNxtYTr
	WliWQ//j9YGTltYjXwWO0doiwrnq+oR3ijPRxlaw5srQoZhVRFj1IiUoCu8bfGZ/q/OAX5l2n6vG5
	EaSHhS8N28d32yp0zO0AXh9IvHuztbgIkP93+ncc96gQa/I0M9g3BhYotjD2ZEIlk9Bwy+WmX7KpS
	/NMehP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcAo-0000000EVtx-16Sh;
	Tue, 17 Dec 2024 18:19:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcAk-0000000EVrT-32eM
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 18:19:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 542D1A41F44;
	Tue, 17 Dec 2024 18:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F80C4CEDE;
	Tue, 17 Dec 2024 18:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459593;
	bh=3KXuVnD9D+xJr3IbkexI7hbjcfsyh7wWVwrrKoPjpeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4SAPZDedYs3kXXyLmJSO7yQxmKumVijVWPamYYOeh0Kpif9cqyzpymhMfLZ3oo1y
	 9QREygSOnYVvrDDgvtnt5Sx/QZi3w5jispy1rhlyN/yf9pgJPwaBUTTrG69WDWLi+6
	 8QrF7zvyZOg4ttrVPksHfvRFucpsiV2gQ2HJZAYnRwHJpOUGfNV10kC7S55pKheg6H
	 Q1w7loIbHIfi4r+nqFtd/XhyyF05Q+x3JzYgnUGEMwa5lY7P9emcXufhgHvw7jRCJE
	 7LMzyE9mrdtKdYe9yVt/ghr8oXCHrQHBEsM6GXdG0vc6GLcT4SJ3ZP/elgVDcPsSO7
	 AQD3bp1QXXf7g==
Date: Tue, 17 Dec 2024 18:19:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, conor+dt@kernel.org,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/4] riscv: export __cpuid_to_hartid_map
Message-ID: <20241217-grape-disdain-26ee36738961@spud>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
 <20241217113134.3508333-3-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20241217113134.3508333-3-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_101954_832346_F31B9BB6 
X-CRM114-Status: UNSURE (   7.88  )
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
Content-Type: multipart/mixed; boundary="===============2359425749568352291=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2359425749568352291==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlUeFHDDVuswpK1n"
Content-Disposition: inline


--vlUeFHDDVuswpK1n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 11:31:32AM +0000, Valentina Fernandez wrote:
> EXPORT_SYMBOL_GPL() is missing for __cpuid_to_hartid_map array.
> Export this symbol to allow drivers compiled as modules to use
> cpuid_to_hartid_map().
>=20
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.c=
om>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vlUeFHDDVuswpK1n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HAxQAKCRB4tDGHoIJi
0uPrAP4/CsqF4xQUklJpDfXANiZA1Z3vqLRdOQwomW1QCh6cwwD8C4TNhyPMruzt
3n13BSc3PEpaygd3us95wNDVC00i+Qc=
=ZwHv
-----END PGP SIGNATURE-----

--vlUeFHDDVuswpK1n--


--===============2359425749568352291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2359425749568352291==--

