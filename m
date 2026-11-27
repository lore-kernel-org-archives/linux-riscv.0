Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3F606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=evZuyP1r;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EytNRt3G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bpJrcf6lXhu4HIacmvgzB5N63d1Z81IIfjGFq9G/Rog=; b=evZuyP1rk4F9ZOTgvYC38g+Kp6
	7SukXK8xcqMF9QS9tuRoO75QCarNF3vVSuBPn9CIVMQhcD7wg5GRAHx6Mgr/bjk0+FAz9I1yyY3oI
	96yq4dxtaVKXUxohosziPf3UbY8LIzLaG6LGeN3h6hyRSIyw2EC5RxtMasBQg9SlhWZCEsLZ4sESN
	I2bT8SIDQz611DlXqpCT63yw39RNQshWoGdNHke4NK6NHfpcj0Nk0s+vcEVA6/gP/ThcYJraNyfVM
	qDsR31ZThW23VTjdwiQGsl1mhnUwtpACuwCEAn6WXEzVvrQH98QNcamNl9GkmW3R2R5d1C/IWZiN0
	xdS8BVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Wr-0000000HOIs-3n9a;
	Fri, 27 Nov 2026 18:18:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Wq-0000000HOIi-3HEP
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 18:18:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 344CF411A7;
	Fri, 27 Nov 2026 18:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246CB1F000C1;
	Fri, 27 Nov 2026 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803516;
	bh=BCJg5KdEXOKerir7HvXSyinpM8/rio61Rq/LE65yPLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EytNRt3GLG1J4r9JmqWz3/UC047RRfvPn8JBxshF6cPJyM6l1xlItsB7ZaQonsPra
	 ZQxqYnqPKFTVeUH8m7UPYWiNilvJJVX8JtWkG+EQoCPNKFWTc6l5C6ITsmxEXLlD1C
	 /RkDfJWqScN01jgK292syU+NVOeAVmXMhFSO9YuddVzCZ5662N0QLZhbswNiZqZttT
	 rM8OJ2IBN+IH8p2LV1Rt8Ew48cT6YASosd0+heGbyh8PSMFIJGznr+nsqV0SlEtFIF
	 n/pEDUyT/zjNyBOsORemwXoE6rGV4wcPu1x8iyu+yiiKVw+UFW6CMbfe+J+VbDgzE/
	 UI/dbv2wkwktg==
Date: Fri, 27 Nov 2026 18:18:31 +0000
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
Subject: Re: [PATCH v2 5/8] dt-bindings: riscv: add OpenHW Group CVA6 APU
 boards
Message-ID: <20261127-matriarch-phonics-1e87aaec99e4@spud>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
 <20261126164632.978624-6-marouene.boubakri@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261126164632.978624-6-marouene.boubakri@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4688230112096718077=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4688230112096718077==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udVk4Ha3Io07rmnV"
Content-Disposition: inline

--udVk4Ha3Io07rmnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--udVk4Ha3Io07rmnV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawnJdwAKCRB4tDGHoIJi
0k1oAP9/1/ilB4QcXZSXlaI5y8jSA/cUMi1Sc4LNhWV6uVzcegD/YMas2mYSVM2y
FXkenTlmKxUNzYatb53FiJer/ZIePAw=
=chay
-----END PGP SIGNATURE-----

--udVk4Ha3Io07rmnV--


--===============4688230112096718077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4688230112096718077==--

