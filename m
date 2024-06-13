Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3D0C27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfUKXFjazqnfKYR5uqGL40nKKeMkgERv+Wi4K5H6a8Y=; b=wAleGloU2wssVTnCmshTlVM/zR
	ORj3Hc00AGDEZh5eMz/2DpXil8aj3J6vbdxytdSI4AYd0nQU5qp4NSBosrPYiGYFzqf0YB1wNlGZZ
	+adgG3j+V/4L18nLgulN+8ytd2yi3ZNaZU91szhjwpuwu2Ie6h4nyMnoEJzr5Yg3qdwcpiStSp3xH
	lSWYBNJu+YBzc8wHCDR4ntAOIWWYq3+o1y8Mb+hTPka/vj8AkITyYWewp672G6Vs30PbC46UKpTjX
	D08/eULklgM6ItFB9D2YelDjjc0rO8jQg2KMng8CdnlXB3WvMy4mp1NVgQidJAHAc38FRtsjdGIXG
	yy3/5AeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfCw-0000000FYPO-1VzN;
	Thu, 13 Jun 2024 07:49:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfCu-0000000FYOG-0ZZk
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718264955; x=1749800955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tOsnQVOFTDPDAjyXqM6o5BX1/ALySEuh1yBpE5U5t04=;
  b=HMvLdNuoCW8QchGY2gQAkxqeLGY+6ijhiwXQECNNzQ9dNSYAPU6ZI+2B
   tsuWMRPLjwamHRPaWi1C73VEhpuYAJFSdL5PLMk9Uj+Ap+WnmAPLE0C2B
   CdlC6Xd4IYdnIO7u5v6rgXOnuLgT3hVs6dyPltUYu18kC4YPcocFZfxh2
   pe2wm2SRGIi4NXPrQQcBDxwlhO+UmkbrCMLTpSJbo5dimubNJgR6M8d+h
   k3eCjlvuMmXcoeK3jst2qROa0TjIfRWnLHTmvUWvwylb8EUvLlLhCUmZT
   RUd+8Hu1/hADsZ8wJdlM4NsfTlWdoM3ICnjVuKqZ20aqtg4SSzn2bqqSa
   g==;
X-CSE-ConnectionGUID: HD7DQktUQset5I4Uvw9H8Q==
X-CSE-MsgGUID: EH4vLWffT2uZaRrw4Ct1EA==
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="asc'?scan'208";a="29819693"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jun 2024 00:49:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 13 Jun 2024 00:48:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 13 Jun 2024 00:48:51 -0700
Date: Thu, 13 Jun 2024 08:48:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt
	<rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Andrea Parri <parri.andrea@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Fix early ftrace nop patching
Message-ID: <20240613-lubricant-breath-061192a9489a@wendy>
References: <20240523115134.70380-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240523115134.70380-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_004916_259852_855A5C34 
X-CRM114-Status: GOOD (  20.99  )
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
Content-Type: multipart/mixed; boundary="===============5083338059289107961=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5083338059289107961==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ucH24q+vfrE+sERa"
Content-Disposition: inline

--ucH24q+vfrE+sERa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 01:51:34PM +0200, Alexandre Ghiti wrote:
> Commit c97bf629963e ("riscv: Fix text patching when IPI are used")
> converted ftrace_make_nop() to use patch_insn_write() which does not
> emit any icache flush relying entirely on __ftrace_modify_code() to do
> that.
>=20
> But we missed that ftrace_make_nop() was called very early directly when
> converting mcount calls into nops (actually on riscv it converts 2B nops
> emitted by the compiler into 4B nops).
>=20
> This caused crashes on multiple HW as reported by Conor and Bj=F6rn since
> the booting core could have half-patched instructions in its icache
> which would trigger an illegal instruction trap: fix this by emitting a
> local flush icache when early patching nops.
>=20
> Fixes: c97bf629963e ("riscv: Fix text patching when IPI are used")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cacheflush.h | 6 ++++++
>  arch/riscv/kernel/ftrace.c          | 3 +++
>  2 files changed, 9 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm=
/cacheflush.h
> index dd8d07146116..ce79c558a4c8 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -13,6 +13,12 @@ static inline void local_flush_icache_all(void)
>  	asm volatile ("fence.i" ::: "memory");
>  }
> =20
> +static inline void local_flush_icache_range(unsigned long start,
> +					    unsigned long end)
> +{
> +	local_flush_icache_all();
> +}
> +
>  #define PG_dcache_clean PG_arch_1
> =20
>  static inline void flush_dcache_folio(struct folio *folio)
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 4f4987a6d83d..32e7c401dfb4 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -120,6 +120,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ft=
race *rec)
>  	out =3D ftrace_make_nop(mod, rec, MCOUNT_ADDR);
>  	mutex_unlock(&text_mutex);

So, turns out that this patch is not sufficient. I've seen some more
crashes, seemingly due to initialising nops on this mutex_unlock().
Palmer suggested moving the if (!mod) ... into the lock, which fixed
the problem for me.

> =20
> +	if (!mod)
> +		local_flush_icache_range(rec->ip, rec->ip + MCOUNT_INSN_SIZE);
> +
>  	return out;
>  }
> =20
> --=20
> 2.39.2
>=20

--ucH24q+vfrE+sERa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmqkUQAKCRB4tDGHoIJi
0m3VAQDMZOg52eVsvZthKmdZBM/Y3SXPrObGxlcvKyFsEVooWQD8C8VClKYq1GTX
I/KHs08ahGuI+30Vfq/MEeFlrbU1AgU=
=hljr
-----END PGP SIGNATURE-----

--ucH24q+vfrE+sERa--


--===============5083338059289107961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5083338059289107961==--

