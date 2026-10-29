Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35106606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=etCICSUT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGzL1GOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hitH9gQ3ePp9+iQ9z5Z6PfRf7tDXWiVbfna0iKwrbR0=; b=etCICSUTYkoY8owGHh9f5HUN73
	rZqSBlUv/KeOXJ/vvTER4vO5eeLFVeXeK1yUGlFHyu3KPDmU5M+Aqa4mOFTu8XmxAfKcPExptQ/PT
	vJnwCeTFG21VIrq2XW9ng91InBAnW6fwn+uLjRydFcH2dMmu46CZB5I6KpWNy26hRn3A32Ijvimov
	U25ACCmumW6CwZBJudu1vJcXEHHSFF6pHgJmJLqKNdmI3dXHTeLa5ffksTpnB4iMa4/W0ZqODI4XQ
	dn0KqT5xExtxJ1C8C0jkqtJ3rWhv2N31nnKJjsGPBp9Ca+48cmECtSb1PZuAlb4cc+XSierSy6d/g
	2ef8eU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW6w-0000000AH3B-3lU3;
	Thu, 29 Oct 2026 19:48:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW6v-0000000AH2l-1xBQ;
	Thu, 29 Oct 2026 19:48:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45578600DA;
	Thu, 29 Oct 2026 19:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111541F01816;
	Thu, 29 Oct 2026 19:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793303308;
	bh=u252tjYKu8WES2GFHaIRhebsdub9EY80KrpQW0NOE88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGzL1GOLHsp9NYnOCGpNkmncl26bVqLnagbMlr0KRI9G3wEXzg6em6NxcPtL2GCNf
	 0ypl/tQU25ITnD0hK5MNjbbpCDg4AprAKGK9CuLTAncEaDD50HYKOS9Y1TB93kjXyq
	 OMrvAOXmMAS/A1lCvqHJwbkfs9FmscK/sfcUzUV9ib9G0Mt0iPll/bPRDnWxHORh5M
	 2IVZ28FQzvF0S1GyVa8Mq7KZ4xXW32RPJ6TzQkGiYlT9soynbXioyO6jZe+V09gpgm
	 /YabrN1IOs9SzcDy7/Cz1FBpJd4ly2M4GC7Cf0kwk5MTPo6kU4Hp9gUFIQ/DUjrSQU
	 ybzJKTrYFCTIg==
Date: Thu, 29 Oct 2026 19:48:18 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH RFC 10/18] dt-bindings: timer: add Zhihe A210 CLINT
Message-ID: <20261029-january-outplayed-7b3cc08ead9f@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-10-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027-a210-scmi-v1-10-74d58ce85bd8@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============6670299819051265358=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6670299819051265358==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W7hKehumc3z37k+1"
Content-Disposition: inline

--W7hKehumc3z37k+1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--W7hKehumc3z37k+1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOjAgAKCRB4tDGHoIJi
0ltpAQCa1wSwznBTy+fR83zbHqIQ7ceLE46Nv6Rh5+ETvcaylwEA9+glYYWU0dU+
Z+BQlJxBMAMKiT4bjKK4hdt/kOnCqQw=
=/QQ+
-----END PGP SIGNATURE-----

--W7hKehumc3z37k+1--


--===============6670299819051265358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6670299819051265358==--

