Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177C4C52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 22:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkefpQFpJU+bWQhnEmsAMvhyNzO04aC/hp6nh4h83Uk=; b=TvmNuBeRXQqZuJgG3tE0CZgjOY
	vIs5euAY5vvE1t6CsQHwK61DhtZFaJ/wJ8kLNULC+rapa5IVBx0js5wVzRTO0FHCeHUHMaVsrueyK
	YlCJceP2vNrtWn5GxYT+3FdeE3q7zNnDzYxMrCvkqX0qGBYHdJOZZ1GPUCjfSFTT8gkCaPRv772+q
	A4C7DYlFCu339Xrgnyr5vraHGZPnk+hmACthEQ+DkETpxK1ImZc0JI3cpwYrdSH0Z8W5tYsnsXHHh
	bcMKGyel33CjWw5itA8j+TM8EbE28GYkgk1neNkZ2A21tOkZ5qg+MA9thHF29LH2DXbXV9dpruVz2
	xo21gT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfoZe-0000000HSZg-19iR;
	Sun, 18 Aug 2024 22:40:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfoZb-0000000HSZ0-1ICk
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 22:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 06A47CE0490;
	Sun, 18 Aug 2024 22:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AB6C32786;
	Sun, 18 Aug 2024 22:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724020828;
	bh=nvPIW8MrNDLXJBVY8SG6ZctzKzWx2f6RqLPxk4qnoUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezhA/uFsNcmRYc1rtMUFEV7Ow3YdA1VbP5uMKK/30TkFlwen1hAZvK9xsDcimmi92
	 8mUkNTOZwST0HGSh4vM4DnbCHm6a++ZaxgVo4RbUvVFM8m9OWTbcvm6YRKek+t6V+b
	 tvMtFKlZWup0UsrsaXKSoVKj5NF5XtXpfcDBydD6D+jJ2t8ih4KJZ9cLzA7S07qGk0
	 vq+sKIxr8X2LKC31TVsBfWO9WSod6mP+qklBNC9MJntvh1ZJ3i0Eg1xUj7sGc6nvuI
	 XvJNhd2SOrp4A0BzyoSOroeJlm60WSx1l8CHZK2GihFb8k+RZovDlStUMU9Oy8F5WZ
	 stjafl0rbJBZQ==
Date: Sun, 18 Aug 2024 23:40:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 12/13] dt-bindings: riscv: Add Ziccrse ISA extension
 description
Message-ID: <20240818-dinner-legume-9c73c5145898@spud>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-13-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240818063538.6651-13-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_154031_547061_AAA0B149 
X-CRM114-Status: UNSURE (   9.18  )
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
Content-Type: multipart/mixed; boundary="===============0642101006010723177=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0642101006010723177==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MdjlHmg67ept7cTJ"
Content-Disposition: inline


--MdjlHmg67ept7cTJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 08:35:37AM +0200, Alexandre Ghiti wrote:
> Add description for the Ziccrse ISA extension which was ratified in
> the riscv profiles specification v1.0.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--MdjlHmg67ept7cTJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsJ4VQAKCRB4tDGHoIJi
0q1TAQC/3Y3ikmFCM9JkfyYBjvVDU7doIlqoBTwix2edEFt+cgD/e8U9gPTWeUR9
iKo8EiUwOQ2/3YOG6uwaJ7IPl8oZCQo=
=15P4
-----END PGP SIGNATURE-----

--MdjlHmg67ept7cTJ--


--===============0642101006010723177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0642101006010723177==--

