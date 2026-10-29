Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DF606A31D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=keVRjCzW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAuzTLXi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NGWIBzxkd8pU8JRXl6uqbDbg9YSDcyCaSzUePdBpJqU=; b=keVRjCzWYNw3mG5WSgSCKMOSYG
	pW7SGBwUEH6aIdvjWVgprKOzXa54+slyHhRXJZCIqWZ8d5pu7kfhwZncLCES75jix3yobCHjyDnUi
	jzE8xcScg8SaRWVlDcljvXLxb21YIdVr0PpokRxKX9UvhTDFQtweGTtPe7VkuFIiP76rJoGEN7DXi
	Ktx3b3grtx+0NIglYVi+Kxz51mesoF8q7gOaSfUnf7keC35dOK1PSH+3XIYdK+JfHc4lb2PIjqP5r
	R/Vw5zxRT8CVVHcQBD7YJKfEhlNhoSxJ5MZnQORUjgM18OGg8ZuDufIQ6Kzp39vKxuklDKEh0VpLX
	NXlTExnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVgl-0000000AEit-3Hvw;
	Thu, 29 Oct 2026 19:21:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVgj-0000000AEi8-2nwD;
	Thu, 29 Oct 2026 19:21:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A64443552;
	Thu, 29 Oct 2026 19:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5314B1F01816;
	Thu, 29 Oct 2026 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793301685;
	bh=mB8QQ9/vuRBF76kR+CudZygjTkN8E4l9aL3S24NkFsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XAuzTLXiGvC8VQP+nWevpaO+TsHjId4xLBvJWdQcv63R3x9XoN+Q/vGXj4CVBc57I
	 pC5q33SQ0UrPpJ1emPMBwAXIwrB8UexTYCEbNzxV37Ssahkr6ehEcyJU04FsmfLkYI
	 fe3vP4rgoJ4SnriSyUAoZ2v8mH8VIpTcj95TJalpCKYqaf9JiXglZfxreTyyjVku5v
	 UzebI4qJiXKPLFsg0hsAIlqFX7reNKWjEQuqgiHmG1dDsqeUY+cYAWmoINte08cOoH
	 r5U+rE8gAv4g2hVhVCGijCSqa7pUL4JR0vuQj1cEujEepOxfKU5rTzXL4CtaA+1ZtS
	 cKUispFNm1INw==
Date: Thu, 29 Oct 2026 19:21:16 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH RFC 08/18] dt-bindings: interrupt-controller: add Zhihe
 A210 PLIC
Message-ID: <20261029-untimely-zeppelin-b623272dac92@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-8-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027-a210-scmi-v1-8-74d58ce85bd8@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============4752960028235408254=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4752960028235408254==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xQea4YahfBZW6fDj"
Content-Disposition: inline

--xQea4YahfBZW6fDj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xQea4YahfBZW6fDj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOcrAAKCRB4tDGHoIJi
0lkuAP4j1Syr4NaSYo5EgKM2vK/7/8yKlgaO3jdnsqLsLpiHOgD/UFmkhvm6cmzg
4hrX0XP8cpTtSUPiXYnApAVxiVf1CgM=
=4vU2
-----END PGP SIGNATURE-----

--xQea4YahfBZW6fDj--


--===============4752960028235408254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4752960028235408254==--

