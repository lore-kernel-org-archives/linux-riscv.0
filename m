Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294A4CFD31C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d38QO70s67c0Si0I+iwgnLG8mVlY3MuFg7CKtOpfqUw=; b=b7zgy5bwCCChnM
	nLqdb2Ln9962vmkOhRbCI8DQGBrvJyGcPjYMb3UxoJUdVVNi3/xFV5opiusnOO5l9E1/hKP0OnQF5
	NCY4j5tSj0OZTPshtv9WQt5jxNIObWhSyBPUpl7BpcIb2pvaANTi5pD+M3Qq0C6GjRAOywAnSegqv
	CNd+osS/R7W/lTd2pm40EIMKRn1QJS6yeTDJAIu8N4R0hja8f655V2DcJEvok9VLpq9u2tPk/7DrR
	gP5tZtN9OsY+MpeKU1JMAhherZfN3tco4CxtTiV7OU4XwWIOTaMjwQU5bb6jusnZpnahY1tSwixuU
	05hYHg1c+68t81UNjSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSsX-0000000BLdy-0HTj;
	Mon, 24 Nov 2025 09:29:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSsU-0000000BLd8-3xGx
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 09:29:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so34353175e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Nov 2025 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763976536; x=1764581336; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSUd6Iu5swY1yI3rOZ1kFsJAdObQXxI7F4AS/dEiKfI=;
        b=Ak2HaKGyKStPV31Zvg3vHaToYgzVKGflCwrbyMeNjI6C+x/iWw30bRVACL30CYQQsz
         vSoy71n/vemxLqDhcpyhHqLHLvzMEiG+GyZxAR43tsCd5SF0i+OcZWRFF5K/8QllG+pK
         eD1TVJuqevbfZfRnvN8z04qyFuXLP9dRC5nVKnYZz8QMlAFunFDuHgpKea0NkhqLzP0U
         AGSWzDoDbV9Z8//vRjq1IAfEYwXtCmoYzMn5zl7FHKPyzUf1PfCsB0/hCh2dFSf68jO7
         0h8/JD9Q8aLCRFIo6kH/PGnABLJp3J1j/H6BiQbkobYmODYStQvWwMe4INk6247EURIr
         bIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976536; x=1764581336;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSUd6Iu5swY1yI3rOZ1kFsJAdObQXxI7F4AS/dEiKfI=;
        b=OxeamadqPMjce9VIFVfjR69HORVMNGTRYSJykPkVlZ5d3RA0/mKSubjwmC5AHHOQyp
         Yjiz5mRcQqKBVYBq8CMrVgTL+tqjfKkS1Ek7wfA1MkESmsJpY2ysvcV5E+820ShEP+xO
         doPZFK+ye1cEfZVzQ141m5bI6V8Xj+TomV59FROvmzibRKmSWoRxgv27BdBk3bW+OEaX
         8IWMxeql9vxza6H614fgNDUl/6ySR0o4c0vLt9Z3cgXDXcf7kANL4QI/cF4Ixe9stphU
         MUH6wCowUTe2xfXD7rRE+rd9s6xrMcllR5E//2j9NHVlT2HrZK+w1C+lyafUVd6Fs4Mn
         tWEA==
X-Forwarded-Encrypted: i=1; AJvYcCU/LmQVh7vo3qsHRtrONSn00w6dVhMAjb6EKnVxS/7lrTnOovstsBrgE2ht0nkbcjo5uC6Zu0jxXiwpxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxapMotX/ri3EPg5n09nfGT54AB2xyeIdD4kTFcoaGzrpP+vP4z
	4tT9wSj5sD3lOPj964It3AdKXh+SoVn/Ar+kaX99W4mOG4xjvB8IShef9UGMmsVMTzk=
X-Gm-Gg: ASbGncvImH1dj9Pn9vl27qPjPltXVvqU6pk3l8pTss8iOfTGqMyzCCiw+9UgpLy3IhP
	7yomoL8jwlVdpTvAy2EcV1JseVP6WVm/yBpenzljGS4/BTYOk4NEiD5r/hWTNSu+tAXP7/VylQI
	nIoRIIL2VS4pnTTVswxuOrb5YF+3ILKEwkAonBKxwgKKEJnXs0R/O9Whips+DFgwgUltyfehqyJ
	zlxGdeGS+E7OW81zFVLLHb3C7ZGpUD0WGSKoaJf/2/4uZ8l9peWAeFy70zfoaJUvmB8wdPyb4/T
	g93TrwrOS4YWwPfKfjrgv/+gcVUkdtqKc3QCk+3b8Y4rjXT+2k0c2SgQp2yAaOJxVk8gOq+6ULE
	60KfyC7YqytM3z0jdkGgV0pGPfeTHfzKEmn0G9cQKtRE+80F23Xx3otK42rEHgRvvp0vyw8Gcch
	zyG1DGGhhzTIpl0tgybBaUok75cxXqRmHm99NDMq0g
X-Google-Smtp-Source: AGHT+IGqX87Liusvu8VA+P6vAK2NQvQqKGFS75x4fPSdpk7QAnEFO6Q86alRxbuZVhECcom6UWrp6g==
X-Received: by 2002:a05:600c:1c0c:b0:46e:7e22:ff6a with SMTP id 5b1f17b1804b1-477c018a099mr145588045e9.15.1763976536416;
        Mon, 24 Nov 2025 01:28:56 -0800 (PST)
Received: from r1chard (220-129-146-231.dynamic-ip.hinet.net. [220.129.146.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b03c7515sm9757191a91.5.2025.11.24.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:28:56 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Mon, 24 Nov 2025 17:28:49 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/6] efi: earlycon: Reduce number of references to global
 screen_info
Message-ID: <aSQlUVPfQrEwXPWm@r1chard>
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <20251121135624.494768-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121135624.494768-2-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_012859_020071_EAB5DB18 
X-CRM114-Status: GOOD (  19.73  )
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

On 2025/11/21 14:36, Thomas Zimmermann wrote:
> Replace usage of global screen_info with local pointers. This will
> later reduce churn when screen_info is being moved.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/efi/earlycon.c | 40 ++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
> index d18a1a5de144..fac3a295c57f 100644
> --- a/drivers/firmware/efi/earlycon.c
> +++ b/drivers/firmware/efi/earlycon.c
> @@ -32,12 +32,13 @@ static void *efi_fb;
>   */
>  static int __init efi_earlycon_remap_fb(void)
>  {
> +	const struct screen_info *si = &screen_info;
> +
>  	/* bail if there is no bootconsole or it was unregistered already */
>  	if (!earlycon_console || !console_is_registered(earlycon_console))
>  		return 0;
>  
> -	efi_fb = memremap(fb_base, screen_info.lfb_size,
> -			  fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
> +	efi_fb = memremap(fb_base, si->lfb_size, fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
>  
>  	return efi_fb ? 0 : -ENOMEM;
>  }
> @@ -71,12 +72,12 @@ static __ref void efi_earlycon_unmap(void *addr, unsigned long len)
>  	early_memunmap(addr, len);
>  }
>  
> -static void efi_earlycon_clear_scanline(unsigned int y)
> +static void efi_earlycon_clear_scanline(unsigned int y, const struct screen_info *si)
>  {
>  	unsigned long *dst;
>  	u16 len;
>  
> -	len = screen_info.lfb_linelength;
> +	len = si->lfb_linelength;
>  	dst = efi_earlycon_map(y*len, len);
>  	if (!dst)
>  		return;
> @@ -85,7 +86,7 @@ static void efi_earlycon_clear_scanline(unsigned int y)
>  	efi_earlycon_unmap(dst, len);
>  }
>  
> -static void efi_earlycon_scroll_up(void)
> +static void efi_earlycon_scroll_up(const struct screen_info *si)
>  {
>  	unsigned long *dst, *src;
>  	u16 maxlen = 0;
> @@ -99,8 +100,8 @@ static void efi_earlycon_scroll_up(void)
>  	}
>  	maxlen *= 4;
>  
> -	len = screen_info.lfb_linelength;
> -	height = screen_info.lfb_height;
> +	len = si->lfb_linelength;
> +	height = si->lfb_height;
>  
>  	for (i = 0; i < height - font->height; i++) {
>  		dst = efi_earlycon_map(i*len, len);
> @@ -120,7 +121,8 @@ static void efi_earlycon_scroll_up(void)
>  	}
>  }
>  
> -static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
> +static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h,
> +				    const struct screen_info *si)
>  {
>  	const u32 color_black = 0x00000000;
>  	const u32 color_white = 0x00ffffff;
> @@ -145,13 +147,12 @@ static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
>  static void
>  efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  {
> -	struct screen_info *si;
> +	const struct screen_info *si = &screen_info;
>  	u32 cur_efi_x = efi_x;
>  	unsigned int len;
>  	const char *s;
>  	void *dst;
>  
> -	si = &screen_info;
>  	len = si->lfb_linelength;
>  
>  	while (num) {
> @@ -174,7 +175,7 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  			x = efi_x;
>  
>  			while (n-- > 0) {
> -				efi_earlycon_write_char(dst + x*4, *s, h);
> +				efi_earlycon_write_char(dst + x*4, *s, h, si);
>  				x += font->width;
>  				s++;
>  			}
> @@ -207,10 +208,10 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  			cur_line_y = (cur_line_y + 1) % max_line_y;
>  
>  			efi_y -= font->height;
> -			efi_earlycon_scroll_up();
> +			efi_earlycon_scroll_up(si);
>  
>  			for (i = 0; i < font->height; i++)
> -				efi_earlycon_clear_scanline(efi_y + i);
> +				efi_earlycon_clear_scanline(efi_y + i, si);
>  		}
>  	}
>  }
> @@ -226,22 +227,21 @@ void __init efi_earlycon_reprobe(void)
>  static int __init efi_earlycon_setup(struct earlycon_device *device,
>  				     const char *opt)
>  {
> -	struct screen_info *si;
> +	const struct screen_info *si = &screen_info;
>  	u16 xres, yres;
>  	u32 i;
>  
>  	fb_wb = opt && !strcmp(opt, "ram");
>  
> -	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI) {
> +	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
>  		fb_probed = true;
>  		return -ENODEV;
>  	}
>  
> -	fb_base = screen_info.lfb_base;
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		fb_base |= (u64)screen_info.ext_lfb_base << 32;
> +	fb_base = si->lfb_base;
> +	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		fb_base |= (u64)si->ext_lfb_base << 32;
>  
> -	si = &screen_info;
>  	xres = si->lfb_width;
>  	yres = si->lfb_height;
>  
> @@ -266,7 +266,7 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
>  
>  	efi_y -= font->height;
>  	for (i = 0; i < (yres - efi_y) / font->height; i++)
> -		efi_earlycon_scroll_up();
> +		efi_earlycon_scroll_up(si);
>  
>  	device->con->write = efi_earlycon_write;
>  	earlycon_console = device->con;
> -- 
> 2.51.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
