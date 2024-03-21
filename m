Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B95C54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 05:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMROGCp+dUVcCballkZLefEgynCpUmT/0rwcHQ+S9Gw=; b=WjCKQUvufTVTbE
	m2ELI742dRL92U0Q4nR3q5J2HsTEpXU8UnLQ2U8Zkg5kqauDBs3zRNRu61itjlKeqlTyKM8gH8BTe
	q6/AgsKKdOHV0mZlBmGlA3QOIBpAmF4wy1E80BFNIzziq6mMLhunnVZKnM2sItF0t62lY5bYnQmkw
	7zLuLbImPciSUEKOzZvrLJpoI9KVT3npGwerLzl963+qs6fSAC06NQ7WxfZZ6a6gdY7jWm8HZltpA
	TR2j8xcdHG7ilIHftAKLaIIr/yJRvOCuO7+DQ1V8YvQeEp/0+lPqzlWVyLLfRGVjMa/qPu27rw3JN
	9naDOu4vfcezliINqBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnBJV-00000001xzg-1vse;
	Thu, 21 Mar 2024 05:50:05 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnBJR-00000001xwz-10fu
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 05:50:02 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3c37d50adecso458140b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711000188; x=1711604988; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fMphhNJ5kOGNAmeCpoYULkf287odK9ySZpSTtY/rRg=;
        b=hHJ0GRxktJ6SwjLHQNPTMvrnpBV4vFqDq2Jtmo1VVVmO09amqqlpeQ9EOwirkrlQTf
         7s+mRBjvR/cwRncjWHm/DAAdJXDwdzNuR90r9yCIaar/AwLE/zI/uRELmGW+8unThInR
         Hwe3ft+1ZprCgFJl1KeqWbdCgHy4AabT1RkDn+G+Q9QQ+TuNx7+/o3fhN1pbQl7MVHOR
         eFn4QjLZeYz0H1EcU1M0ToKUFQJ1c23yn9XkmpSnwNKBc7bIq1DtQ0a5RCyIQpRLD3mS
         Qt9ZBI1EF19rFBA7CjCHDYzqA7NEtFQfvo+sd36kI24XHrNr4rMn2U/gpZNYamgh3k9X
         J9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711000188; x=1711604988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fMphhNJ5kOGNAmeCpoYULkf287odK9ySZpSTtY/rRg=;
        b=MEbmRgZpFBbxtXkaFZV1haGMNxn/l1HvQsD/pS0K8yEU1zmcAxZXkDR5YeaXPv9IHn
         EFy+ruruwrMn2abVlCqeRQL+H0JFrFDU/J13PLm40MvhqYZrs1IygHBAJeJ6iTCLJhgy
         ftMpTdg2AWK+etXk4bJtdTzTHfzJG0kXzDSjGU8Rm9OiGjRzkePNeSXD2cGTeGAVg8iH
         xSEcr/NGGEJQ66rsB9hR6DZIZAWWft2cjl71ASDYZy3HoRwbQDalM03ZnVGFA5q/c6+b
         WCgBiPOEAz0yjgGGw3b2ZCOR9sB6Yf4TNvvF1QgLZpvUgIrbQZPxW5EdsE9wKBuL5JWe
         7WqQ==
X-Gm-Message-State: AOJu0YzI0iU0GPg9eb6fXrQFZCncNFjR5nfu7mWSyJzI+EURGSlKPAGX
	vzL+9QoUEaQeq5YK+zvkkP9K6EWsYD/BuwaWR25COzlVhCROw88vpf+oOf+pTEo=
X-Google-Smtp-Source: AGHT+IE0/NeFnqIC97uS0g8chtXLhBTnsViFruSK0O5TsDNqnoRtdY/a9pxc+Nn5UfS59hiKwsJLqA==
X-Received: by 2002:a05:6808:16ac:b0:3c3:773b:1289 with SMTP id bb44-20020a05680816ac00b003c3773b1289mr4629025oib.5.1711000187996;
        Wed, 20 Mar 2024 22:49:47 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id c25-20020aca1c19000000b003c3aef12838sm56402oic.42.2024.03.20.22.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 22:49:47 -0700 (PDT)
Date: Thu, 21 Mar 2024 11:19:38 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Drew Fustini <drew@pdp7.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Message-ID: <ZfvKclUHAPkmywT3@sunil-laptop>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
 <ZfiKooxO88h1nj35@x1>
 <Zfj4FnG5vAPP55ri@x1>
 <Zflm5cje/+rnZ7HH@sunil-laptop>
 <Zfuzmx/bvJZjWDx4@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zfuzmx/bvJZjWDx4@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_225001_313666_6E2B19CC 
X-CRM114-Status: GOOD (  32.47  )
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

On Wed, Mar 20, 2024 at 09:12:11PM -0700, Drew Fustini wrote:
> On Tue, Mar 19, 2024 at 03:50:21PM +0530, Sunil V L wrote:
> > On Mon, Mar 18, 2024 at 07:27:34PM -0700, Drew Fustini wrote:
> > > On Mon, Mar 18, 2024 at 11:40:34AM -0700, Drew Fustini wrote:
> > > > On Thu, Feb 08, 2024 at 09:14:11AM +0530, Sunil V L wrote:
> > > > > This series enables the support for "Collaborative Processor Performance
> > > > > Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> > > > > encoding of CPPC registers as defined in RISC-V FFH spec [2].
> > > > > 
> > > > > CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> > > > > enable this, is available at [2].
> > > > > 
> > > > > [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> > > > > [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf
> > > > > 
> > > > > The series is based on the LPI support series.
> > > > > Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
> > > > > (https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)
> > > > 
> > > > Should the https://github.com/vlsunil/qemu/tree/lpi_exp branch also be
> > > > used for this CPPC series too?
> > > 
> > > I noticed the ventanamicro qemu repo has a dev-upstream branch [1] which
> > > contains 4bb6ba4d0fb9 ("riscv/virt: acpi: Enable CPPC - _CPC and _PSD").
> > > I've built that but I still see 'SBI CPPC extension NOT detected!!' in
> > > the Linux boot log.
> > > 
> > > I'm using upstream opensbi. It seems that sbi_cppc_probe() fails because
> > > cppc_dev is not set. Nothing in the upstream opensbi repo seems to call
> > > sbi_cppc_set_device(), so I am uncertain how it is possible for it to
> > > work. Is there an opensbi branch I should be using?
> > > 
> > > Thanks,
> > > Drew
> > > 
> > > [1] https://github.com/ventanamicro/qemu/tree/dev-upstream
> > 
> > Please use below branches for qemu and opensbi. These are just dummy
> > objects/interfaces added to test the kernel change which are otherwise
> > platform specific features.
> > 
> > https://github.com/vlsunil/qemu/tree/lpi_cppc_exp
> > https://github.com/vlsunil/opensbi/tree/cppc_exp
> 
> I know the opensbi branch is just for the purpose of testing the kernel
> driver. However, I am new to ACPI and I am trying to understand how a
> real system might work.
> 
> The _CPC register address encoding in the RISC-V FFH spec enables the
> SBI CPPC register ID to be specified. But how would SBI firmware know
> what physical address corresponds to the CPPC register?
> 
> If sbi_cppc_test_write() [1] was implemented for a real system, then how
> would it know what physical address to write to for a CPPC register like
> SBI_CPPC_DESIRED_PERF?
> 
The SBI extension provides an abstraction to access the CPPC registers.
SBI implementation for the platform should be aware of how to access a
particular register in the back end when it supports the extension.

Regards,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
