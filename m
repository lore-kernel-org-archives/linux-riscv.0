Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18370EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRhqcVXwnCWzjFWCDWogRSCLOyng7oy4Bso4oKUyf3c=; b=LvZ4ltv3Cuklk+gTxI0ZLTD3+n
	xD8KkCt2uFWxC/Fpzjprpz/KP1rLhf2lTtXwbtL2Snd9t+ymwKuGLSwTaD5bb/4ojkZsUJGCXLrj2
	NikfTACt2wDRRXRI0Q0rzXfs1YPFfB16X74x+6ACmGvs1uN9ypRQ7IiBYeD6pqyAgUp4aY09X2UKV
	sCgpXVMn3yXjdFD/+ipmDZlIYuMX0Q+VXKEh8kz/175GO4PB0V9b77LZ9m4PNcnGHaVBglqJaGwK8
	mh36ewthlISJ/B0mMLd+u3uxFCvBSqyDUdkw3+NmdF2BCQT9ikVXWArOqfUm97yzo1NsT29D/9p7Q
	eJEUWEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVtO-00APAy-1w;
	Tue, 20 Jun 2023 07:35:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVsh-00AOms-0k
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 07:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687246467; x=1718782467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CiYbGpGxbvQRmBhoQD9BV7+PckOjLQNQDOdLx6nTSIQ=;
  b=EgRo8g6wBOgcD9RHJUwr9rKH52Nrv2zdOxuF1Ti3lq55eOW9PlfYztTL
   buy2gwyr1iBU9g+jtnZ7RTRqythiYyvA5mih5vLgcb0jtaFNQYc2CkCja
   dt4kJl7DC3rReIE1qkgF704DVGIlE08Mj9DNtyEHl0JHECko4SpXcANy2
   AJtgjPAHbyU+VDUqbe6DdfAFDZtO3IHlbgX0OREPGU3dYTshXoMv1zoFp
   aL6geO0i9Rj64QHsQIXiYeARFreky/wctT3EOz1P+8w3efPyw1p+wqp9R
   gWatHal0OhnbE+IhnTX1zXw0+++RlxQm8GorNe8vH23OggHuvrhy7o6M1
   A==;
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="asc'?scan'208";a="218773263"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2023 00:34:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 20 Jun 2023 00:34:24 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 20 Jun 2023 00:34:24 -0700
Date: Tue, 20 Jun 2023 08:33:57 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Fix up some vector state related build failures
Message-ID: <20230620-bagging-swerve-07dbcea6adbc@wendy>
References: <20230619172101.18692-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230619172101.18692-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_003427_455364_AA454BFB 
X-CRM114-Status: GOOD (  19.90  )
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
Content-Type: multipart/mixed; boundary="===============8707928166999248761=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8707928166999248761==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CzEaax3zkomX7UJ8"
Content-Disposition: inline

--CzEaax3zkomX7UJ8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 10:21:01AM -0700, Palmer Dabbelt wrote:
> I get a few build failures along the lines of
>=20
> ./arch/riscv/include/uapi/asm/sigcontext.h:19:36: error: field =E2=80=98v=
_state=E2=80=99 has incomplete type
>    19 |         struct __riscv_v_ext_state v_state;
>       |                                    ^~~~~~~
> ./arch/riscv/include/uapi/asm/sigcontext.h:32:49: error: field =E2=80=98s=
c_extdesc=E2=80=99 has incomplete type
>    32 |                 struct __riscv_extra_ext_header sc_extdesc;
>=20
> The V structures in question are defined for !assembly, so let's just do
> so for the others.
>=20
> Fixes: 8ee0b41898fa ("riscv: signal: Add sigcontext save/restore for vect=
or")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Not the first time you've caught this sort of problem in headers, is
there a particular build that catches these?

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/include/uapi/asm/sigcontext.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/includ=
e/uapi/asm/sigcontext.h
> index 8b8a8541673a..8c8712aa9551 100644
> --- a/arch/riscv/include/uapi/asm/sigcontext.h
> +++ b/arch/riscv/include/uapi/asm/sigcontext.h
> @@ -15,6 +15,8 @@
>  /* The size of END signal context header. */
>  #define END_HDR_SIZE	0x0
> =20
> +#ifndef __ASSEMBLY__
> +
>  struct __sc_riscv_v_state {
>  	struct __riscv_v_ext_state v_state;
>  } __attribute__((aligned(16)));
> @@ -33,4 +35,6 @@ struct sigcontext {
>  	};
>  };
> =20
> +#endif /*!__ASSEMBLY__*/
> +
>  #endif /* _UAPI_ASM_RISCV_SIGCONTEXT_H */
> --=20
> 2.40.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--CzEaax3zkomX7UJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJFWVwAKCRB4tDGHoIJi
0mLmAQCmD8aJmqjVxv+Wrlbnz+Kjx9p5dSdRnHb4ruvtqGNfigD+PJOTOCsc1mT0
VMiU9C9mYrikcGVVIIrSE51oj8wBdAI=
=4xke
-----END PGP SIGNATURE-----

--CzEaax3zkomX7UJ8--


--===============8707928166999248761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8707928166999248761==--

