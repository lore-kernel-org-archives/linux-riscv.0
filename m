Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D24C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8lFeRfLQvQ3Mt560V7pURXN+oSgtj6Ib7beBeO95bA=; b=fTUzLNrVuXeTVp
	1g3bGtAXCcssxKMSaxu5minioT5nESxxGKCGJQK2v/XMgvcbdcAxz3GKLk6EMfNwSk8IIT43zgI1Y
	BXclaBq3dlLSz3wjPvJWGLNcjtgTz+keABWlHv6L5PNS8cWbcDyat3oKsyfszYJ9p1k6gRk7NZa72
	vKs5yI64DNadRfVL/zvhlxp8Mgz6PdDye6wT5+NP9gthSTAeCLuaINCYz4yhm/G8yWxDFo+pNdlDu
	OOXOgPzZCrpqBPFhbvYUC2IU9WkEc+67xW13WgLc/BvHEQditBwWnDlmPuJ82FxrwbZs4pp3KLYDd
	1UPZZm3z7jwxuAggRwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7Yc-007cwU-1R;
	Wed, 19 Jul 2023 13:49:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7Ya-007cvV-0F
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 13:49:33 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3158a5e64b6so6532380f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689774570; x=1692366570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JeaSSoZd0P4aBDcnBZ8BgOhayrU2NW5OGYbO05NkL/4=;
        b=mSLGK2c7L5EE4FfadrFnGKrx8rHqMorl3CkK/H11fHsq3cy4XSsKtutECoQcxj7VUH
         6217O/9tcynPgDcZCiS5kwgKPRQ9yaxcBfet9pGpjP3OtetZCluXE3f4KQeLL37dXcdq
         Shyafc4xZzvzAf3/I3duYT0A6Lan59ePh67EPf8B6LGZv9LJEeK4tH3b6lkOaji6veEW
         jV3wN5L8eRb0FEZEQdFL5i8bBvckl20VHoXJydGdhlh18d4M6Z7KwE4oD2NfJGaix4SY
         m60NOgE8+OkCmcQdiCC141H+NDbenv1Kvjlt/AYNlG4in4PaDFI5cUWT/kWWjIB6GhTf
         8q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689774570; x=1692366570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeaSSoZd0P4aBDcnBZ8BgOhayrU2NW5OGYbO05NkL/4=;
        b=gVJ5bshi3cZ9FsZOPURX0zG1iZ/61qAYoZlZnm18JhjuHhQMpQ9QfBz1HVsXei/DyB
         MhtR6MH6dN5VRXYmbsjaXgZd6619vWqNZS+M8/LMObSlZ9ZrUpU3UFV7zisjJeoNIKXU
         vIv2VGQjtL624tNY9+xwQZTlW3jBMPrfmWH8Q9TBL1W0Y2T/ybUFeIFuPlu5uvKEtRZL
         s26U6TcIwfWOLUkIbdtDR8fDRLbISZiyWxEorsOyIKuRzHngyqxAsFD7NJ04MT9fg/kY
         b4J01jLCk1ENo6kvOBJSL3ia8oXgHNTLll7aQihzTSYBvWa/eBIK12uv5CGrOEHqyZG5
         F42A==
X-Gm-Message-State: ABy/qLZEwatxtle3E7Iqp2Lu+y+85KMiYAysaqtF3sgxAAXC/pGdSTtJ
	0YtrS8MpBmy29obdgnAJOo1UcQ==
X-Google-Smtp-Source: APBJJlEbRVrqi3m5ZvwiJaNOZocZP7fbMQ7EmoV04cKWj5tMJSoThE8C5X94lSqKcc5w5KB/JoRc7Q==
X-Received: by 2002:adf:d0d1:0:b0:314:824:3777 with SMTP id z17-20020adfd0d1000000b0031408243777mr13524380wrh.48.1689774570336;
        Wed, 19 Jul 2023 06:49:30 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.201.220])
        by smtp.gmail.com with ESMTPSA id w17-20020adfde91000000b00315a57f1128sm5357828wrl.115.2023.07.19.06.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 06:49:29 -0700 (PDT)
Message-ID: <32595080-dd79-5cf0-46e7-b82d0df8f067@linaro.org>
Date: Wed, 19 Jul 2023 15:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/9] vgacon: remove screen_info dependency
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
 Khalid Aziz <khalid@gonehiking.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>,
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
 <20230719123944.3438363-6-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230719123944.3438363-6-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_064932_169614_137CF11C 
X-CRM114-Status: GOOD (  21.02  )
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

Hi Arnd,

On 19/7/23 14:39, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The vga console driver is fairly self-contained, and only used by
> architectures that explicitly initialize the screen_info settings.
> 
> Chance every instance that picks the vga console by setting conswitchp
> to call a function instead, and pass a reference to the screen_info
> there.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/alpha/kernel/setup.c      |  2 +-
>   arch/arm/kernel/setup.c        |  2 +-
>   arch/ia64/kernel/setup.c       |  2 +-
>   arch/mips/kernel/setup.c       |  2 +-
>   arch/x86/kernel/setup.c        |  2 +-
>   drivers/firmware/pcdp.c        |  2 +-
>   drivers/video/console/vgacon.c | 68 ++++++++++++++++++++--------------
>   include/linux/console.h        |  7 ++++
>   8 files changed, 53 insertions(+), 34 deletions(-)


> @@ -1074,13 +1077,13 @@ static int vgacon_resize(struct vc_data *c, unsigned int width,
>   		 * Ho ho!  Someone (svgatextmode, eh?) may have reprogrammed
>   		 * the video mode!  Set the new defaults then and go away.
>   		 */
> -		screen_info.orig_video_cols = width;
> -		screen_info.orig_video_lines = height;
> +		vga_si->orig_video_cols = width;
> +		vga_si->orig_video_lines = height;
>   		vga_default_font_height = c->vc_cell_height;
>   		return 0;
>   	}
> -	if (width % 2 || width > screen_info.orig_video_cols ||
> -	    height > (screen_info.orig_video_lines * vga_default_font_height)/
> +	if (width % 2 || width > vga_si->orig_video_cols ||
> +	    height > (vga_si->orig_video_lines * vga_default_font_height)/
>   	    c->vc_cell_height)
>   		return -EINVAL;
>   
> @@ -1110,8 +1113,8 @@ static void vgacon_save_screen(struct vc_data *c)
>   		 * console initialization routines.
>   		 */
>   		vga_bootup_console = 1;
> -		c->state.x = screen_info.orig_x;
> -		c->state.y = screen_info.orig_y;
> +		c->state.x = vga_si->orig_x;
> +		c->state.y = vga_si->orig_y;

Not really my area, so bare with me if this is obviously not
possible :) If using DUMMY_CONSOLE, can we trigger a save_screen
/ resize? If so, we'd reach here with vga_si=NULL.

>   	}
>   
>   	/* We can't copy in more than the size of the video buffer,
> @@ -1204,4 +1207,13 @@ const struct consw vga_con = {
>   };
>   EXPORT_SYMBOL(vga_con);
>   
> +void vgacon_register_screen(struct screen_info *si)
> +{
> +	if (!si || vga_si)
> +		return;
> +
> +	conswitchp = &vga_con;
> +	vga_si = si;
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
