Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F2C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 23:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8tGvf4CnVIOf1cbnTjFz+ogCOfyLrAEbkJfK1XYyC0=; b=r/MYcmXZBMr47T
	jsQwVmzIs8E3qCijo4AWV52gaElggmdMeHNXPTKYPM8lf9z4qum3l+Ofjwo75HqH8EfbPJ2AFEwcF
	doXqmy0bdvbv22hVXvXim1l/MZAtUvmRcOUjit1WHskyMSnZxUV2Gknr8xs6jrlRm6QjF4XXB6ySW
	R+kQXgbP87stCzFzmy8fsF8W53hVX5TwwBc/bo4HCzjT2ReXj9n428G7E5Ry/IwoPPoRaVaOVeE3x
	55GE03LAuN9qchzjKLlqLnaWqzZhIfb7ge0ScUjbP8C/4lojMDeIeRjmJb2R0df9X17h8rpdZK6Op
	8bPI3fWzi927Rjz4IoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUR4-00B0JN-2X; Fri, 15 Jul 2022 23:09:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCTiO-00Akp7-L0; Fri, 15 Jul 2022 22:23:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id a15so6872272pjs.0;
        Fri, 15 Jul 2022 15:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ou4ITJAtDpdEe2oGXNdiIauXOvcSg7DQL0fAZO9cl2U=;
        b=Q8lGAoHw8McxXXPUu9JJi1XBb9QitejFhB3EEwl7pOmObYxg0niuVsgwD5pp+sh+vE
         xuIKedL/WXyDOOgKJBNrsDZftnMo9VkkzEBAU07KrLja6rRFtcHKmFquU9rhG815UU2M
         4qN1XN8OsBzeKfEo5BTfdcSUJQ2BwjYyJuOFMY1ANoellCCLxbAHe55abXJ7Zm6HvfQg
         GKaa2Vtf5KUXirx9wqbsorAJO9z4sV3vRf0YDGd8uZXmu52ax/4hGUDH+Qk3BfTyJPaN
         iAwhnKMbwb+t+CoQOhksE/3VAGMsc4nRaI5nIO7QpJ2agWHS8WCalQSMbeCbYh/XUxGP
         0SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ou4ITJAtDpdEe2oGXNdiIauXOvcSg7DQL0fAZO9cl2U=;
        b=7AvhPLxE2jmipVfeg6SpjFo9v9NDfDo9JZj6uqIeRvJgSAc1kS7Qg8C0zMEG9jdAym
         bcp09dj0o9WwXyUAXsATIjkv+I2R0z0M7Wf3J0oY2FDPRcWH9HOwalvvP33qaJicntt3
         ISgSsbHRAPrDZcUDlSmSVdQzep3BUqvOppPjEKy4fkxUYEqdMyYBaMAfrAyHLL9EjM7Y
         reWi/ESlUx90gee32GyOZsBR9SPqKo/St5Ygt7vXq669ODS7qg6/AZbB6PFLZuoAE581
         n5EHyy7MLf5UlkXeEAWWrCtYSEwRtDo5SKsIKEOlP/trEPt/PgEFo1GqVeILAa7ko0bs
         5ZKw==
X-Gm-Message-State: AJIora+NYWJPXi1CU57iow0xEWnu8aWK07Czvk63FBMDesnHQWuiCIK6
	hZnotEmWeD3TUX523iU6FkA=
X-Google-Smtp-Source: AGRyM1tY7KJ/8yKzDhwZuUT2Q/d9pehX12mE0ZjdresU33mAA0lNxgF0E239suZTF5xMlCXXfdaB4Q==
X-Received: by 2002:a17:90b:3e8e:b0:1f0:1ac:5908 with SMTP id rj14-20020a17090b3e8e00b001f001ac5908mr17817321pjb.175.1657923792909;
        Fri, 15 Jul 2022 15:23:12 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id j20-20020a170902759400b00161ccdc172dsm4013893pll.300.2022.07.15.15.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 15:23:12 -0700 (PDT)
Date: Sat, 16 Jul 2022 07:23:10 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-csky@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC PATCH 2/2] asm-generic: Add new pci.h and use it
Message-ID: <YtHozgXIkpyWHKth@antec>
References: <20220714214657.2402250-1-shorne@gmail.com>
 <20220714214657.2402250-3-shorne@gmail.com>
 <CAK8P3a2_HKMf8nMcSkK1_jyCEHEdzz=YiRmPvN+ACbPTafXJzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2_HKMf8nMcSkK1_jyCEHEdzz=YiRmPvN+ACbPTafXJzA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_152316_730696_5E7D46C9 
X-CRM114-Status: GOOD (  31.75  )
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

On Fri, Jul 15, 2022 at 10:09:21AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 14, 2022 at 11:46 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > The asm/pci.h used for many newer architectures share similar
> > definitions.  Move the common parts to asm-generic/pci.h to allow for
> > sharing code.
> 
> This looks very nice, thanks for doing it!
> 
> > Two things to note are:
> >
> >  - isa_dma_bridge_buggy, traditionally this is defined in asm/dma.h but
> >    these architectures avoid creating that file and add the definition
> >    to asm/pci.h.
> 
> I would prefer if we could just kill off this variable for non-x86, as it's
> only set to a nonzero value in two implementations that are both
> x86-specific and most of the references are gone. That does not have
> to be part of this series though, if you don't want to address it here, just
> add a comment to the new pci.h file.

I will look at it, maybe in a v3.

> >  - ARCH_GENERIC_PCI_MMAP_RESOURCE, csky does not define this so we
> >    undefine it after including asm-generic/pci.h.  Why doesn't csky
> >    define it?
> 
> Adding David Woodhouse to Cc, as he introduced this interface. As I
> understand it, this was meant as a replacement for the old
> architecture specific pci_mmap_page_range interface, and is ideally
> used everywhere.
> 
> It's probably something that slipped through the review of csky and
> should have been there.
> 
> As an aside, it seems the pci_mmap_page_range() cleanup was
> left almost complete, with sparc being the only one left after
> David Miller found a problem with the generic code. Not sure if
> this was ever resolved:
> https://lore.kernel.org/lkml/1519887203.622.3.camel@infradead.org/t/#u

I see, I will leave it foe now.

> > +#ifndef PCIBIOS_MIN_IO
> > +#define PCIBIOS_MIN_IO         0
> > +#endif
> > +
> > +#define PCIBIOS_MIN_MEM                0
> 
> We should probably #ifdef both of these for consistency.

OK.

> > +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > +{
> > +       /* no legacy ide irq support */
> > +       return -ENODEV;
> > +}
> 
> And this can just go away now, according to what we found.

Yeah, that will be nice.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
