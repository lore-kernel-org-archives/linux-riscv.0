Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA59EB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 03:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owN3edo8rA7hn/tF/OYor1PZ65SQaCxSoM4CiyXab7g=; b=A7/qdDgclUGhwy
	hIaDJdHwjdTsnzhIFmUFp2fnkHB6HJiGMK1ubgLs57EF4xtiO/y9UtJWF+yMOBG4fBeaiPGBBONi6
	wrVvvNvgtaOUFI35rApuRF1Mymwx/gpDlDTO9W9PLRI/NOnSpDOUp668r/6cc6CwrwozFCvQwpRo0
	8nISytxWcBc7ms+e1SY7QpwdaUc7Izn7g6hQWU7QV69WEzitTMuV4c9o8KjSPw0oXH/KDTOSrC6Rx
	GdD0GdPnwjo7lXOCo0y/Wgl7vZ0Yy0EVJpjElyWv/AkYD7kY0Xtvz1WBmQPbEQD8BzDDUfkrQXRnm
	jec40Vcho01p1TX7qzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9dkn-00DUA9-0m;
	Thu, 15 Jun 2023 03:34:33 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9dkj-00DU8d-1t;
	Thu, 15 Jun 2023 03:34:31 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhSZn5RL6z4wjB;
	Thu, 15 Jun 2023 13:34:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686800067;
	bh=YpcS1BrLjvGbDxUqeoV3otHCJ3+/0YDjxYK8icm+ysA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eEFN1zC7xAn1Wr3Kit71RQEzhLSL4SIBGcM6Ixe1KFqmhMEDomwzMDGJd3HwTL8zN
	 Z5SzsEAPWzmB9tToxQgSaEVOZXcEQR7leaAQGQjisqMEYiBBeqWsC5xWKqS8nyBQLS
	 pZzn7lqvIK5M7QTIjRhq5k3woxwBsVmXj1ytVeSX3L8BgOr6n2Y9Xmg03KpI+lVpeE
	 ZQAqJIHwBFhFhWRd2V6IMzeNMrigU4PNW1gqmzYWbgPI4yfBONTfaDdJaTx2Ggqek4
	 HbDECZQGZ/n1t7b6XWR17o8sR8f4D6jNZpL9A5ut0u3lqw1gvXjyrzPclYoftupZAa
	 PNxDjHn73WIPw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eric DeVolder <eric.devolder@oracle.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 geert@linux-m68k.org, tsbogend@alpha.franken.de,
 James.Bottomley@HansenPartnership.com, deller@gmx.de,
 ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, 86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org
Cc: kernel@xen0n.name, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
 keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org,
 frederic@kernel.org, akpm@linux-foundation.org, ardb@kernel.org,
 samitolvanen@google.com, juerg.haefliger@canonical.com, arnd@arndb.de,
 rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
 sebastian.reichel@collabora.com, rppt@kernel.org,
 kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
 ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
 mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
 xin3.li@intel.com, tj@kernel.org, gregkh@linuxfoundation.org,
 tsi@tuyoix.net, bhe@redhat.com, hbathini@linux.ibm.com,
 sourabhjain@linux.ibm.com, eric.devolder@oracle.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v1 10/21] powerpc/kexec: refactor for kernel/Kconfig.kexec
In-Reply-To: <20230612172805.681179-11-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-11-eric.devolder@oracle.com>
Date: Thu, 15 Jun 2023 13:34:25 +1000
Message-ID: <87fs6tflfi.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_203430_067892_6A5BBD62 
X-CRM114-Status: GOOD (  21.13  )
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

Eric DeVolder <eric.devolder@oracle.com> writes:

> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig | 55 ++++++++++++++------------------------------
>  1 file changed, 17 insertions(+), 38 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index bff5820b7cda..36f2fe0cc8a5 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -588,41 +588,21 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
>  	default "y" if PPC_POWERNV
>  	select ARCH_SUPPORTS_MEMORY_FAILURE
>  
> -config KEXEC
> -	bool "kexec system call"
> -	depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
> -	select KEXEC_CORE
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel.  It is like a reboot
> -	  but it is independent of the system firmware.   And like a reboot
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
> -config KEXEC_FILE
> -	bool "kexec file based system call"
> -	select KEXEC_CORE
> -	select HAVE_IMA_KEXEC if IMA
> -	select KEXEC_ELF
> -	depends on PPC64
> -	depends on CRYPTO=y
> -	depends on CRYPTO_SHA256=y
...
> +
> +config ARCH_HAS_KEXEC_FILE
> +	def_bool PPC64 && CRYPTO && CRYPTO_SHA256

The =y's got lost here.

I think they were both meaningful, because both options are tristate. So
this previously required them to be built-in (=y), whereas after your
patch it will allow them to be modules.

I don't know for sure that those options need to be built-in, but that's
what the code does now, so this patch shouldn't change it, at least
without an explanation.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
