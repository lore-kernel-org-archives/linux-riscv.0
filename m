Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA7CEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yVuopIVdsMPtH0BoNiH6eAviltCi/MQTJAtPB2AR7A=; b=Jogwtk3MGlC/cCz+P2JFTf/y6N
	XHCFCyOhR3wqPFBUl+RThSytEAmP72p41wWGPJ1zkIFIzz6t5s2XF3aT4cT1RJsC4RSrP7mOCRAIU
	pOggZVETvIpvTmtfRki95FzggnkjvCS0SNP4wzVOPPvtK+QaOGYQWI1mfprQXyfGZ7b07ew2z0NfD
	XGGrqYcQfKar0bZvxlkBskKk3E7X+2Klo3zvRtPKoM9aSb5xOlfwTaCQSYt+Ijq7Ihg9WvGWZ+MbE
	fCRo6j8XfaoAmJC7GiljyyHpTlYR91FTQJ3GwDlRkalwJRd38OYALeY7siGFtIxfYgYoA8XEQhE6m
	rBsQtFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEQQg-00F9Vy-1d;
	Wed, 28 Jun 2023 08:21:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEQQc-00F9UZ-27;
	Wed, 28 Jun 2023 08:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687940491; x=1719476491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMkXk+bPbzGfZkrBHrsW/8MysrRy74gOjizdruOTAJs=;
  b=kCc1sLeAkRnfbTr4VaoNHqSAsK0+wEg5ztTAfO7ZhX0jRKcf97Fn9qQn
   1t0Z5B4SuCwlIa83rIubOQz8GJGgS6YzyLnLfA0crfLLvpLsGt3LGzmCH
   Bb7xinBaYiEel/kMgj/gev1XxcnqMYEFb3VWa/t5ZPXT1SqkQ8abeSdTm
   /hRuUFty+FTL38GYFxTWw62moUj8dyi0+e2IR5Pg1fP7XA7KNaHlfAvX7
   OdzZba/MW3V0BELU5aj7vHpz+/iptSMppBJLuORgaTd3NXeCQOy6Ummh7
   cWC88RfU3s4fJLXfOH2MDyPCeRJFCzVeW/QwzlW/c5rdlpDhcD1kKWwYZ
   w==;
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="asc'?scan'208";a="220938489"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jun 2023 01:21:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 28 Jun 2023 01:21:15 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 28 Jun 2023 01:21:04 -0700
Date: Wed, 28 Jun 2023 09:20:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Eric DeVolder <eric.devolder@oracle.com>
CC: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <geert@linux-m68k.org>, <tsbogend@alpha.franken.de>,
	<James.Bottomley@hansenpartnership.com>, <deller@gmx.de>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<glaubitz@physik.fu-berlin.de>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-ia64@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sh@vger.kernel.org>, <kernel@xen0n.name>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<hca@linux.ibm.com>, <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
	<borntraeger@linux.ibm.com>, <svens@linux.ibm.com>, <hpa@zytor.com>,
	<keescook@chromium.org>, <paulmck@kernel.org>, <peterz@infradead.org>,
	<frederic@kernel.org>, <akpm@linux-foundation.org>, <ardb@kernel.org>,
	<samitolvanen@google.com>, <juerg.haefliger@canonical.com>, <arnd@arndb.de>,
	<rmk+kernel@armlinux.org.uk>, <linus.walleij@linaro.org>,
	<sebastian.reichel@collabora.com>, <rppt@kernel.org>,
	<kirill.shutemov@linux.intel.com>, <anshuman.khandual@arm.com>,
	<ziy@nvidia.com>, <masahiroy@kernel.org>, <ndesaulniers@google.com>,
	<mhiramat@kernel.org>, <ojeda@kernel.org>, <thunder.leizhen@huawei.com>,
	<xin3.li@intel.com>, <tj@kernel.org>, <gregkh@linuxfoundation.org>,
	<tsi@tuyoix.net>, <bhe@redhat.com>, <hbathini@linux.ibm.com>,
	<sourabhjain@linux.ibm.com>, <boris.ostrovsky@oracle.com>,
	<konrad.wilk@oracle.com>
Subject: Re: [PATCH v3 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <20230628-urologist-faction-42ebe5372206@wendy>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
 <20230626161332.183214-12-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230626161332.183214-12-eric.devolder@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_012130_768510_CF2F5546 
X-CRM114-Status: GOOD (  30.70  )
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
Content-Type: multipart/mixed; boundary="===============4470076760303395697=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4470076760303395697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dNpbxT7522GzDtJd"
Content-Disposition: inline

--dNpbxT7522GzDtJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Eric,

On Mon, Jun 26, 2023 at 12:13:30PM -0400, Eric DeVolder wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the

> equivalent set of KEXEC and CRASH options.

I find this diff a little hard to follow (since the other half off the
change is in another patch), so it may be me missing something, but are
you sure?

>=20
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/riscv/Kconfig | 48 ++++++++++++++--------------------------------
>  1 file changed, 14 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5966ad97c30c..c484abd9bbfd 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -585,48 +585,28 @@ config RISCV_BOOT_SPINWAIT
> =20
>  	  If unsure what to do here, say N.
> =20
> -config KEXEC
> -	bool "Kexec system call"
> -	depends on MMU
> +config ARCH_SUPPORTS_KEXEC
> +	def_bool MMU
> +
> +config ARCH_SELECTS_KEXEC
> +	def_bool y
> +	depends on KEXEC
>  	select HOTPLUG_CPU if SMP
> -	select KEXEC_CORE
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel. It is like a reboot
> -	  but it is independent of the system firmware. And like a reboot
> -	  you can start any kernel with it, not just Linux.
> =20
> -	  The name comes from the similarity to the exec system call.
> +config ARCH_SUPPORTS_KEXEC_FILE
> +	def_bool 64BIT && MMU && CRYPTO=3Dy && CRYPTO_SHA256=3Dy

This looks like a change to me. Previously, only KEXEC_PURGATORY
required these crypto options to be like so, but now KEXEC_FILE needs
them too.

What am I missing?

Cheers,
Conor.

> =20
> -config KEXEC_FILE
> -	bool "kexec file based systmem call"
> -	depends on 64BIT && MMU
> -	select HAVE_IMA_KEXEC if IMA
> -	select KEXEC_CORE
> +config ARCH_SELECTS_KEXEC_FILE
> +	def_bool y
> +	depends on KEXEC_FILE
>  	select KEXEC_ELF
> -	help
> -	  This is new version of kexec system call. This system call is
> -	  file based and takes file descriptors as system call argument
> -	  for kernel and initramfs as opposed to list of segments as
> -	  accepted by previous system call.
> -
> -	  If you don't know what to do here, say Y.
> +	select HAVE_IMA_KEXEC if IMA
> =20
>  config ARCH_HAS_KEXEC_PURGATORY
>  	def_bool KEXEC_FILE
> -	depends on CRYPTO=3Dy
> -	depends on CRYPTO_SHA256=3Dy
> =20
> -config CRASH_DUMP
> -	bool "Build kdump crash kernel"
> -	help
> -	  Generate crash dump after being started by kexec. This should
> -	  be normally only set in special crash dump kernels which are
> -	  loaded in the main kernel with kexec-tools into a specially
> -	  reserved region and then later executed after a crash by
> -	  kdump/kexec.
> -
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> +config ARCH_SUPPORTS_CRASH_DUMP
> +	def_bool y
> =20
>  config COMPAT
>  	bool "Kernel support for 32-bit U-mode"
> --=20
> 2.31.1
>

--dNpbxT7522GzDtJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJvtVAAKCRB4tDGHoIJi
0nmiAQDOO3BHXlme661CQ5d0WA+9UNnblFm/cWV3USIeSzvJAQD9Ev9vbdYVY6Uu
ypalgd3Ta51Btqo6Gv+Pn5Xaf3a3lg4=
=9sLY
-----END PGP SIGNATURE-----

--dNpbxT7522GzDtJd--


--===============4470076760303395697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4470076760303395697==--

