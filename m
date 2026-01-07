Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED42DD0D151
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOERYOuC/mtqdjKTROrlFFgc5LdoNYSLkg7chmCl5Co=; b=iDITOV1MddjMU3
	p9n+9BnX9IgsJDJLfLUWaUlPSG4DnLSghPK1t3Wu2azWx4kB8gmeDq2mJbL3CAt0zaFetfx6D1ALY
	qsCBQYdSfd7x3mKq5CetqG6kul8WiVAMbRHGYNzNGUXSRRYF7en376MCDr1ygkxXylLJcBcv4SAgl
	pqrpA79LjTbMfN6eSaQCkClCztpteflvqNi2PlVr9oXD/lMaEof06DCpIeEPygTGgAAM9wjdae+6k
	FjsFR42jHe+Vndoa5nUQgOEy0JHt0JUfpPGAu8ddXH9xNPs1jdJ3GJ6YfkJFUD039FX1LqY4/YKER
	Zaxdv/vsfT+zwCMWC6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXhB-0000000FOp5-2qk3;
	Wed, 07 Jan 2026 17:51:45 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXh9-0000000FOo7-2DnZ
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 17:51:45 +0000
Received: by mail-oo1-xc41.google.com with SMTP id 006d021491bc7-65ecd7fcf36so1280320eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 09:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767808302; x=1768413102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/E5kiVoPjL6HPjfNbHsUE0ncuM+O4VtxgKzooyiAI6s=;
        b=GkUcv7sEkID36UWSh/zF3R81P0A2dhn5dL4cWT02GFIsVKZfz9JHp2iLvbQEh6h/PQ
         ALvwVr/Gx+zJY0akzU+AGm+ggz0N4pphF/ma0atooVAxbrTWwgsh+dPqOGr+Sawi6WKQ
         ncT5mb6J1a2+VjXBeKrZylGZCl3ERrbnG/Y2tSJ5uhOX0pWb7oFJLdcAyXefdnJq4XQl
         62Y4iPqmm24joCjYZTP1yrSiAdwMtuBkgDN4/Cqs3Uxhy6qQbi825aYcBorR0YT477NC
         K76QpZKui4+ayKMm/+m8Seat9R44D8omFLP4b4P7u5oNg+BUYtB/tEX5fxsb8cYOCOJM
         NB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767808302; x=1768413102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E5kiVoPjL6HPjfNbHsUE0ncuM+O4VtxgKzooyiAI6s=;
        b=pRb8eoYQlLw7/1GdrqsW2RS7DE7modpcDpfz0GvvAPiTVm33A6AaQOwsjLSIYFg5l4
         knt/7ovpbrdK4Gs80N7+KMv7XsG5uOgS6+6es4mYWG08aJ2X14xUvMSCNQzulT2Zs6BN
         J0lM4psL5R6MdkUUGUoxDyf3dX7QQ5Y8A+c/+v+hReBrjp8D3IDsINtDRIfWySAREj90
         Jqd+RJVomzCY7cfxuKa2au4jIIX93AuFBpH/t7oMhLWkmkUPDLt2tFMFckBfYF/bNlnR
         c4eO6sJ57XhZBtBea8TyeH7pDe/MzqDB2XCucObnOYyizAMiDjYdQNnpqgXxYse7sfQ7
         TflQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9d3tx682XFNVaViQw5+btp45Ny9SmYJSt7hl04thPc4eL8BkSYpHyv4atcYgoTPixhn65ml8+Iw7jfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdkvNY1tW7Uhzy3xsQ8OodLbr4rhm21yrznPZfDCOhHtNc3rE5
	NBFYLtMwOfx4N+TZVR1OgOjVEuj5pZpwku+cFgzOhJbjuZUcQO5WYfMkWGUexMBvN0A=
X-Gm-Gg: AY/fxX6w2tBn1ID3WJ48Ir0CdcG1M1EH1KTtZWXJlZuXI1PM7cmfhsbVrDDp1SCqcvT
	1Cvwq1Zejmb4zd/ZH7x9nbFyOPQPDk9ve2mv5PMY5gDaVfM4CHrhc8w7h6HsI4VopCGuf8fsSjT
	kvFe3WRIWYkBF3GRsK3twntfoNV/1GFGRXb+zc52MZbAaPIvwHLgxGqZRtHNQ02fqMacP5MQI77
	BOl3TOoYgcoIk0eEgUnN2qknP1SJNSgkGyzSkGIKrksm40EiXa75z8kpeojD4gEfGXEAKw1SbIM
	eYF5Jv4J80fh15HDJ9XoPtmFxgiILyQSRTt44tpEFOJyFnOC8rUbJCs0JslLcw4eMiYAzRr8l5c
	xL5vBnPpaNkGEvmjHSYg1kKDQYUNPz7FeHMihPf54cg0o94AV8tnxQaGga98gJ9VoUOJCaShAU1
	fYAlXnb1OJXgst
X-Google-Smtp-Source: AGHT+IE13osf5CjYyTbx4kUFVq9/wdcOC/ch/TW3ja8QBG6H6cD6+EWQcns0Lx1kzYLZNwCYibHqkw==
X-Received: by 2002:a05:6820:2204:b0:659:9a49:8fe1 with SMTP id 006d021491bc7-65f54ed4064mr1332868eaf.14.1767808301928;
        Wed, 07 Jan 2026 09:51:41 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de8cbfsm3524574fac.3.2026.01.07.09.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:51:41 -0800 (PST)
Date: Wed, 7 Jan 2026 11:51:40 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Zong Li <zong.li@sifive.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, joro@8bytes.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, alex.williamson@redhat.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Question about RISCV IOMMU irqbypass patch series
Message-ID: <20260107-dc4b5f1d879db9afb00a4a87@orel>
References: <CAPYmKFscKJ1ff470d6YmuMxLdJPSZ-ZmuGMMAFO83TT-vvV2JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPYmKFscKJ1ff470d6YmuMxLdJPSZ-ZmuGMMAFO83TT-vvV2JQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_095143_775309_BBC4907D 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, Jan 07, 2026 at 06:01:26PM +0800, Xu Lu wrote:
> Hi Andrew,
> 
> Thanks for your brilliant job on the RISCV IOMMU irqbypass patch
> series[1]. I have rebased it on v6.18 and successfully passed through
> a nvme device to VM. But I still have some questions about it.
> 
> 1. It seems "irqdomain->host_data->domain" can be NULL for blocking or
> identity domain. So it's better to check whether it's NULL in
> riscv_iommu_ir_irq_domain_alloc_irqs or
> riscv_iommu_ir_irq_domain_free_irqs functions. Otherwise page fault
> can happen.

Indeed. Did you hit the NULL dereference in your testing?

> 
> 2. It seems you are using the first stage iommu page table even for
> gpa->spa, what if a VM needs an vIOMMU? Or did I miss something?

Unfortunately the IOMMU spec wasn't clear on the use of the MSI table
when only stage1 is in use and now, after discussions with the spec
author, it appears what I have written won't work. Additionally, Jason
didn't like this new approach to IRQ_DOMAIN_FLAG_ISOLATED_MSI either,
so there's a lot of rework that needs to be done for v3. I had had hopes
to dedicate December to this but got distracted with other things and
vacation. Now I hope to dedicate this month, but I still need to get
started!

Thanks,
drew

> 
> [1] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/
> 
> Best regards,
> Xu Lu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
