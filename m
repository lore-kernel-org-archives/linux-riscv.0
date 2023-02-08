Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D310C636D6
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 18:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5JdPrxiI2ozAYBxmVbvWb7ZS5quptvw9L+5OC9vg30=; b=0Jfw2zXiZm5tusy4fQtUYDUkb+
	aR/5NRKHTh6Xn85aicY1lfy725YmPCmOzvVY49oGJpWVLET2bGxoDd+wowchg66lmIbZd9KH/EuNi
	1Fq0H7Dibx2Qoq1lbImW++a4ygh2tFd1iUSD7FQUX+0s98D/aev9+Qk/8h/YYAYRND7NojsPZ1WdV
	u1D75K6lC8tJ+LsVuxkxsliZaUqUwWoB3FD89T+FeKP9EIkZUHqyP2c21/Yh+3xfqW4lbvm1HfSaj
	2ERM6gL6Zb7F4YKPcWKCk21ZA6fVCKehElpH6O589SH/mu57+xeKNg30CrbGzT2G/iBEUwDsw8vI5
	y6m9NGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPpBD-00Gc60-SL; Wed, 08 Feb 2023 18:28:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPpBA-00Gc5W-PZ
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 18:28:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E8871B81F37;
	Wed,  8 Feb 2023 18:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48158C433D2;
	Wed,  8 Feb 2023 18:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675880901;
	bh=h4Z1PtHljHwCVbgMyobf4aJQwDVtpHPPBTMUIZs29Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3eRbsqzEtl0u4K+pBR/uh1MTytXhj7AZOwXNMUUOYm7UpSy4RuCOJdOrHI/HlxNx
	 +TH6fp1qcyG+a0tgA0HNILcVRxHV4yfFQB5woClSttKefRU0kTtrkhr/wWd/S8IcXk
	 rOA52rdu9fss65Fo3PF2lG5oNdJNa+yUKATyq875Kvaijqu12VL8wt3OZSxUympaQh
	 yT+W7N6ofw2unevGSzvVJKYgcwSC7/NVZYrCk/vuMUKYliKpgJ9U2miVbN7Ewkvjui
	 uESzBfK5yX/n37emQJk8dScQ30Vt/TM18Q/DBQZn//ttd66cuRSVEp3NNOAPQ6E3Lu
	 n5wACa15bgCbQ==
Date: Wed, 8 Feb 2023 18:28:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 00/24] Add basic ACPI support for RISC-V
Message-ID: <Y+Ppv6kB1iksf+TF@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_102825_023143_DC4FDCDF 
X-CRM114-Status: GOOD (  13.83  )
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
Content-Type: multipart/mixed; boundary="===============5613278586948880202=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5613278586948880202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3UvAYbWp1U8XT/He"
Content-Disposition: inline


--3UvAYbWp1U8XT/He
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil,

On Mon, Jan 30, 2023 at 11:52:01PM +0530, Sunil V L wrote:
> This patch series enables the basic ACPI infrastructure for RISC-V.
> Supporting external interrupt controllers is in progress and hence it is
> tested using polling based HVC SBI console and RAM disk.
>=20
> The series depends on Anup's IPI improvement series.
> https://github.com/avpatel/linux/commits/riscv_ipi_imp_v17

In the future, please provide links to patchsets rather than "random"
git trees.

> Jisheng Zhang (1):
>   riscv: move sbi_init() earlier before jump_label_init()
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What has this patch got to do with your series? Just something that was
sitting in your tree?

If you need this, it'd be ideal if you would submit *with* the R-b tags
it appears to have had by v6 [1] & add the reason that you need to move
it to the commit message.
In Jisheng's series that was obvious, but this is a significantly larger
series and it is hard to spot your reasoning for it.

Cheers,
Conor.


--3UvAYbWp1U8XT/He
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+PpvwAKCRB4tDGHoIJi
0vPuAP9v5J77SYw+hhwGsTWGrB7BFSWQB+FJSClGtSF9oLyAyQD/eikMzjv2mCEL
dIFF92vSrmUAKvml2Nv8u8CbSJh1RwM=
=oI2R
-----END PGP SIGNATURE-----

--3UvAYbWp1U8XT/He--


--===============5613278586948880202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5613278586948880202==--

