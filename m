Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D69CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 21:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUWSe7Kwi0HLNXi6FFlV5KWKplZ0Ix1JtNjAw6uyg2A=; b=aDywyRSOi4HTYi
	0oGbWUma/5iuZKAIUJTAPujqF2IID7m8QggI5vpKQFz1WQZwwz5Xoj8ZqYYx+NAScWJVx5lqBryYe
	Au6LIv1udZzlWe4v/ByTC/pngBQXPMUllKi0KY5eTmxSJur5grXggbUHZu+dX8xT9ArKtdQmwWD/o
	aYtWNtekExdr/1Mcr4QKSoDZNwkYuJLGDub6OXG/Cdp0Fv8bCPMN9k7cgRcTICjXcXRn1Dpq3LJAu
	LeuUB8NN9E3ucGwyx4Ij8Vemh3zdc9BzPfln9kR3OBPXuo5gVNcMnNCTqRwXmwF5TXB+DEycMl+Z+
	Ispws9LngjfsbW94beUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEeCB-00Cc4t-Sl; Thu, 21 Jul 2022 21:58:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEeBz-00Cc0F-Ac; Thu, 21 Jul 2022 21:58:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so2620995pjl.0;
        Thu, 21 Jul 2022 14:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PktSKT1L2O3nGxL2SVwxNXiNfS8ZomkMf08apPvZeCg=;
        b=DJY3jYWEFScuIXxMnaqONdYTGCVVwRulQsGebVz6JYCl1utvdLvXQ94toEx5kGMkZZ
         z1/pEiOFwUNWBrMC7+4ufNAkz0jd7cbHp8Zx0ZkqjXfnzObxdRWZcdzVyVOTA1gGu7Wp
         JmFlPgpXKXjsmdzknKots5Mlaul12c7HuPzlH/glqY7CBGvnUXzOUm/Pn6d996JPp/kd
         n4swd/grc13CTgVSCCDo1KShFnI4Jm/FapFGmE8Z2OWfZZMKtLemGcWh4NS19m7XSq9K
         xCmGPLb+25sN7ef6IEg88SWqFRVXLoHcy1Qc9xBZLqp1omKZJBnUyIg5gJB28vKKwrti
         vv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PktSKT1L2O3nGxL2SVwxNXiNfS8ZomkMf08apPvZeCg=;
        b=X4XXadQ2i9Fov3+XldV1DpDBv2nVOIKY9L941MZfMJjeaD+yBN0Fd7wfO53tHyfqFV
         Gw6oFjLqL6ovVAiqFzVXxoPzEDk2okLhC54bkZ4rq0gAQJDMaHDuV3myfjBvbECK1k25
         ssTQY9Nksb1ZvGXQOYBkbqdEmgdxnH4dV59p2YSa/Av76jRKs/3HqpcDrCqseEBoujiv
         6EtpVbhap6+F4dODdmY7kRYP4zDZxkH23EFiNo6pLRYcSiuJwagY/ZOMgt9uGCBXIFyM
         iZLvxTl6Fl1SZaJGcUmoqNkDgVl8J1WFJPGfPHFGf9S2CsnNNFc6m26q9rEE/GwjVM9h
         IEJA==
X-Gm-Message-State: AJIora/ugisYcRBAmJsqOWptwh82Fp8W1qyjcFUQbAGkh2NNGdCAt5mD
	ahQBT2ozVar723YIti3t0pA=
X-Google-Smtp-Source: AGRyM1ulFYUkEqFxa2Ru+9pVLJDAQXGuHlUKI/EVz0VkAXFTFzAMfPLdmoEQMlVX34zoyjKglGkluQ==
X-Received: by 2002:a17:902:db02:b0:16c:5568:d740 with SMTP id m2-20020a170902db0200b0016c5568d740mr362437plx.100.1658440725499;
        Thu, 21 Jul 2022 14:58:45 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id b17-20020a170903229100b0016bef6f6903sm2266180plh.72.2022.07.21.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 14:58:44 -0700 (PDT)
Date: Fri, 22 Jul 2022 06:58:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 4/4] asm-generic: Add new pci.h and use it
Message-ID: <YtnMEwh3U3Ng9q4a@antec>
References: <20220721134924.596152-5-shorne@gmail.com>
 <20220721173733.GA1731649@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220721173733.GA1731649@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_145847_390149_4FC7F4B7 
X-CRM114-Status: GOOD (  26.49  )
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

On Thu, Jul 21, 2022 at 12:37:33PM -0500, Bjorn Helgaas wrote:
> On Thu, Jul 21, 2022 at 10:49:24PM +0900, Stafford Horne wrote:
> > The asm/pci.h used for many newer architectures share similar
> > definitions.  Move the common parts to asm-generic/pci.h to allow for
> > sharing code.
> > 
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> > Acked-by: Pierre Morel <pmorel@linux.ibm.com>
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> > Since v4:
> >  - Add reviewed-by
> > 
> >  arch/arm64/include/asm/pci.h | 10 ++--------
> >  arch/csky/include/asm/pci.h  | 17 ++---------------
> >  arch/riscv/include/asm/pci.h | 23 ++++-------------------
> >  arch/um/include/asm/pci.h    | 14 ++------------
> >  include/asm-generic/pci.h    | 32 ++++++++++++++++++++++++++++++++
> >  5 files changed, 42 insertions(+), 54 deletions(-)
> >  create mode 100644 include/asm-generic/pci.h
> 
> > +++ b/include/asm-generic/pci.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __ASM_GENERIC_PCI_H
> > +#define __ASM_GENERIC_PCI_H
> > +
> > +#include <linux/types.h>
> 
> Do we need <linux/types.h> here?  I don't see anything below that
> depends on it.

Thanks, you are right, I think some of the earlier functions may have needed it,
which is why I had it earlier.  But now that we have removed those we should be
able to remove this.

That said, I think some of the architecture includes could also be removed.  On
OpenRISC we are able to get away with only having the global asm-generic/pci.h
so we don't need a wrapper pci.h header at all.

However, I don't have everything setup to build all of those architectures so I
was being a bit conservative to remove headers.  I'll see what I can do in the
next version.

-Stafford

> > +#ifndef PCIBIOS_MIN_IO
> > +#define PCIBIOS_MIN_IO		0
> > +#endif
> > +
> > +#ifndef PCIBIOS_MIN_MEM
> > +#define PCIBIOS_MIN_MEM		0
> > +#endif
> > +
> > +#ifndef pcibios_assign_all_busses
> > +/* For bootloaders that do not initialize the PCI bus */
> > +#define pcibios_assign_all_busses() 1
> > +#endif
> > +
> > +/* Enable generic resource mapping code in drivers/pci/ */
> > +#define ARCH_GENERIC_PCI_MMAP_RESOURCE
> > +
> > +#ifdef CONFIG_PCI_DOMAINS
> > +static inline int pci_proc_domain(struct pci_bus *bus)
> > +{
> > +	/* always show the domain in /proc */
> > +	return 1;
> > +}
> > +#endif /* CONFIG_PCI_DOMAINS */
> > +
> > +#endif /* __ASM_GENERIC_PCI_H */
> > -- 
> > 2.36.1
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
