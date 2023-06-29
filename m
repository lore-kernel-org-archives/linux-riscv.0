Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DEAEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykxhOsQ9wFSgS0//k7l2pT4kEWf5i11sXZ/PbHuX0dw=; b=SsDLccwlVf6huQIrE1jXWoTY7M
	33f2Qyzf4EL0o2XsXD0LSmjYYgOInVgYkIToLs/Lr1KIRHAtbTfnTeAjjxfW/yxgyZPCf2JAn9sfE
	YjZk1cRR4uPHjCCigxDgQXI1VM2qeLzaUCUq1i0bgZ9JYT51+ZTA2glVEyM/M6H2ETQ9lVatFN4mL
	WAgs/fgdxSw3HjF8m0Ae6XNrNT1C6d3ZGxz/jKKv/7yfa/L5iV0jA7e3ZK/Fw1OPitHMOsEN05Sxj
	qR8DZyH+7ag1dw7kWDrvNk+1BcQ+A6BzhjrDRWwWk3F8CdWgJkifGIHqAoWHUc3ukTPus+dVdHAX6
	WyBwJ/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEy8X-0023ua-1C;
	Thu, 29 Jun 2023 20:21:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEy8U-0023tz-2P
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 20:21:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A53D361602;
	Thu, 29 Jun 2023 20:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2F1C433C8;
	Thu, 29 Jun 2023 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688070061;
	bh=2EKT9o9WbD2WgjMMeb6vDB+5luSTVPB5AqnS1fbvM3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTU8z7WHkzMQZ4u7FyEQ9zaoyPcYjmdlXtErsodotbsuSoJoqnL1R7Sfu0pfZeAYT
	 9UPoHudNWlEyaRRl3CqrX/FQudXIqyawxYTPZCspkOw0l3J39DpiO5n0CQJJ5MkVzx
	 goYeCw9uUwXnQX6vvJuU0kNwhJ0t3JT50CpYI/kuLTpTLPIY0vjI81OzqIwh43TUkQ
	 wWjBN0RC8Tcqzl3NIItU5Y2NJiqNg0MitcKneSD2XU+AsBXyqZS7BOpdA9rJgY3ZXD
	 FioDma7YBDr2MbG+z7BCHvaJ+dvBFsNaOqvpSj5xLFsBpQTFKAfP1gtlFap9JVAsCL
	 TAkH0+J42EC0A==
Date: Thu, 29 Jun 2023 21:20:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable
 parsing "riscv,isa"
Message-ID: <20230629-landed-popsicle-ab46ab3b46d9@spud>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
 <20230629-resilient-grievance-d782163b09d6@wendy>
 <20230629-a80f112e6ed4158080867694@orel>
 <20230629-deceit-macarena-2a744ac70148@wendy>
 <20230629-11c59410a48bba2c00bb2433@orel>
MIME-Version: 1.0
In-Reply-To: <20230629-11c59410a48bba2c00bb2433@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_132102_888929_F615E9C1 
X-CRM114-Status: GOOD (  54.67  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: multipart/mixed; boundary="===============8978820465018766747=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8978820465018766747==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aUcFPpOKBEUgnTXE"
Content-Disposition: inline


--aUcFPpOKBEUgnTXE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 03:53:08PM +0200, Andrew Jones wrote:
> On Thu, Jun 29, 2023 at 12:39:51PM +0100, Conor Dooley wrote:
> > On Thu, Jun 29, 2023 at 11:31:33AM +0200, Andrew Jones wrote:
> > > On Thu, Jun 29, 2023 at 09:28:56AM +0100, Conor Dooley wrote:
> > > > As it says on the tin, provide a Kconfig option to disabling parsin=
g the
> > > > "riscv,isa" devicetree property. Hide the option behind NONPORTABLE=
 so
> > > > that only those willing to keep the pieces enable it, and make sure=
 the
> > > > default kernel contains the fallback code.
> > > >=20
> > > > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  arch/riscv/Kconfig             | 16 ++++++++++++++++
> > > >  arch/riscv/kernel/cpu.c        |  3 +++
> > > >  arch/riscv/kernel/cpufeature.c |  2 +-
> > > >  3 files changed, 20 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index 1d39efe2b940..0e1909ac5947 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -291,6 +291,22 @@ config NONPORTABLE
> > > > =20
> > > >  	  If unsure, say N.
> > > > =20
> > > > +config NO_RISCV_ISA_FALLBACK
> > > > +	bool "Permit falling back to parsing riscv,isa for extension supp=
ort"
> > > > +	depends on NONPORTABLE
> > > > +	help
> > > > +	  Parsing the "riscv,isa" devicetree property has been deprecated=
 and
> > > > +	  replaced by a list of explicitly defined strings. For compatibi=
lity
> > > > +	  with existing platforms, the kernel will fall back to parsing t=
he
> > > > +	  "riscv,isa" property if the replacements are not found.
> > > > +
> > > > +	  Selecting Y here will result in a kernel without this fallback,=
 and
> > > > +	  will not work on platforms where the devicetree does not contai=
n the
> > > > +	  replacement 	  properties of "riscv,isa-base" and
> > >                      ^ spacing issue
> >=20
> > Huh, weird. Given the tab followed by spaces, it must have snuck in
> > during reflow of the text after some rewording.
> > Wonder how I missed it, given that...
> >=20
> > > Should we also have a kernel command line option, 'isa_fallback', whe=
re
> > > without this config the command line option is not necessary to fallb=
ack,
> > > but, with this config, no fallback will be done unless 'isa_fallback'=
 is
> > > provided?
> >=20
> > I don't know, maybe I have the wrong end of the stick but it feels a bit
> > premature for something that may never not be hidden behind NONPORTABLE?
> > Perhaps that could be left for a point in time where the default value
> > of the symbol changes, or the dependency on NONPORTABLE is removed?
> >=20
>=20
> With the command line option, we could consider dropping NONPORTABLE (but
> still default off this config). What I'm thinking is that if we want to
> encourage the adoption of the new format, then there should be a bit of
> pain when it's not used, but not enough pain to risk rebellion. So,
>=20
>  * defconfig builds will silently/painlessly fallback
>=20
>  * builds that want to encourage adoption enable this config and will
>    fail to boot when they don't get what they want and don't have the
>    command line option
>=20
>  * users still working through the growing pains can manage when
>    the boot fails, and when it doesn't, with the command line

So, something like the following squashed in? I inverted the config
option, seemed more natural that way.

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentatio=
n/admin-guide/kernel-parameters.txt
index d910fba25f2c..6c0d0bc06048 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5437,6 +5437,13 @@
 			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
 			CPUs.
=20
+	riscv_isa_fallback [RISCV]
+			Fall back to detecting extension support using the
+			"riscv,isa" property on devicetree systems when the
+			replacement properties are not found, on kernels where
+			RISCV_ISA_FALLBACK is not enabled. See the Kconfig entry
+			for RISCV_ISA_FALLBACK.
+
 	ro		[KNL] Mount root device read-only on boot
=20
 	rodata=3D		[KNL]
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0370713ad965..a9a473b67182 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -291,22 +291,6 @@ config NONPORTABLE
=20
 	  If unsure, say N.
=20
-config NO_RISCV_ISA_FALLBACK
-	bool "Permit falling back to parsing riscv,isa for extension support"
-	depends on NONPORTABLE
-	help
-	  Parsing the "riscv,isa" devicetree property has been deprecated and
-	  replaced by a list of explicitly defined strings. For compatibility
-	  with existing platforms, the kernel will fall back to parsing the
-	  "riscv,isa" property if the replacements are not found.
-
-	  Selecting Y here will result in a kernel without this fallback, and
-	  will not work on platforms where the devicetree does not contain the
-	  replacement properties of "riscv,isa-base" and "riscv,isa-extensions".
-	  Please see the dt-binding, located at
-	  Documentation/devicetree/bindings/riscv/extensions.yaml for details
-	  on the replacement properties.
-
 choice
 	prompt "Base ISA"
 	default ARCH_RV64I
@@ -857,6 +841,24 @@ config XIP_PHYS_ADDR
 	  be linked for and stored to.  This address is dependent on your
 	  own flash usage.
=20
+config RISCV_ISA_FALLBACK
+	bool "Permit falling back to parsing riscv,isa for extension support by d=
efault"
+	default y
+	help
+	  Parsing the "riscv,isa" devicetree property has been deprecated and
+	  replaced by a list of explicitly defined strings. For compatibility
+	  with existing platforms, the kernel will fall back to parsing the
+	  "riscv,isa" property if the replacements are not found.
+
+	  Selecting N here will result in a kernel that does not use the
+	  fallback, unless the commandline "riscv_isa_fallback" parameter is
+	  present.
+
+	  Please see the dt-binding, located at
+	  Documentation/devicetree/bindings/riscv/extensions.yaml for details
+	  on the replacement properties of "riscv,isa-base" and
+	  "riscv,isa-extensions".
+
 endmenu # "Boot options"
=20
 config BUILTIN_DTB
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e3cda14a486b..52fa607a1691 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@ struct riscv_isa_ext_data {
=20
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
 extern const size_t riscv_isa_ext_count;
+extern bool riscv_isa_fallback_cmdline;
=20
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
=20
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 86a1d98b8b3b..1e4cbdedc7fc 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -81,7 +81,7 @@ int riscv_early_of_processor_hartid(struct device_node *n=
ode, unsigned long *har
 	return 0;
=20
 old_interface:
-	if (IS_ENABLED(CONFIG_NO_RISCV_ISA_FALLBACK))
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) && !riscv_isa_fallback_cmdline)
 		return -ENODEV;
=20
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f6fb18d2af84..5d848b7c1dde 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -471,6 +471,14 @@ static int __init riscv_fill_hwcap_from_ext_list(unsig=
ned long *isa2hwcap)
 	return 0;
 }
=20
+bool __initdata riscv_isa_fallback_cmdline =3D false;
+static int __init riscv_isa_fallback_setup(char *__unused)
+{
+	riscv_isa_fallback_cmdline =3D true;
+	return 1;
+}
+early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
+
 void __init riscv_fill_hwcap(void)
 {
 	char print_str[NUM_ALPHA_EXTS + 1];
@@ -490,7 +498,7 @@ void __init riscv_fill_hwcap(void)
 	} else {
 		int ret =3D riscv_fill_hwcap_from_ext_list(isa2hwcap);
=20
-		if (ret && !IS_ENABLED(CONFIG_NO_RISCV_ISA_FALLBACK)) {
+		if (ret && (IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) || riscv_isa_fallback_=
cmdline)) {
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
 		}


--aUcFPpOKBEUgnTXE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ3npwAKCRB4tDGHoIJi
0rLJAP9etcIUO114tihh69MI5tEvXw2Te4CHN+A5w1radGXVxAD/Vhsf2WtYqSo7
rZCbB2lMWjCKjxfBohCGI8FiPCJOFgA=
=okZX
-----END PGP SIGNATURE-----

--aUcFPpOKBEUgnTXE--


--===============8978820465018766747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8978820465018766747==--

