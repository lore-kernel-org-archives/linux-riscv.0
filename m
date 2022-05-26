Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D29C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 10:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eesFSu2LDKDzdTK16KcEp0RV9L9rHHM3xuVDhhqyR18=; b=e8oboKrdanBTic
	o+xt2AD5vu6jYB36bcihy5GdfqilOh4v6wyDJFqRsyQjdyRhmc82jdXb6NhK+xHLyqf+X6v9+AE3/
	GMxU5pgYzN48e8NjCoyw93vkHMC0ojBv63s35ZtdG8ZzgRYhG+bCdjlOZCiEVMfcpEjooIiFauVmY
	F3385ragovY2roUh3mYvAoMVHw/8BBe3EkeI1Yzxa9i3LGnmzuDEpmFEmWO5kQ//bsO8XRgcCZQyi
	ZFBYar45/fU1v05AaREurPYvaqLB0B1l+BfcqTvcFY3KZfmrBwcQHlFHl/ygOSWrVqHSvk6CBkyG8
	XIRK032HxZaT5H5JjW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAXB-00EN7z-JT; Thu, 26 May 2022 10:16:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAX8-00EN76-Su
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 10:16:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id q18so1051749pln.12
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 03:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Y3eU/w+btAOyZHyBXYt+hk25vT05aSPhsIXUT8uHW4=;
        b=Udx8BVbAkgZSSSzXzgFgYJbCewYfcdOpz6T7ErV8QIvhsSQ1EYf2KvPy+lFegyPAd6
         FNfgWZhnOnlMHk2m9HFCEFzXJki/V52WDF3S5Ej5XqwJW8C9zIrPtcnYRbKyb88ktsc/
         VInB3efk12Vodx/9EWhqliUp3tlsWYWH1w42wcQDNp/8sG94vsl36u37aCByBYr0KRxW
         VOiHpIMGgA3dkn9vk4WXcH2j6s/oWaZkmrAShqRvTidBenAQm7KWdnKZsq6LhmvnoUIu
         F+UROkgF/b9j5swVr91EFcCRyN5zd3IHryE+QselPPfxwj7u9K1hoNJsK8Q/x0aGDMZZ
         iPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Y3eU/w+btAOyZHyBXYt+hk25vT05aSPhsIXUT8uHW4=;
        b=pNqij4mYQzm5bi8kqm/JbXgG1sTEUwgh2ppcADxDZF8H1YgizNP8ZfwGdZAXw8pdhH
         rGpGJSMLmIDmv4K+OhbYYVLc3YDKqpf1mRBgiNPu+0g6NFZkeZYSNTtQyEjAEe7V1JZb
         nqlNTrLCytyjLq8SVZOcMpe+iMQJ+IkHCTJT9Q9INqprsN9UPPyjBO2w1sLkqOSXW3n6
         Cvj7lTmJeXsT2dviDSP1wGIWGYb3F9QQZMZNgmZ3ca8mX4h3KLztUZYK5kJWFkrwVPCI
         Yywb/gQmMIqlVMLf/nurg1T5tc48Ac1C30laIjgxEM/IYEjqpobjPGme/nrkFb94VfX6
         ijOA==
X-Gm-Message-State: AOAM531/dh6gQq0Qvh2/jwSIU1z2ZuNI07JwMItcDdK9NQkFCCn19voV
	oJfThcEN85DV7vBR9Xu/lNMiUSosLY6TsoXa
X-Google-Smtp-Source: ABdhPJxJz34W7UwGbIHBo7cdYQHAxdsuQZtFizYaWq04IKjBgju6JFGWyLfVxAGBflzW20SnrJlKWQ==
X-Received: by 2002:a17:903:2305:b0:163:64c7:f9ff with SMTP id d5-20020a170903230500b0016364c7f9ffmr5879166plh.46.1653560157179;
        Thu, 26 May 2022 03:15:57 -0700 (PDT)
Received: from sunil-laptop ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id ji13-20020a170903324d00b0016240bbe893sm1092596plb.302.2022.05.26.03.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:15:56 -0700 (PDT)
Date: Thu, 26 May 2022 15:45:50 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, Sunil V L <sunil.vl@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 2/5] riscv: cpu_ops_spinwait: Support for 64bit hartid
Message-ID: <20220526101550.GB19431@sunil-laptop>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-3-sunilvl@ventanamicro.com>
 <a7910ff4-0bce-befa-f961-a82a8a1025a1@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7910ff4-0bce-befa-f961-a82a8a1025a1@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_031558_970544_5ED03808 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, May 25, 2022 at 05:27:51PM +0200, Heinrich Schuchardt wrote:
> On 5/25/22 17:11, Sunil V L wrote:
> > The hartid can be a 64bit value on RV64 platforms. This patch modifies
> > the hartid variable type to unsigned long so that it can hold 64bit
> > value on RV64 platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >   arch/riscv/kernel/cpu_ops_spinwait.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
> > index 346847f6c41c..51ac07514a62 100644
> > --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> > +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> > @@ -18,7 +18,7 @@ void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
> >   static void cpu_update_secondary_bootdata(unsigned int cpuid,
> >   				   struct task_struct *tidle)
> >   {
> > -	int hartid = cpuid_to_hartid_map(cpuid);
> > +	unsigned long hartid = cpuid_to_hartid_map(cpuid);
> >   	/*
> >   	 * The hartid must be less than NR_CPUS to avoid out-of-bound access
> 
> This line follows:
> 
> if (hartid == INVALID_HARTID || hartid >= NR_CPUS)
> 
> INVALID_HARTID is defined as ULONG_MAX. Please, mention that you are fixing
> a bug:
> 
> Fixes: c78f94f35cf648 ("RISC-V: Use __cpu_up_stack/task_pointer only for
> spinwait method")
> 
> NR_CPUS alias CONFIG_NR_CPUS is an int. You should convert it to unsigned
> before comparing it to hartid to avoid build warnings.

Thank you for the feedback. Have modified the patch and commit message
as per your suggestion in V2 version. Please check.

Thanks
Sunil
> 
> Best regards
> 
> Heinrich
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
