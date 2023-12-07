Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5196C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX6uyI1gQem56SfCQpJL8d3sGfJ/njd6D50EfbWqYt0=; b=tQicMymU8nEKK7jlByZzj+n56/
	6geaRQ1826mBUPej+KCkKOT49sLNgGYz1cNZBtmz9StZfOnq7EfRxZhQ8fjQpktBGKBZ1neTyu9Yi
	21aAU9Kw8Nc4yiCG+hZCHQ/Jn1v3LPGvadjsixV+ctVdA1vf6Lt3eTbAYsGWGmsxF9+cve0ylQfp9
	HPaaGg/j5Md3uVBApBZbqj/Jz+3Opux4O1vuA4pG1z3xmBpS6LCxOSl0niurZRQhRdzrE250/uddd
	oNYZk7QBkiS1UUOxnyWJEcsGAei/YXzZ5RmGPLQvrr4GfXD7/Lq2Vy2QcRA08RPqdq7avpOGgRrss
	1FYTH0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBF23-00CyaI-2F;
	Thu, 07 Dec 2023 14:07:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBF20-00CyYP-0p;
	Thu, 07 Dec 2023 14:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701958032; x=1733494032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FcrSijvE4f1IkcQ97V2bhaESClswu8A2/SLJLTjyLy4=;
  b=uCipT4cx+5Fe4kBL6ftpZguN8Pm58y1oUFFFeWD3GfNRFG23344bdeed
   vkcKE8Sz1iB3yd3beKMdYJad3lpJ1ppGq4rEgUZ3OQumfkqiWNHo+wMCb
   2kGz2AKibT7wyGkRPrDLmSIqRgvNtO258Fmkadc9U7Mw9No6p1tT6GCou
   gs5hJJsDpj1c2KOyzGR+pmIXf3Ej1n334l/RVpJnuMOgMvN50rU7apj6A
   tEWU2UvzEQsSRw9yyVbXzXg4T+afqR/U2YJCBaHfhW16MgCrsN+xJQMjE
   uhj8qS3laEr7bBKqPsYeP7mBIZNLNGK9s0yOhGGtfAjLPGDb2uly2DDIw
   g==;
X-CSE-ConnectionGUID: eIjt9fRyQI+quPyqXbhx+Q==
X-CSE-MsgGUID: 2932n12QQ/O+STS0j5Z9cA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="180086965"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 07:07:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 07:07:10 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 07:07:07 -0700
Date: Thu, 7 Dec 2023 14:06:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<virtualization@lists.linux-foundation.org>, <anup@brainfault.org>,
	<atishp@atishpatra.org>, <pbonzini@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <jgross@suse.com>,
	<srivatsa@csail.mit.edu>, <guoren@kernel.org>
Subject: Re: [PATCH v1 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <20231207-kindling-upgrade-22d29116ccf3@wendy>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
 <20231205181119.207204-19-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231205181119.207204-19-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_060712_496063_174BD1DA 
X-CRM114-Status: GOOD (  11.44  )
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
Content-Type: multipart/mixed; boundary="===============3796871273016014605=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3796871273016014605==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ewSSXgzOuaTlaZW"
Content-Disposition: inline

--8ewSSXgzOuaTlaZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 05, 2023 at 07:11:23PM +0100, Andrew Jones wrote:

> +static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
> +					unsigned long flags)
>  {
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
> +			lo, hi, flags, 0, 0, 0);
> +	if (ret.error) {
> +		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
> +			pr_warn("Failed to disable steal-time shmem");
> +		else
> +			pr_warn("Failed to set steal-time shmem");
> +		return -ENOMEM;

btw, how come this is an ENOMEM and not a propagation of the error from
the ecall?

> +	}
> +
>  	return 0;
>  }

--8ewSSXgzOuaTlaZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXHRbQAKCRB4tDGHoIJi
0qaSAQCrWAPSqAvfzE2m8SQ/25FLnCV29+FUxC/4XmtNTzii/AD/UVtOcM36NryL
rFVl/FEY88aDf13VTFCOtAejMbOHXwo=
=krKo
-----END PGP SIGNATURE-----

--8ewSSXgzOuaTlaZW--


--===============3796871273016014605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3796871273016014605==--

