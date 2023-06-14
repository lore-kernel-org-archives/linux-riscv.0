Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E549EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xoXe2Ibi3FRiOLGbpNtYzN9EepESBTexFkj1Q6wl0Bg=; b=BENiHrZWPSzqsWm3IC/75AWg3E
	/W/B6c7yi4o57lay7QSaHOz+ylVqKj2YNuLqxJk3Wk4MLaPQ5CtYTh97zKPVDrC4047j0faRO4/jq
	Vqi8ye3iX2Mmo/9A2Dwhn9W//z8u30LWifNntWvs1g3SxvsjMqH2+IqrsjtfxwrHDeKJYLJgaJ+OF
	f2weueg53ov3pVWat0zGlQ/xGWT/+CAXVSpwak7ooAqdVR13QP3hUsw144GTUdHl4oGWxOwaBBgU2
	fywTiFXbQT2dO/lPSv6BYCfVkMM46IHLNdaaMbfkH5BPdGhxFjo8k7MEa0VnzgKrmbKJmjAxfj9bD
	UrUUP7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9FB1-009bmx-17;
	Wed, 14 Jun 2023 01:19:59 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9FAr-009bl4-30;
	Wed, 14 Jun 2023 01:19:56 +0000
Received: from dggpemm500006.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QgnX45KKjz18MCL;
	Wed, 14 Jun 2023 09:14:44 +0800 (CST)
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 09:19:38 +0800
Subject: Re: [PATCH v1 01/21] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
To: Eric DeVolder <eric.devolder@oracle.com>, <linux@armlinux.org.uk>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
	<geert@linux-m68k.org>, <tsbogend@alpha.franken.de>,
	<James.Bottomley@HansenPartnership.com>, <deller@gmx.de>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<glaubitz@physik.fu-berlin.de>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-ia64@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sh@vger.kernel.org>
CC: <kernel@xen0n.name>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <hca@linux.ibm.com>,
	<gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
	<svens@linux.ibm.com>, <hpa@zytor.com>, <keescook@chromium.org>,
	<paulmck@kernel.org>, <peterz@infradead.org>, <frederic@kernel.org>,
	<akpm@linux-foundation.org>, <ardb@kernel.org>, <samitolvanen@google.com>,
	<juerg.haefliger@canonical.com>, <arnd@arndb.de>,
	<rmk+kernel@armlinux.org.uk>, <linus.walleij@linaro.org>,
	<sebastian.reichel@collabora.com>, <rppt@kernel.org>,
	<kirill.shutemov@linux.intel.com>, <anshuman.khandual@arm.com>,
	<ziy@nvidia.com>, <masahiroy@kernel.org>, <ndesaulniers@google.com>,
	<mhiramat@kernel.org>, <ojeda@kernel.org>, <xin3.li@intel.com>,
	<tj@kernel.org>, <gregkh@linuxfoundation.org>, <tsi@tuyoix.net>,
	<bhe@redhat.com>, <hbathini@linux.ibm.com>, <sourabhjain@linux.ibm.com>,
	<boris.ostrovsky@oracle.com>, <konrad.wilk@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-2-eric.devolder@oracle.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <6e362106-9d74-1e00-b94d-ce094367e939@huawei.com>
Date: Wed, 14 Jun 2023 09:19:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20230612172805.681179-2-eric.devolder@oracle.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_181950_327413_4503799D 
X-CRM114-Status: GOOD (  39.31  )
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



On 2023/6/13 1:27, Eric DeVolder wrote:
> The config options for kexec and crash features are consolidated
> into new file kernel/Kconfig.kexec. Under the "General Setup" submenu
> is a new submenu "Kexec and crash handling" where all the kexec and
> crash options that were once in the arch-dependent submenu "Processor
> type and features" are now consolidated.
> 
> The following options are impacted:
> 
>  - KEXEC
>  - KEXEC_FILE
>  - KEXEC_SIG
>  - KEXEC_SIG_FORCE
>  - KEXEC_BZIMAGE_VERIFY_SIG
>  - KEXEC_JUMP
>  - CRASH_DUMP
> 
> The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP.
> 
> Architectures specify support of certain KEXEC and CRASH features with
> similarly named new ARCH_HAS_<option> config options.
> 
> Architectures can utilize the new ARCH_SUPPORTS_<option> config
> options to specify additional components when <option> is enabled.
> 
> To summarize, the ARCH_HAS_<option> permits the <option> to be
> enabled, and the ARCH_SUPPORTS_<option> handles side effects (ie.
> select statements).
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/Kconfig         |  13 ------
>  init/Kconfig         |   2 +
>  kernel/Kconfig.kexec | 103 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 105 insertions(+), 13 deletions(-)
>  create mode 100644 kernel/Kconfig.kexec
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 205fd23e0cad..a37730679730 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -11,19 +11,6 @@ source "arch/$(SRCARCH)/Kconfig"
>  
>  menu "General architecture-dependent options"
>  
> -config CRASH_CORE
> -	bool
> -
> -config KEXEC_CORE
> -	select CRASH_CORE
> -	bool
> -
> -config KEXEC_ELF
> -	bool
> -
> -config HAVE_IMA_KEXEC
> -	bool
> -
>  config ARCH_HAS_SUBPAGE_FAULTS
>  	bool
>  	help
> diff --git a/init/Kconfig b/init/Kconfig
> index 32c24950c4ce..4424447e23a5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1917,6 +1917,8 @@ config BINDGEN_VERSION_TEXT
>  config TRACEPOINTS
>  	bool
>  
> +source "kernel/Kconfig.kexec"
> +
>  endmenu		# General setup
>  
>  source "arch/Kconfig"
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> new file mode 100644
> index 000000000000..660048099865
> --- /dev/null
> +++ b/kernel/Kconfig.kexec
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menu "Kexec and crash features"
> +
> +config CRASH_CORE
> +	bool
> +
> +config KEXEC_CORE
> +	select CRASH_CORE
> +	bool
> +
> +config KEXEC_ELF
> +	bool
> +
> +config HAVE_IMA_KEXEC
> +	bool
> +
> +config KEXEC
> +	bool "Enable kexec system call"
> +	default ARCH_DEFAULT_KEXEC
> +	depends on ARCH_HAS_KEXEC
> +	select KEXEC_CORE
> +	help
> +	  kexec is a system call that implements the ability to shutdown your
> +	  current kernel, and to start another kernel.  It is like a reboot
> +	  but it is independent of the system firmware.   And like a reboot
> +	  you can start any kernel with it, not just Linux.

"kernel.  It is like", "firmware.   And like"

A few more spaces, I don't know the original author's intention, perhaps can be removed.

> +
> +	  The name comes from the similarity to the exec system call.
> +
> +	  It is an ongoing process to be certain the hardware in a machine
> +	  is properly shutdown, so do not be surprised if this code does not
> +	  initially work for you.  As of this writing the exact hardware
> +	  interface is strongly in flux, so no good recommendation can be
> +	  made.
> +
> +config KEXEC_FILE
> +	bool "Enable kexec file based system call"
> +	depends on ARCH_HAS_KEXEC_FILE
> +	select KEXEC_CORE
> +	help
> +	  This is new version of kexec system call. This system call is
> +	  file based and takes file descriptors as system call argument
> +	  for kernel and initramfs as opposed to list of segments as
> +	  accepted by previous system call.
> +
> +config KEXEC_SIG
> +	bool "Verify kernel signature during kexec_file_load() syscall"
> +	depends on KEXEC_FILE && MODULE_SIG_FORMAT

I see that there is no "depends on MODULE_SIG_FORMAT" on x86 and arm64.

> +	help
> +

This blank line can be deleted.

> +	  This option makes the kexec_file_load() syscall check for a valid
> +	  signature of the kernel image.  The image can still be loaded without
> +	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
> +	  there's a signature that we can check, then it must be valid.
> +
> +	  In addition to this option, you need to enable signature
> +	  verification for the corresponding kernel image type being
> +	  loaded in order for this to work.
> +
> +config KEXEC_SIG_FORCE
> +	bool "Require a valid signature in kexec_file_load() syscall"
> +	depends on KEXEC_SIG
> +	help
> +	  This option makes kernel signature verification mandatory for
> +	  the kexec_file_load() syscall.
> +
> +config KEXEC_BZIMAGE_VERIFY_SIG
> +	bool "Enable bzImage signature verification support"
> +	depends on KEXEC_SIG
> +	depends on SIGNED_PE_FILE_VERIFICATION
> +	select SYSTEM_TRUSTED_KEYRING
> +	help
> +	  Enable bzImage signature verification support.
> +
> +config KEXEC_JUMP
> +	bool "kexec jump"
> +	depends on KEXEC && HIBERNATION
> +	depends on ARCH_HAS_KEXEC_JUMP
> +	help
> +	  Jump between original kernel and kexeced kernel and invoke
> +	  code in physical address mode via KEXEC
> +
> +config CRASH_DUMP
> +	bool "kernel crash dumps"
> +	depends on ARCH_HAS_CRASH_DUMP
> +	select KEXEC_CORE
> +	select CRASH_CORE
> +	help
> +	  Generate crash dump after being started by kexec.
> +	  This should be normally only set in special crash dump kernels
> +	  which are loaded in the main kernel with kexec-tools into
> +	  a specially reserved region and then later executed after
> +	  a crash by kdump/kexec. The crash dump kernel must be compiled
> +	  to a memory address not used by the main kernel or BIOS using
> +	  PHYSICAL_START, or it must be built as a relocatable image
> +	  (CONFIG_RELOCATABLE=y).
> +	  For more details see Documentation/admin-guide/kdump/kdump.rst
> +
> +	  For s390, this option also enables zfcpdump.
> +	  See also <file:Documentation/s390/zfcpdump.rst>
> +
> +endmenu
> 

-- 
Regards,
  Zhen Lei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
