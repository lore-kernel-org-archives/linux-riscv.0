Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CA9C61DF7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i38ONmdkpsUAUd7fPFiuQrqS2TRbNi4kIy+Sjgrhx1c=; b=MgTqbMaWUEZFNxW6fkqfZiZ25f
	Ltb44H3aEOyyruZg2HkT5YZJpumKa0igCeZBhYOPCtvM6/f1QHVlN9z+j3zfuK+j+Co8pMIGnEtg+
	qsMzU5vvc3TPQc51iS4zGoAViINqzV691V7+KGboHv+Gk6Qa1sLNXGN7avrjk5cKMEhh0Aa7WxJ0i
	SSvMJ9f4Rikw3BWuxw9OP4nvZNhSN3U5+7Bms4LrL5pF/C4C45XQiiuX/3yzKyrmx/43e3tW8/y2l
	Ajdu/uKGV3MRT9Em/nsN/XUG9cGECeqOTzKU8JusGI2+v9oDx5obcQSMt+c3lOnFHufTypjMFtLr1
	8WeOsetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AzL-00541R-2d;
	Thu, 23 Nov 2023 14:47:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AzI-0053zx-2I;
	Thu, 23 Nov 2023 14:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700750849; x=1732286849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MUsg89fQ9NBzKyUbXc1Aej1I5ZOvhdvSHAYt6cV/nr8=;
  b=YDhFm98gdKcKRuWqXngUb2P7RcV+XPjpx63qUM+0H4pCdKbLwG1Db4hd
   m+uSCprBntoEN3ET25z4a3a0Unnlsex3h1N07fUrmVDARc2fkd1q2Hsgd
   TCIIzcbefDno2+1pXmegpEPFR+gmfynW/7EGwpi7Wvurl8M+XdkVOrbJm
   juyaE27KHHTiYg94viOeuyxHYhcw4FIU6O7Yf4EmPVFlt4vjee0qBQV+6
   HWqsBkYiO4Uy5KY2wVUEZLEwW+4r+FQuczXu+uKPFnM0lQm90s4pBYNh/
   A4ePztReHKnU4NEcU0X20jVmCMcsamsDcVqWzLAtmfSDRuPziJyUVLSmV
   Q==;
X-CSE-ConnectionGUID: BE0Y80HqR8yoj+GuwVwALQ==
X-CSE-MsgGUID: b3thrMNzRuC8XgsnWxRyVw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="asc'?scan'208";a="12195934"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:47:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:46:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:46:27 -0700
Date: Thu, 23 Nov 2023 14:45:59 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v4 07/13] RISC-V: Move T-Head PMU to CPU feature
 alternative framework
Message-ID: <20231123-snub-headdress-23a80f001ccd@wendy>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-8-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231122121235.827122-8-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_064728_767351_F6CBE92F 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============4066086175707605911=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4066086175707605911==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u2td/6ehnVJK/j3z"
Content-Disposition: inline

--u2td/6ehnVJK/j3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  drivers/perf/riscv_pmu_sbi.c         | 19 ++++++++++++++-----

> +config THEAD_CUSTOM_PMU
> +	bool "T-Head custom PMU support"
> +	depends on RISCV_ALTERNATIVE && RISCV_PMU_SBI
> +	default y
> +	help
> +	  The T-Head C9xx cores implement a PMU overflow extension very
> +	  similar to the core SSCOFPMF extension.
> +
> +	  This will patch the overflow CSR and handle the non-standard
> +	  behaviour via the regular SBI PMU driver and interface.
> +
> +	  If you don't know what to do here, say "Y".

This is a < 20 line diff to the pmu driver, is it really worth adding
having config options for these two non standard PMU implementations?

--u2td/6ehnVJK/j3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9lpwAKCRB4tDGHoIJi
0p2/AP44N1mho7QcO/007yqDwBgkqYEOvZh2Uuy27l3ZNMV4CwD7BXD0U3yWECON
6d7xv7JjsIfKlCFpYK59CusQR3peRg0=
=tcdb
-----END PGP SIGNATURE-----

--u2td/6ehnVJK/j3z--


--===============4066086175707605911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4066086175707605911==--

