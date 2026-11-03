Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158E5606D822
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 21:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aXI/rKh8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6kvvwzI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y55l//Kmm/R/N0xsRnI20dxyR0GniThUommK/RxzMGI=; b=aXI/rKh84zsXZVgXrSFh+fGsFd
	hXwITs1kWfy5AeiW7DZmZnhhDACsLx89PnRNvpa7A0S4ei4qkGfZYl2PxE63ml7u2fgH7gR5Oi/oM
	kzYW62WV8sW+YOD3sc2r4KsnJrFpZAI7wtaxjB57AIyrzMRBeD25bRzxjf0I8Cy8esRNBqYzJA1Li
	TZdejbyoU/WdsngLAmlZWi6HopuFITPNSfB5ILX5/Hp4bmy2VugytqnQRFLjYy1ImCTf8E8627irK
	/edVe6xhauDkZKRd6VG0JvZRbWisiwnTw6D8Si9+eK62M9GfD2YEWN4cx63Q5PkTTlN8ZhbYLAB+D
	dm4eHuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMIE-00000003lEM-3LIF;
	Tue, 03 Nov 2026 21:43:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMID-00000003lDB-28qG
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 21:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 448E242BA1;
	Tue,  3 Nov 2026 21:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863B91F000C1;
	Tue,  3 Nov 2026 21:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742225;
	bh=YXzymi9E16naCnR8b95KHFKlep9Gz7Uplr2TOO0CwXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G6kvvwzIlksb22bEiO4mqKt3bvgQtXhR/3kiO94mO5qRcVrIVipuIRbkPrEG0H146
	 XTXaKbECySQVpmcEXF+Uagv8VxpwhHDGiPsfgB44+CIHj2Y/iruYQtIS93XFvvPzcS
	 oLz5EzEQDAX1QuACOPlj9nh/PAqxc8CKkWH2aYlEidM23IJQGg0r5kF+0phXqXj8Th
	 UA0f1d3FCmHI/Po2RXqSaAkd6HZkePr+eFIrJn8D8DbajFaVaOW5HJWrvA3fvNcCgg
	 MutnZAMz+j6yPTDdPDwFnpwxossfIvM6Wjq4ygxhoNy2MxrHOMVSjdCQNVdIPM3BpJ
	 1NpC+QbdfejSQ==
Date: Tue, 3 Nov 2026 21:43:39 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: riscv: Add MIPS Boston board
 compatible
Message-ID: <20261103-dioxide-delegator-9188c92d0841@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-3-3ac5d49f2c37@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-p8700-dts-v2-3-3ac5d49f2c37@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5310157975736209622=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5310157975736209622==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QBEjC0eKNNNL7ngn"
Content-Disposition: inline

--QBEjC0eKNNNL7ngn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QBEjC0eKNNNL7ngn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupViwAKCRB4tDGHoIJi
0spOAP454JgnRDdTYXV7MJdbV6AspmZZAFYLDI0KhHvjOpOL6wEAh2oex+nkFn9I
AMQXlIpoDADhC31vf8DP8/MPAHwvhAo=
=Kc/M
-----END PGP SIGNATURE-----

--QBEjC0eKNNNL7ngn--


--===============5310157975736209622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5310157975736209622==--

