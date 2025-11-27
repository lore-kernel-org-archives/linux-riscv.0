Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2D6D116E3
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 01:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z73VFyvoK1op6kgXFdciWYC4N3Jt3N5ZL2tdYlPJN2s=; b=bSwQ7P9u5Ssdgq
	yPdoFS3t0dyyBYoPuU+nCUEZuIujJ0Y6tYtGNrI1WLQZiXnjvM94puOnzDjApaCoEnRmA9OWe9vtn
	sfOLgP+G1yMv4pXrIsOqWMYWDYRga15rxcVkRzEKckjgbyycwbIBKtMJIS1rTwbjJ6JHvchp5jq2Q
	6xfSvLH/gge67Fl3NmslP2AlYVZQGOdM4bK5FbSMURhmJFjJEN0InvbnLqF97dFsJVYS0Z2XjC+/x
	pD3eFDlJrzwIa5Qt7C+cZZz3j9gJFgBiGhPmDLr2I7bzvLr0UZcm0ScSAfmXH0Rf74sjbQcAycrO5
	NW4MDa8HzhgXrqa43kuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQhe-0000000FqVS-0NEI;
	Thu, 27 Nov 2025 01:21:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQha-0000000FqUW-3Tfc
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 01:21:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47118259fd8so1984895e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 17:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764206501; x=1764811301; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKB+umqjLQJdt0Xtb5+/u9pc/TjHJihZz4gGx4BvVKM=;
        b=JLNsuUjyXe6IZiGeDeunR/EJLWO9XCShpThcyX5iW0ygRdxgB/1H2DesScblSfgfuy
         CddIKLeSlI2W9XeOOfkiM302dy7TSDMSR1C3Cw2s+jyg8ZgsTYi5aUtYA2EHp9mIu6Wh
         zNEsawumC++uQDv3eIgoklBOHDqB4bFfLWCydE6/QovFI5XKO18xEXmW3mJVslzUKd/w
         ryoponowLgJabGUEdtHNLOBPat7kW3tb54I+uk7DnijIiJzxqZx+LMKdrKVHNpdiYbxg
         OPLotN+pmG+AtoFKd1SaBQ+FqoBAGf90ynRVQ/zFGMhrdJK6MWAJ73IGOJwV9N5BGZQ5
         A5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206501; x=1764811301;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XKB+umqjLQJdt0Xtb5+/u9pc/TjHJihZz4gGx4BvVKM=;
        b=c1GxmOSyG6WvQEFPAo0inoQKsRH6ppKAk13RbT9ibG8mN+rgfmmXsdLnASR80soOBT
         40hqHarima0xq7W9KkW3ri9cSmZE2QMcrQ478palGE7xeOzzl/kAg9nXr5OR/v0/ARq3
         m0YMMHzoRIqkkIIrnRE9joq6sF1OGA4WmcAxAoyVOlrl9HS1FjXxTXSbnsU0AiFbn+Ca
         sv3s8KEgOiVQ3JMivkKdITxbvvCCLBm636UJL0UTQbecbLFU8DezhS4Sk5ptoVGJCMM/
         DSDji0xwKqZK2KShrMcD1GpuZoeVTxvzI0PkFe6DodC0fMkurQwT2SgYR3JsiSg8JGgN
         OURg==
X-Forwarded-Encrypted: i=1; AJvYcCXjOusLRHEDDbZzGmWRWf7BS0x6AFWoRF1aR42261r9G+qIaHglCEzLSeYoZoEv5gCgFxF8gdnZUs7EKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2YxMt1YzMlL50CDRVADdJrCaQ209YDdoRSvVXu51/kVc4KTja
	pYUjP4QTtPJOkqecdCLCyWt79OjHsw0Gv11fu9tmocJFdnWAPsNb9YKPp6x9b085PLE=
X-Gm-Gg: ASbGncvJtEdzXzkyjt1QVCKQ+xpLSjzHm/6ifxmYQZA1+YxoFYURl72Jl0ZvZBUcMhg
	AE8s7zAkmcnij4lx7s0AjPKvYgLQyJtNiTfrTmx0sn7AfY5W7mgtuUxRRCTWUR+bx8LQg7kvYT8
	w4vkPW9GAzFcCiOBdkgUcSjYVC7wdtQU7yxYF4Xa+7N5hnmv8SO2MzOz+RfpDIveELDWxAzE7Ea
	uHb5ATwcoq07BLn61mxxrPRZ/TNmrWHfe7wzsdADCg8Jd/0pKK+1RMuMBcojt/O3EJDqIxm1iFq
	A+xrnQc83lmnEkH8TsZklLxbF4UNWgMX8xq5uYy3TKT4iypNPC2QyE3QrIcgGYx6CXV2HKT7/LL
	3IvornaBqEQH9tLzlVbUuPjb55zQtDvDTzVNCuj1ARAyeS6zxtScvqgOf+CYL/6W27CoaWamd5U
	heyHcRmlQzgzQj6qkyIb7bDhDAQ4MpaEAAZSoYDvCdqzA=
X-Google-Smtp-Source: AGHT+IH5dreI2mWiT9OHT4iDH1t5EyaQjC3x4sVC42/rf7Nn0IkLjAie1oF/6UEYyyU2S+G28jWY9w==
X-Received: by 2002:a05:600c:1382:b0:475:de68:3c30 with SMTP id 5b1f17b1804b1-47904b103edmr91666245e9.16.1764206500927;
        Wed, 26 Nov 2025 17:21:40 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed472744sm22492012b3a.26.2025.11.26.17.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 17:21:40 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 09:21:33 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 4/9] sysfb: Replace screen_info with
 sysfb_primary_display
Message-ID: <aSenndnjZfpf0hRy@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
 <20251126160854.553077-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-5-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_172143_035442_7E6E2D13 
X-CRM114-Status: GOOD (  27.35  )
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


Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Replace the global screen_info with sysfb_primary_display of type
> struct sysfb_display_info. Adapt all users of screen_info.
> 
> Instances of screen_info are defined for x86, loongarch and EFI,
> with only one instance compiled into a specific build. Replace all
> of them with sysfb_primary_display.
> 
> All existing users of screen_info are updated by pointing them to
> sysfb_primary_display.screen instead. This introduces some churn to
> the code, but has no impact on functionality.
> 
> Boot parameters and EFI config tables are unchanged. They transfer
> screen_info as before. The logic in EFI's alloc_screen_info() changes
> slightly, as it now returns the screen field of sysfb_primary_display.
> 
> v2:
> - update comment
> - rename init_screen_info() to init_primary_display()
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com> # drivers/pci/
> ---
>  arch/arm64/kernel/image-vars.h                |  2 +-
>  arch/loongarch/kernel/efi.c                   | 15 +++++++------
>  arch/loongarch/kernel/image-vars.h            |  2 +-
>  arch/riscv/kernel/image-vars.h                |  2 +-
>  arch/x86/kernel/kexec-bzimage64.c             |  4 +++-
>  arch/x86/kernel/setup.c                       | 10 +++++----
>  arch/x86/video/video-common.c                 |  4 ++--
>  drivers/firmware/efi/earlycon.c               |  8 +++----
>  drivers/firmware/efi/efi-init.c               | 22 +++++++++----------
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 18 ++++++++++-----
>  drivers/firmware/efi/sysfb_efi.c              |  4 ++--
>  drivers/firmware/sysfb.c                      |  6 ++---
>  drivers/hv/vmbus_drv.c                        |  6 ++---
>  drivers/pci/vgaarb.c                          |  4 ++--
>  drivers/video/screen_info_pci.c               |  5 +++--
>  include/linux/screen_info.h                   |  2 --
>  include/linux/sysfb.h                         |  5 +++--
>  17 files changed, 66 insertions(+), 53 deletions(-)
> 
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 85bc629270bd..d7b0d12b1015 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -38,7 +38,7 @@ PROVIDE(__efistub__end			= _end);
>  PROVIDE(__efistub___inittext_end       	= __inittext_end);
>  PROVIDE(__efistub__edata		= _edata);
>  #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
> -PROVIDE(__efistub_screen_info		= screen_info);
> +PROVIDE(__efistub_sysfb_primary_display	= sysfb_primary_display);
>  #endif
>  PROVIDE(__efistub__ctype		= _ctype);
>  
> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
> index 860a3bc030e0..638a392d2cd2 100644
> --- a/arch/loongarch/kernel/efi.c
> +++ b/arch/loongarch/kernel/efi.c
> @@ -18,7 +18,7 @@
>  #include <linux/kobject.h>
>  #include <linux/memblock.h>
>  #include <linux/reboot.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  #include <linux/uaccess.h>
>  
>  #include <asm/early_ioremap.h>
> @@ -75,11 +75,11 @@ bool efi_poweroff_required(void)
>  unsigned long __initdata screen_info_table = EFI_INVALID_TABLE_ADDR;
>  
>  #if defined(CONFIG_SYSFB) || defined(CONFIG_EFI_EARLYCON)
> -struct screen_info screen_info __section(".data");
> -EXPORT_SYMBOL_GPL(screen_info);
> +struct sysfb_display_info sysfb_primary_display __section(".data");
> +EXPORT_SYMBOL_GPL(sysfb_primary_display);
>  #endif
>  
> -static void __init init_screen_info(void)
> +static void __init init_primary_display(void)
>  {
>  	struct screen_info *si;
>  
> @@ -91,11 +91,12 @@ static void __init init_screen_info(void)
>  		pr_err("Could not map screen_info config table\n");
>  		return;
>  	}
> -	screen_info = *si;
> +	sysfb_primary_display.screen = *si;
>  	memset(si, 0, sizeof(*si));
>  	early_memunmap(si, sizeof(*si));
>  
> -	memblock_reserve(__screen_info_lfb_base(&screen_info), screen_info.lfb_size);
> +	memblock_reserve(__screen_info_lfb_base(&sysfb_primary_display.screen),
> +			 sysfb_primary_display.screen.lfb_size);
>  }
>  
>  void __init efi_init(void)
> @@ -127,7 +128,7 @@ void __init efi_init(void)
>  	set_bit(EFI_CONFIG_TABLES, &efi.flags);
>  
>  	if (IS_ENABLED(CONFIG_EFI_EARLYCON) || IS_ENABLED(CONFIG_SYSFB))
> -		init_screen_info();
> +		init_primary_display();
>  
>  	if (boot_memmap == EFI_INVALID_TABLE_ADDR)
>  		return;
> diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
> index 41ddcf56d21c..e557ebd46c2b 100644
> --- a/arch/loongarch/kernel/image-vars.h
> +++ b/arch/loongarch/kernel/image-vars.h
> @@ -12,7 +12,7 @@ __efistub_kernel_entry		= kernel_entry;
>  __efistub_kernel_asize		= kernel_asize;
>  __efistub_kernel_fsize		= kernel_fsize;
>  #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
> -__efistub_screen_info		= screen_info;
> +__efistub_sysfb_primary_display	= sysfb_primary_display;
>  #endif
>  
>  #endif
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 3df30dd1c458..3bd9d06a8b8f 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -29,7 +29,7 @@ __efistub__end			= _end;
>  __efistub__edata		= _edata;
>  __efistub___init_text_end	= __init_text_end;
>  #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
> -__efistub_screen_info		= screen_info;
> +__efistub_sysfb_primary_display	= sysfb_primary_display;
>  #endif
>  
>  #endif
> diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
> index c3244ac680d1..7508d0ccc740 100644
> --- a/arch/x86/kernel/kexec-bzimage64.c
> +++ b/arch/x86/kernel/kexec-bzimage64.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/efi.h>
>  #include <linux/random.h>
> +#include <linux/sysfb.h>
>  
>  #include <asm/bootparam.h>
>  #include <asm/setup.h>
> @@ -303,7 +304,8 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
>  	params->hdr.hardware_subarch = boot_params.hdr.hardware_subarch;
>  
>  	/* Copying screen_info will do? */
> -	memcpy(&params->screen_info, &screen_info, sizeof(struct screen_info));
> +	memcpy(&params->screen_info, &sysfb_primary_display.screen,
> +	       sizeof(sysfb_primary_display.screen));
>  
>  	/* Fill in memsize later */
>  	params->screen_info.ext_mem_k = 0;
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..675e4b9deb1f 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -22,6 +22,7 @@
>  #include <linux/random.h>
>  #include <linux/root_dev.h>
>  #include <linux/static_call.h>
> +#include <linux/sysfb.h>
>  #include <linux/swiotlb.h>
>  #include <linux/tboot.h>
>  #include <linux/usb/xhci-dbgp.h>
> @@ -211,8 +212,9 @@ arch_initcall(init_x86_sysctl);
>  /*
>   * Setup options
>   */
> -struct screen_info screen_info;
> -EXPORT_SYMBOL(screen_info);
> +
> +struct sysfb_display_info sysfb_primary_display;
> +EXPORT_SYMBOL(sysfb_primary_display);
>  #if defined(CONFIG_FIRMWARE_EDID)
>  struct edid_info edid_info;
>  EXPORT_SYMBOL_GPL(edid_info);
> @@ -526,7 +528,7 @@ static void __init parse_setup_data(void)
>  static void __init parse_boot_params(void)
>  {
>  	ROOT_DEV = old_decode_dev(boot_params.hdr.root_dev);
> -	screen_info = boot_params.screen_info;
> +	sysfb_primary_display.screen = boot_params.screen_info;
>  #if defined(CONFIG_FIRMWARE_EDID)
>  	edid_info = boot_params.edid_info;
>  #endif
> @@ -1254,7 +1256,7 @@ void __init setup_arch(char **cmdline_p)
>  #ifdef CONFIG_VT
>  #if defined(CONFIG_VGA_CONSOLE)
>  	if (!efi_enabled(EFI_BOOT) || (efi_mem_type(0xa0000) != EFI_CONVENTIONAL_MEMORY))
> -		vgacon_register_screen(&screen_info);
> +		vgacon_register_screen(&sysfb_primary_display.screen);
>  #endif
>  #endif
>  	x86_init.oem.banner();
> diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
> index e0aeee99bc99..152789f00fcd 100644
> --- a/arch/x86/video/video-common.c
> +++ b/arch/x86/video/video-common.c
> @@ -9,7 +9,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  #include <linux/vgaarb.h>
>  
>  #include <asm/video.h>
> @@ -29,7 +29,7 @@ EXPORT_SYMBOL(pgprot_framebuffer);
>  bool video_is_primary_device(struct device *dev)
>  {
>  #ifdef CONFIG_SCREEN_INFO
> -	struct screen_info *si = &screen_info;
> +	struct screen_info *si = &sysfb_primary_display.screen;
>  	struct resource res[SCREEN_INFO_MAX_RESOURCES];
>  	ssize_t i, numres;
>  #endif
> diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
> index 42e3a173dac1..3d060d59968c 100644
> --- a/drivers/firmware/efi/earlycon.c
> +++ b/drivers/firmware/efi/earlycon.c
> @@ -9,7 +9,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/serial_core.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  #include <linux/string.h>
>  
>  #include <asm/early_ioremap.h>
> @@ -32,7 +32,7 @@ static void *efi_fb;
>   */
>  static int __init efi_earlycon_remap_fb(void)
>  {
> -	const struct screen_info *si = &screen_info;
> +	const struct screen_info *si = &sysfb_primary_display.screen;
>  
>  	/* bail if there is no bootconsole or it was unregistered already */
>  	if (!earlycon_console || !console_is_registered(earlycon_console))
> @@ -147,7 +147,7 @@ static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h,
>  static void
>  efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  {
> -	const struct screen_info *si = &screen_info;
> +	const struct screen_info *si = &sysfb_primary_display.screen;
>  	u32 cur_efi_x = efi_x;
>  	unsigned int len;
>  	const char *s;
> @@ -227,7 +227,7 @@ void __init efi_earlycon_reprobe(void)
>  static int __init efi_earlycon_setup(struct earlycon_device *device,
>  				     const char *opt)
>  {
> -	const struct screen_info *si = &screen_info;
> +	const struct screen_info *si = &sysfb_primary_display.screen;
>  	u16 xres, yres;
>  	u32 i;
>  
> diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
> index a65c2d5b9e7b..d1d418a34407 100644
> --- a/drivers/firmware/efi/efi-init.c
> +++ b/drivers/firmware/efi/efi-init.c
> @@ -19,7 +19,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_fdt.h>
>  #include <linux/platform_device.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  
>  #include <asm/efi.h>
>  
> @@ -57,15 +57,15 @@ static phys_addr_t __init efi_to_phys(unsigned long addr)
>  extern __weak const efi_config_table_type_t efi_arch_tables[];
>  
>  /*
> - * x86 defines its own screen_info and uses it even without EFI,
> - * everything else can get it from here.
> + * x86 defines its own instance of sysfb_primary_display and uses
> + * it even without EFI, everything else can get them from here.
>   */
>  #if !defined(CONFIG_X86) && (defined(CONFIG_SYSFB) || defined(CONFIG_EFI_EARLYCON))
> -struct screen_info screen_info __section(".data");
> -EXPORT_SYMBOL_GPL(screen_info);
> +struct sysfb_display_info sysfb_primary_display __section(".data");
> +EXPORT_SYMBOL_GPL(sysfb_primary_display);
>  #endif
>  
> -static void __init init_screen_info(void)
> +static void __init init_primary_display(void)
>  {
>  	struct screen_info *si;
>  
> @@ -75,13 +75,13 @@ static void __init init_screen_info(void)
>  			pr_err("Could not map screen_info config table\n");
>  			return;
>  		}
> -		screen_info = *si;
> +		sysfb_primary_display.screen = *si;
>  		memset(si, 0, sizeof(*si));
>  		early_memunmap(si, sizeof(*si));
>  
> -		if (memblock_is_map_memory(screen_info.lfb_base))
> -			memblock_mark_nomap(screen_info.lfb_base,
> -					    screen_info.lfb_size);
> +		if (memblock_is_map_memory(sysfb_primary_display.screen.lfb_base))
> +			memblock_mark_nomap(sysfb_primary_display.screen.lfb_base,
> +					    sysfb_primary_display.screen.lfb_size);
>  
>  		if (IS_ENABLED(CONFIG_EFI_EARLYCON))
>  			efi_earlycon_reprobe();
> @@ -274,5 +274,5 @@ void __init efi_init(void)
>  	if (IS_ENABLED(CONFIG_X86) ||
>  	    IS_ENABLED(CONFIG_SYSFB) ||
>  	    IS_ENABLED(CONFIG_EFI_EARLYCON))
> -		init_screen_info();
> +		init_primary_display();
>  }
> diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
> index a6c049835190..401ecbbdf331 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
> @@ -1,13 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
>  #include <linux/efi.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  
>  #include <asm/efi.h>
>  
>  #include "efistub.h"
>  
> -static unsigned long screen_info_offset;
> +static unsigned long kernel_image_offset;
> +
> +static void *kernel_image_addr(void *addr)
> +{
> +	return addr + kernel_image_offset;
> +}
>  
>  struct screen_info *alloc_screen_info(void)
>  {
> @@ -16,8 +21,11 @@ struct screen_info *alloc_screen_info(void)
>  
>  	if (IS_ENABLED(CONFIG_X86) ||
>  	    IS_ENABLED(CONFIG_EFI_EARLYCON) ||
> -	    IS_ENABLED(CONFIG_SYSFB))
> -		return (void *)&screen_info + screen_info_offset;
> +	    IS_ENABLED(CONFIG_SYSFB)) {
> +		struct sysfb_display_info *dpy = kernel_image_addr(&sysfb_primary_display);
> +
> +		return &dpy->screen;
> +	}
>  
>  	return NULL;
>  }
> @@ -73,7 +81,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>  		return status;
>  	}
>  
> -	screen_info_offset = image_addr - (unsigned long)image->image_base;
> +	kernel_image_offset = image_addr - (unsigned long)image->image_base;
>  
>  	status = efi_stub_common(handle, image, image_addr, cmdline_ptr);
>  
> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> index 8e0f9d08397f..46ad95084b50 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -176,7 +176,7 @@ static int __init efifb_set_system(struct screen_info *si, const struct dmi_syst
>  
>  static int __init efifb_set_system_callback(const struct dmi_system_id *id)
>  {
> -	return efifb_set_system(&screen_info, id);
> +	return efifb_set_system(&sysfb_primary_display.screen, id);
>  }
>  
>  #define EFIFB_DMI_SYSTEM_ID(vendor, name, enumid)		\
> @@ -316,7 +316,7 @@ static struct device_node *find_pci_overlap_node(void)
>  		}
>  
>  		for_each_of_pci_range(&parser, &range)
> -			if (efifb_overlaps_pci_range(&screen_info, &range))
> +			if (efifb_overlaps_pci_range(&sysfb_primary_display.screen, &range))
>  				return np;
>  	}
>  	return NULL;
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 916b28538a29..1f671f9219b0 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -66,7 +66,7 @@ static bool sysfb_unregister(void)
>   */
>  void sysfb_disable(struct device *dev)
>  {
> -	struct screen_info *si = &screen_info;
> +	struct screen_info *si = &sysfb_primary_display.screen;
>  	struct device *parent;
>  
>  	mutex_lock(&disable_lock);
> @@ -92,7 +92,7 @@ EXPORT_SYMBOL_GPL(sysfb_disable);
>   */
>  bool sysfb_handles_screen_info(void)
>  {
> -	const struct screen_info *si = &screen_info;
> +	const struct screen_info *si = &sysfb_primary_display.screen;
>  
>  	return !!screen_info_video_type(si);
>  }
> @@ -141,7 +141,7 @@ static struct device *sysfb_parent_dev(const struct screen_info *si)
>  
>  static __init int sysfb_init(void)
>  {
> -	struct screen_info *si = &screen_info;
> +	struct screen_info *si = &sysfb_primary_display.screen;
>  	struct device *parent;
>  	unsigned int type;
>  	struct simplefb_platform_data mode;
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index a53af6fe81a6..9c937190be81 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -29,7 +29,7 @@
>  #include <linux/delay.h>
>  #include <linux/panic_notifier.h>
>  #include <linux/ptrace.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  #include <linux/efi.h>
>  #include <linux/random.h>
>  #include <linux/kernel.h>
> @@ -2340,8 +2340,8 @@ static void __maybe_unused vmbus_reserve_fb(void)
>  	if (efi_enabled(EFI_BOOT)) {
>  		/* Gen2 VM: get FB base from EFI framebuffer */
>  		if (IS_ENABLED(CONFIG_SYSFB)) {
> -			start = screen_info.lfb_base;
> -			size = max_t(__u32, screen_info.lfb_size, 0x800000);
> +			start = sysfb_primary_display.screen.lfb_base;
> +			size = max_t(__u32, sysfb_primary_display.screen.lfb_size, 0x800000);
>  		}
>  	} else {
>  		/* Gen1 VM: get FB base from PCI */
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 436fa7f4c387..805be9ea4a34 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -26,7 +26,7 @@
>  #include <linux/poll.h>
>  #include <linux/miscdevice.h>
>  #include <linux/slab.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  #include <linux/vt.h>
>  #include <linux/console.h>
>  #include <linux/acpi.h>
> @@ -557,7 +557,7 @@ EXPORT_SYMBOL(vga_put);
>  static bool vga_is_firmware_default(struct pci_dev *pdev)
>  {
>  #if defined CONFIG_X86
> -	return pdev == screen_info_pci_dev(&screen_info);
> +	return pdev == screen_info_pci_dev(&sysfb_primary_display.screen);
>  #else
>  	return false;
>  #endif
> diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
> index 66bfc1d0a6dc..8f34d8a74f09 100644
> --- a/drivers/video/screen_info_pci.c
> +++ b/drivers/video/screen_info_pci.c
> @@ -4,6 +4,7 @@
>  #include <linux/printk.h>
>  #include <linux/screen_info.h>
>  #include <linux/string.h>
> +#include <linux/sysfb.h>
>  
>  static struct pci_dev *screen_info_lfb_pdev;
>  static size_t screen_info_lfb_bar;
> @@ -26,7 +27,7 @@ static bool __screen_info_relocation_is_valid(const struct screen_info *si, stru
>  
>  void screen_info_apply_fixups(void)
>  {
> -	struct screen_info *si = &screen_info;
> +	struct screen_info *si = &sysfb_primary_display.screen;
>  
>  	if (screen_info_lfb_pdev) {
>  		struct resource *pr = &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
> @@ -75,7 +76,7 @@ static void screen_info_fixup_lfb(struct pci_dev *pdev)
>  		.flags = IORESOURCE_MEM,
>  	};
>  	const struct resource *pr;
> -	const struct screen_info *si = &screen_info;
> +	const struct screen_info *si = &sysfb_primary_display.screen;
>  
>  	if (screen_info_lfb_pdev)
>  		return; // already found
> diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
> index 1690706206e8..c022403c599a 100644
> --- a/include/linux/screen_info.h
> +++ b/include/linux/screen_info.h
> @@ -151,6 +151,4 @@ static inline struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
>  }
>  #endif
>  
> -extern struct screen_info screen_info;
> -
>  #endif /* _SCREEN_INFO_H */
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index 8b37247528bf..e8bde392c690 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -8,11 +8,10 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/platform_data/simplefb.h>
>  #include <linux/screen_info.h>
>  #include <linux/types.h>
>  
> -#include <linux/platform_data/simplefb.h>
> -
>  struct device;
>  struct platform_device;
>  struct screen_info;
> @@ -65,6 +64,8 @@ struct sysfb_display_info {
>  	struct screen_info screen;
>  };
>  
> +extern struct sysfb_display_info sysfb_primary_display;
> +
>  #ifdef CONFIG_SYSFB
>  
>  void sysfb_disable(struct device *dev);
> -- 
> 2.51.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
