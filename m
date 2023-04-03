Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7116CC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 09:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCJXv1XqOOnj0biO5XwP0LD5nqEl2NnTA9GOlWHhABw=; b=ZNBBvOjXxVkG5OTmJkZc05c0iN
	TrOEjfDQSwI0bnr4oC7wE53J6hCAtAJxSrtJe79BbVt5XzWaLTncamRugR5H49DuoLmG0uwVN4BSS
	mmT2F9EWgQrRab4q4i3fkidD0tW00WVY0JxYXysJBSxpKLWA5Rw7ahQJCiAtZyKT4aET6Qy8IdjJG
	9GzfPoXZCJic5caiGqF9KY/iBwH3v6a/ZGG81ak9xFyQkAhKQTF42LZnSgoOJvktuouTFl5EPcoG+
	pD6EwdLUB45Bq1WWoXYUP0O740fbLQErFaUQnjTZCGRHaXnptLQNM9UI0Xtu5C+3JPoeLVuG+gj/K
	peTMTJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGfa-00ElDm-14;
	Mon, 03 Apr 2023 09:40:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGfV-00ElCO-2K;
	Mon, 03 Apr 2023 09:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680514805; x=1712050805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFKq8L4uhXOKBPkBPlGji3aE5ZbKk+WcLtn0OrClLrI=;
  b=I6NHClE+rMK/bDWuqp3Sm/ENoDClk3CPgoIBlUZd+nNq656a7wFV/rw7
   WjjCA8gdTsTb0NgZaku+J2Neh184Z/Pzk1Zy1CFMbFG2HOC84XJ4bHgsE
   pEpFU1PwO7iiIw81vdIlhJyVL/phLTQGktrevdafj+lw7si9uONI5mlVC
   3fT441dRVDXpZTbs+0TvJNvD4zh9hr3mVN2d96LFy9Tx847/8dmhxLSto
   zZRwDLaI2Tyuue0mY0PCZcR9mb72Tbx6YfAq7uHG3kBmKymjQXnnIHv0O
   Jo6kCvizEG1jPDk/iqUMytC/H51GU3/BuA8FvwR92rlsnKJ7RXy2w36d7
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,314,1673938800"; 
   d="asc'?scan'208";a="219147455"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 02:40:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 02:40:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 02:40:00 -0700
Date: Mon, 3 Apr 2023 10:39:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Anup
 Patel <anup@brainfault.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 2/8] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <20230403-80af54e80a34fc70fad04e0c@wendy>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-3-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230403093310.2271142-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_024005_818834_5A459D16 
X-CRM114-Status: GOOD (  10.29  )
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
Content-Type: multipart/mixed; boundary="===============3468354287656923608=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3468354287656923608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OGdrsm9wa6bk/U+d"
Content-Disposition: inline

--OGdrsm9wa6bk/U+d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 03:03:04PM +0530, Anup Patel wrote:

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 59d58ee0f68d..1b13a5823b90 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -221,8 +221,10 @@ void __init riscv_fill_hwcap(void)
>  				}
>  			} else {
>  				/* sorted alphabetically */
                                   ^^^^^^^^^^^^^^^^^^^^^

> +				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> +				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);

This entry has been added in an incorrect order chief :/

>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
>  				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);


--OGdrsm9wa6bk/U+d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCqe4QAKCRB4tDGHoIJi
0gt+AQC9yRaN+dKTHz7fyAJWu/44+2C9yyyQhdoeOwofaMhPEAD/W0Yk90pvYVJv
dura6pOmVWifrUHBvPFooyq5BM5GIQA=
=h69e
-----END PGP SIGNATURE-----

--OGdrsm9wa6bk/U+d--


--===============3468354287656923608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3468354287656923608==--

