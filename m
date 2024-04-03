Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1045FC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 03:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+5blfXoB5pUThetnSHcn+fhJ8d5uqZfHbwYOfsnyg4=; b=rroS1wlUeIxMi1
	O0yqqk4iP1XEi18T/I3g4/QSdSFNvZeTTlaikHwSGxck22KHScUC6JU8vxDfHZ71w7+LUF4nMbrIW
	el4xXwyLklJMVSlR33LtrHnQxODxDpVB/GH9+NuHquU3ybKBuDRMDOyfNU/Gp/5MqcouOVH4nLZ4Y
	wIqsh3MrKNI2voEgJe2D45k5WgSSuCHux6d2AVfJP+d6fbr7EqDRv9PjNTts0X9/bwIj60+pC1YrP
	0edFMFD0R8aKODOLg3L1hC8nesNkJ3VwFcwLCXjs32+Mo9xk3y0WfwPedGEA/vl9JOTK3mCwJLcnx
	BpQPW0FZfQgBdgLifWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrhz-0000000Dr33-1gGy;
	Wed, 03 Apr 2024 03:54:44 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrhv-0000000Dr1y-0VJh
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 03:54:41 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6e69ae0ff44so3360157a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 20:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712116476; x=1712721276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nDlMmweqmT2YXtYjoDTBUfL6Mkig9fvlUABwdUVfhNw=;
        b=KCH9DO99FFWe7lNz41U3+xgleZMCXGoaKGum93fsv/JnwOI/KRIMY9wTeB81urKAFm
         AqhgK4cngoMYGy1aGkgpPZiff5sMSfEJQ5XjEquGg6zxJAJZBG2rLjt2nbiZr/fkzcvH
         krJgaymIqZSk9s9MS4DATMOsPYb+rmUgxfrdpD1/gwJG/QzMMJJ0XPIAfeGymq2voU7k
         mXYG296imKv0mfMoL0Br/j0DhoKpYmCwMXeA+VAJVW2pgyA55NAcbLxWSCcTmswf9KdM
         11qNpbO+xKaa0MqyYLlWW5nV4pTk+JUb4f4aBZax6qi7vf8d3hC4/jy3ROCJ0/QYsjtd
         ZrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712116476; x=1712721276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDlMmweqmT2YXtYjoDTBUfL6Mkig9fvlUABwdUVfhNw=;
        b=gpRqpNB7hP9r9L7jR39lXBeNfxUutqRAG43Hg+UZgQ6AEA9GFgf2kQkURYYO6Os4D1
         4DU+z95g8glZyN3LXuI6CtYZKYYekvF262O3OMuR6Nx0z9T082k7S1/oBVyWxAtILBwo
         AmxydPRopix+5wXVmbEkU4yb4JCIVY3B1b1wgkDQ64T76GupjQ/bKNsjn7qseNwIqHG/
         fMAGY0TNEFjTPxJLn4rRp7eIZ7AM0lbtpPaIp/gNSAtLvo95LyNFF3irmsp4vyWrC5aY
         Pe54icCuA5LaF8ovcIn81OooAbckCfJpN5OrOWQb7F/SmqE8BQryL6aRN69pO8ye89Tr
         EEug==
X-Forwarded-Encrypted: i=1; AJvYcCXVOKRCZzCBd8dXyL6jEqYAzycsiEv2MG97hwSr9tnIM2kwnLeDiG93IdCP+T44fSnuRTOPF2DpQOPYgpbqJ8oKysLS0lxe6dVfJyXqLamu
X-Gm-Message-State: AOJu0Yw5BDkI/CxqzuTne/y3kXNldy5wFNGaiPrGK0urPIWRuy+2SDHJ
	rQeu6xzOWD4G/NsPZtajb9XZXxsNo2m/EajzvuK9qWdi7nOyyeZ6bGInzxGKtjk=
X-Google-Smtp-Source: AGHT+IETkCuICm5EPgSs85v0APh8MQMZIQjKjNwLi31nnN/NIeD9KNS9g5g3rmLvIILzexgZSobE3g==
X-Received: by 2002:a9d:6b94:0:b0:6e6:a32e:5f32 with SMTP id b20-20020a9d6b94000000b006e6a32e5f32mr16558369otq.29.1712116476362;
        Tue, 02 Apr 2024 20:54:36 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id cm28-20020a056830651c00b006e6763530e1sm2497020otb.61.2024.04.02.20.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:54:35 -0700 (PDT)
Date: Wed, 3 Apr 2024 09:24:21 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Haibo Xu <xiaobo55x@gmail.com>, "Xu, Haibo1" <haibo1.xu@intel.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	"Moore, Robert" <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Jisheng Zhang <jszhang@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Marc Zyngier <maz@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>, Yuntao Wang <ytcoode@gmail.com>,
	"Schofield, Alison" <alison.schofield@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"acpica-devel@lists.linux.dev" <acpica-devel@lists.linux.dev>
Subject: Re: [PATCH v2 6/6] ACPI: RISCV: Enable ACPI based NUMA
Message-ID: <ZgzS7W83iWRII73G@sunil-laptop>
References: <cover.1709780590.git.haibo1.xu@intel.com>
 <01cb5780041565784d459cd94a5c4f55eaa87739.1709780590.git.haibo1.xu@intel.com>
 <Zgpf0rqUSEZcSiAV@sunil-laptop>
 <CAJve8om9-cTtYKLmB0R=6Wwh5KQ9z+16AFR-tuUkJhJjbn0UEA@mail.gmail.com>
 <SJ1PR11MB6083B43290D216B1568642B0FC3F2@SJ1PR11MB6083.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083B43290D216B1568642B0FC3F2@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_205439_332090_334C167A 
X-CRM114-Status: GOOD (  16.66  )
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

On Mon, Apr 01, 2024 at 04:57:30PM +0000, Luck, Tony wrote:
> >> If the firmware didn't provide the SRAT/SLIT on ACPI based systems, then
> >> there will be a message "Failed to initialise from firmware" from
> >> arch_acpi_numa_init(). This is not specific to RISC-V. But I am
> >> wondering why should it be pr_info instead of pr_debug.
> >>
> >
> > My understanding is maybe it just wants to expose explicit logs to
> > avoid any potential bugs from FW or Kernel.
> 
> There are lots of ACPI enabled systems that aren't NUMA (single
> socket servers, desktops, laptops). Making this "pr_info()" would just
> add noise to the boot on all of those.
> 
Exactly. But this is an existing pr_info message across architectures.
My suggestion is to add one more patch in this series to convert
this to pr_debug unless someone has strong reason to keep it pr_info.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
