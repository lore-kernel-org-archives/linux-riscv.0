Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F499606A324
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 21:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ohmtAO7s;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5fG+dD4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mIah/Z8zrProXAFN+TcgAugrYN8K01Pp8N9EKWZGjck=; b=ohmtAO7sPIWDhwxoDlv0FYBxst
	K5RnCL1USaIevxQcPuTYiqhw25cZ1i3XU0aXZ5h6TjNop0XPJikAC+8RXMrHkQdEVobtAL0LCylD5
	dRcDyIKnmasNBzdD+spCdZKUHSKKum/lEuRSy1pAc4H3yU5xTyAkW+wSb08Ij6x59ERZqG3/L3IEr
	duyFezVOrJV15dqdQoTI6I3sLMf748eDO5EQM/9ciDsTUXDKIlq9QAzduJCyU4Z42e6EyZMC19hJ3
	Cn3XQ3c4RXA3ahZY0raIWOl8iKCIWHB5n2GWdc3tX+UeYUvIjEtlHW5pwLnfhcsaycCMMABsfff8d
	4gRqwezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMLm-00000003lxN-1S1h;
	Tue, 03 Nov 2026 21:47:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMLl-00000003lxB-1y5u
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 21:47:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DA04404C3;
	Tue,  3 Nov 2026 21:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AA11F000C1;
	Tue,  3 Nov 2026 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742445;
	bh=VXYJTEbkCcS8JY3kdIlS7QjgGSrvZ1I4sev2LE7rAIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5fG+dD4dQX8szkRjAKbncD/EdF4Ot8EbhNn9gYxvI/5/rdEucqktxKD4QFfssbHn
	 ojqc6v9mDrECqeHOJWHhhgneaJZKlwXJubSM9/SmE5m3ridTQMiT5TLzMrCJdBJxFT
	 neqdcdHaen2jRN8e+pO4g4Iwf+M2mi4jo4jWTGhOrvarK4Wub+Mz07jkHS0WonPXMY
	 xkta30l8w1Dw2jdJBpMfS1jy6ch5B6s9esTNfKIutlztC3U8JBklxAP8bmHYfYjLob
	 S0kFgUrF6Ruvd2APt79uOiEcUUgjCqT60n+fkd/xtCxPNFEfmej4HkElyTZtIIACLf
	 JFHURGafjqU+A==
Date: Tue, 3 Nov 2026 21:47:19 +0000
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
Subject: Re: [PATCH v2 8/8] riscv: defconfig: Enable GF SoCs
Message-ID: <20261103-relax-generous-641baaf8d606@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-8-3ac5d49f2c37@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-p8700-dts-v2-8-3ac5d49f2c37@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4943158451552739717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4943158451552739717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="icZwj7cyj7n5tvNn"
Content-Disposition: inline

--icZwj7cyj7n5tvNn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--icZwj7cyj7n5tvNn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupWZwAKCRB4tDGHoIJi
0jrOAP98Oz6hQvtnGxRqEmdtCWLQydi/HZ/hRXa2RL1fVLGqlAEAp/1T6OE911ue
PT2tKUa/uPWdVa+9LAS5tpcDRaTZnwA=
=vS1z
-----END PGP SIGNATURE-----

--icZwj7cyj7n5tvNn--


--===============4943158451552739717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4943158451552739717==--

