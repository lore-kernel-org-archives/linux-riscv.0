Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3A6EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMjwTF6aH3U3HBFGeMCKXzCshdRHhOvq2cBBKZc0Qa0=; b=hhJJmgXqhXr3VFAp02v0owBLrI
	Kiauzut+1XQiuMaz1OmpXg30BS6x7YCCMEWy1Rl4365FQlthyQB4vgYLlACJ/fW/pIg2cley0Lu+Q
	7rm/8eXCYKD7w5HkGYSUxDC2+fbHi8XXcKV6soJ0Z4/CKhmETgULJLGYScEAHhn7EmCTV/WIOCUUI
	HPVsPoeW+Pxb/8lbl+lG517qwYFfGcczHholR0uKlsJPMyV1Py42Bphdev+7AUgMopJSyesC4CEQP
	0P8ITzC+fPLSoi9USUrVuJ2EPYT3DYWuDVb560yP8F7KGWQpM817IHiGFgrb9EmTiFv2HWxDfaBo8
	48vfcSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGaE5-00CPFT-2W;
	Tue, 04 Jul 2023 07:13:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGaE2-00CPEQ-1M
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 07:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688454806; x=1719990806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3R780gSrSJ9nAhXyLdyPKWWj43EVLHOBBiNKAgvxGrU=;
  b=EGTyV8a3o/A0hlAbEm9mpDobxTPXlxAS5Nu7e7dVo1SA7L29IetsZmB/
   D+RVDzyXgvp5QizBnYWMWf4PQcP2D/FCpBz/vVm9ai0zkR9B7/1x8uISV
   tNje1/6/yk1ac7USOqCw7/4zx1GvYAmo0WxwoyqDXVaNGI3jglHyAdJM0
   3vZvHPc0V/q9KrX9PO5O4fYGrau+MSh25B5k8r/aymZF3PLq5zU3K8j3t
   gNB+5HsXzN2U6E7r5OWPF+e+1TDXvl7rl7dvLi6ux94tr7jRImhAELz7F
   vWESmGLiFw05qgBconO6b9EF3TaVWpUJ0qH81tFnA/0t7VfMuyl/NPgPd
   g==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="asc'?scan'208";a="221180429"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2023 00:13:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Jul 2023 00:13:21 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 4 Jul 2023 00:13:18 -0700
Date: Tue, 4 Jul 2023 08:12:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: Re: [PATCH v3 11/11] RISC-V: provide Kconfig & commandline options
 to control parsing "riscv,isa"
Message-ID: <20230704-surely-defective-c55f6341127c@wendy>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
 <20230703-greedy-dividable-251fa2b809ac@wendy>
MIME-Version: 1.0
In-Reply-To: <20230703-greedy-dividable-251fa2b809ac@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_001326_467029_A74E6797 
X-CRM114-Status: GOOD (  18.84  )
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
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============3686037790124548097=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3686037790124548097==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M4y9ClbXh4dwVo7F"
Content-Disposition: inline

--M4y9ClbXh4dwVo7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 11:28:03AM +0100, Conor Dooley wrote:
> As it says on the tin, provide Kconfig option to control parsing the
> "riscv,isa" devicetree property. If either option is used, the kernel
> will fall back to parsing "riscv,isa", where "riscv,isa-base" and
> "riscv,isa-extensions" are not present.
> The Kconfig options are set up so that the default kernel configuration
> will enable the fallback path, without needing the commandline option.
>=20
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v3:
> - Invert the Kconfig entry. It's now default y & not hidden by
>   NONPORTABLE, but its entablement will now activate the fallback
> - Add a commandline option to enable the fallback on kernels that do not
>   enable it in Kconfig, as Drew suggested
> - Default the global var to the Kconfig option & override it with the
>   commandline one, rather than have checks for IS_ENABLED() and for the
>   commandline option in riscv_fill_hwcap() &
>   riscv_early_of_processor_hartid()

My own bot reports a build failure for nommu, because of section
mismatches. riscv_early_of_processor_hartid() needs a dose of __init:

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1acf3679600d..208f1a700121 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -41,7 +41,7 @@ int riscv_of_processor_hartid(struct device_node *node, u=
nsigned long *hart)
 	return 0;
 }
=20
-int riscv_early_of_processor_hartid(struct device_node *node, unsigned lon=
g *hart)
+int __init riscv_early_of_processor_hartid(struct device_node *node, unsig=
ned long *hart)
 {
 	const char *isa;
=20
Good aul nommu build, always the one that catches stuff :)

--M4y9ClbXh4dwVo7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKPGXQAKCRB4tDGHoIJi
0rg5AP9PY2fBP1Bcb1QnerRLwimjm13N3bl6EFsys6XQFXHKGgEA1IWYAyQyJYZo
ePxSXe208Sl91eEjos5oE0IwX0ipbgQ=
=YbUb
-----END PGP SIGNATURE-----

--M4y9ClbXh4dwVo7F--


--===============3686037790124548097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3686037790124548097==--

