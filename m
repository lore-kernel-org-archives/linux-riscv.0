Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876D4C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 21:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0c4T51XlUXlLzhjYZFUAv6DTMiTDoOxflHTMLMbVoQ=; b=m6Lp+6pKf02P+ATECRPAyKIhUH
	bkYNgv+Cw/qX+4nNbDjgc1tQp+BAwzey2FcIuSyz38NUNddbRYJTMJF5QatCrP1NIE7fDywcdh1Pq
	wRr5qCSsK/Gsm2IljM6dHirMOTXuOjRzn8yEP5+SGQVhL/tAbGhx551jRHD954fwQg9BdEE5Tm17+
	gNBa6jnSOJWesMLxzFvCPHg2jVanewOkI9igef1zGNOulvB52VwPTCMNfhlb74EuV2MOTTi6959Bz
	VLNiYkYYkgImzJh12H69VdwOlgsXsswJ0cNeUtWeVoLiS/HDV/VmotKcBGKxk2CVZzxbe0NBznQPm
	Sn4AAZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS33W-003dLz-BN; Tue, 14 Feb 2023 21:41:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS30l-003c7h-P5
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 21:38:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B33B2B81E9A;
	Tue, 14 Feb 2023 21:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C8FC4339B;
	Tue, 14 Feb 2023 21:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676410728;
	bh=6jbhCugUXCS4XCdW63SXO4wmvPiA/c8ygiTvvYBz15w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpGAwpRsBKElwLUHUGFBFZvMltk/e1tfCNqYocBpogklr9EhyLK6YgLZEDnUK5f9q
	 QLzJChn2wwaQzXjtqBo1ySt+YsLn8nLrF96ustKi0Q4ik3eusoA37QFmd1198YVvtk
	 7y7Ce4OysTBPGyLGb/AQ6Rkvq2kv/KAKKAl0Hu+HD2lQL57fQsH3KJRlGsZ5HsE9gz
	 anFPTbfyrPWRYrCdu8XZ4nzYQJ26EGcaChJTVVFwA+Wt4kGyM1U7BnKAOOVtgkLPKV
	 gVgFeTKV6/SfaBb87/q7EuzesfHEhCaifbTXK5r0EzRvTTLzw8EeI2HOe8bJHnerLc
	 KFIetAPy9oNLA==
Date: Tue, 14 Feb 2023 21:38:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com,
	heiko@sntech.de, slewis@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sunil V L <sunilvl@ventanamicro.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] RISC-V: Move struct riscv_cpuinfo to new header
Message-ID: <Y+v/Yu/ELfzx954s@spud>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-2-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230206201455.1790329-2-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_133852_046419_FC04D8AC 
X-CRM114-Status: GOOD (  21.51  )
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
Content-Type: multipart/mixed; boundary="===============5549326094249523601=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5549326094249523601==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f5tYJzmdjbJLMszm"
Content-Disposition: inline


--f5tYJzmdjbJLMszm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 12:14:50PM -0800, Evan Green wrote:
> In preparation for tracking and exposing microarchitectural details to
> userspace (like whether or not unaligned accesses are fast), move the
> riscv_cpuinfo struct out to its own new cpufeatures.h header. It will
> need to be used by more than just cpu.c.
>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
>=20
> (no changes since v1)

Really? I don't recall seeing this patch in v1? ;)

>=20
>  arch/riscv/include/asm/cpufeature.h | 21 +++++++++++++++++++++
>  arch/riscv/kernel/cpu.c             |  8 ++------
>  2 files changed, 23 insertions(+), 6 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cpufeature.h
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> new file mode 100644
> index 000000000000..66c251d98290
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2022 Rivos, Inc
> + */
> +
> +#ifndef _ASM_CPUFEATURE_H
> +#define _ASM_CPUFEATURE_H
> +
> +/*
> + * These are probed via a device_initcall(), via either the SBI or direc=
tly
> + * from the cooresponding CSRs.

May as well fix the typo here while we are moving the code & a respin is
required anyway.

I'm sure we'll need this patch regardless of approach, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--f5tYJzmdjbJLMszm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+v/YgAKCRB4tDGHoIJi
0tZUAP9alaj90UKMameldRPMqw+IPDy0llCUwKgwfXm1M4dLnwD9Fs25ZbsYQRWN
myGAiC3u18dRkuCDk/kRsy20aoskSQU=
=mKq5
-----END PGP SIGNATURE-----

--f5tYJzmdjbJLMszm--


--===============5549326094249523601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5549326094249523601==--

