Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016A9C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prKn3LZiu+OQRX9HToq6CtO6novqiJyysINgke9GVkI=; b=O84Ab6DrAtektE
	bvywhG+c0Rn6ii324z3Dkl+2IYbjHZmAebJUb2qEU+eeWJuAiIUfbSIGWIgq4ZgXzn3NZ0hP77Zs0
	wWXZcoV4GL6t9wahIIE5efIvnG0kc1JJ0SZtip5TiCPm/ESgKLUsvL2jitOF/UrQmurm6TbN8LXm1
	zIYsHaGfHEKH9+IVUEnlWYcCfbZZfKQQQtlADc6bxadT/9UgSZJI6rQl3rlzB9eoNaMtGpNEgsoiO
	hL/0bcJ5oViK4dR7cEpJ0yhgoNZXlojRma8tVLEeRDozZnnpJfVWv2PKHARFYXv0M1LNuV4q+gbWC
	tHuNB4iOGugyZhIAJJDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEPn-005Qgd-2g;
	Mon, 04 Dec 2023 19:15:35 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEPk-005Qfu-24
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 19:15:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d0538d9bbcso29628725ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 11:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701717331; x=1702322131; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gLNCTARupzyNgRT6x18YzDTNwf+kcKqpIPYo+HCBokw=;
        b=qmzV7dNA21FyVC5swXuKdUpbEDTiCtsjEpoAZsNgMcGqUFGYd6WpQDg1ZTYu1fVvxK
         JFHsBXCojhESkDm924Hl9DoU70czKEszLyLK7cigqyT2mEWWByuYm7TK76puZSMbf+r5
         PVl9LFx9oO2xEF27BcPYhczD89eiar+HsQ4/l/xhgMf98bGaN8YWm0K6fC/O+sfZhlW9
         8OM405mnneh6MthLKiRnPkYbJozQBIV9P+QlEpFhndK0s/BLhwSCceMoGbLVhGQiRvoo
         YGvOw12WfYBHI7yjojdpwYYopbhmx4hdaMcCJjcbutIZgj4PVZc09sR5dTOOekcGQWrO
         n/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701717331; x=1702322131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLNCTARupzyNgRT6x18YzDTNwf+kcKqpIPYo+HCBokw=;
        b=tIXEB1PWnbZX1oUZGNN0x3pMSpIC658nSvzaNwWWUgWnUJFz41mT0XD8RESqJmn4r0
         9Z1XUUOe1WFeSWJ5xtOz+S7nnPTbhA5XHHEVIFTzMffcR6+mOk9d/wrqyyIewDp0uiAQ
         INcSYIhpfmo7yhN9Kqp9LAH04gqgEPzG0s4OWPnUqQv+Rb3VUmlPie8hUdkG9lZA2IXx
         +E6mFE4MfBIlXDZB5ZnS7zylkGNUuo+j5C/7tiTeOUl2MV206t1KeHzqf9g0G7T+ze9o
         GkVOcqWDBoZFUQY06IEis1G7axWbeMN6ykkBis2DY0MWwmVieuISZEjktIIuUQCrXsAT
         FA1g==
X-Gm-Message-State: AOJu0Yx3lFwKV4QWPcI90EkJNS9YSHKtDF7OK7RqowkSi9N/0l4EtB6d
	GVifhSXkzRRfNWMl4gb3FKnv8w==
X-Google-Smtp-Source: AGHT+IF1+hncDnlwONOq3K7JGHXoxT4PeNTA0x9QpCTjznLkr3m+MBONU0GdZwrvEODd/Q7iRl/euA==
X-Received: by 2002:a17:902:e74f:b0:1d0:b503:2edb with SMTP id p15-20020a170902e74f00b001d0b5032edbmr1448349plf.69.1701717330853;
        Mon, 04 Dec 2023 11:15:30 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902e84b00b001d076c2e346sm4731423plg.51.2023.12.04.11.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 11:15:30 -0800 (PST)
Date: Mon, 4 Dec 2023 11:15:28 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <ZW4lUDpl0eZVNjrp@ghost>
References: <20231203135753.1575-1-jszhang@kernel.org>
 <20231203135753.1575-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231203135753.1575-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_111532_680725_6C39E7BB 
X-CRM114-Status: GOOD (  26.00  )
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

On Sun, Dec 03, 2023 at 09:57:52PM +0800, Jisheng Zhang wrote:
> Some riscv implementations such as T-HEAD's C906, C908, C910 and C920
> support efficient unaligned access, for performance reason we want
> to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
> avoid performance regressions on other non efficient unaligned access
> platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globally selected.
> 
> To solve this problem, runtime code patching based on the detected
> speed is a good solution. But that's not easy, it involves lots of
> work to modify vairous subsystems such as net, mm, lib and so on.
> This can be done step by step.
> 
> So let's take an easier solution: add support to efficient unaligned
> access and hide the support under NONPORTABLE.
> 
> Now let's introduce RISCV_EFFICIENT_UNALIGNED_ACCESS which depends on
> NONPORTABLE, if users know during config time that the kernel will be
> only run on those efficient unaligned access hw platforms, they can
> enable it. Obviously, generic unified kernel Image shouldn't enable it.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7f8aa25457ba..0a76209e9b02 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -654,6 +654,18 @@ config RISCV_MISALIGNED
>  	  load/store for both kernel and userspace. When disable, misaligned
>  	  accesses will generate SIGBUS in userspace and panic in kernel.
>  
> +config RISCV_EFFICIENT_UNALIGNED_ACCESS

There already exists hwprobe for this purpose. If kernel code wants to
leverage the efficient unaligned accesses of hardware, it can use static
keys. I have a patch that will set this static key if the hardware was
detected to have fast unaligned accesses:

https://lore.kernel.org/linux-riscv/20231117-optimize_checksum-v11-2-7d9d954fe361@rivosinc.com/

- Charlie

> +	bool "Use unaligned access for some functions"
> +	depends on NONPORTABLE
> +	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	default n
> +	help
> +	  Say Y here if you want the kernel only run on hardware platforms which
> +	  support efficient unaligned access, then unaligned access will be used
> +	  in some functions for optimized performance.
> +
> +	  If unsure what to do here, say N.
> +
>  endmenu # "Platform type"
>  
>  menu "Kernel features"
> -- 
> 2.42.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
