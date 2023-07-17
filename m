Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0E2EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 10:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGquLMgrDwvPzDfCr/OyXEKpjKp5BwWgiTlgNWcMvuw=; b=XTxfSNfhMerlljxCDj+DJkcAEn
	Lkr36IEgR5qWn/QXRaRvpEQfMBdlhZIW6KUiot+rpuK9Guiv+DnPOV5Lai0Z14IkJNdhm3rD6mhgq
	TsOgJlt7H05UJEMqfWmGEW3wRLP2Bplf5Dp/5MQ9G/w6fO9xBpI5twwnTchM2O3RNAmSjQLC6/Qvl
	av1U/hicW2lxa7HyuuOWMPYT124Hvi1pNBy6LvWvE5DdbBRFAMLtPtVPaUfA24xUgxlcSK3/BYHhJ
	pCDzO8E02pQCzxk6Ga9/3GRO/IzTzmp849TvFNXkRnT9QXCSl21rEd1neKKCdgz8OTDki+KH8BhZZ
	ie/my3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLOM-003kH4-2u;
	Mon, 17 Jul 2023 10:23:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLO4-003kFe-1x
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 10:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689589409; x=1721125409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yY5z0dTfZymbPgEwXv6sL9TcA1E2Nl6cy0T/qXpu2e8=;
  b=zn1xZ82znIAoqHRF6jGUy20bcsoojU941pb24H2oVFXytu68RqQ2WEyN
   At8ybLXg7hXl/TMTGtpEPnNiptRDkZu6eih/jGNh8CaNOZq5BnGSlpFRj
   OwAB5m5sV7aOMF6HSk5ler91Tv6efHRXU0RbGDRZp2WCG5Xja9XeKug4r
   h3vZmlaYfFM1JKdOqYkOcLYWkr9DzFi4phJeBICuCdxD6/FeEk5h9zl/q
   snu2X/kqpRI6Em037tDIjMbU8kTHD+2H47jpuJUTYl+mk6UhanSuo4wnB
   MnrzWUdX1PjMTnu7quFRYPklNg/oh4CSaiBhuRqbITZwJK0GwjBO6uSoQ
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="224179077"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 03:23:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 03:23:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 03:23:15 -0700
Date: Mon, 17 Jul 2023 11:22:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, Anup Patel
	<apatel@ventanamicro.com>, <guoren@linux.alibaba.com>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Sia Jee Heng
	<jeeheng.sia@starfivetech.com>, Xianting Tian
	<xianting.tian@linux.alibaba.com>, <anup@brainfault.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <atishp@atishpatra.org>, <vineetg@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Vincent Chen
	<vincent.chen@sifive.com>, <bjorn@kernel.org>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <greentime.hu@sifive.com>,
	<heiko.stuebner@vrull.eu>
Subject: Re: [v1, 2/6] riscv: Add support for kernel mode vector
Message-ID: <20230717-caution-haste-2d9c7b7478b8@wendy>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
 <20230715150032.6917-3-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230715150032.6917-3-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_032328_908781_A9CEE81C 
X-CRM114-Status: GOOD (  29.08  )
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
Content-Type: multipart/mixed; boundary="===============2102736019201516739=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2102736019201516739==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iV/umP/XCrSnL2cw"
Content-Disposition: inline

--iV/umP/XCrSnL2cw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 15, 2023 at 03:00:28PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> Add kernel_rvv_begin() and kernel_rvv_end() function declarations
> and corresponding definitions in kernel_mode_vector.c
>=20
> These are needed to wrap uses of vector in kernel mode.
>=20
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/vector.h        |   2 +
>  arch/riscv/kernel/Makefile             |   1 +
>  arch/riscv/kernel/kernel_mode_vector.c | 129 +++++++++++++++++++++++++
>  3 files changed, 132 insertions(+)
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
>=20
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index a4f3705fd144..9831b19153ae 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -22,6 +22,8 @@
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
>  bool riscv_v_first_use_handler(struct pt_regs *regs);
> +int kernel_rvv_begin(void);
> +void kernel_rvv_end(void);

So, we ditched all of the "rvv" stuff in the last series, using either
"vector" - has_vector() - or "riscv_v". I'd rather not introduce a third
naming scheme for vector related things...

Given what you add below is full of other things that use "vector", how
does s/rvv/vector/ sound here?


> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/k=
ernel_mode_vector.c
> new file mode 100644
> index 000000000000..c0c152c501a5
> --- /dev/null
> +++ b/arch/riscv/kernel/kernel_mode_vector.c

> +/*
> + * kernel_rvv_begin(): obtain the CPU vector registers for use by the ca=
lling
> + * context
> + *
> + * Must not be called unless may_use_vector() returns true.
> + * Task context in the vector registers is saved back to memory as neces=
sary.
> + *
> + * A matching call to kernel_rvv_end() must be made before returning fro=
m the
> + * calling context.
> + *
> + * The caller may freely use the vector registers until kernel_rvv_end()=
 is
> + * called.
> + */
> +int kernel_rvv_begin(void)

How come this returns an int, but you never actually check the result? The
other kernel_*_begin()s don't seem to return anything other than void.

> +{
> +	if (!has_vector())
> +		return -EOPNOTSUPP;
> +
> +	if (!may_use_vector())
> +		return -EPERM;

I notice arm64 takes a stronger approach. There, if the has() call
fails, it has a WARN_ON(). For the !may_use() case, it BUG()s.
Since users are forced to check may_use_vector() before calling
kernel_rvv_begin().

Is there a reason that we should not take the same approach?

> +
> +	/* Save vector state, if any */
> +	riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	/* Acquire kernel mode vector */
> +	get_cpu_vector_context();
> +
> +	/* Enable vector */

These three comments are mostly a statement of the obvious, no?

> +	riscv_v_enable();
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(kernel_rvv_begin);
> +
> +/*
> + * kernel_rvv_end(): give the CPU vector registers back to the current t=
ask
> + *
> + * Must be called from a context in which kernel_rvv_begin() was previou=
sly
> + * called, with no call to kernel_rvv_end() in the meantime.
> + *
> + * The caller must not use the vector registers after this function is c=
alled,
> + * unless kernel_rvv_begin() is called again in the meantime.
> + */
> +void kernel_rvv_end(void)
> +{
> +	if (WARN_ON(!has_vector()))

But there is a WARN_ON() here...

> +		return;
> +
> +	/* Restore vector state, if any */
> +	riscv_v_vstate_set_restore(current, task_pt_regs(current));
> +
> +	/* disable vector */
> +	riscv_v_disable();
> +
> +	/* release kernel mode vector */

Again, comments kinda state the obvious, no?

Otherwise, this stuff looks generally fine to me & similar to what is
being done elsewhere.

Thanks,
Conor.

--iV/umP/XCrSnL2cw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLUWcwAKCRB4tDGHoIJi
0lJzAQD41VZhxqpJpwbWOdKfzg6guhfplhTi5WtOaa33gd6cWQD/YNxLumr8fUg9
z+VXhD7WLQiZeJtqUZK8/r1Ns7oYvgM=
=nUHC
-----END PGP SIGNATURE-----

--iV/umP/XCrSnL2cw--


--===============2102736019201516739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2102736019201516739==--

