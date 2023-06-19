Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734B6EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 18:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOCK46ZeFOOw/5B3SwlwpQFIkNbLHBW8uHo+A3ZxlBw=; b=DBfhAhTIEj709W
	ZZ40aTRSQKeuujhfumAekAyhJr/ouaTUIKAwrTPhHDLUn57CFB90PanzJazvCFRCYZNEDen3V1B39
	ihSOoH8lJ90RWOrGMSVciYPoe8RxM+l4gHxDJhmFd+cqwDs6Zn8HIOBptG4Wvq1PDtey2D6h8LC2P
	DLYmxBFZDPuTn/uVNF67Fh7tLFKYCJVsM7TyOH3mrBeMFm8teoAEsXRH9mkWHg+e3qUFCb1vZwbCP
	vUj7mC5ebV+J63l3VHJp6/VB3FryE8Ha2z5UGIVEkXvdM/g6UpzCaaqeYnNqHtC5av2jroeiW2MLJ
	8g94kOjE90hoyckQzFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBJWk-009BV1-2v;
	Mon, 19 Jun 2023 18:22:58 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBJWh-009BT2-0o;
	Mon, 19 Jun 2023 18:22:56 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qBJVV-000Ryh-FD; Mon, 19 Jun 2023 20:21:41 +0200
Received: from p57bd9486.dip0.t-ipconnect.de ([87.189.148.134] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qBJVV-000OlA-36; Mon, 19 Jun 2023 20:21:41 +0200
Message-ID: <5c66d9a869e24e795ae242598935eddfea095730.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 13/13] sh/kexec: refactor for kernel/Kconfig.kexec
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eric DeVolder <eric.devolder@oracle.com>, linux@armlinux.org.uk, 
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
 geert@linux-m68k.org, tsbogend@alpha.franken.de, 
 James.Bottomley@HansenPartnership.com, deller@gmx.de,
 ysato@users.sourceforge.jp,  dalias@libc.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de,  dave.hansen@linux.intel.com,
 x86@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org
Cc: kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com, 
 christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com, 
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
 hpa@zytor.com, keescook@chromium.org, paulmck@kernel.org,
 peterz@infradead.org,  frederic@kernel.org, akpm@linux-foundation.org,
 ardb@kernel.org,  samitolvanen@google.com, juerg.haefliger@canonical.com,
 arnd@arndb.de,  rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org, 
 sebastian.reichel@collabora.com, rppt@kernel.org, 
 kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com,
  masahiroy@kernel.org, ndesaulniers@google.com, mhiramat@kernel.org, 
 ojeda@kernel.org, thunder.leizhen@huawei.com, xin3.li@intel.com,
 tj@kernel.org,  gregkh@linuxfoundation.org, tsi@tuyoix.net, bhe@redhat.com,
 hbathini@linux.ibm.com,  sourabhjain@linux.ibm.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Date: Mon, 19 Jun 2023 20:21:38 +0200
In-Reply-To: <20230619145801.1064716-14-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
	 <20230619145801.1064716-14-eric.devolder@oracle.com>
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.134
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_112255_455603_3C60CEAA 
X-CRM114-Status: GOOD (  25.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Eric!

On Mon, 2023-06-19 at 10:58 -0400, Eric DeVolder wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/sh/Kconfig | 46 ++++++++--------------------------------------
>  1 file changed, 8 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 9652d367fc37..d52e0beed7e9 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -546,44 +546,14 @@ menu "Kernel features"
>  
>  source "kernel/Kconfig.hz"
>  
> -config KEXEC
> -	bool "kexec system call (EXPERIMENTAL)"
> -	depends on MMU
> -	select KEXEC_CORE
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel.  It is like a reboot
> -	  but it is independent of the system firmware.  And like a reboot
> -	  you can start any kernel with it, not just Linux.
> -
> -	  The name comes from the similarity to the exec system call.
> -
> -	  It is an ongoing process to be certain the hardware in a machine
> -	  is properly shutdown, so do not be surprised if this code does not
> -	  initially work for you.  As of this writing the exact hardware
> -	  interface is strongly in flux, so no good recommendation can be
> -	  made.
> -
> -config CRASH_DUMP
> -	bool "kernel crash dumps (EXPERIMENTAL)"
> -	depends on BROKEN_ON_SMP
> -	help
> -	  Generate crash dump after being started by kexec.
> -	  This should be normally only set in special crash dump kernels
> -	  which are loaded in the main kernel with kexec-tools into
> -	  a specially reserved region and then later executed after
> -	  a crash by kdump/kexec. The crash dump kernel must be compiled
> -	  to a memory address not used by the main kernel using
> -	  PHYSICAL_START.
> -
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> -
> -config KEXEC_JUMP
> -	bool "kexec jump (EXPERIMENTAL)"
> -	depends on KEXEC && HIBERNATION
> -	help
> -	  Jump between original kernel and kexeced kernel and invoke
> -	  code via KEXEC
> +config ARCH_SUPPORTS_KEXEC
> +	def_bool MMU
> +
> +config ARCH_SUPPORTS_CRASH_DUMP
> +	def_bool BROKEN_ON_SMP
> +
> +config ARCH_SUPPORTS_KEXEC_JUMP
> +	def_bool y
>  
>  config PHYSICAL_START
>  	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
