Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5CCC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov2k83It+sMKShPrUKnnqkMPgQQdVAzFTmOr+vwzuMU=; b=f6eH+15WGpONpg
	B3j66hl1vXBgQVH/MawG3uODtxxB5ohSAJSzvoMhGDY8loauYI+hVVp78dsc2VKxaHr84NxG8E4I+
	n9i7G1kfK1KtzTsIwZxikN76qZs/odDw3BHaVA4XhHUIV1IzIgPtZsg7gY3EnLWrWa4+zUuPJWpz3
	HMcOSzdfiq9EitAHR/HLx+FqaHi1tAK7YmBx4NLVlbwazDiLXy/OsiZndFHP2H9IHPpRhMrWEfy1p
	yVN3T17QEES+M3dQtmO13+YMos4zGabWOiSsyJ7vzdA5I5DKCVLeIYKdS/Dw7ipKM8OTjY3TE+lDL
	BKFih8MhQRFzQFAEEtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cby-00AXlV-26;
	Mon, 29 May 2023 13:08:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cbv-00AXjC-28
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:08:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f60b3f32b4so20760385e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 May 2023 06:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685365706; x=1687957706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aF9IRkrLPVcWloa4pJuck748Ln8OhhbNXky3Ir8k0q4=;
        b=oDdQjbmQpKR4roJ5hsrTJKqncwFAwFtXI1xz8SidikDtpNt0oFL/UATfvoZQ7f+2Yk
         nWD/dvCxaZDW0RaWBCwcyaX0hMXLa9JAtT+umv2h1xV0A+At9i+e8mGLPUvlluLjNoYg
         xEZlF01sZqXhcPbDDVY8WXdR8oxvTw5p/Gtw/3TWh0rNA2BvdTijgIy5bzRCX6fIopUV
         WM79VLuNieo03Wf0iqv5OQJygcse9NuF8zyyBMlOGFNAuHZ/5DFjc2U3n6erFUM44I9x
         /0QPw6jR9Uz1Wn3BcMp8N7/7ANAXfkV3nNzpBoKvfwy5a/R+pUtwMOqNduILi/8rOClc
         ByCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685365706; x=1687957706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF9IRkrLPVcWloa4pJuck748Ln8OhhbNXky3Ir8k0q4=;
        b=OIHpoKHih473VjPzC2tvD0R1B07H2hcVoWE+XyRVBKiQYMiluIiVmfkoiULM+n619W
         s8iyjM6kSF4Z3OvI12qxPUOHMC9IRMnInITpOpGlRz5z3EpcYwNCTNQmNBJI7gYFRxHO
         xyotA5yzMW+pN/JHPyqAE8eORd+lNA8L3ibWjNa5EhAj5WvTWCxjsIaBEDDvRqDoe83g
         HsXQwiS/j99fgRJy0xc3Oi8qFNUTbVSsLAyja2fNu7I1OnMAzX4Eu/+t9J0lCe6pTs42
         GNuKqS4SED7uun8jm8KHb7gwZrniJLVIwqNLni7BLAnsDWd05XoZWb24z9bMmp1iNDRh
         b9FA==
X-Gm-Message-State: AC+VfDwe6/Z5M6yJpQiXTVggUKil6vg7+FPZ+f3qPBUAqNHqX1xpCsuh
	y0/WCidzRk8foW/rOrWdHfZGZA==
X-Google-Smtp-Source: ACHHUZ49VvpE0rxW0tNNSGGKMg0HCyKSXjsUguIvGNkHncqKM5NlknUc6CoCheA0Yx8Y5aGbjJqOtg==
X-Received: by 2002:a1c:7711:0:b0:3f1:9b85:e305 with SMTP id t17-20020a1c7711000000b003f19b85e305mr10801478wmi.34.1685365706382;
        Mon, 29 May 2023 06:08:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z26-20020a05600c221a00b003f60101074dsm17862149wml.33.2023.05.29.06.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 06:08:26 -0700 (PDT)
Date: Mon, 29 May 2023 15:08:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, suagrfillet@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable ARCH_SUSPEND_POSSIBLE for s2idle
Message-ID: <20230529-635a440721fd4e1305cbc9c9@orel>
References: <20230529101524.322076-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529101524.322076-1-songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_060831_704007_89852D85 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, May 29, 2023 at 06:15:24PM +0800, Song Shuai wrote:
> With this configuration opened, the basic platform-independent s2idle is
> provided by the sole "s2idle" string in `/sys/power/mem_sleep`.
> 
> At the end of s2idle, harts will hit the `wfi` instruction or enter the
> SUSPENDED state through the sbi_cpuidle driver. The interrupt of possible
> wakeup devices will be kept to wake the system up.
> 
> And platform-specific sleep states can be provided by future ACPI and
> SBI SUSP extension support.
> 
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>  arch/riscv/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 348c0fa1fc8c..4bb818035585 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -805,6 +805,9 @@ config ARCH_HIBERNATION_POSSIBLE
>  config ARCH_HIBERNATION_HEADER
>  	def_bool HIBERNATION
>  
> +config ARCH_SUSPEND_POSSIBLE
> +	def_bool y
> +
>  endmenu # "Power management options"
>  
>  menu "CPU Power Management"
> -- 
> 2.20.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
