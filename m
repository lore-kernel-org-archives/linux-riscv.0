Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6D4C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 20:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMkSjZWvsc8r8mD7BtbENVDLYoCdCqOCU37ZpdWGkg4=; b=mrzNS1Wff4anDI
	OtdHgi1MJOjrglIa51AlVYcj18luuep2lqMWKdma9uazA4zjYNg3/RhpJuRN9ZzVi8cSE1yOCTLqv
	XqyMDou+WAQ/JCxFBoS+vWAjwQuCZUEDMxZ8zc+2EMi/JYFceiWQ4Jb6GmUuu9WdjUEFXra0P+fct
	P6QJ8KOWUE+FdcCbTu35l3PBmzZaijvLhmNaCEvpwEK82ML5HEs//yh5BTHGwRb+xvatU/WCRviGp
	CgN5YNZtVyntDYpU67QzB5AlKiSU2V65qqIAfRkGTkOXP503/ZUSNmnUCjSLjQJ4EKiYOoxQVPvHb
	sDqk0CculyOvpv7PHy0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRHTB-00000008WeQ-3YzC;
	Tue, 09 Jul 2024 20:29:49 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRHT8-00000008Wdz-2Qao
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 20:29:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70b0d0a7a56so3078104b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720556985; x=1721161785; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r2+jHxAEG+4VbUC0OZZJU2rWzzQisahg87K71ePTkuY=;
        b=jeQa29NbmQHWcYs5hfq0gmIcdplLdHPiXvBAXSftKKClvIRhfgFAslhX/BB6NS3w7x
         LpAjbXfZnSbcSJnMFyBG1oVZe7DcEAdKPZnHw5e3rs+zGxY20DeWxEh+61qyK71L4A20
         /GC+4H9BbqUZ1WHTE1EtZ3YLkrQIa+3ORT/t6ZdM0/4a/koM0MbTUfvwGDDV5RDEL1Di
         YUtRrXhhgpxj8UyGTMxuK+eUKwJIUaZHfBARCRPo7t6Ws15GHG3QQNn8b802NB6W+kha
         gy1S4KM11AJC5VAxT8aPatmmtLKfA6syATYKMRejGaUQKUP5uq1bm9Os/2KNQ1BGJZyH
         TMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720556985; x=1721161785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2+jHxAEG+4VbUC0OZZJU2rWzzQisahg87K71ePTkuY=;
        b=WVhcsMtYF1ZfHyz7DcBLyh0mLT36PumNOoY+Hkb6eHDZZM3sB/PbaVmrXZXDSYVOAV
         dYPDGhs8lO/9tvB/dp36Fu4Y1qbBpR8xEapBy5S6siEKwDL51kUJc7vD4q4FaYmLsYqf
         H6gkNPwdIoUvVB2DTvjp4GKfI+T68RTRmkq6EdgPkh22kb9GbGmfnA5G98p0TgycP1fa
         WN8bNIKDuilOZelYn6nspE8C+lzK025gevSnN5JQZPaMqDn2jEhd39Aatfb5/m5/gGg8
         FBr3aU8eebHXof9P1Z76z0RKHlIQhaqRoMbd262aEA3rtMQdDFoNI9iSRRd8NX426xSa
         7rYA==
X-Forwarded-Encrypted: i=1; AJvYcCW2t1/V792NzbjCmxfLc0YkIehf/YD+UVdO0bkOkABpcqkaFnFg0JfPjLIN4PXFVcj52UezcKLxwsQsI/gS31IeMyQExO+j3o/Zn0bcF84S
X-Gm-Message-State: AOJu0Yxu2JR2Dcd920ZRPPGMo8+ens9xhUf1sSpY2tB3DQa3rgO2ZX+4
	2iaJUuWPAijeHSJUDEX1sAH9S2ySiDI5+w33NUiJQvKtsg2zXmDRunPoBa9Qdwc=
X-Google-Smtp-Source: AGHT+IHvyjUH8ArsNII9bJpvyGejtf+ilOTzEpcXtEvBjBrMVFs10pu7Ig8U8REkU9pJd97VpkeKjA==
X-Received: by 2002:a05:6a00:1395:b0:70a:f57c:fa1d with SMTP id d2e1a72fcca58-70b43623b6amr4658217b3a.29.1720556985517;
        Tue, 09 Jul 2024 13:29:45 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d5f0ab0bfsm1810102a12.1.2024.07.09.13.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 13:29:45 -0700 (PDT)
Date: Tue, 9 Jul 2024 13:29:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, atishp@atishpatra.org,
	anup@brainfault.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant macro check
Message-ID: <Zo2dtuv0quQ7FwtK@ghost>
References: <20240708121224.1148154-1-xiao.w.wang@intel.com>
 <20240708-wildcard-denim-12de7fae795b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708-wildcard-denim-12de7fae795b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_132946_865040_170F2FF2 
X-CRM114-Status: GOOD (  22.89  )
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

On Mon, Jul 08, 2024 at 01:22:11PM +0100, Conor Dooley wrote:
> On Mon, Jul 08, 2024 at 08:12:24PM +0800, Xiao Wang wrote:
> > The macro CONFIG_RISCV_PMU must have been defined when riscv_pmu.c gets
> > compiled, so this patch removes the redundant check.
> 
> Did you investigate why this define was added? Why do you think that it
> is redundant, rather than checking the incorrect config option?

This file is only compiled with CONFIG_RISCV_PMU:

# drivers/perf/Makefile
obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o

So having this check does seem redundant. I am copying Alex as it looks
like he wrote this.

- Charlie

> 
> Cheers,
> Conor.
> 
> > 
> > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > ---
> >  drivers/perf/riscv_pmu.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > index 0a02e85a8951..7644147d50b4 100644
> > --- a/drivers/perf/riscv_pmu.c
> > +++ b/drivers/perf/riscv_pmu.c
> > @@ -39,7 +39,6 @@ void arch_perf_update_userpage(struct perf_event *event,
> >  	userpg->cap_user_time_short = 0;
> >  	userpg->cap_user_rdpmc = riscv_perf_user_access(event);
> >  
> > -#ifdef CONFIG_RISCV_PMU
> >  	/*
> >  	 * The counters are 64-bit but the priv spec doesn't mandate all the
> >  	 * bits to be implemented: that's why, counter width can vary based on
> > @@ -47,7 +46,6 @@ void arch_perf_update_userpage(struct perf_event *event,
> >  	 */
> >  	if (userpg->cap_user_rdpmc)
> >  		userpg->pmc_width = to_riscv_pmu(event->pmu)->ctr_get_width(event->hw.idx) + 1;
> > -#endif
> >  
> >  	do {
> >  		rd = sched_clock_read_begin(&seq);
> > -- 
> > 2.25.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
