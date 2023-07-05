Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E817EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 01:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmwerMITSm6MYvXxMh1GNzf9p8l0lezo/xunrv5lQVw=; b=teMxxIv/eXKxtD
	UzHUyUN9UyoAZ9HXYuZmbZzsBQrIPDyrUQ/o6SDWQBIGQJdW3iNHnaNxB0UqSMlx0CDo4OKsEyLgw
	/FQw3OYsjBahzo4WHQbo8N1rJSVhp9pFbS3dGEFFM3c53WMQBl0tYJykH8UTWvJgCb7CK30r7PIBL
	krETP5M3tULbLw2KHg9dmPA3YXWvC2GoeWy07Fk7I7SuQ4GYddx1cNjcTvaWHLemzFmL6QXsSEb+3
	JGjaEM69yTI3Dj8PGEu1LeZqzuN3PkB9KCO/3Svo19uRwtpfUHWN21aGvI3osz+RWiX9iKpEnuIco
	SzQk0yjTSPm1PPhXF3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGrGn-00EX5d-2f;
	Wed, 05 Jul 2023 01:25:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGrGl-00EX5F-2u;
	Wed, 05 Jul 2023 01:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=vSma8IQq31fU+wERjB/1DEs56WPeOxb4JmpgeCP9te0=; b=NqOllcmfQCJsXDWSgRe6XBVnWj
	N4QeXHnoBA0l4ngHnQGT/VGcEliJUrmqaycBN+2GIRdVjDxV+tnik/9rAy9+8uLu2uVYgw3M9Ijit
	b7KAluyhoziSKHSt8qRF6Z+ZvVHuXwfSGXXjIxN23iq9PatYGgC57zhbhFsr4Al3rpsm21UgpMS8H
	eYxAeDJ5HgJ9B8K4XjzpMPeXctK9EnDryWGL7hR0C08ZS4GDdyExSwjBxXsqxtE6VqOSB7hFcaedu
	bHTszkDDNxL3Ca94zOBqQrtIxzhRKMYfM7HS31q4nmEYYs2zifZKYsDF3CIFP3ImMbq0KH0nVevr3
	SxHqVhdQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qGrGg-009dZe-Ku; Wed, 05 Jul 2023 01:25:21 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8Cxc_B0xqRklS0AAA--.884S3;
	Wed, 05 Jul 2023 09:25:08 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxniNtxqRki8kbAA--.44387S3;
	Wed, 05 Jul 2023 09:25:01 +0800 (CST)
Message-ID: <d1c0702f-e16d-1edd-19a4-1bdc2def14ab@loongson.cn>
Date: Wed, 5 Jul 2023 09:25:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [05/12] arch: Remove trailing whitespaces
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-csky@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230629121952.10559-6-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230629121952.10559-6-tzimmermann@suse.de>
X-CM-TRANSID: AQAAf8BxniNtxqRki8kbAA--.44387S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWryxAr17Ww18uw15tw15WrX_yoW5Wr1UpF
	WDCw1kGryDWFsYyF1xJ348uFWSgws7tFW3uryDK34UAr90vryjvrykt3Z3A34DGrnrCFW0
	g3yrWF4jg3WrAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUJ529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
	xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWx
	JVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUn
	bAw7UUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_022519_366055_AE883938 
X-CRM114-Status: GOOD (  14.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2023/6/29 19:45, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   arch/ia64/Kconfig | 4 ++--
>   arch/sh/Kconfig   | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
> index 21fa63ce5ffc0..e79f15e32a451 100644
> --- a/arch/ia64/Kconfig
> +++ b/arch/ia64/Kconfig
> @@ -260,7 +260,7 @@ config PERMIT_BSP_REMOVE
>   	default n
>   	help
>   	Say Y here if your platform SAL will support removal of BSP with HOTPLUG_CPU
> -	support.
> +	support.
>   
>   config FORCE_CPEI_RETARGET
>   	bool "Force assumption that CPEI can be re-targeted"
> @@ -335,7 +335,7 @@ config IA64_PALINFO
>   config IA64_MC_ERR_INJECT
>   	tristate "MC error injection support"
>   	help
> -	  Adds support for MC error injection. If enabled, the kernel
> +	  Adds support for MC error injection. If enabled, the kernel
>   	  will provide a sysfs interface for user applications to
>   	  call MC error injection PAL procedures to inject various errors.
>   	  This is a useful tool for MCA testing.
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 9652d367fc377..04b9550cf0070 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -234,7 +234,7 @@ config CPU_SUBTYPE_SH7201
>   	select CPU_SH2A
>   	select CPU_HAS_FPU
>   	select SYS_SUPPORTS_SH_MTU2
> -
> +
>   config CPU_SUBTYPE_SH7203
>   	bool "Support SH7203 processor"
>   	select CPU_SH2A
> @@ -496,7 +496,7 @@ config CPU_SUBTYPE_SH7366
>   endchoice
>   
>   source "arch/sh/mm/Kconfig"
> -
> +
>   source "arch/sh/Kconfig.cpu"
>   
>   source "arch/sh/boards/Kconfig"
> @@ -647,7 +647,7 @@ config GUSA
>   	  This is the default implementation for both UP and non-ll/sc
>   	  CPUs, and is used by the libc, amongst others.
>   
> -	  For additional information, design information can be found
> +	  For additional information, design information can be found
>   	  in <http://lc.linux.or.jp/lc2002/papers/niibe0919p.pdf>.
>   
>   	  This should only be disabled for special cases where alternate


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
