Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FE5EE36AE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcEtlxvizEDf4jLPrjnHTX3/DmTWnBo0/Yka8lccyL4=; b=mmL0320XwZxtl/YbGv0Bs9o385
	BQX3Bf/j0sqpJ86I2mc3H6pKkwY7NopFH7Tza9X32PDDeMCFta2cS/UDTlRmCreVYzd8HoF8NlvzE
	d4ec6Ra0h0V1Ta7MbY0QFtoSiriKN9Kwzh6NvqKKx2QPj/nrjNj/q1fBbjIHSRaPj1WYAltxGXr1w
	OCg2SivkwPxpm5PQDAY66M+AkZJyEwF/W7zDtG2aiAVQrb8xMmYlSgKXQd7RR3Ehd+SQpeM2n9eNA
	3Nx1reKUQTMbZRJkEmHWJtPJKJYGuGtDhNjxmmc522cZ3NruMf24d8XgY1gvhkvhmbeD40/ns09fQ
	KeeLDkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaqM-00000002TdN-12uM;
	Thu, 12 Feb 2026 17:51:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaqL-00000002TdF-1CHB
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 17:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5255360010;
	Thu, 12 Feb 2026 17:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8ABC4CEF7;
	Thu, 12 Feb 2026 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770918668;
	bh=tVbscBlvX5MU2g7eUlmicDhpSLT1c7Ut0PUEhqLNj3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXohiu/cw0WFXN3JZsxH8Sn6Z84OMl1RNtywe32HxNJ551oHkNj5ag15e7F/H5Ixe
	 6/G+FbTC7tty1yd4L8STBsbinEQxtTC8+JAX+BPPvQZGN9mQWGgwSRe457m3WGUx7i
	 XSWCMlMuUi2t18x2MyKEsc6WVaIvKwrpBOcWAK2L+J2EeYPITg1Ls30JT95mZ4R3I8
	 E8L7tESZpXojzlKlRlxhmXJZoBj9eB2iABuuB5GSqYHlCWlmVyBYwghWua7GrKXt/U
	 ThWxO43c50S+5Codli85URNz84hekLsNx6lGvbGBE8vY7+0pF5uacU/7vM4qSGAU5s
	 jukPg3XSI2jRA==
Date: Thu, 12 Feb 2026 17:51:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Sean Chang <seanwascoding@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix various typos in comments and code
Message-ID: <20260212-rush-exclude-b292151e13a3@spud>
References: <20260212163325.60389-1-seanwascoding@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260212163325.60389-1-seanwascoding@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0927735595254507284=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0927735595254507284==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ALjf8vcF+BVGhfLH"
Content-Disposition: inline


--ALjf8vcF+BVGhfLH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 12:33:25AM +0800, Sean Chang wrote:
> Fix various typos in RISC-V architecture code and comments.
> The following changes are included:
>=20
> - arch/riscv/errata/thead/errata.c: "futher" =E2=86=92 "further"
> - arch/riscv/include/asm/atomic.h: "therefor" =E2=86=92 "therefore", "ari=
thmatic" =E2=86=92 "arithmetic"
> - arch/riscv/include/asm/elf.h: "availiable" =E2=86=92 "available", "coor=
espends" =E2=86=92 "corresponds"
> - arch/riscv/include/asm/processor.h: "requries" =E2=86=92 "is required"
> - arch/riscv/include/asm/thread_info.h: "returing" =E2=86=92 "returning"
> - arch/riscv/kernel/acpi.c: "compliancy" =E2=86=92 "compliance"
> - arch/riscv/kernel/ftrace.c: "therefor" =E2=86=92 "therefore"
> - arch/riscv/kernel/head.S: "intruction" =E2=86=92 "instruction"
> - arch/riscv/kernel/mcount-dyn.S: "localtion =E2=86=92 "location"
> - arch/riscv/kernel/module-sections.c: "maxinum" =E2=86=92 "maximum"
> - arch/riscv/kernel/probes/kprobes.c: "reenabled" =E2=86=92 "re-enabled"
> - arch/riscv/kernel/probes/uprobes.c: "probbed" =E2=86=92 "probed"
> - arch/riscv/kernel/soc.c: "extremly" =E2=86=92 "extremely"
> - arch/riscv/kernel/suspend.c: "incosistent" =E2=86=92 "inconsistent"
> - arch/riscv/kvm/tlb.c: "cahce" =E2=86=92 "cache"
> - arch/riscv/kvm/vcpu_pmu.c: "indicies" =E2=86=92 "indices"
> - arch/riscv/lib/csum.c: "implmentations" =E2=86=92 "implementations"
> - arch/riscv/lib/memmove.S: "ammount" =E2=86=92 "amount"
> - arch/riscv/mm/cacheflush.c: "visable" =E2=86=92 "visible"
> - arch/riscv/mm/physaddr.c: "aginst" =E2=86=92 "against"
>=20
> Signed-off-by: Sean Chang <seanwascoding@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ALjf8vcF+BVGhfLH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaY4TBAAKCRB4tDGHoIJi
0qx2APwLMPaOJdTCJZ77zwBCcoJxv1OCebheJ1jz+NzZZsQBPQD9GI14E6hJEgbP
qoq+dOR1vc4ktT34X8O8lg5uew2cfQ0=
=1pzJ
-----END PGP SIGNATURE-----

--ALjf8vcF+BVGhfLH--


--===============0927735595254507284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0927735595254507284==--

