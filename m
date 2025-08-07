Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0C1C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 22:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZedSgKDGmu0s9q7G9S627Lh3JRn2/re9Bt2cBGlFjrg=; b=JHHq7M+TNFnOx5
	SQRXyKfeFTElbclyvG873um1Aj6BLhoEW6g1FKw1iLpqaBDtJiBEeviAMEVY1WHGtcBVhrH+WvyVP
	T7H46uYY9YUFCDCvUbnYQxHXU6oGCvdPiQ4t71PL6EWgCyMb0HEihZStfQpF5NsLksgZgtex/st6s
	N8KFfGADRW99Spg06UvcJ6Cexendbn8zYJIKIwyMWLdRs5jIQXPLDvOUN5p3lNIDASRJRQlhzYhbX
	buivnr/nvhqQQ2lP3lrtNFLVNhmvqdKe9uvpd4Af+lElMhwdH8wPqufmTUvFbl4s9r+UL9qnNUsPX
	p7GGChR9rbomVlIt1NoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8gw-00000001bDE-1cPe;
	Thu, 07 Aug 2025 22:02:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8gt-00000001bCn-1y5R
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 22:02:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso1502216e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Aug 2025 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754604146; x=1755208946; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avU98ttBLtIvdyvPJMGprxMYrTMdHK1g7EvVWfIGfOU=;
        b=KsX7wnLnk2gtVHx3r2QkSc0yxjMBQmWywCDDUQ/l9NfgAFWklG4oGngElAywkc/hX0
         ARAdXYc5/IAdF3QfoR1W13dcirUVQJMeQiX4dr80yo7KR8XkaU/0lUKIdeF3nreJ4gtq
         2zvnFtNUrBbZnI7IAnUyR/U3VjOZ1jxzuaCDHlV3MGeqtb2mjJ/aRLIScMup00JZIGoN
         rS6WqABdAY3mPs3Y6/NqwPbZ65z/W83ZW4xTENBP2tZ1yJS2nAXogeCy7nL/U9mqpTfs
         BRH4Qptam6KxMujBjaqO7V60TNA7vP0TegcoVnrjniM4M4kmrMkbqYY6V81atTMMTtWl
         xfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754604146; x=1755208946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avU98ttBLtIvdyvPJMGprxMYrTMdHK1g7EvVWfIGfOU=;
        b=oZYOWVRcLx/w6cUyEwhgn+PCjUA4aE09C1ES9RTE0kF8xjQkGAf3lzFm9pmtzzBlHB
         aYFuxDkGUzCRngx6aNQvb+p1estlztjaCkSO+DxXfaDRlaf/+Vk8aoZwkLjBvKaxEQ4w
         FIzOcRdo+MNHPG6xYYt86WkZVLvrTNhqDSDh85TDmQaaNDQC6jgl3N4yTS/rheHUl6vw
         6F/9zXNaLLhV3sMzYwD0tPiZEoMIxza1YFXXF8xPDWLXDL1kgQp0VuRZozn53e/ceKzd
         M9pnzEQgB+lMCWgANIVBfGD++TcVuLR7TDDoCxw9nVjZpyTnfynlrBk5QLmppYZl3rWl
         oZDA==
X-Forwarded-Encrypted: i=1; AJvYcCXx7hJYz94rnummIcFNG9WtP6+2KIWWQCmp/mTVCNF3RZ+9yN1O+fwB7x2BVd9AJ/jiwz4qSm6xJ8JOQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2fFW4Es8rkTNQgFMGHBC+N6O2+swekOMuDCMdaHLPJRcN4By3
	UzSsrDSfWucRiMtG2K6KeNTHHaQEDnrNgooHlY3HMl6EYHpkTbGPypkk
X-Gm-Gg: ASbGnctPzvdl7/NkE4a6WQz1JLrUR3r7mK9/d6O+rGtvVdNMR9DGXJXZHPueMAKE+cf
	JQ6L6bPqycJh7T3vLlIsqEXxUtdWzG2tbSD8GXAqzE+hr8NzjwTJ1xsrDqy1poc+T9pq0KhA1sW
	VXxMKKJMalkpoj938TCI8J4i23G+GK6GxOeyWozaydmDi7/0unIvbAoSra4D0bn5bBx5+3hZpJk
	PK9gMNJscrIZYcI2a0X9SCJdnaQzYeL7Tijisq0XRJGSjR/NAMhVsdV3Q3KKfWhhci4nN8MM/19
	5W/bREuEWRH8gSP05XMVI/F2c09UESuSfmWW2V2P2ACZgbmlFBe7z8s2/mbV2ikHhuGjXeDAWqR
	cXYjYor1h4pgVLZmkSQcdviHE9a0n3Uqv
X-Google-Smtp-Source: AGHT+IHrSlgT91DmFGc7QbYqpGLkkw0UvA0xvI/15T5zYAmuonH256/5HgVY0NHOfuAFPEwun5hM6Q==
X-Received: by 2002:a05:6512:3f10:b0:55b:842d:5825 with SMTP id 2adb3069b0e04-55cc0135fc8mr109358e87.43.1754604145361;
        Thu, 07 Aug 2025 15:02:25 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-55b88ca35e7sm2752896e87.134.2025.08.07.15.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 15:02:23 -0700 (PDT)
Date: Fri, 8 Aug 2025 06:01:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Nam Cao <namcao@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Respect mask state when setting
 affinity
Message-ID: <nowqjgxmomniw624avrizohwzzq7ebkznb64m25qim3zgxjacn@oizd7ngxjd6a>
References: <20250807111806.741706-1-inochiama@gmail.com>
 <87fre3mhkh.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fre3mhkh.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_150227_527184_7A46FD07 
X-CRM114-Status: GOOD (  24.31  )
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

On Thu, Aug 07, 2025 at 02:39:42PM +0200, Nam Cao wrote:
> Inochi Amaoto <inochiama@gmail.com> writes:
> 
> > The plic_set_affinity always call plic_irq_enable(), which clears up
> > the priority setting even the irq is only masked. This make the irq
> > unmasked unexpectly.
> >
> > Replace the plic_irq_enable/disable() with plic_irq_toggle() to
> > avoid changing priority setting.
> >
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index bf69a4802b71..5bf5050996da 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -148,6 +148,7 @@ static void plic_irq_enable(struct irq_data *d)
> >  
> >  static void plic_irq_disable(struct irq_data *d)
> >  {
> > +	plic_irq_mask(d);
> >  	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
> >  }
> 
> This part is not required for the problem you are addressing, right?
> 
> I do not oppose the change, I'm just curious if I miss something here.
> 

It is true, this is added because it is needed to follow
the disable required of the irqchip. I think it is better
to split to a separate one.

> >  
> > @@ -179,12 +180,14 @@ static int plic_set_affinity(struct irq_data *d,
> >  	if (cpu >= nr_cpu_ids)
> >  		return -EINVAL;
> >  
> > -	plic_irq_disable(d);
> > +	/* Invalidate the original routing entry */
> > +	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
> >  
> >  	irq_data_update_effective_affinity(d, cpumask_of(cpu));
> >  
> > +	/* Setting the new routing entry if irq is enabled */
> >  	if (!irqd_irq_disabled(d))
> > -		plic_irq_enable(d);
> > +		plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
> >  
> >  	return IRQ_SET_MASK_OK_DONE;
> >  }
> 
> This part makes sense:
> 
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> Tested-by: Nam Cao <namcao@linutronix.de> # VisionFive 2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
