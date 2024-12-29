Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EAAE7718B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 15:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dfNO45WJb5ttthKzYOfwK8eZ7Svrie34CqaVzDiIAE=; b=FhSRKIKbu0yxWTpmX8Eau5S88L
	WcsJ0dw/bFF+1rJBh3qwhy0HB3IGWcLAFVgGgC6GzXEHmhhZZ3za5D0taqFBXPy0bdhjGssvA8ZpK
	+hWRd59kleoi93k1z7i0jeId67g9czHxdj0raxVx24zcnBNywmuHXn8I7+d8VlVhMUuvfNgn0QwiU
	fyYC9KQgtdebofgmveloPOdjFfjio111ccfIRzZjipGuGPDFslkCyBccGWSOvAR949MJdXJUBbqkB
	He3x7haogbolzwWqAyiBOM33kB3OaIMkvQN7m4OoHs1sADsNLl6PgwyhnwBsnP5Esi9Q7sr/xeqVq
	VYYpIPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuz7-00000003Yxx-1zAb;
	Sun, 29 Dec 2024 15:13:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuut-00000003YSf-26ZH
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 15:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2989A40101;
	Sun, 29 Dec 2024 15:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE682C4CED1;
	Sun, 29 Dec 2024 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735484957;
	bh=qaakPx8PxtKG0H599xpxUqqP1tuvqAihNdErtlhgw84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djeMJhqk0V86Tbm4gCFALAfUz6Vgz+syBla4djR9rY3S2fdeLRRmCRu5X0c87OGUu
	 BwwxXcljuuHxrmogEimRTX2oXDFCg5Pnc7gg30rBo4QdERhs3H5f8xyVLGWq2ID4N2
	 vTzO22z6AfKC1eMaP80raXc8aAyj2Y5CUnWJsgAsP8ThV02hZS4mLfqudLnlrRpn5h
	 +5vOZFhEHvvwuLGWSIxvAoGmAztRZUQUXGgJ8FLu6Oa4rk/2Id+0TAFxrXBtgLRoFq
	 SXqN095yYyr5w/3R0w0OxfPMIWvpvVfhaIJoH3a7xyGe/oYWrkVyhGuYwxs5Ekzana
	 iiw4eBUV7vySQ==
Date: Sun, 29 Dec 2024 15:09:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Access time mmio instead of rdtime.
Message-ID: <20241229-cogwheel-kebab-3cc2b21096c8@spud>
References: <20241227150056.191794-1-arikalo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241227150056.191794-1-arikalo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_070919_612098_D1D2F09E 
X-CRM114-Status: GOOD (  10.33  )
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
Content-Type: multipart/mixed; boundary="===============8843001022032057861=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8843001022032057861==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VX5rwSexmm3NwLN+"
Content-Disposition: inline


--VX5rwSexmm3NwLN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 27, 2024 at 04:00:56PM +0100, Aleksandar Rikalo wrote:
> +#if defined(CONFIG_RISCV_TIME_MMIO)
> +	if (!of_property_read_u64(n, "clock-reg", &mmio_addr)) {

This is a non-standard, undocumented property. reg & reg-names are what
you should be using here.

Cheers,
Conor.

> +		riscv_time_val = ioremap((long)mmio_addr, 8);
> +		if (riscv_time_val) {
> +			pr_info("Using mmio time register at 0x%llx\n", mmio_addr);
> +			static_branch_enable(&riscv_time_mmio_available);
> +		} else {
> +			pr_warn("Unable to use mmio time at 0x%llx\n", mmio_addr);
> +		}
> +	}
> +#endif


--VX5rwSexmm3NwLN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ3FmFQAKCRB4tDGHoIJi
0rtMAP4ykJ6JJzViF+eyeqj21DXap1/iQ8/uSA0TfW9+KenbFAD/UWIwaZCU/Wfs
ZSxzFVVO3jd1kr+miQ5aP2v7VDQOEQE=
=zw/P
-----END PGP SIGNATURE-----

--VX5rwSexmm3NwLN+--


--===============8843001022032057861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8843001022032057861==--

