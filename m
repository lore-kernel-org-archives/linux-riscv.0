Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26354C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stgcKQ+ezv/z974Lx30KQMbjnfc/HUUDfVyjhVvjtIc=; b=qyK3mWqkQY25D/
	v7PUojBDACRm8E48YpraWcqbNE533aj6Oi8wQnwLB/jQscQmgmkPY/lMVg9ZuyKcaQYIFp1d70u1q
	BlVR3zSAd/WL753OCXrokla0xpJb+Bc+NqersNricXTobTOMdsxI+q+HbaEcOzJPwCfXz3ntZX1R9
	FCUYhJ50tEQzVENDOApBS0WFcll+Jlur3udzyB6QrXb9+3CElLhGTpZFF1B7mXNj984lQSTW6jl4k
	tnRflsrdqO2drNhVJ7pkZriGXqfWTFFZSgeSe7VVpVa1eDEz0ixDt3gsidWbY7u+LqIfLD97DICG+
	GExPmTyjbgHM/qUmA0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuAT-000243-14;
	Thu, 11 Jan 2024 12:28:17 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuAR-00023K-07
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 12:28:16 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a28ee72913aso1067963266b.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 04:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704976091; x=1705580891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=met0TS3f1iN0VupGC8yYYJUiPelRlG/OMDMfE7CCcUo=;
        b=W2DSdtftMrYswM2coMuxYaYR3WVq2euuYRCJassSUBYJyI2Zm0sWo4nGT1s15hn+/+
         MOZJvZjwQ6/LLl9qvdCBm48MC/C1YHsZabYGyv6GId0d8uqJbAQJewhKScj7eHUM7AB4
         TsTgl14q/9K20tn7uEWzrDt3yBZPo9elgaJApHUaoVmvAeyh+97jD6VPM52imNztCYju
         z3H6QYvcoxXI4tIHqoSPFOcWWudEQdAQveBTyY1yU2qyR56gIeW0y3SVvXzH3zjGx2bw
         meC5vxJNzRLjvvIw5jZzdzs1CI0uy1pniBdZFTKr+KkN/2guaSUJ07MNVtEBYNiTg0o4
         n78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704976091; x=1705580891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=met0TS3f1iN0VupGC8yYYJUiPelRlG/OMDMfE7CCcUo=;
        b=aJkas8Ol3xhO7uQGXhdFpZd3WQ74HT5x1fMtn23nA/20XBHME5cbrDqEO9yeekhbJT
         pPfaIdWh9witVnjjkinQkgr0+AlYNublNUeZeVDZWsw2uf2MPOe2ezpBXhbq7U5eKTmu
         wsUcE7LXLsKoMONXHwAHxLOdPV9uAS+Fz7cR8apPqTnEmef1tXfNHrZewE/YwvtKOTho
         Dy5+RiYVWeq5a4lijkQ1ZUJi3sHmxOCaUrw0zuzBn6AdcamvbdcaVzE32o+2i4spDYqP
         3NMOiARUjYmcKBNxa3rNagZaOQZBS36IPVEv5eR5+bWR7fMWNlfPmOLpiWJsVzvZR6du
         NmOw==
X-Gm-Message-State: AOJu0Yw7uNTY6MAgJuB76gkUQyF6/t7Q9UkhG73tHaZ5ftPQiN+5Bqc4
	cB8/KLCuGIvXDH4r5uR0jzWubGyJgHYAFg==
X-Google-Smtp-Source: AGHT+IEkg2z959ndk+FzzQaRGZjtyR4oRWJbgbi4WbvdpfH73VMDgLf0V+BD0aiz0hAD1dgeK/Pwbw==
X-Received: by 2002:a17:907:7f29:b0:a29:eefc:ef80 with SMTP id qf41-20020a1709077f2900b00a29eefcef80mr809934ejc.33.1704976091271;
        Thu, 11 Jan 2024 04:28:11 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ox9-20020a170907100900b00a2825a9e1d0sm526002ejb.174.2024.01.11.04.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 04:28:10 -0800 (PST)
Date: Thu, 11 Jan 2024 13:28:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: Re: [PATCH -next 1/2] ACPI: Enable ACPI_PROCESSOR for RISC-V
Message-ID: <20240111-e3a13157f1869342e2c8e942@orel>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
 <20240111093058.121838-2-sunilvl@ventanamicro.com>
 <20240111-bb411d2dd39eb859dd049fa0@orel>
 <ZZ_cBlOSW9VCjkOv@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZ_cBlOSW9VCjkOv@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_042815_085402_843A7A9A 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, linux-pm@vger.kernel.org, Atish Kumar Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 11, 2024 at 12:16:06PM +0000, Sudeep Holla wrote:
> On Thu, Jan 11, 2024 at 11:00:12AM +0100, Andrew Jones wrote:
> 
> [...]
> 
> > Also, interestingly, it looks like this ancient line
> >
> >  obj-$(CONFIG_ACPI_PROCESSOR)    += processor.o
> >
> > in drivers/acpi/Makefile should be removed,
> 
> No
> 
> > since there's no drivers/acpi/processor.c file.
> 
> Correct, but ..
> 
> > I guess the make process silently filters object files which don't have
> > corresponding source files?
> 
> May be, but I doubt if that is the case here.
> 
> processor.o is just aggregation of all processor_*.o and this will be
> the processor.ko when built as a module.

Oh, I see. I had tried looking for a processor.o after building, to see if
it was something like that, but it still didn't appear. It didn't occur to
me to also try ACPI_PROCESSOR as a module.

I'll go put my head in some sand now.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
