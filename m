Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF5BD116E3
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 01:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmsL3DLlDVepx8m19Go+DoqoS/L/PG8zzMh1UL6qb0s=; b=ZCQSpxHBCE3hHz
	Z+WZU15Ml+YTTo1rM9voKj+ECL2bueZLbT57sdxP6/5ODmdSoTm9CzxN6Lfn/6agcv4uKngvhn6ZE
	tk8Y0yr18Dxv2atTh/HPqHh0RN8ILYm3HT4IgeR2ZSsxJJMlRs1LtQRicW10BgHL5vs4zkZtkyN2q
	+x5/KAcb4Yom2nv/KddybbBD4NWyiZpUU4cgArKH42SC/igXhWiaxFX8f2m3hzhN8Y3w+c7umUUmw
	3wsiG8N3m0vrJtYk9dyNk5TOcE1YuBVCAm8vagtqDW9cd6FUL8YY4t/CMPTOVEARtewTqTXxPejOz
	D2Bhw4Moqf5qmHojto4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQeN-0000000FqFZ-0hlc;
	Thu, 27 Nov 2025 01:18:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQeK-0000000FqEa-09aj
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 01:18:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477a1c28778so2840485e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 17:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764206298; x=1764811098; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=;
        b=dTG+6dSIakxsTfawMmWH8HCuOAd/4dAZpsdnvoNlLRohzdU56OiO1U2s9TggIUWAaU
         K+42NYcNk8xROONbc8ValFxn/B2pQXElHL0ekTR8WYn+2O+LGnaENa6lvajbBoWEKdh+
         nr43wIGV9OZBrCUMGAJA4hlwQpUjbMJ0tEfUz+DNXNuEOD+D0QJBmQ6smc2s3txHRru9
         eBvWdHhEkcBYm+FqWln+Mydp89XLVNAlHb4lCv5f04aCMH5dr2HKE3egCnMobqQofGHi
         v8osS/KnNTvc0KC26ZZEP5gd0MKCLpVksCyjz/Ex3iU0WDx8f0ste/D2Jr0gJAsOsel/
         toWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206298; x=1764811098;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=;
        b=nlcPTU5UJ326KvPfnV5j+BzuP2LOfy2le4E8pc2NBWCJsSa29eFM4XlfmcZmWOrLjo
         rCisyTUmoo3JQ6Cnt5lN+uz9eaIZLmbKzBrSyzwgpHixou9WSj3t5ujb4VDjkDVqsNgb
         LdJobMRALAT/w4BED4pR5Szx715XJiemNkp5AXeES+mt6aXL0UYYhZye9rLIKJbPTpqe
         oSO/M1Ms6vArzYvlBew5JDgpa/ZjL+3RczxpjM6gYbZDyJpRPs5R9Y10pq+LHkBgTZC9
         r0QfvFtrhygR5Oa8akEyPfvNCzrvZzETeC0LHBzc9YIfLzw/Zm5Lr2rSWEYxyDSJK+D7
         NgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEkgAxw+pS3MBd+V3CKQ5SQNbogMLRJl1p6wZaPb76xjgEsmCRDfcnVb2/l6ea/RIUV5XYWy36qMTo6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+SDNcCFJYez6Xc77z2K83FpkEvqbH4fkZJUlLrwI6SiI9rmK2
	fp8DzI553Yyd+dThY2TWjFfCUXi0Zb0Slq+NQMp+Cx6zS0pA1JgmxlVHeETMPuhZ9lM=
X-Gm-Gg: ASbGncs6EXbaeq8SrsExeEwNTbS7/os7jrdcBGPIKLx/ob/NA7Azbn+3CnNSgFIwyBF
	seML0X3lr+KlMNwwNpVfnC4MgMlmRc9Iv9yNlECdvAG+bQnH5AVicW3JS/desOe/hMqZGib9+P/
	68FcHXj6kRAq+yIMawgVKTEJ2wo9BVtaBJIrOSCPPkHohAOHtkOB8yUSYK8Avbawrf6Rmg5Q85L
	K8Wg0YfIWY7uUlXGvgX69x1m0EmRBuRfvGeCpWaBwsMPuwCcJVwcPs4JeTImDyVynJLKRMqt+4p
	xolPN/vRuv6+/sataah9HiTJ3/aKXkPZdWpE6+KgzNqGcxxiy/iALITe1mwi2wpc6rn0b5/AxbX
	/Dqed6v6aIfTIfEZy6j8TL8FAdoSIDPwCmMpUS518Fl7NrfPHYwtxs4YwN6WLTtBys9uHwe3aHA
	oxxPrbG1WjeYYLbA6oV2Y2eBH2GJKYFJtw
X-Google-Smtp-Source: AGHT+IHKRsRzIcI/YdpyjCx/e6RWPSP3syqAgwQHcfAEZoMWkqQomccWOuW4YSvp5SYEElJFnjRGrw==
X-Received: by 2002:a05:600c:19ce:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47904b25e63mr87066215e9.30.1764206297510;
        Wed, 26 Nov 2025 17:18:17 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075ddsm207261215ad.3.2025.11.26.17.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 17:18:17 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 09:18:09 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/9] sysfb: Add struct sysfb_display_info
Message-ID: <aSem0a7jTfCNTdX-@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
 <20251126160854.553077-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-4-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_171820_083333_6678C7C5 
X-CRM114-Status: GOOD (  16.28  )
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
> Add struct sysfb_display_info to wrap display-related state. For now
> it contains only the screen's video mode. Later EDID will be added as
> well.
> 
> This struct will be helpful for passing display state to sysfb drivers
> or from the EFI stub library.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  include/linux/sysfb.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index 8527a50a5290..8b37247528bf 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/screen_info.h>
>  #include <linux/types.h>
>  
>  #include <linux/platform_data/simplefb.h>
> @@ -60,6 +61,10 @@ struct efifb_dmi_info {
>  	int flags;
>  };
>  
> +struct sysfb_display_info {
> +	struct screen_info screen;
> +};
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
