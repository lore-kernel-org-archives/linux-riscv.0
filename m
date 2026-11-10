Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45575606A33B
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2oJyPnwt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrjfhPuy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+Zq8ZI7Eq3W+y98kSJW5getK2LEBeWPrNFKJJgMrcXA=; b=2oJyPnwtlyzYf9A0141yFbr1ri
	sbh6sji8800zxW7vr+Ui28gLANUmrc/M1i3+K+WwTSGUXLY9NA9dtjEuoRf0a2mx4B1Ywu4vJDPRy
	84+s2CP8O6i4aEcTEqL1sRSKPxoeGXdJ3nwfzAv1VOElLeMBI+Dt9I3gM/Fm7A60+ZJ79R8Ixe1gG
	tS+602Ccoq7jvoo5qXiVth7d04yrkh8/BH6OBj/DU3A8tbb9igZFgr09Zt7T3ZDY/0NlTvEDl1sAM
	j5g9ZDBgRdr4W2M1w8ZlxhuWztzGHSddUB/NR0++IMR7gkTR74ZuCJV5SOJGZivSDmBhIDfFp0t/S
	MKb6uNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr1U-00000004rC3-2Vfz;
	Tue, 10 Nov 2026 18:56:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr1T-00000004rBT-0UNg
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 18:56:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FE62632C8;
	Tue, 10 Nov 2026 18:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA591F0089F;
	Tue, 10 Nov 2026 18:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337006;
	bh=u8imW74Qi5u4rYZaASt9BvkUnwV5h/SQzuQOySm1baM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QrjfhPuyjrn758SshpFQS7FRi6KIfKbRgyl+CtMhrvVvZjUmlpcp6iWAN/kkbzjOA
	 fNFWbEyH6+KMFB//wyuZPXioASmVeGISz6wXCAfnqmeKgWv3NntFCBjVvNp7B/4jS7
	 OiI33lv7t0PXZtKvuhfgHDcw7h65oJjCiD9eS+SgFHLZIUGDIZ5xe1XA6WDiAALDvI
	 Pze3mQX2QzMQ1ohGkXp5QaJMOP+oFQOkZLTtr/nd9oIDyTv9WIPV4HAnkGedbmrW5P
	 oz626tq/cWbFeP6dzaJPS06hPO78cnQPDN5YjrRJCuSNDtuqimDwlsforrvFKYkLHQ
	 S/7QH8nQ8c3oA==
Date: Tue, 10 Nov 2026 18:56:40 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: net: bluetooth: realtek: Add RTL8852BS
Message-ID: <20261110-attire-jump-6178a8647787@spud>
References: <20261110074607.363918-1-frederic.mahe@cirad.fr>
 <20261110074607.363918-2-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261110074607.363918-2-frederic.mahe@cirad.fr>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4491544956171797040=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4491544956171797040==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kBGoRM1PY2im1kOY"
Content-Disposition: inline

--kBGoRM1PY2im1kOY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kBGoRM1PY2im1kOY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNo6AAKCRB4tDGHoIJi
0nnSAQCFIoM4GYZglD/WwQpxDX+5sCXjmakE+bkUW0bDG1pyfgEAliCFskf+23B2
YsTLdzd0nPu3HBNEcI+w+XJrYB3tOQU=
=fxea
-----END PGP SIGNATURE-----

--kBGoRM1PY2im1kOY--


--===============4491544956171797040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4491544956171797040==--

