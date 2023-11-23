Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC92C61DF7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgrqHO6sPKRZOZDqwOOf8PBylGdBF3t4F+Tq1E4TTN4=; b=T5rXdlxu5A3KDMHPRfyP54Od4r
	7xl/zJ5Bb0J3By+DMTs3r8RfzDcxDJwnWS/geRtsD600Jwnv/2brxQPuNIPM4EqmSb2wE9FxSN7x1
	IqJIIaGHodS6A3w+2f5ivQo/EmSy3nu0tTusiWZz/N8y/t1swqyUk/EtNIemPrtyuROhevuG5IZVK
	O/TwI0uykf8KOfEI6lEUSklt2KebDe7k9cpWjIPYfHDroj14VazVYDnFMObRmeo9mnFQz9TAkgGNM
	57Sq60um/YpVxRvrFF1yWroNhA/64b/fQVy4wuE3CZzfCCj6oll1UXQ+DnCnecW0hJgvGFAqBXsdG
	Lf5cJuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6A8H-004xJi-1o;
	Thu, 23 Nov 2023 13:52:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6A8E-004xJ7-1R
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 13:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700747558; x=1732283558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aznKgEjxL0gDCvdqXB2iOl1LmY4FPyCsLGk1PVbiKws=;
  b=iuOe1W5K7eGBBmeh+tzI9X8Gm+YIzreWauc4WaCQ00+nIAidqewWPEH3
   Nkov4VTb/yKeHAkkdgZ0umqpLSSCcOod9BzDo7H9E66XStfRXcxfDwkz4
   horKor8V9BFLlfYA2fffB6sP1ytRl1FnhIXRaYCxt2MWDDK4CzMgUE7zu
   0MWlPkjM+u9tKCNaZVJyTzswImbm7hyZVcuDbMsWnakeDOGI5ESDulZm5
   wpAgQNu6IaIgwA518RnowR0ow+hXfjwYDeMkVfZsYrfYqLDeLM8lwAOQ+
   czCUVpronmptVhz9v3H1o+32thjosg2B2ZuozPduawxLFCSwJl/zCOabx
   g==;
X-CSE-ConnectionGUID: h2V/iXBSSfiFReBxuDFLQA==
X-CSE-MsgGUID: QZh0mXVNQLGVqC67cNRwjw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12193466"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 06:52:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 06:52:17 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 06:52:15 -0700
Date: Thu, 23 Nov 2023 13:51:47 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] riscv: declare overflow_stack as exported from traps.c
Message-ID: <20231123-blooper-very-cefbf92c0f05@wendy>
References: <20231123134214.81481-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20231123134214.81481-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_055238_563693_F0D20176 
X-CRM114-Status: GOOD (  17.22  )
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
Content-Type: multipart/mixed; boundary="===============1281876786023715799=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1281876786023715799==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AAkSMNNL38JK6UIZ"
Content-Disposition: inline

--AAkSMNNL38JK6UIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 01:42:14PM +0000, Ben Dooks wrote:
> The percpu area overflow_stacks is exported from arch/riscv/kernel/traps.c
> for use in the entry code, but is not declared anywhere. Add the relevant
> declaration to arch/riscv/include/asm/stacktrace.h to silence the followi=
ng
> sparse warning:
>=20
> arch/riscv/kernel/traps.c:395:1: warning: symbol '__pcpu_scope_overflow_s=
tack' was not declared. Should it be static?
>=20
> We don't add the stackinfo_get_overflow() call as for some of the other
> architectures as this doesn't seem to be used yet, so just silence the
> warning.
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
I suppose this should also be
Fixes: be97d0db5f44 ("riscv: VMAP_STACK overflow detection thread-safe")

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/stacktrace.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm=
/stacktrace.h
> index f7e8ef2418b9..b1495a7e06ce 100644
> --- a/arch/riscv/include/asm/stacktrace.h
> +++ b/arch/riscv/include/asm/stacktrace.h
> @@ -21,4 +21,9 @@ static inline bool on_thread_stack(void)
>  	return !(((unsigned long)(current->stack) ^ current_stack_pointer) & ~(=
THREAD_SIZE - 1));
>  }
> =20
> +
> +#ifdef CONFIG_VMAP_STACK
> +DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overfl=
ow_stack);
> +#endif /* CONFIG_VMAP_STACK */
> +
>  #endif /* _ASM_RISCV_STACKTRACE_H */
> --=20
> 2.37.2.352.g3c44437643
>=20

--AAkSMNNL38JK6UIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9Y8wAKCRB4tDGHoIJi
0h0SAQDcTTkoh0A97aUVYnh6fGQAyoM9vAAQlKvpypv3AJuD+gEAoEsaf1PuO36l
tNylF+mvaA8289yMcGPGOgABUq/p1As=
=qrsB
-----END PGP SIGNATURE-----

--AAkSMNNL38JK6UIZ--


--===============1281876786023715799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1281876786023715799==--

