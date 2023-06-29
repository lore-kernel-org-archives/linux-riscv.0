Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D02EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eT7H4p41lsnmlliCvTJv1HNnJxMEGlHEJ7Zkzh0d7zY=; b=OeW36xzmN7YGfdc5lKIoPZBhRX
	XCvj4SLCq+JdDpUyKufOXbt3zptj0wzz7uC1QDXyO9C3tIoIewIXV5W1I98cWT7hiG8i0YupUniKb
	U7/8MDcHXjXORhzhsDpJ/iin/qI1S9/U9uJxdsNhjDYGgOdhhLtOsIvNvwaTwQynvXKRbexhCEI72
	00Re4atZMFSXPpIjDKO3YkhpkUFeD0Dh9kUYrx3AXq9mr8Uy/M8w81azFfOHbUVSlfLCvPA8K3v1Y
	87aHEYSbjU3CrsMIYuu2G/+S3UxcG2dRJZR5OY07SG37ptG4XJTxlMUNfSe8VWx5qoGRq6LAVrZ+I
	z6M91x3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0pP-002RWW-1G;
	Thu, 29 Jun 2023 23:13:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0pM-002RVl-2x
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:13:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33BB46163E;
	Thu, 29 Jun 2023 23:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FBEC433C8;
	Thu, 29 Jun 2023 23:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688080407;
	bh=2awjKHX4Yc3J7yyhiD16O0HE9smL0d+ZJRJ1b6FGCdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBH4/tNSFm9WdrCxJAuarB7CnL3BK0WdGtrqTNPsZqRhSlGAZJDcQd0DMPa4DtvIG
	 LYvI6Z/5NK2aZIxKi8CV2byiwJ3qf4QMUkCdZUeewOzTELM85xY/PTMKSmOf+hhB0k
	 cflm3hh5CoMderrowZQszFa0whC6mZ1k2UV9Pykl3U3/dKnJemasvh73P+KO1e3FGN
	 SbtLQgHCKyQNw7etW0PGrUWvwzUHKB/6AjPtxOJkoVLRzR/t3wN07wzN3Cqm8n5uoM
	 j11KT46ptOs5+I2fNvi7NhXOCIN4ql3jalKUb3FxuhwkHAhseYNlwVX8k6zO8tE7CD
	 xnzJSyG++LBVg==
Date: Fri, 30 Jun 2023 00:13:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 01/10] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <20230630-detection-jogger-c60ea71ee6b6@spud>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
 <20230629-fruit-syndrome-74e32af9c8ad@wendy>
 <CALs-HstMTxJFHEoSCaAUtYzT+a-2RSYAhWMQmkVw2+WE=y0agQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HstMTxJFHEoSCaAUtYzT+a-2RSYAhWMQmkVw2+WE=y0agQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_161328_993085_0E957ABC 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8584047783579271795=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8584047783579271795==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Op4eXmT/eGWY9/iV"
Content-Disposition: inline


--Op4eXmT/eGWY9/iV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 04:10:48PM -0700, Evan Green wrote:

> > +               print_mmu(m);
>=20
> Did the indent get wonky here or am I just seeing it wrong because gmail?

Nope, you're right. Thanks!

--Op4eXmT/eGWY9/iV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ4QEgAKCRB4tDGHoIJi
0vq+AP98TaZYGhjpm9uC0HHIvRVzFL0ZATKN5slrUBu8PZ27QQD/VZKNm18gMlPa
SPpca1cy7ZS/8C5V+Sui5QYuupbzFAo=
=6I9B
-----END PGP SIGNATURE-----

--Op4eXmT/eGWY9/iV--


--===============8584047783579271795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8584047783579271795==--

