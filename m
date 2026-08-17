Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76900C5DF7A
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/SPK1G6SwOxNUNgMWtolNRsmcbsuv1RA7K8Xv+xPrU=; b=NOruDw9rP3GWsDhCV+urmIdZun
	nKTNnQHmtCAv10CFe6cnVVKgjTG4vChlx0icJCl0VC5taGu+4f6Zkqsp0WQuGk0DVSuE8jwRV6frG
	+4SrSOZQrAHSlyf26z5zf4T4VWpHGAxoqWLl6iXEwBdlUMjdWhd9687hBVxmWNmaMgvAhoBpMTfJ/
	CJUTT5/PAfG1/9e8eGQWMS/jg8V3GkUT5Ux+LAb175zYn0xKGgMJ9Yxdm20r/VKlCq2d9qLspJQON
	+wfYg1J8S8r0I0r55pdHcny9RTlp3HgFib3jnI5UTcUWUOTsSUkEWEv4YCllKXCc0hCVZYOcAh/K7
	wLp7/lpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvy80-00000006HQB-0Aew;
	Mon, 17 Aug 2026 14:15:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvy7w-00000006HPQ-3FeI
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786976148; x=1818512148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SUNRs3ekH9d7tIDCE+FLtqvCJk4MOw0Hpq23FcS6BcM=;
  b=Z/WZtkyzMVkSYx5yGQ9nOdoOeMgZCjReLDQ6uRkJEB/bYLNftvaIHHjg
   VsHsTjhYRDEohGrM2me82brmpkcG8EEMaJHQ9Lfs6arHk0NNfGBGgccw1
   dJrAa7z7WdcOx3HE8oSJC3RLYTq3Z1/gN0ZzBcoeVwYSI5hg6uwnbrmsS
   Wj/9RUsg2B4bLIWdod+sMQ1AvjZuVNHhriyofkioLJciEjcho2NnyZDMA
   LWEioUEEFrkKODW96yRnj4MIR5sMRZI4zeEaNxzDztte7HJ7A/XC244pk
   xJBLn7BDYv4JczQ3YeSoirPuG9bHhKi78LhvIJeYXGKrV+GuTALGhEbR4
   Q==;
X-CSE-ConnectionGUID: XzMd5B7sTriYVChL9cryQg==
X-CSE-MsgGUID: Cfx/b3YCQ+GVPhdxeXEX2g==
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="asc'?scan'208";a="62555110"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 07:15:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Mon, 17 Aug 2026 07:15:45 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 17 Aug 2026 07:15:43 -0700
Date: Mon, 17 Aug 2026 15:14:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Ivy Lopez <skunkolee@gmail.com>
CC: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew
 Jones <andrew.jones@oss.qualcomm.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: hwprobe: require both F and D extensions for
 RISCV_HWPROBE_IMA_FD
Message-ID: <20260817-unmade-dyslexic-4bb4acf535af@wendy>
References: <20260816003216.22534-1-skunkolee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260816003216.22534-1-skunkolee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_071549_244560_FC222369 
X-CRM114-Status: GOOD (  19.49  )
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
Content-Type: multipart/mixed; boundary="===============3869451153507812737=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3869451153507812737==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n7SigRToBKy0m259"
Content-Disposition: inline

--n7SigRToBKy0m259
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 06:32:16PM -0600, Ivy Lopez wrote:
> Documentation/arch/riscv/hwprobe.rst states that RISCV_HWPROBE_IMA_FD
> means both the F and D extensions are supported. However, the
> implementation uses has_fpu(), which returns true if either extension
> is present, since that's sufficient to determine whether FPU state
> needs to be saved/restored. Reusing it here silently weakens the
> hwprobe semantics from "F and D" to "F or D", giving userspace no way
> to know which extension is actually present when only one is.

The kernel never supports F without D, so this cannot occur.
riscv_isa_extension_available(NULL, f) always returns false if D is not
also present.

If anything, the code in has_fpu() should be changed to only check D and
not F to match expectations elsewhere, or F and D for the same reason.

>=20
> Check both extensions explicitly with riscv_isa_extension_available(),
> matching the pattern already used for the neighboring C and V checks.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221874
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
>  arch/riscv/kernel/sys_hwprobe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 1659d31fd288..7f91beb82a1c 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -85,7 +85,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  	u64 missing =3D 0;
> =20
>  	pair->value =3D 0;
> -	if (has_fpu())
> +	if (riscv_isa_extension_available(NULL, f) && riscv_isa_extension_avail=
able(NULL, d))
>  		pair->value |=3D RISCV_HWPROBE_IMA_FD;
> =20
>  	if (riscv_isa_extension_available(NULL, c))
> --=20
> 2.55.0
>=20

--n7SigRToBKy0m259
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoMXSAAKCRB4tDGHoIJi
0r33AP9xvTpVhoNyjAY90W4COwASd1mqNfOe9G3m5dpok0xXnAEAvta/WYrgdiJS
ph9ufnFx3dNQEarmIui3TUPaJMjtEgs=
=JOkw
-----END PGP SIGNATURE-----

--n7SigRToBKy0m259--


--===============3869451153507812737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3869451153507812737==--

