Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4104CEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 01:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rmi2kx/DEmOiqJAfSAS/AZ8M/LMXJlhSK54u/vkYac4=; b=vSK47ird5noShThb0G4TTp2Dnt
	1T0XTHhZ2d5ElRPNWM9s7I8stUk9ei8nqfbpezPZaV4OTqXG9AytK1LyDS0greykgXVId0HQUlPHi
	0t1G8aa3idt0ZGtt4mVShyG6eWR3sx1p2blfPJv0iuaRkG140ksWyZx79C+SNCuWzDgqmfUjcc7xp
	CAvYk3aun1ImCVqgVuFf1foWIZO0MpE/4RCqfiVEAo2arLp9S2Zhk3vtBbPYpKGon9bFbmj4sSD7f
	kAE8FOUaYSD/RCe1m4YbOcgY1W5VteibwMoq+lFme+vHulp/E+mHVuJJ5Po8jf/p0HkIiuB16oUmK
	csL6l0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9FDp-009cBW-1c;
	Wed, 14 Jun 2023 01:22:53 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9FDg-009c8G-2B;
	Wed, 14 Jun 2023 01:22:51 +0000
Received: from dggpemm500006.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Qgng45C3bzLmks;
	Wed, 14 Jun 2023 09:20:48 +0800 (CST)
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 09:22:36 +0800
Subject: Re: [PATCH v1 05/21] arm64/kexec: refactor for kernel/Kconfig.kexec
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
 <20230612172805.681179-6-eric.devolder@oracle.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <29427d7c-7d81-9bda-0067-d17b51952cb4@huawei.com>
Date: Wed, 14 Jun 2023 09:22:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20230612172805.681179-6-eric.devolder@oracle.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_182245_030958_F28B2AA7 
X-CRM114-Status: GOOD (  26.62  )
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
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/arm64/Kconfig | 61 ++++++++--------------------------------------
>  1 file changed, 10 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 343e1e1cae10..33552476a877 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1433,60 +1433,19 @@ config PARAVIRT_TIME_ACCOUNTING
>  
>  	  If in doubt, say N here.
>  
> -config KEXEC
> -	depends on PM_SLEEP_SMP
> -	select KEXEC_CORE
> -	bool "kexec system call"
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel.  It is like a reboot
> -	  but it is independent of the system firmware.   And like a reboot
> -	  you can start any kernel with it, not just Linux.
> -
> -config KEXEC_FILE
> -	bool "kexec file based system call"
> -	select KEXEC_CORE
> -	select HAVE_IMA_KEXEC if IMA
> -	help
> -	  This is new version of kexec system call. This system call is
> -	  file based and takes file descriptors as system call argument
> -	  for kernel and initramfs as opposed to list of segments as
> -	  accepted by previous system call.
> -
> -config KEXEC_SIG
> -	bool "Verify kernel signature during kexec_file_load() syscall"
> -	depends on KEXEC_FILE
> -	help
> -	  Select this option to verify a signature with loaded kernel
> -	  image. If configured, any attempt of loading a image without
> -	  valid signature will fail.
> -
> -	  In addition to that option, you need to enable signature
> -	  verification for the corresponding kernel image type being
> -	  loaded in order for this to work.
> +config ARCH_HAS_KEXEC
> +	def_bool PM_SLEEP_SMP
>  
> -config KEXEC_IMAGE_VERIFY_SIG
> -	bool "Enable Image signature verification support"
> -	default y
> -	depends on KEXEC_SIG
> -	depends on EFI && SIGNED_PE_FILE_VERIFICATION
> -	help
> -	  Enable Image signature verification support.

I don't see an alternative to this option. It's used in
arch/arm64/kernel/kexec_image.c:135

> -
> -comment "Support for PE file signature verification disabled"
> -	depends on KEXEC_SIG
> -	depends on !EFI || !SIGNED_PE_FILE_VERIFICATION
> +config ARCH_HAS_KEXEC_FILE
> +	def_bool y
>  
> -config CRASH_DUMP
> -	bool "Build kdump crash kernel"
> -	help
> -	  Generate crash dump after being started by kexec. This should
> -	  be normally only set in special crash dump kernels which are
> -	  loaded in the main kernel with kexec-tools into a specially
> -	  reserved region and then later executed after a crash by
> -	  kdump/kexec.
> +config ARCH_SUPPORTS_KEXEC_FILE
> +	def_bool y
> +	depends on KEXEC_FILE
> +	select HAVE_IMA_KEXEC if IMA
>  
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> +config ARCH_HAS_CRASH_DUMP
> +	def_bool y
>  
>  config TRANS_TABLE
>  	def_bool y
> 

-- 
Regards,
  Zhen Lei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
