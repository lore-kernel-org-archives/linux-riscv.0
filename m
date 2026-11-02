Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B3A606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 19:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fr4U9k0I;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0dWhcfO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vG7oKZbAF0SmU6DGOYKqUhkE8Fgs++NcsAN3IcteD1M=; b=Fr4U9k0IcM5SQG9VN/0ikI3lkk
	GmAB3SDEcWIyH6G6AzdfG5odIomh+topcO8iroRPTb3QHNYVRudTWH8tz8IFMfOzeF7UDxdlFi9L6
	ZfE6UsVS6QmUnoONcVE8XfAYdglaeF0Pf34eXCZU1cMYBAX22wTUMhv7oU61q9A1l9ApYvKWXjYN5
	lk3D57YaMcIKOOG4OqklPsSMSsl5f9Nz1QVuAbsgtdoJyIs1YOU8zk1HNV5dp0Bvz0duG83yVV7Kt
	FoEbv/otXGSfMmYvRcHTTkPugqU37FlHZVNGu8cqaL5OCXnNrX1z4CBuqT5kfcG8W64tOFEczWABr
	HCv4ucTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxUX-000000004b4-1Ezi;
	Mon, 02 Nov 2026 19:14:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxUW-000000004ac-1Mej
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:14:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0139F43732;
	Mon,  2 Nov 2026 19:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC84D1F00A21;
	Mon,  2 Nov 2026 19:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646887;
	bh=o4BWY5KFXSmVDgW8Ud3VQ3NPMxuR150U2T11g1AHqeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o0dWhcfOFk8VSHNIrIa5lLkdih2+I/wlIO0Uftyyx3f2x3PD1ob6En+6uDq/YuvGQ
	 S4zFADeddoECtQa/Uo46hhXEgi8CPC+X68kaPDYvGcQAVcR39sUpWVd00s4xih1GT/
	 /jhUowzZy5E6pJ5qhf2WdFKMeHWIqDrXfoJzvOdWGM/TYkWK1CFbwB1Elx6LcF3lEM
	 VP3zufkCtGaRXlUWOHy5oPPmYrKZieWu3EgHPnqaFNPtd/MXnS4BK/GAGfCx1KQsQW
	 No6ZL0oK05rUXFF5K3RIWVjWxzP4/IV0n9UW61h87qQhGB3L7QvUjZa82zsacSuhmt
	 FQZkb4ofkFlGw==
Date: Mon, 2 Nov 2026 19:14:42 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: riscv: cpus: add OpenHW Group CVA6
 compatibles
Message-ID: <20261102-pretended-helium-c37853df1c99@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-3-marouene.boubakri@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102141727.640769-3-marouene.boubakri@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8398677141713712724=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8398677141713712724==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CY94ol2i4y7nKpGc"
Content-Disposition: inline

--CY94ol2i4y7nKpGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--CY94ol2i4y7nKpGc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujhIgAKCRB4tDGHoIJi
0oHlAQCf6tvKBotBDIW30chlWr1UEZQn1nVklLOXwu06Owx/dQD+LtQPLSDH4PWg
wTVTrtzZywGLXjvalIjGSaYm0IQV/QU=
=PjKr
-----END PGP SIGNATURE-----

--CY94ol2i4y7nKpGc--


--===============8398677141713712724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8398677141713712724==--

