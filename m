Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C67EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvYA8fDmM4yiqkrlhtuAn8Ocv+DRZlL4oR/IXxctmXw=; b=0LIYGxfRoUqjQO
	ryxjZfH83CPbow6WhGg37c7dHki/2+05slwrGJ2eLFGvkBQHgpWlASU7W++rr4LM+ar7vntrBlcve
	oFrGEyz7fUYAw4f/9b4DZDtEzPNtOyHZLz7xsayrHIkI1y8s+wojfQGOHMA/Ez3SPnSkeezJFffcm
	FU3ZLalBV7AKosW1WIkgfun7Qj1Z6Nhl0/1lWhgyq5XGWd2yhN3C0V2+8fmYG+iFRcrytlGHOOurK
	fLHYsFw6Aff+4RPN4iM1EaG0Z6G+LGE0QgwzFDrA6GRned82CQ8OMWzrMV9cz9AymgE3GZqtrI78b
	Zv9/t2XAIb2TkOWU1+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTc04-0045fh-1o;
	Wed, 09 Aug 2023 05:44:52 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTc01-0045eU-2c
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 05:44:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8b4748fe4so42760905ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691559886; x=1692164686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vxcldl12I3EwBgJQlvH4uhDdlUAS8X8H2ABb+awGB+s=;
        b=bWGuxL1DOLIxUyEVzJG60PbAM1TTn29jgsmsdGFv9qt+PlkLpRdGCCJZGPoiRMfOYr
         w9qFJTH5PT+r7p4FA5jao0vuTT90gasDkW6Bo1XxbbOWe/fhyXTmQUTE2pfQLsatgY0r
         lX7gmoWKIwHD6LZwG2TlGOKagQrqaidNlUvAOGhXyV8pCSVZ/Lk0UmyWUdXrIu+T9Eh3
         /Soqy/xjVjR1GiUStLrKv7rmXMRysXV7RIbStm8m+wr2i3F1i+UdIwa9g55kgvjwJrxx
         DBO33rOID4saTHn/d3MhTY0k3X/iUrCb06S3/3JTmz6goyAyYFhB0CeGlH+nFXPQYBNd
         TuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691559886; x=1692164686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxcldl12I3EwBgJQlvH4uhDdlUAS8X8H2ABb+awGB+s=;
        b=BHeArko6Ac+2FLNLmjqcmveMGBg/cviQKtz/ko8wm5SiRykcoxk3coIy4Yi6NCO+tJ
         BXgL+XQbXEVNHtobmRMlWrkmIVsFyEgOigxdtt/918uA+zwABSrWpEL8fgt31s4h/GD/
         x0u/ltIbeJRaV16ntnvS6+aRmg5w74vis/GPZhrIfkDyRB1FiGbygz7e+pKTVgULNFZx
         VJh4/Z30YgwdHUEqexpEpVkGowIFQPcFYIQrLdV/rCy1aK8SwYxZeHpd0Zzr3tujLLZl
         cxqD8RLptwn8Jwpp0uH7qZL7XRiUYKizox0miuIwUggj15rr6qLDBqs+P7PCfIAOy3RE
         Ir7g==
X-Gm-Message-State: AOJu0YwoJo1lqi88p1K3PkYTFEZI9NgKZPySfJ/AiT0JjKp8b3rlP0oy
	DD74ayEQwdKkzskscwYMK9rybw==
X-Google-Smtp-Source: AGHT+IFQByYfqVXmufCi4ZexsDkSCJeetmAUHqrPdPKuKE7/AuT3eoLpHY4Ewpuc1qDtZMZN3aNTyA==
X-Received: by 2002:a17:902:e88b:b0:1bb:dc48:644a with SMTP id w11-20020a170902e88b00b001bbdc48644amr1829426plg.49.1691559886467;
        Tue, 08 Aug 2023 22:44:46 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id jw15-20020a170903278f00b001b8a54f99d1sm10040833plb.275.2023.08.08.22.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 22:44:46 -0700 (PDT)
Date: Wed, 9 Aug 2023 11:14:36 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v1 11/21] swnode: Add support to create early during
 boot
Message-ID: <ZNMnxAVn6Vy337Eq@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-12-sunilvl@ventanamicro.com>
 <ZMyWDDD6Lw8REd1r@smile.fi.intel.com>
 <ZMyymUdV63g4eGaT@sunil-laptop>
 <865y5phdwd.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <865y5phdwd.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_224449_856095_234C477C 
X-CRM114-Status: GOOD (  39.82  )
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

On Tue, Aug 08, 2023 at 02:17:22PM +0100, Marc Zyngier wrote:
> On Fri, 04 Aug 2023 09:11:05 +0100,
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> > 
> > Hi Andy,
> > 
> > On Fri, Aug 04, 2023 at 09:09:16AM +0300, Andy Shevchenko wrote:
> > > On Thu, Aug 03, 2023 at 11:29:06PM +0530, Sunil V L wrote:
> > > > From: Anup Patel <apatel@ventanamicro.com>
> > > > 
> > > > swnode framework can be used to create fwnode for interrupt
> > > > controllers.
> > > 
> > > Why? What is this for?
> > > Can you elaborate? This commit message is poorly written...
> > > 
> > > And why firmware node is not enough for ACPI case?
> > > I assume the fwnode in DT case is already provided by OF.
> > > 
> > Thanks a lot for the review!.
> > 
> > You are right, OF provides the fwnode for irqchip drivers. However, for
> > ACPI case, it is typically created using irq_domain_alloc_named_fwnode
> > or irq_domain_alloc_fwnode since these are not ACPI devices in the
> > namespace but from MADT. The fwnode created using
> > irq_domain_alloc_fwnode() is a simple one which doesn't support properties
> > similar to the one created by OF framework or software node framework.
> > Hence, lot of data from the MADT structures need to be cached as
> > separate structures in the drivers and also would need several ifdefs to
> > check for ACPI and some amount of code duplication is also required due
> > to the way DT driver gets the information vs ACPI.
> > 
> > The beauty of software node framework is, it supports adding properties
> > and also is a supported fwnode type in __irq_domain_create().
> 
> There is no beauty here. Only some extra bloat that we do not need.
> 
> DT and ACPI exposes very different attributes. One describe the HW,
> the other one describe an OS abstraction. Pretending that you can
> summon both into the same infrastructure is a fallacy. You'll just end
> up with the cross product of both infrastructure, and pollute the rest
> of the kernel with pointless cruft.
> 
Hi Marc,

Thank you very much for the feedback!. Sure, let me revert this approach
and do as you recommended in next version.

> > So, if we
> > can create the fwnode for these irqchip using software node, we can
> > attach the same properties and the actual irqchip driver which uses the
> > fwnode doesn't need to have any ACPI vs DT checks. Same driver will work
> > seamlessly on both DT and ACPI platforms.  But the challenge is,
> > currently swnode expects to be created with sysfs which won't be
> > available during early boot when irqchip drivers need to be probed. So,
> > adding support to create without dependency on sysfs help us to reuse
> > the same framework for irqchip use case also.
> 
> That's another fallacy.
> 
> Most irqchips *DO NOT* need to be probed early. Only the root
> irqchip. Given that this series is about *secondary* interrupt
> controllers, they absolutely don't need to be probed early.
>
Since we created swnode for root irqchip also in this approach, we had
to support early creation. With your feedback, this is no longer
required.

> To be clear: I do not intend to merge anything that:
> 
> - invents yet another way to "abstract" firmware interfaces
> 
> - adds more "early probe" hacks for non-primary interrupt controllers
> 
> I have already said that in response to Anup's AIA series, and this
> equally applies to this series.
>
In Anup's AIA v7 series, he has made non-primary controller drivers as
platform drivers which are not probed early.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
