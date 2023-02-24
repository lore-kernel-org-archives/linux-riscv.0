Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B83C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfRwnblWtTStaEX4riLDuop4blv414dqF3TPYlRt1pk=; b=syfcvBvHEUuVZz
	+GUimcsg4nxBjEhIdt1a/eT5KshuM1EnO6JSWeY0e2UI8bH0brO/MaX1TYIX84iaqu5hIaTWIj1vW
	4c6jkaHyDv6U4FvzLxYOMmwlKo3u7UXHO2rAFTTTxoame8c8Ul+jjJMuy4z9aUf6HgHsXHgq6zXeL
	HC27YbKbb1VqWjRU3o/yU6hFFTcEyOL2+/ANglqzZD57j3GtM/KfCHvLEwQR2bj8aSwV6IWsSPEvi
	2ANcWiyiqoYAfcHsih2sljQMt8lymV2C5d3y5BQBfo/W9+vl0DBiax15Yux3FWVdAjSuTj2tOMCGG
	SSYp46MdvYpNtCcZfwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTiK-001ZUZ-OZ; Fri, 24 Feb 2023 08:46:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTiH-001ZTX-Cc
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 08:45:58 +0000
Received: by mail-pl1-x631.google.com with SMTP id e9so10966429plh.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 00:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/g1Br9nMWuN1kMcnj12xFgT0Rd9SMTlaPziJnIgRsI=;
        b=HJVHq/ZFu4hLwrKBdjVcvVDh8BY2u5vhJLGEkVHDDj91kJv4YRW/orPIWQhCaQxpt3
         T196f1t9afHRM06Hddxj2UDAO/ZGAp/4kLtWatrr2Okps1PTMLtqCUl5fVyPFfyBJ1r9
         njk21YOnKbov8YmqfqNYhKCy42RNelscCPU+Er6jPjma9ntQP2o8VWzzyB1lhdt34cre
         wX8Am/J5HGndXiNov/b4ZFzZeWYXynWWExyK8oc+79LtF5/IxHIvGTbOynOGQzioxjCs
         0Sh3H6i9pQCMtts9OvyTkbzRTMlymONFJDCHlrq9Da5sNVqQf+ayqR2CP41xXwzYfjyl
         81bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/g1Br9nMWuN1kMcnj12xFgT0Rd9SMTlaPziJnIgRsI=;
        b=hN4uNPTKJ8ggrVTSFzLKjM0PY/sLE3cK5o+aCm7NYZFne0gPmbT1mCQnJzX2+oMJVc
         3uuYN9mdCm3Qf6cR4ke02i0+ZTOMQhU3EUaHN83IOj8aKPww0xmKbcrBi7iecOgRE7Jb
         Ml60CCnw0cFZI6h+88Q+92ruvNzIQ+H7PAGWjEAdWoZ8lc6BTNumbjzXqdkOdudqvPZ/
         28Sf4fl4EhdTon5+dnCZulu3rkcVAm881eppsd2ObmDjih7gLreeFFvm6pCr/TuEAwyz
         0abrPdfPVhmbsQUxOl74216STc3hTz492/jdCfowb49fTlONXqOKpjsEUoFXFq32BMI8
         pB7w==
X-Gm-Message-State: AO0yUKUxSI4HK36JLjhtvsQyVZMpXgOgM2DFiKuLfdqU/AzEb8zq8rUX
	MQZvAtsCww5Nls0EGlzt+MqUPQ==
X-Google-Smtp-Source: AK7set8MdWRkAMrfAw1y8GkgFBrDn6UZ97qOIFghP/NVv/y5GdQIrkhZih6PNeZKPMELP0frUqPa5A==
X-Received: by 2002:a05:6a20:3ca0:b0:be:e0c3:5012 with SMTP id b32-20020a056a203ca000b000bee0c35012mr14992895pzj.1.1677228355548;
        Fri, 24 Feb 2023 00:45:55 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm2665775pfn.107.2023.02.24.00.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 00:45:55 -0800 (PST)
Date: Fri, 24 Feb 2023 14:15:46 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 05/21] ACPI: Kconfig: Enable ACPI_PROCESSOR for RISC-V
Message-ID: <Y/h5OiF61xtcdUQP@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-6-sunilvl@ventanamicro.com>
 <20230220160518.zuppmgvvhvipawxe@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220160518.zuppmgvvhvipawxe@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_004557_450192_7B18E443 
X-CRM114-Status: GOOD (  21.44  )
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

On Mon, Feb 20, 2023 at 05:05:18PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:27PM +0530, Sunil V L wrote:
> > Enable the ACPI processor driver for RISC-V.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  drivers/acpi/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> > index ccbeab9500ec..b44ac8e55b54 100644
> > --- a/drivers/acpi/Kconfig
> > +++ b/drivers/acpi/Kconfig
> > @@ -281,7 +281,7 @@ config ACPI_CPPC_LIB
> >  
> >  config ACPI_PROCESSOR
> >  	tristate "Processor"
> > -	depends on X86 || IA64 || ARM64 || LOONGARCH
> > +	depends on X86 || IA64 || ARM64 || LOONGARCH || RISCV
> >  	select ACPI_PROCESSOR_IDLE
> >  	select ACPI_CPU_FREQ_PSS if X86 || IA64 || LOONGARCH
> >  	select THERMAL
> > -- 
> > 2.34.1
> >
> 
> The commit message doesn't tell me if this is a premature config
> enablement or if it's already necessary for this series. I think
> if it's already necessary, then it should point out what requires
> it in the commit message or be squashed into whatever patch
> requires it (and also point out in that commit message why it's
> required).
> 
Thanks Drew. Let me drop this patch. We will need it in future when
we need to enable LPI/CPPC etc.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
