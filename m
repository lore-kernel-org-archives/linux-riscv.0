Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12949C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtoDgbngewinYaWeVvadsc+Eyv+qzoK2Kt88h0nDgB8=; b=UYPxh3UAfLkZB1gwLAvolXFv9F
	qrXX/yC/2643I0s3ZYT+D+NX56WfOx5NV/b22qyYh7XkHbbrYqZJMZ3Hh4AY119I4NrvXdv9NTztg
	cedDTpWL04ciMe0BCn04VfMqXR1Gq1ihtaadcJ9jTR/OOzaGLdMCPNTiTuDN9r4qz8ntDx8ERw+Ez
	Nu8N5p/g26lkLdRp1IijUVkMxmR4xMqg1xBWcjMXATeucjvq9rpl8A5T83+Hv+u5MB8n+zeT6BI8m
	H3ySrOpDW7gAPjyeqisMpEUyUzpZN9byt8Qoy6Bmnq792AwTBIV8L+Wq1wwNZyUrb1Bl1nE2/D0UW
	7BH4Um5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrDI-00000000N3j-3VOK;
	Wed, 06 Mar 2024 13:21:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrDF-00000000N2x-0eIA
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709731296; x=1741267296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x6saRHVg0VfK1dnvwUWzELfx+mRt+YMbrULENEEZOVE=;
  b=B1Unxr3xXjDV5DhfWfZnKy6D7Qju88Q/LT77u6dVZuaCNwgAivVA+4tg
   O682kneFWX9vXFzKLDDWkRshR26O4UNtLQ0yqZJZRGC46/nRfz/hHNCW9
   YknOSXYSGTh8FBCyHGoDK0lRYEktqHzY19jKnEiJmh9gCVCIdyBjp3WHa
   zOXsXVFSTinqG5x1oJxBd33mYLU42qUuJeb5QYPN7QP0V+y5HEaCIrSZU
   ASJ5aXdcWmVIS3U1HRYSr6sKfXRoEFdVVaZqTFQ9WGG71uAZ6d93uB/jL
   PN9O8Es2s4XBWJ8lbhD9BHRIiaLwFftqQlM7qUyFpbMvQqdCTXENrfi8O
   A==;
X-CSE-ConnectionGUID: MbkuSMWuTa2dMHhEfXhTsQ==
X-CSE-MsgGUID: 7mh+FgpZTSy/sDRKCR9T0A==
X-IronPort-AV: E=Sophos;i="6.06,208,1705388400"; 
   d="asc'?scan'208";a="184556607"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2024 06:21:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 06:20:24 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 06:20:21 -0700
Date: Wed, 6 Mar 2024 13:19:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v6 3/4] riscv: Decouple emulated unaligned accesses from
 access speed
Message-ID: <20240306-tactless-decathlon-b0df16517b1b@wendy>
References: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
 <20240301-disable_misaligned_probe_config-v6-3-612ebd69f430@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240301-disable_misaligned_probe_config-v6-3-612ebd69f430@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_052137_282001_1D5026FD 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============0246275115822031236=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0246275115822031236==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0+iLppiDSyfXGqPN"
Content-Disposition: inline

--0+iLppiDSyfXGqPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2024 at 05:45:34PM -0800, Charlie Jenkins wrote:

> -void unaligned_emulation_finish(void)
> +bool check_unaligned_access_emulated_all_cpus(void)
>  {
>  	int cpu;
> =20
> -	/*
> -	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
> -	 * accesses emulated since tasks requesting such control can run on any
> -	 * CPU.
> -	 */

Why was this comment removed? This patch doesn't change the situations
in which PR_UNALIGN is allowed, right?

> -	for_each_online_cpu(cpu) {
> -		if (per_cpu(misaligned_access_speed, cpu) !=3D
> -					RISCV_HWPROBE_MISALIGNED_EMULATED) {
> -			return;
> -		}
> -	}
> +	for_each_online_cpu(cpu)
> +		if (check_unaligned_access_emulated(cpu))
> +			return false;
> +
>  	unaligned_ctl =3D true;
> +	return true;
>  }


--0+iLppiDSyfXGqPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZehtaQAKCRB4tDGHoIJi
0nqQAP9qDs9BXRRIcemNZkKQPjQ7O1zObSc+rYvFSFXl5n2dCgD+LIqa+Incg/HH
X0NiaSTSjXLgY8Y3hcOJ/2aMZ1V8dQA=
=VVCG
-----END PGP SIGNATURE-----

--0+iLppiDSyfXGqPN--


--===============0246275115822031236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0246275115822031236==--

