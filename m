Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7474EC87FCF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 00:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pckHHIrY5zDq8YielljFK6xGJXxI/nTj+K7ENEO5Goc=; b=K2Kxu5rrLC6jxN
	E5TArwtUMdNu++5Yq1LDQsa98KgxZANkBT1CG8wANLWhPxZQDE+ExH5h3Xv/PYRIPWL0JYEW4J0ZI
	G0tYW3GdMPIIUOLVVRNzhFuto3+8QBS81jD4abSggVOGOltXapl6XptlolqA+NjpirQGP0UFVzkfL
	rSJWFkUdgxuF1hvJXD+MrCoonBrhQ9yhJRp2j6eyXlMJQy9Lly6lLwH4jSaB2+wkIpDUC88L68tXJ
	+eyF4apou1lcqen6RW6K6ybgTL8YTlkO+GnczCjPtDRwc0Lov3uWOWU1BQbLEnfNJEsVYuIQc5wql
	8gGrmBUVcy/3avDm8jMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukAfh-00000001iw7-32ym;
	Fri, 08 Aug 2025 00:09:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukAff-00000001ivL-0U9s
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 00:09:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2407235722bso15776475ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Aug 2025 17:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754611758; x=1755216558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXd2+hikVHn0DCUK47UPFJHxdRXV/eWo/6UJdSdmyyg=;
        b=PqzI67BWMxcgPSqmqjHcRZvbHXiwf36BOb7qMtEw3P+/WboNKYADkgb5lfRcY48foG
         U71WSaicJn53HiAravM0NBI5x4tQ/YHZvw6Um63m0ggYv6ukP8NDWk9kq158aBnjOW0V
         JsaLz4zM2PhSry1ziMthBwyU/cNMwnPifs80nc3CcD24blIP4wJRxCp2qEVutwtP5qBD
         kCwWQWuBgY8cwOsBjGLBle8dX7pvuxbemy76ImTCagbj/40IXAa2BQCcfrrv9Tv+jMY8
         JkC9FvWstG+fXKVLlO3AF3uWu1qUPXSIyCEORwSnZon4czSOksIF3cOZq4f049vwOX/k
         Q8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754611758; x=1755216558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXd2+hikVHn0DCUK47UPFJHxdRXV/eWo/6UJdSdmyyg=;
        b=isrLSVc8R4JNe1ONtfLPBSTyUYcZxo1qlmxl6J27DriFq3H9CBSzf5ggly+Rev55D+
         8mt89odr30Y0E5q3g33T5p6u1aT1W6l7wBk2Ut2MDFF4OhVY9Iisvzrn7ICYNT9OUo/t
         UnGMXOxV14MDttXxFaWNNsX6VCP+5fds6psnED0h72+LBz0HlwGv0PjQFE6G7CiyVP0J
         kByvr7NL/080smzXyodYy16ZsF8GNgUqbtz96wkYulPbJtuKqVc2G3Cfy6jse65ZVTDw
         rRqwhybeHblEvon7/CjbNKFAX/P2nmVNrL49GQ7+jNGufAa4y9KqfStrRkM0VzZUSQGw
         zSHA==
X-Forwarded-Encrypted: i=1; AJvYcCWxTJiNhUFYoEJCBAwA8/xvStK6ycCF3qBZVrKL7NhJ5eAKz3wzUttVN/rZbaACvQgwyA79tgjrcCIEBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOeXPKKmBO2gwOQcy9jrF3HlmHC1O89ANg+JpW3xqxzu23syJB
	/oiG5rYKC2XRy5RXcGQHzf82RxCfSqykv8mkd4mbP9ZZP0CCUWAaZPBO
X-Gm-Gg: ASbGncs4+y8Gawu2eInEdOJ8umAPspD9f/M1R+/kOn6GSjqDDw5ooYzIn1xNUvMfDS+
	daH/OVvlO5sRnTQF5hRDjVL76mV3lfx2hHAOeKCUDA7zbZOZrAJTdtpYymH9qXPMpSM9C5Bm9AZ
	4s4MjXzZYLMUsnFM3wEXZh8cptYH1BivdsobwFU9X6a54rK3M8sxDMceACW2RMWwS0Bd+7tqVpj
	KTQ7t4rDuK3+FrOdZFUdldCFpwelVGzISXi4QypvfKr481ubuNuy2WsHR0A8G7rlYlLPDoiX2aa
	23s/xQdVEnxrcQlEbVDrFOF+iFMrtW3kdOcD0MENdmFui45/jWuoXWOgVapbidUPD1b1Wk2pMKf
	2fAOIXg3ruA59T6UFcUQ0qg==
X-Google-Smtp-Source: AGHT+IEYZa7c6DgRkIA/IyVY7kXZKzb4NOGAiFrm0H6w/sJuK+opnTwKBJhZcOZBLBQYwP9x2EHNqA==
X-Received: by 2002:a17:903:1103:b0:240:3ed3:13e7 with SMTP id d9443c01a7336-242c2228d0bmr13612495ad.42.1754611758173;
        Thu, 07 Aug 2025 17:09:18 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241d1f1ececsm194004595ad.68.2025.08.07.17.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 17:09:17 -0700 (PDT)
Date: Fri, 8 Aug 2025 08:08:34 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Nam Cao <namcao@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Respect mask state when setting
 affinity
Message-ID: <prnjyu7ev5scocf4jh5jikox3niftje364lf3bjvizppxamdov@hbizpiazqual>
References: <20250807111806.741706-1-inochiama@gmail.com>
 <87fre3mhkh.fsf@yellow.woof>
 <nowqjgxmomniw624avrizohwzzq7ebkznb64m25qim3zgxjacn@oizd7ngxjd6a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nowqjgxmomniw624avrizohwzzq7ebkznb64m25qim3zgxjacn@oizd7ngxjd6a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_170919_174734_405DC92B 
X-CRM114-Status: GOOD (  23.96  )
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

On Fri, Aug 08, 2025 at 06:01:39AM +0800, Inochi Amaoto wrote:
> On Thu, Aug 07, 2025 at 02:39:42PM +0200, Nam Cao wrote:
> > Inochi Amaoto <inochiama@gmail.com> writes:
> > 
> > > The plic_set_affinity always call plic_irq_enable(), which clears up
> > > the priority setting even the irq is only masked. This make the irq
> > > unmasked unexpectly.
> > >
> > > Replace the plic_irq_enable/disable() with plic_irq_toggle() to
> > > avoid changing priority setting.
> > >
> > > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  drivers/irqchip/irq-sifive-plic.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > > index bf69a4802b71..5bf5050996da 100644
> > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > +++ b/drivers/irqchip/irq-sifive-plic.c
> > > @@ -148,6 +148,7 @@ static void plic_irq_enable(struct irq_data *d)
> > >  
> > >  static void plic_irq_disable(struct irq_data *d)
> > >  {
> > > +	plic_irq_mask(d);
> > >  	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
> > >  }
> > 
> > This part is not required for the problem you are addressing, right?
> > 
> > I do not oppose the change, I'm just curious if I miss something here.
> > 
> 
> It is true, this is added because it is needed to follow
> the disable required of the irqchip. I think it is better
> to split to a separate one.
> 

After some dig in, I found it is not very necessary to add this,
When all enable bit is clear, the PRIORIT register of irq is
not functional, so only umask the irq does not make sense. Only
calling irq_enable does enable the irq.

I prefer to add a comment to describe this behavior, instead of
adding this change in a separate patch.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
