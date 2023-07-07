Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ED8EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2qVoS22BtfjGIYhZcSxuo6K8DCTJe8nE8kf5mfcBkU=; b=q09631lzNxPU+TiLdliYLk6h1z
	LoW51I5aJfPbhjEemaZAU5RUfT2byNWheDQQvPqtX1pAZ/pdHtnjSJe06CGVjTQ9MJsI6EmPHZRhp
	NcI+ZbbRaXvDBVIpYDJrXr9oPd1ox61E8thUisULFfgPWWx1u4SXCqAOBcjyiaEfQSdwFYeKbq4Lx
	lkTjzO9L98WV6tu6PKXB23gri8MdbZrWz3Pr30Abhn3AY7s3Wi4vEIz2lVsrpux5NfWXktCeB+nWK
	vPUml0qZqyErMgqsMm3tp7RveIZ7NCQfZq3VYXsJ8uiA/ER2BeRLg5lZjzZoy+0FRaEGDF2tYpBCc
	Z1mmbMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHiC4-004CKe-2z;
	Fri, 07 Jul 2023 09:56:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHiC1-004CGN-0h
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 09:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688723761; x=1720259761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jeT9ji2Ec6uvJ68iEc6vLZKOvv5MkXwC+a9T9+NYyWU=;
  b=BC9aGp2Ct5t9ScFp0hGCrdEJ81UUvdGPoopvjzyyugmJ0r/WVcLDBg5Q
   dqbt1PidedJUV7UUjDVdcLc5PtySKCa3h5FINONER9LVkow6cn33osbKL
   nNhVoP4wIWWnWYMl+qXbgk/0Yi+L84FlhhHkR4+XUyw6Q0s1h+wh6g13V
   KaP/TedpG0k33JFCyXoxrnsvva+XU8U43VJOeheZBdYoU4Kxfdh6onPk1
   WkVcbZTDACfXvwWAlC8yFI+StYWFm0pXgABiqk/Y8fBLlFmMjdPkUjh0+
   ZIeftJ3Z7Igr5pK6lhCPtUZnSkYL/roDte/LeDgDADCmi+gJbNOPLLJZa
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="asc'?scan'208";a="222547790"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jul 2023 02:55:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Jul 2023 02:55:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 7 Jul 2023 02:55:51 -0700
Date: Fri, 7 Jul 2023 10:55:21 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Re-alphabetize Kconfig
Message-ID: <20230707-contrite-old-0efdb8702633@wendy>
References: <20230706210457.12618-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230706210457.12618-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_025601_416290_C9C0A940 
X-CRM114-Status: GOOD (  14.47  )
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
Content-Type: multipart/mixed; boundary="===============6564966916999061712=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6564966916999061712==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Km6KyxkL0RqlVJxx"
Content-Disposition: inline

--Km6KyxkL0RqlVJxx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 02:04:57PM -0700, Palmer Dabbelt wrote:
> Looks like I missed a few of these, I just stumbled on these again due
> to a merge conflict.
>=20
> Fixes: f32b4b467ebd ("RISC-V: enable dynamic ftrace for RV32I")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/Kconfig | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b49793cf34eb..6553cc6c0858 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -105,9 +105,15 @@ config RISCV
>  	select HAVE_CONTEXT_TRACKING_USER
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS if MMU
> +	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYN=
AMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
> +	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_EBPF_JIT if MMU
> +	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>  	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select HAVE_FUNCTION_ERROR_INJECTION
> +	select HAVE_FUNCTION_GRAPH_TRACER
> +	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
> +	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
>  	select HAVE_GCC_PLUGINS
>  	select HAVE_GENERIC_VDSO if MMU && 64BIT
>  	select HAVE_IRQ_TIME_ACCOUNTING
> @@ -148,12 +154,6 @@ config RISCV
>  	select TRACE_IRQFLAGS_SUPPORT
>  	select UACCESS_MEMCPY if !MMU
>  	select ZONE_DMA32 if 64BIT
> -	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYN=
AMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
> -	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> -	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> -	select HAVE_FUNCTION_GRAPH_TRACER
> -	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
> -	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
> =20
>  config CLANG_SUPPORTS_DYNAMIC_FTRACE
>  	def_bool CC_IS_CLANG

There's a bunch more elsewhere in our Kconfig stuff, but no point
hanging around on re-sorting this stuff..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--Km6KyxkL0RqlVJxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKfhCAAKCRB4tDGHoIJi
0kpQAP94Z6ir4A9cFjmZHdosUw08t0EVWVKYSNtM788HO1vMmgD/eElZMNm58yTF
mEVhVMCtmW1wdwSluAfBO2S8Zn0u4wo=
=y9kI
-----END PGP SIGNATURE-----

--Km6KyxkL0RqlVJxx--


--===============6564966916999061712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6564966916999061712==--

