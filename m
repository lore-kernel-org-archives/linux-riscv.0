Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F81C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0A0ybAXXWXkYMe/Na7StAdGHlEl1WOFiL/QFBYxheQ=; b=AluVgZrAjXvgCH
	/Sh1S+TrojiaIJj1yJV9TEaJ0JwRz3bhurCxMBGew7dYKJ0afe7nidvL+2khVaNfPYy9HdB/tkmJJ
	zVp/SPYSVJj1FWsoTL4N+BNGAWDDUUa4aQEmGC8Jt7Qq4oRGYP+gk1MuhYk0BxMbrYLS+ty1m4hkT
	stH3kPGZKxH/HITFfIY0R3duA1wpX9SzaKqgjLQR3TnQO6F1LXbppOD39eL+BQHQCJm/xTt6WRCr6
	g88WkLIFZZiEtCfRiWJl8y/5qs1ovkX8G8Xbx9ZzzpJRckcKnUJT9eZeYf142gDsF1tHz8plWegqn
	synDK1AAMfCtQjIBKnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tYO-00H7V6-2e; Mon, 27 Dec 2021 17:12:56 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1tYK-00H7Sr-Tb
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 17:12:54 +0000
Received: by mail-qv1-f44.google.com with SMTP id fo11so14282180qvb.4
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 09:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=af02MDoLDv5kbBqJbyiSBVRg3nPQiESX18I2wb5cRsA=;
 b=PWZQ01GaCqrrs+hwkzr2R1rqZTOlMek1WALi8aW3zTOkskgs6qYhe6LAIQ4ZJ621nk
 Z/UkwLcW8S1G8VViLCP0QKs4eaxJQd9l+7785vUs5ZJYevY4us3dNvKL6fb5bQ7b0/1Y
 31xxJQX4hNzXAbHxPV067hmvsBDfLz9NueNgzEB2wFuMiKlCWX38YR1XgHFrT1gkqFfc
 Bx2YfCrsQjV/N6OAS/DUJjWLtwGhcTRrEYGCUUWCtQGXAKZJTwbCj+D/jsOMor9Jp0b5
 RdAxl0s1xAHX/BcDVw+mByc9F4VcHPUB/vfdB17xsln3a3a06Cp4W2cmGK5cRcwp5Hro
 rEWA==
X-Gm-Message-State: AOAM530QDSooBECR5IG3WF1A9rUXuAcVQYWKtqp8trQVJJiK189fsVgo
 O84hlOb7NTQWbEIgECSBUcLmbOVc6tsb1/f0AMw=
X-Google-Smtp-Source: ABdhPJxNmaSn541hp00AtbTQkpIwBC7T6N1h7BjA/mD+syu3XRg/0WG6Xin/cclUcv9Fozfek23tdPR8FsdpVccd1ZY=
X-Received: by 2002:a05:6214:20a2:: with SMTP id
 2mr15740245qvd.52.1640625170529; 
 Mon, 27 Dec 2021 09:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-4-schnelle@linux.ibm.com>
 <CAJZ5v0iBJ8NtQautnWnp_pXMfLy_rxys8j4+ugSTbNBb=wzy6A@mail.gmail.com>
 <f9f698b44173c6906e49e17aa33a98e12da7f60b.camel@linux.ibm.com>
In-Reply-To: <f9f698b44173c6906e49e17aa33a98e12da7f60b.camel@linux.ibm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Dec 2021 18:12:39 +0100
Message-ID: <CAJZ5v0iG=wqVtJULiTFsffMWqihA0Rk+abMzmfTcH+J9d5G+YA@mail.gmail.com>
Subject: Re: [RFC 03/32] ACPI: Kconfig: add HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, John Garry <john.garry@huawei.com>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Len Brown <lenb@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_091253_001928_8B04E9D0 
X-CRM114-Status: GOOD (  19.75  )
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

On Mon, Dec 27, 2021 at 6:02 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>
> On Mon, 2021-12-27 at 17:47 +0100, Rafael J. Wysocki wrote:
> > On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > > In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> > > not being declared. As ACPI always uses I/O port access
> >
> > The ARM64 people may not agree with this.
>
> Maybe my wording is bad. This is my rewording of what Arnd had in his
> original mail: "The ACPI subsystem needs access to I/O ports, so that
> also gets a dependency."(
> https://lore.kernel.org/lkml/CAK8P3a0MNbx-iuzW_-=0ab6-TTZzwV-PT_6gAC1Gp5PgYyHcrA@mail.gmail.com/
> ).

And my point is that on ARM64 the ACPI subsystem does not need to
access IO ports.

It may not even need to access them on x86, but that depends on the
platform firmware in use.

If arm64 is going to set HAS_IOPORT, then fine, but is it (and this
applies to ia64 too)?

> >
> > > we depend on HAS_IOPORT unconditionally.
> > >
> > > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> > > ---
> > >  drivers/acpi/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> > > index cdbdf68bd98f..b57f15817ede 100644
> > > --- a/drivers/acpi/Kconfig
> > > +++ b/drivers/acpi/Kconfig
> > > @@ -9,6 +9,7 @@ config ARCH_SUPPORTS_ACPI
> > >  menuconfig ACPI
> > >         bool "ACPI (Advanced Configuration and Power Interface) Support"
> > >         depends on ARCH_SUPPORTS_ACPI
> > > +       depends on HAS_IOPORT
> > >         select PNP
> > >         select NLS
> > >         default y if X86
> > > --
> > > 2.32.0
> > >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
