Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C28CDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QbY+ieMv3VmUNaLuU5Q1tq7Sbb4Io+ZULZ0iK6UWOs=; b=uUFzP97G2DqmNlavLzOwNal6Q9
	JPdPqQi98sKHn9TRMe95uc8oH/W+pK7cFZq9RUsPGvWzF2O9nunVQF0JSs+sX2QUDUofBM+ku5c9s
	xsxpsU5BZLPI+NSB5ZWE9meqPn3Gb3OewHyqZCjYDrE88BebwwuB4ilLuLw2ozYP2r66npLUODSC8
	Pb/7D9B9dtJN7hPjfCUk/VEJHyQtWtyTmG5O5JTGP4+RYST0Gqbz4NvJ9Y8GlnIe2K9DYMIQPUinA
	A6hMlRE6lb6ddMNqjXUkHOL8ti5kioGcZ4Ipj+lfNt1U6NOzhuyXIcGUbdSdddhc7wfooVCA/p/M2
	nSLcg0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqw0B-0016nO-1g;
	Thu, 12 Oct 2023 13:45:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqw08-0016mk-1V
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D789FCE26FB;
	Thu, 12 Oct 2023 13:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618C0C433C7;
	Thu, 12 Oct 2023 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697118318;
	bh=YQ5wJcHY0hDgkgyDHoQtSOxSAeunkdw2c4W88ualWMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PApzEjNBlbCWU+ufOksWts9qJ+I4v1dtZGRckTdsjSEF78W6W0VQnGWpssXDbSXK7
	 lfRjTQvFy8gMkmKEbAgwhTgV/RdTLUCR9asvT9G1ifCU9FQmzfvNZ/pdpIMX2dA4ID
	 w+ilFGcUlWl4vfMhPP37Scqy5POMVUTaLD5BPxlf3N+kKkz7njkHofORIuFQd19SVU
	 euy8aT1kkdx4mXQJ+94Cex7l92O95PRvbfcpaKM4UCPW4GM2ca6mPvRDxpTg489yLl
	 gROgbJ7sadFoqL5uGdMgsaAG+vjGWxebQ1fZQPK7XQdBA7BlVhL7po0M/r1x3Ql8ux
	 R8cRAeTKSewvA==
Date: Thu, 12 Oct 2023 14:45:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 2/6] RISC-V: Move the hwprobe syscall to its own file
Message-ID: <20231012-geologist-ramp-71c76a4305c7@spud>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-10-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231011135610.122850-10-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_064520_715145_D440ED3A 
X-CRM114-Status: GOOD (  10.39  )
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
Content-Type: multipart/mixed; boundary="===============3621349117903213122=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3621349117903213122==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dW8SvBhNRQ8hhPVN"
Content-Disposition: inline


--dW8SvBhNRQ8hhPVN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 11, 2023 at 03:56:13PM +0200, Andrew Jones wrote:

> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * The hwprobe interface, for allowing userspace to probe to see which features
> + * are supported by the hardware.  See Documentation/riscv/hwprobe.rst for more
> + * details.
> + *
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2014 Darius Rad <darius@bluespec.com>
> + * Copyright (C) 2017 SiFive

So uh, this is all new(ish) code, originally written last September,
that is being moved, right?

--dW8SvBhNRQ8hhPVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSf4aQAKCRB4tDGHoIJi
0viTAQDQUCsGBYCq0jR6zbinXT/iNqohxwwGfxY2gxUVEa2daAEA8VaDBjKWWein
6FOC0dQwiVErYXFAhkZ6k87u4DVlqgc=
=iMIN
-----END PGP SIGNATURE-----

--dW8SvBhNRQ8hhPVN--


--===============3621349117903213122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3621349117903213122==--

