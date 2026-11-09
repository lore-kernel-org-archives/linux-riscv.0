Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21A5606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 19:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nAaaOkr/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OiMOuThd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yn2xNia0gp0QjInqR/j/7bl9FvoJ3DJ6Hvs3JOxi2LE=; b=nAaaOkr/f0jDb37EGJNYR1UL0S
	JKZsK2i8uOqWXGkpvCC4/PEmfo8e9YIumFKPCpqWoPxooRrZ83oPC2RJlISUkni3Ctvwa/qFX4RWW
	tNvnldWZ2egm25ai8aJFpk/VoZDDaTKV8IHVlR3ZoUGP0SSLkdKp9O/UDeZOI+uMVu6K9WL9Kh179
	zhwvAQ9oF2aSX0Va7Fi5dt0OegE789J7YmY67bKWWGwbW3jtDHRguuC5O30eCgv/ygGvkeHGIjLtY
	PaK30F4B5XoBvlyKjMlgtJ3DnQMWdDozeKvNHYschgi1Wlium1cex3VRnJ8E+ydXVhkBtYgDo1WxT
	dbnl4bQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQV4G-00000001YFm-0zTo;
	Mon, 09 Nov 2026 19:30:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQV4E-00000001YF4-1Zen
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 19:30:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD3F34170C;
	Mon,  9 Nov 2026 19:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7EE1F008A2;
	Mon,  9 Nov 2026 19:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794252609;
	bh=L6VfwYpY8IxdSh1G+DlU88baaChUFV7ZxIByH+ynFzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OiMOuThdsthnJ9VU+xpKTAMeJ9EWOEszQjTp1Upl7BWC2k488CbLmt89PxrYQiQrL
	 3x3qgIuzS9/S3TancSeDeJmc7tk2kZPjA5Sq9Vr4v7Oj3Yhq7Fj3jl1ib04f9mh1N0
	 sRFI/rYtTkN5liUT5nhce4JF7drT0njI5NnPCOlv5wXWlClPqavH1Zibn9q0Irlquv
	 A50d8zvZoubOXOV/1E/CiiEw2OKBUs6nNHIDvHyx4GoRFEXwP/Y8QlXRtqNRAYe+BA
	 GED0b8p/aTrp8lcYoxy5r8sZK6Xzbnqoxjl+zD1qw3GVfmbAuN4QT/VutT0FvPICNh
	 zNcmRBdCloTeA==
Date: Mon, 9 Nov 2026 19:30:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis
 compatible
Message-ID: <20261109-implosive-saxophone-2f278afdd759@spud>
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-2-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261109051050.105623-2-joel@jms.id.au>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3126485829994128854=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3126485829994128854==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jYkxKq0oK3oBwCOD"
Content-Disposition: inline

--jYkxKq0oK3oBwCOD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jYkxKq0oK3oBwCOD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavIfPAAKCRB4tDGHoIJi
0rcCAP4ouz5K4oFu9QOK+AKf3XtURfpWVq2lqDQg90quvAqzOwD/b12aM/hP9T5t
WjUp258JZ/CXrFdjz8LxMLrBgug1KgA=
=McSo
-----END PGP SIGNATURE-----

--jYkxKq0oK3oBwCOD--


--===============3126485829994128854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3126485829994128854==--

