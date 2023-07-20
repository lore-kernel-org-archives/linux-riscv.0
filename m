Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03A2EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQwSB87aNJbALjnm9C/R6zCaK7ZpPsm12o+o9rxC7b4=; b=vWEgNj+wl2m36K
	iGt10MOX+WLVNacRi4wz5TShil0PEtLfmBcurR/9ZLOhAW82DC3qIbh4dN3htiZyKp1mRy0m3stBm
	NVvYCcloyTBSTDwU06hlhIh3cTrXJ7nyCkNp2/nH/qyeFDDJk9I6tSrAz3ZPDaKjju+areF5VCn5u
	OsM68TkTScJinT++0X972GGUkR8huxv0ov9XLm0BrzJ572MtSrqX4wZARBte3Ee7VniFACWwuLIqq
	B1UT1+IcZ0UFOnEVfi6r5A0Cxo6u7OXzcjtjLloaTcAHPyeVlTuPTat8YW5pDPoEk2HJeBuFHzTfj
	hvaFPYLMdC9bGbcyvCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYhz-00BwEa-0R;
	Thu, 20 Jul 2023 18:49:03 +0000
Received: from mailout.easymail.ca ([64.68.200.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYhu-00BwD4-2F;
	Thu, 20 Jul 2023 18:49:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by mailout.easymail.ca (Postfix) with ESMTP id 479C0623ED;
	Thu, 20 Jul 2023 18:48:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at emo07-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
	by localhost (emo07-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkMMq7FPWqRc; Thu, 20 Jul 2023 18:48:49 +0000 (UTC)
Received: from mail.gonehiking.org (unknown [38.15.45.1])
	by mailout.easymail.ca (Postfix) with ESMTPA id C8ABC61E38;
	Thu, 20 Jul 2023 18:48:49 +0000 (UTC)
Received: from [192.168.1.4] (internal [192.168.1.4])
	by mail.gonehiking.org (Postfix) with ESMTP id CC21F3EED6;
	Thu, 20 Jul 2023 12:48:47 -0600 (MDT)
Message-ID: <aea82980-358a-863f-d6a0-66f4ce3f87b7@gonehiking.org>
Date: Thu, 20 Jul 2023 12:48:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Dexuan Cui <decui@microsoft.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren
 <guoren@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Linus Walleij <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, WANG Xuerui <kernel@xen0n.name>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-2-arnd@kernel.org>
From: Khalid Aziz <khalid@gonehiking.org>
In-Reply-To: <20230719123944.3438363-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_114858_813444_406ECC7B 
X-CRM114-Status: GOOD (  25.74  )
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
Reply-To: khalid@gonehiking.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/19/23 6:39 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The list of dependencies here is phrased as an opt-out, but this is missing
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
> 
>   - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>     the merged arch/powerpc never did
> 
>   - arm lists footbridge, integrator and netwinder, but netwinder is actually
>     part of footbridge, and integrator does not appear to have an actual
>     VGA hardware, or list it in its ATAG or DT.
> 
>   - mips has a few platforms (malta, sibyte, and sni) that initialize
>     screen_info, on everything else the console is selected but cannot
>     actually work.
> 
>   - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
>     in the opt-out table and declare a screen_info to allow building
>     vga_con, but this cannot work because the console is never selected.
> 
> Replace this with an opt-in table that lists only the platforms that
> remain. This is effectively x86, plus a couple of historic workstation
> and server machines that reused parts of the x86 system architecture.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Khalid Aziz <khalid@gonehiking.org>


> ---
>   drivers/video/console/Kconfig | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index 1b5a319971ed0..6af90db6d2da9 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -7,9 +7,9 @@ menu "Console display driver support"
>   
>   config VGA_CONSOLE
>   	bool "VGA text console" if EXPERT || !X86
> -	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
> -		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
> -		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
> +	depends on ALPHA || IA64 || X86 || \
> +		(ARM && ARCH_FOOTBRIDGE) || \
> +		(MIPS && (MIPS_MALTA || SIBYTE_BCM112X || SIBYTE_SB1250 || SIBYTE_BCM1x80 || SNI_RM))
>   	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
>   	default y
>   	help


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
