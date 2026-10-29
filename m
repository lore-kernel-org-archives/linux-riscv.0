Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D8606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2y0wGfIW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKCgzPgE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8IsxFNFFndjfQlHfjxsYIWv3NlQDoseVvNfMJqHaEJk=; b=2y0wGfIW9d7oAk8EowKOHB0+Gf
	uYWfStT4RFrepchbBNkq/L9/IBUHF333wPWmLvXTCTTxziPj4VcuJaF8Aqqs4ygQ+KBvI7OwV8JfM
	5Xqan6gkii9Zdt9Q05tuiMEl4NkbpsjV5p2Ko4HTyMPd70BPo6OOeuZV/MZe5/RUfUAjnc0uEQEU+
	xS/QuFvU7ZRI83s/4N4Cswuty4VSQ61g3CfisfrfQuI1AXkm9nOQ8zWim18bM7rt9aQnAQDs6HTFa
	40AVx59Z1Vqvd2ONn2jXaiAFrQ9CCcSgdmsa3KtQt7MKIKaZFyh3khn1fECshE7IfREBj4v4CtTq8
	G6uvYJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW9f-0000000AHWk-49JJ;
	Thu, 29 Oct 2026 19:51:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW9d-0000000AHVI-3HaW;
	Thu, 29 Oct 2026 19:51:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4FF543744;
	Thu, 29 Oct 2026 19:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3331F01816;
	Thu, 29 Oct 2026 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793303476;
	bh=KtHmkWpVa9EDMKk9zLknJHt+iL+tMZYjl7Y0pmLSU+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CKCgzPgENPrfcm5i3vjXyQg0c+ZufGV7+m+uwxUpTjSEbPbjc8qJiilkNvFQYE5et
	 VgMOOhqhbTSSjUeYp/6lt2PnmK/aR9b6LTMldxDANq6V3Y2nz+9EAMay6+0vOt9vDA
	 LM5nw/aQriOfcORoVIhPtOdOJ4qVM7UvejYvHOztoQzzmeSEua6PrqOAQhT+7nORsL
	 zWY5bLanEqPNrKgTUTcPerKK6LM5+zOEmlrbHrzKSZq6zRSNj+HqkO0oqE/lGdzio+
	 z8aNz1Js71e+L+ltR1Bu/wjtFfv9Y9LSBo7UY98hGDqeQfeNn8skonOU4+bQ8cLadM
	 nTuFlXU0rrQ1A==
Date: Thu, 29 Oct 2026 19:51:07 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH RFC 02/18] dt-bindings: vendor-prefixes: add Zhihe
Message-ID: <20261029-battered-wistful-2bded2acb9a0@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-2-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027-a210-scmi-v1-2-74d58ce85bd8@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============6298430326039355041=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6298430326039355041==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LnnD6s57K7/oxCyC"
Content-Disposition: inline

--LnnD6s57K7/oxCyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--LnnD6s57K7/oxCyC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOjqwAKCRB4tDGHoIJi
0m4zAP9hOWNcLGo/D9ValB0XwlKB6J17J6HXMj0W9RIVM1WKDAD/RnMCJ3/9mjw7
f5eVmKa348OJDviBDEXzpcZx8aR8xAY=
=M8+G
-----END PGP SIGNATURE-----

--LnnD6s57K7/oxCyC--


--===============6298430326039355041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6298430326039355041==--

