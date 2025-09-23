Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014CCAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpFWENa+ViJ/9uK99RvGaGYc46AphWGV0V3R792Ib5o=; b=3ulYgnM6KaXzGeUdAtXqYX3qy0
	7+eVlWqq/1kmGhZIIyr1Cqle+UURkP5KwTEPUkJPRd/ry8Lczn0yG+q32xMHSXJIZvhgCI6vne5DY
	c9XWzyAiv/B4fqtwCVF/oN5cOz+VEtMqpTHU2LLfdzV7b+SRowARAvpzKwNj+VNb63k15Ce6gmM2+
	bk9uUvYYvRjJmqapzwmP8x3HttxHFf63qg66kT6+5//UIOuUMYdSJD4x/hGYHhC7AZGng2Z7yNyNd
	qXdTLzw5HLGE1t5+ZmITLYyo77TXjWrG8VUpu61rlqmF14CfA5/h1/jczBzCSivk8dS3j0gsH20sE
	05jsInAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Nq-0000000EdJI-0hPw;
	Tue, 23 Sep 2025 19:09:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18No-0000000EdIu-0wT3
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E2CC6027D;
	Tue, 23 Sep 2025 19:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946F7C4CEF5;
	Tue, 23 Sep 2025 19:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654539;
	bh=U7w0RBhbvZV0tCCq+E/7rvgMmOrzo+yKDpglEYqqbmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSelzzKDhBaPXNH1PUwmkKqVAiB+otctbgli5jzwvFj1FBfFAixXtjRGixJHGxhAH
	 InScH36S0hnN9V12yALB84pQaHC3HeAYqpSido6nCbB5zgGHzj4SWBwW707vBxxd4C
	 opzA7B+FcLmI6me454A3pfb/bRlgPDqYwSlUecwFJOqoX1/Oq1+7Ew9OBVcN5nAlxi
	 thnW/fCLbiyaoRA1Ydc1ryg6degiU+TTpnm+Ea81/J6+ApHONk+Vftn6CuBsqArMxi
	 xPgG0Hqf8KGV+/xbhGtYgt1TPfs3cGG0remjAYdjriLUi6LglwX4mC2Ixo0ZWuoCx+
	 7f+3VEU44hEyA==
Date: Tue, 23 Sep 2025 20:08:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 10/11] riscv: defconfig: Enable Anlogic SoC
Message-ID: <20250923-ivory-gummy-6311b0bb3c36@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250922-dr1v90-basic-dt-v2-10-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-basic-dt-v2-10-64d28500cb37@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============2922594587404644325=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2922594587404644325==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="utCFKJUV5pobzqG8"
Content-Disposition: inline


--utCFKJUV5pobzqG8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--utCFKJUV5pobzqG8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLwRQAKCRB4tDGHoIJi
0tuIAP9wGk8z8DY8my4Mk/9R5hIM/OJtA3PhcVHRZ7nnmORq4QD7BOP4w+OTiBPz
CiYJmEll837wt8T9iufOl30j6jaWoQA=
=boQB
-----END PGP SIGNATURE-----

--utCFKJUV5pobzqG8--


--===============2922594587404644325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2922594587404644325==--

