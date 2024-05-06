Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91796C10F16
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+wNVDGFe1TnO1pFC9p800hhAGyHZwnsouPEVTjpXUc=; b=LYl+SXMAHZsg1h
	8m/APCgvQsAw9x6BvWfGwFjDzZtq3H5iBVqYj1L6cqKizOS5AS8141/y3P7o/Ie19oAuUg+dWDDQs
	62RZCZlv5P+HqmesdDda2OlTnie2s9UZMjeb3b5WRG9YVPKmevUuhwkpl0T4kT3WP0xjXLlSm/R9e
	Q1m+ACeUIl1JZknzwaBa7xCTfFzFvyykUyqOLWbfGJBptT704f+BgTZL2vVcWnNFJUm1eZ67IjeGr
	9Jcx2YBzat/v9zzxUl1zxUygpa2CRko3kNwPuVl9Rh5RZH3+4FL9nyKS6tBW287ASOLwWBHfZWm6+
	5+DqMgWAaY5SbdiH2IJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3wmt-000000079LL-3mln;
	Mon, 06 May 2024 11:45:43 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3wmr-000000079Ja-2AAw
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 11:45:42 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-23d477a1a4fso1399371fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 04:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714995937; x=1715600737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mru4lIZY8M9ZaXmhBpUJWDHWUyRRfxkrVAZooaEo0w=;
        b=XCQqoVjz/YDg2IwiDpCD+OHf2P9J7SWDJFj63ew8G1e+2vI/O8NUkV1WxW7NoFVUOM
         rpAp8SPdLCiJEU01o8TVMV8NTkF2QbfO/XwHcVmtdyI68IILwAVNRt+PhU07cZDR/8zT
         pG0pX7CIa7m3qjklJBqJn4GNvnpTGq+kHDYi7R9EvHo+gJgh9xQCDX3ttZ0SoSVQYShM
         sCgl6gh0hMp9/AjDC50qUQRyirkSDDmmPlQlavyXLDWSWI+f9vIOY/wJozOlmor/GTXK
         A9LnwTjZQ5C6c1K+qz1wLijj+SeoGzJdEqiVWfwxvirRfkwkx8gISdx27UBdJbd+1r78
         40Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714995937; x=1715600737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mru4lIZY8M9ZaXmhBpUJWDHWUyRRfxkrVAZooaEo0w=;
        b=T7VDIrxMSZBf998IR+13mh080NJ7m7rwrFJFmDkXJPjp/iWhtuMWw3kE4ZKENEYn6d
         pDlkJPPUCwo4P2G4b3rXTIsQ6BYeGBlfB8xD3kZOAVStA59duYk9gEObzE7HXOA27M+2
         Hf64/1ydTo3oQWnaLMlsrb03q8G9mjiyvIoMlV5xsfX3cBEDghAxTh9L+DPZr1yrZEYv
         ihw0SeqwFOeRmpIaKX67SepjiAVQY857ut5G3w5RfAO/NSFaQrN3rLdEBJX2L6LneHVV
         hrkqj/fcmwGXUnJBDbSncRQUhf/vx4Vg64qKzbS0U5OjB0btINDdMxCJH2Rg6LUMPP9s
         8lUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeiCDtAKIFqFlhXICF1TQKXQ66OP3KOJG27TQCphIJsxx2Javyiz0YBPIKmI2Oa6ytSgjxx1pYjfnFMeTMON7nQ33nplDE9CSYKkucJWnT
X-Gm-Message-State: AOJu0YwQwCVbC9mlLW8i5YQ858BNytIrroD9ZMhGVnuCW9aa9Y/wHOKU
	YZOXnWSrROGdrqU4IcX2O4MveDxdDdmjNfkvcJaoVvE5Bcfy/ksrVa6TaxaLO5U=
X-Google-Smtp-Source: AGHT+IFyCeIGGLi6q/4GvP57e6HELJs2LVP51SvO1LEbo9QoA+TRsrBFgkTO9NTNLl1fhCADnp5IPw==
X-Received: by 2002:a05:6870:1589:b0:233:5b4d:ff90 with SMTP id j9-20020a056870158900b002335b4dff90mr14085436oab.50.1714995936945;
        Mon, 06 May 2024 04:45:36 -0700 (PDT)
Received: from sunil-laptop ([106.51.191.139])
        by smtp.gmail.com with ESMTPSA id ch13-20020a056830638d00b006ebcceb7f8fsm89603otb.62.2024.05.06.04.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 04:45:36 -0700 (PDT)
Date: Mon, 6 May 2024 17:15:22 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 17/17] serial: 8250: Add 8250_acpi driver
Message-ID: <ZjjC0vigpqwe6R/c@sunil-laptop>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-18-sunilvl@ventanamicro.com>
 <ZjNaR-YtVTm4pbP7@smile.fi.intel.com>
 <ZjNh0Llcx+0VHevy@sunil-laptop>
 <ZjNmdfR2J6hNnYle@smile.fi.intel.com>
 <ZjN3GQI3gegYOIgS@sunil-laptop>
 <ZjOy2G0qN5G076i0@smile.fi.intel.com>
 <ZjTtx88zk4GvCImk@sunil-laptop>
 <ZjUDeuCQNCuYgATA@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjUDeuCQNCuYgATA@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_044541_582616_70143749 
X-CRM114-Status: GOOD (  34.56  )
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

On Fri, May 03, 2024 at 06:32:10PM +0300, Andy Shevchenko wrote:
> On Fri, May 03, 2024 at 07:29:35PM +0530, Sunil V L wrote:
> > On Thu, May 02, 2024 at 06:35:52PM +0300, Andy Shevchenko wrote:
> > > On Thu, May 02, 2024 at 04:50:57PM +0530, Sunil V L wrote:
> > > > On Thu, May 02, 2024 at 01:09:57PM +0300, Andy Shevchenko wrote:
> > > > > On Thu, May 02, 2024 at 03:20:08PM +0530, Sunil V L wrote:
> > > > > > On Thu, May 02, 2024 at 12:17:59PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > > > This driver is not a duplicate of 8250_pnp. It just relies on UART
> > > > > > enumerated as platform device instead of using PNP interfaces.
> > > > > > Isn't it better and simple to have an option to enumerate as platform
> > > > > > device instead of PNP? 
> > > > > 
> > > > > Ah, then extract platform driver first from 8250_core.c.
> > > > > 
> > > > Let me know if I understand your suggestion correctly. Do you mean call
> > > > something like serial8250_acpi_init() from serial8250_init() and
> > > > register the driver directly in serial8250_acpi_init()?
> > > 
> > > Extract the code to be 8250_platform.c and update that file.
> > > I have locally the extraction of RSA code, I will see if I can help you
> > > with the rest.
> > > 
> > Thanks!. That will be helpful. TBH, I don't understand what to do for
> > extracting the platform driver code. There are already several vendor
> > specific UART drivers (ex: 8250_fsl.c) which are enumerated as platform
> > devices. 8250_core.c looks cleanly supporting such drivers which can
> > register themselves with the core. For generic UART, DT has 8250_of.c
> > and ACPI has 8250_pnp.c. But 8250_pnp.c comes with baggage of PNP
> > contract. So, the driver in this patch is similar to vendor specific
> > drivers to support generic uart devices which are enumerated as platform
> > device.
> 
> > I can rename 8250_acpi.c to 8250_platform.c if that is better.
> 
> No, that's not what I meant. We _already_ have a generic platform driver,
> it's just inline in the 8250_core.c and needs to be extracted. When it's done,
> you may simply add an ACPI table to it.
> 
> > Could you please help with a patch even if not compiled so that I can
> > understand your suggestion better? 
> 
Okay, Thanks! Andy.

IIUC, you want to extract serial8250_isa_driver from 8250_core and
then add ACPI support. I was not sure about that since I thought it was
only for legacy ISA devices and they seem to be created by OS itself
instead of discovery. ISA driver has some ordering dependency on PNP
driver as well. Anyway, let me try if that is the acceptable way
forward.

Thanks,
Sunil



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
