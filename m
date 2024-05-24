Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158ABC25B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95BwfgDzams1GYrIPJ//Y/HyAS4op/xp19ay+lo7nRs=; b=sDOF8v/cYTO34S
	VL8Ijln01kA3HCxlonKd2mcnjcCvXUogCyJ6gZNV6/rGDx8JofXIsP2nl+nnmxwklUTLZmfMUUGo5
	cNZHnHmfgKPISH1VEq9B1PBwf7dK5RvtNvqi1x64c8Lfdv87hvWka4Q0mAYgHWgoJGfj9inC9pwXc
	6nlwUZiT9JQctstOPSEg65pNAYsxx+3A7mihD+131Wbd/mB6X8dc76E5zy14zlm1WkexoxZ2aC2Pv
	haA3CUMP0DlmIS5f0yjgBx0VUwZDMWVvug7H9A4xwwD5YFskhApWVsIpjqxVQHHDxrFD+4mH9fn6/
	2arAUsDVNA+qVFdcv/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWZ8-00000009C8D-2wzA;
	Fri, 24 May 2024 15:10:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWZ2-00000009C4W-1bQg
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 15:10:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f333c7e702so22734275ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716563435; x=1717168235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Af8OGgxbQV2zOwezxQcvFU86Dm2eLu88EEanROVZ7Gs=;
        b=KagpUi/1J6CQWzZfVmnaAKq7ltAgGeKZKc961TQaNqU2d8SVCcC13ZRwUDQm5nnbWn
         WUsQVhHx8Px6rtOOMjIpYfp3p4YpZlgvnzh92LxDnn3J+fElCfAGvPl3184HneBbAHfo
         g52KwidPlvC/B/xlOlniekPEx7ipLgfbyCXAm1ZJYeAH7eNH6HtksP4FRethQ/lAijIs
         mD5EDCWMpP1BuBBTbq9uCGLNW+T9W7D5PGX35dRJh4aV/CY7gQMjqsfs6d5/AkDGdn0d
         YaeOAgHMg6ZT+EysCGbyq0skabnEpoC3T3shZH1CftWM3RaEX/ILaKRFIZTKU4flFTIG
         l/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716563435; x=1717168235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af8OGgxbQV2zOwezxQcvFU86Dm2eLu88EEanROVZ7Gs=;
        b=YsT+7sY3h/lKq9QqtDej0uxbg6+jPze2Urtafe5PluqXFMaCJnLDxuyyX5Rw0fHo7I
         s4LQnv+Os8+v1sfBmCvhPXMY5/SXEsbL0aOOaAb7fXHsUjxf5sCJsyOGQtX5SafJswXF
         z0J9SlF4qaUYT1vgUv5iChIZybQYx1pevxkeTInBtE8mk/o4TIbghTTuTke2EDl8W5kg
         gX2bWbs0I5Q4eYSoiqERf6XPA7wGjlIB4II9X0PMTUN/g4ZYPjoAPNQlQJh93HWG/LhI
         K5mTuer0aKiGxP/6Jfoy+nlV8mr6ZmbrXQBvLB17x0QbcQkrU1FeyRY+KGUD1CcMkgsa
         vLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKXCrSxbV+fr2oaUWhp+YHwbpcDusKxrEGq6p7Xlc2hIb56CqOlQi3eK0KlExi+QsEvHbMGOgHEpslfGwCxH3C/bdO/vX4gZlzq70mwLHx
X-Gm-Message-State: AOJu0YzogoNt2tpnA1hFTCGmEXgUFuc4R8nqJlcBHVxbKR/dT4hdMsk4
	QBgmeO06U4x4joGmBrsWGJNtbyvpgNRLdPGen3qVnEVhuVlqkKvG
X-Google-Smtp-Source: AGHT+IFKYN2gEtwY0G5Fgxz9qkP4RfG7v4i0vZYDVcNVAVijtzn7fY8SJLSV2w+zed8Sv5SV56vdfg==
X-Received: by 2002:a17:903:230a:b0:1f2:fe12:b79e with SMTP id d9443c01a7336-1f4487029cemr23870065ad.17.1716563434513;
        Fri, 24 May 2024 08:10:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7535d2sm14989705ad.22.2024.05.24.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 08:10:33 -0700 (PDT)
Date: Fri, 24 May 2024 08:10:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, naresh.kamboju@linaro.org,
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org,
	regressions@lists.linux.dev, linux-riscv@lists.infradead.org,
	apatel@ventanamicro.com, tglx@linutronix.de,
	anders.roxell@linaro.org, dan.carpenter@linaro.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments
 to function 'riscv_ipi_set_virq_range'
Message-ID: <ab42f444-b10c-4992-bc6a-83e269cfe9d0@roeck-us.net>
References: <20240515-zen-calculate-289cfb90cd65@spud>
 <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_081036_503684_F685202C 
X-CRM114-Status: GOOD (  16.16  )
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

On Wed, May 15, 2024 at 10:05:59AM -0700, Palmer Dabbelt wrote:
> On Wed, 15 May 2024 07:36:33 PDT (-0700), Conor Dooley wrote:
> > Palmer,
> > This is the issue I point out to you on the call earlier:
> 
> Ya, thanks, I just hit it.  Looks like it's a semantic conflict between
> 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
> and dc892fb44322 ("riscv: Use IPIs for remote cache/TLB flushes by
> default").  I think all we need is
> 
> diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
> index 886418ec06cb..4fbb37074d29 100644
> --- a/drivers/irqchip/irq-riscv-imsic-early.c
> +++ b/drivers/irqchip/irq-riscv-imsic-early.c
> @@ -49,7 +49,7 @@ static int __init imsic_ipi_domain_init(void)
>                return virq < 0 ? virq : -ENOMEM;
> 
>        /* Set vIRQ range */
> -       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
> +       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
> 
>        /* Announce that IMSIC is providing IPIs */
>        pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
> 
> as a conflict resolution, which IIUC should happen when Linus merges my next
> PR.  So I'll try and remember to call that out.
> 

Unfortunately it looks like the conflict resolution did not happen,
and mainline builds are now affected.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
