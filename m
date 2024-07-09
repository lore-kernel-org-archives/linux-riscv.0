Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E38DC2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 20:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Su6sCZYu1iLa1dPS3rjxOow2J2qyxFiRdwdBxlrhv4w=; b=0/bWBwBLUyM+JB
	OCOVjTaAhJCyDSXp7zidueMprNKvw2D8n3xeeTkuxLuFMcg++oCFA+5u+LeVuOWbiKfie7QK8MRGp
	Wpt4ZYRunuH+IrD4oUG3BfY2YUl+xJ/GPgDC+AYbHEuFftYvQIdjI0xHJtuBW+dx8TWrc1DBhluh5
	o57Iux+VJ1k5czopnZGuZa1JqfOZT4+gQK3/rQl239PnsK1S6g3xwRF5jh2wOexeNYkcztM2gyEWu
	/Yw3jQ5i7ECODhyePjZlBzQZs5Vb9pOdYNsgkhPQ7LDn1MkIDQwea3uZj9EjYXcjbvfUY2q4GwCdJ
	Q5hK1rW6WF80tyCpP0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRHuM-00000008aqI-0yom;
	Tue, 09 Jul 2024 20:57:54 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRHuJ-00000008apo-1Kd9
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 20:57:53 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5c697fc4aa2so598119eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 13:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720558670; x=1721163470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JFkFgEMwAFqLLgQ8q+9F2STswPj9iSERKoMxl+rv1I=;
        b=Pa9KImJ8hA/8Jm+J6aSChTFM6T8/amckhVnG396FfhEgsiY6KPLFzplzaPsR18F8Hx
         Zd1Yq2jT6KZ182z4v8llP8S3+CIGL/9zUKvPHKp8NtyCieN4kEtIoGASmbduweLt0XK1
         Lr+T0I8YYZVilPel7YTGBzfC0NgyxR8tM5xmlum5M1i0v6fJt3/LdnN2bJARIF6MX/24
         0XfYIB/NqxpNYGkO2CUK6m01HKZOhvZPNwcQTYj9KqeSj4NMXfMNqUOdZ1lG21v//Rr/
         xttzTbJm1yH3RLDbbG91my9KptYn1FJlmLRajqPU57OYmLou8efSm8aeNBxV6X+eTTaR
         em2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720558670; x=1721163470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JFkFgEMwAFqLLgQ8q+9F2STswPj9iSERKoMxl+rv1I=;
        b=O81YpAkdu8QCJs1Uzghw6UyhlbjgU8SU3Jb78G/kqMrg8OnhQoTrKAQ5ARQI7M6/y5
         n0KOFdXqE/JEGFAV7sQfIwQAS2wZA9HbfTCdxt/KOmO88wa4hq1rYZiWbnKWzxbd48zR
         UomNUlV6cJeckJmsm5/8Ucd3zBvt1tSnxA4By8RmzhUnRr4SK1M0oAKx2dj6YQngWyl0
         3cIpR6fuU3XhMcgeVpPy7oIusGb4UGTsWKYoI6L/YpaXMa0JNP50HY3nuCsheVSnkh3v
         tfP6j0QsnUE+/ozWkhjDUEoqsW+RGTuIxowqOqg8rE337cJnBFKxx3XTTAoL8O0hMVSw
         g60A==
X-Forwarded-Encrypted: i=1; AJvYcCVGxSBDQp4noCD6Obl7IkV5TrAFdBkAawXd4NvE0XZWhzAM45Ah4uNN2pzKxpgtR7TEdLEbmd6VbPo1ZXgjbUqGpts73lS+87BT/iLhUtuT
X-Gm-Message-State: AOJu0Yx3kPilHwYzN3kuc576bEaB4DEa7lVcNIBXrZ4oE5DiyVhIiU2W
	IAqAuEa2oL44/U/SI1PNsGLvHZxZuDpl+rdSJtrTNssrfFDeTHBOHaObolXpRwU=
X-Google-Smtp-Source: AGHT+IFM6JPO00EDOYIlswbIOR4HoV/jvewcxyTuZsslE/z05OqIkhaPvLWDkjiK4Ps+QOGApj1kFQ==
X-Received: by 2002:a05:6871:2887:b0:25c:b3c9:ecda with SMTP id 586e51a60fabf-25eaebdb520mr2914029fac.38.1720558669887;
        Tue, 09 Jul 2024 13:57:49 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4398039csm2269167b3a.154.2024.07.09.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 13:57:49 -0700 (PDT)
Date: Tue, 9 Jul 2024 13:57:47 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, atishp@atishpatra.org,
	anup@brainfault.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant macro check
Message-ID: <Zo2kSxsJkdkBdBEW@ghost>
References: <20240708121224.1148154-1-xiao.w.wang@intel.com>
 <20240708-wildcard-denim-12de7fae795b@spud>
 <Zo2dtuv0quQ7FwtK@ghost>
 <20240709-unengaged-handgrip-56a5c7b3e1d1@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240709-unengaged-handgrip-56a5c7b3e1d1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_135751_383685_49F9D659 
X-CRM114-Status: GOOD (  32.86  )
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

On Tue, Jul 09, 2024 at 09:44:17PM +0100, Conor Dooley wrote:
> On Tue, Jul 09, 2024 at 01:29:42PM -0700, Charlie Jenkins wrote:
> > On Mon, Jul 08, 2024 at 01:22:11PM +0100, Conor Dooley wrote:
> > > On Mon, Jul 08, 2024 at 08:12:24PM +0800, Xiao Wang wrote:
> > > > The macro CONFIG_RISCV_PMU must have been defined when riscv_pmu.c gets
> > > > compiled, so this patch removes the redundant check.
> > > 
> > > Did you investigate why this define was added? Why do you think that it
> > > is redundant, rather than checking the incorrect config option?
> > 
> > This file is only compiled with CONFIG_RISCV_PMU:
> 
> I might be ill, but I can still read. I was not disagreeing with Xiao
> that the condition is redundant as written - I want to know whether they
> made sure that this check was intentionally using CONFIG_RISCV_PMU in the
> first place, or if another option should have been here instead.

Makes sense! Looking through the lists I see this RFC from Atish where
he introduced a different config option for this
"CONFIG_RISCV_PMU_COMMON"[1]. I wonder if something got confused in the
development of these two patches.

Link:
https://lore.kernel.org/lkml/20240217005738.3744121-12-atishp@rivosinc.com/
[1]

- Charlie

> 
> > 
> > # drivers/perf/Makefile
> > obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
> > 
> > So having this check does seem redundant. I am copying Alex as it looks
> > like he wrote this.
> > 
> > - Charlie
> > 
> > > 
> > > Cheers,
> > > Conor.
> > > 
> > > > 
> > > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > > ---
> > > >  drivers/perf/riscv_pmu.c | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > > > index 0a02e85a8951..7644147d50b4 100644
> > > > --- a/drivers/perf/riscv_pmu.c
> > > > +++ b/drivers/perf/riscv_pmu.c
> > > > @@ -39,7 +39,6 @@ void arch_perf_update_userpage(struct perf_event *event,
> > > >  	userpg->cap_user_time_short = 0;
> > > >  	userpg->cap_user_rdpmc = riscv_perf_user_access(event);
> > > >  
> > > > -#ifdef CONFIG_RISCV_PMU
> > > >  	/*
> > > >  	 * The counters are 64-bit but the priv spec doesn't mandate all the
> > > >  	 * bits to be implemented: that's why, counter width can vary based on
> > > > @@ -47,7 +46,6 @@ void arch_perf_update_userpage(struct perf_event *event,
> > > >  	 */
> > > >  	if (userpg->cap_user_rdpmc)
> > > >  		userpg->pmc_width = to_riscv_pmu(event->pmu)->ctr_get_width(event->hw.idx) + 1;
> > > > -#endif
> > > >  
> > > >  	do {
> > > >  		rd = sched_clock_read_begin(&seq);
> > > > -- 
> > > > 2.25.1
> > > > 
> > > > 
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
