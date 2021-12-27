Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4E7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2P5ODSCkCpNt8RJWsvOn00qli0ByrGuE4n1+DfzTsc=; b=fFNZP9d6jOJCdj
	OiD475XiKXa52is/DMnDJNwBTE8Migj2DMXSOyLCt2wNZxhXFvwRf7hqX7Vyta+8mfnE1LbQQjdpf
	k4VpXj8Wmgk2Phc/qk9+H4Qhhoi8IlbMBuJi+3mNjq2LFkOBVwML365kiXJmhlUD6XlOR/Ggr1o0j
	ofKbPeV+kxLmB+dkjNoN2RdfTdwrTQ6U+i4qG23/bvRU7ld3YeP55cZb++bhtV3tkK8NsmlN5ayva
	GU6n5bV7uRSZhMlojAUkVwj1YDXpNdloioMF7sXPORIFtLwC2gHytalg+xhZ6q7mo1rcSTnqiAF/R
	lRXLTASLfVT7HZBt+YZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1taw-00H81T-3p; Mon, 27 Dec 2021 17:15:34 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1tat-00H80F-88
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 17:15:32 +0000
Received: by mail-qt1-f179.google.com with SMTP id p19so13970700qtw.12
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 09:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtgQp7E+XHWylh821kSXZHujAj5pCd79Pzv+DDY2bEU=;
 b=o8wmNtnwwB2VuUJWM3klcmXEdHm4DX9xho91sFDz4YYruqiD2Im1yCYP8QskmMbMTX
 TMFm4uaQzipATZvBPefXO+yzUqiPesHtunEzYOVHSTuiRVf3oiND8hrzRXyaR1mNOyuY
 d97BIstDe/nV5q/ippGniM6EWivbuBNeufxF6InuOcRAzk6WIbTimTubVcsbIBCbqJdu
 3o73F3ZV/mxOAwFT0lJwM/2kCwWhS05dt0AaMMjIDw/xJDQXQuqZL0RTyCStz3DBaqNj
 i43oGwfPJ+Aj1EYCYcjtYxUDcBAA5wfYQUVCbMr2UmAsJwp2bRhRtTYpbQ1lCLPHu7jD
 Fz6w==
X-Gm-Message-State: AOAM532smZTAyZIGD+Ab+3PhmzGigrXgvcjTfLyoVl6cA8h+LW9CXsEa
 Q2CckT3JwksRMdJ1z3rFxWHq5CKgRjXysI7wEBA=
X-Google-Smtp-Source: ABdhPJzA0UGsW2BMjYh4XhxHxtQu5xuUJBsEKsGOHY8rU94CjJKL3IsMfTI+JhA0Q5Zt69+rfrdTsyx47n0p+gK10nc=
X-Received: by 2002:ac8:46cc:: with SMTP id h12mr15513581qto.417.1640625329642; 
 Mon, 27 Dec 2021 09:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-4-schnelle@linux.ibm.com>
 <CAJZ5v0iBJ8NtQautnWnp_pXMfLy_rxys8j4+ugSTbNBb=wzy6A@mail.gmail.com>
 <f9f698b44173c6906e49e17aa33a98e12da7f60b.camel@linux.ibm.com>
 <CAJZ5v0iG=wqVtJULiTFsffMWqihA0Rk+abMzmfTcH+J9d5G+YA@mail.gmail.com>
In-Reply-To: <CAJZ5v0iG=wqVtJULiTFsffMWqihA0Rk+abMzmfTcH+J9d5G+YA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Dec 2021 18:15:18 +0100
Message-ID: <CAJZ5v0htSMwM5SgSAaS-UB3G=99DC8ytQ5P4BfjDhdAoQ7pFdg@mail.gmail.com>
Subject: Re: [RFC 03/32] ACPI: Kconfig: add HAS_IOPORT dependencies
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Len Brown <lenb@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux PCI <linux-pci@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 linux-csky@vger.kernel.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_091531_317531_ED10036A 
X-CRM114-Status: GOOD (  23.43  )
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

On Mon, Dec 27, 2021 at 6:12 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Dec 27, 2021 at 6:02 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> >
> > On Mon, 2021-12-27 at 17:47 +0100, Rafael J. Wysocki wrote:
> > > On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > > > In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> > > > not being declared. As ACPI always uses I/O port access
> > >
> > > The ARM64 people may not agree with this.
> >
> > Maybe my wording is bad. This is my rewording of what Arnd had in his
> > original mail: "The ACPI subsystem needs access to I/O ports, so that
> > also gets a dependency."(
> > https://lore.kernel.org/lkml/CAK8P3a0MNbx-iuzW_-=0ab6-TTZzwV-PT_6gAC1Gp5PgYyHcrA@mail.gmail.com/
> > ).
>
> And my point is that on ARM64 the ACPI subsystem does not need to
> access IO ports.
>
> It may not even need to access them on x86, but that depends on the
> platform firmware in use.
>
> If arm64 is going to set HAS_IOPORT, then fine, but is it (and this
> applies to ia64 too)?
>
> > >
> > > > we depend on HAS_IOPORT unconditionally.
> > > >
> > > > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > > > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > > > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> > > > ---
> > > >  drivers/acpi/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> > > > index cdbdf68bd98f..b57f15817ede 100644
> > > > --- a/drivers/acpi/Kconfig
> > > > +++ b/drivers/acpi/Kconfig
> > > > @@ -9,6 +9,7 @@ config ARCH_SUPPORTS_ACPI
> > > >  menuconfig ACPI
> > > >         bool "ACPI (Advanced Configuration and Power Interface) Support"
> > > >         depends on ARCH_SUPPORTS_ACPI

Besides, I'm not sure why ARCH_SUPPORTS_ACPI cannot cover this new dependency.

> > > > +       depends on HAS_IOPORT
> > > >         select PNP
> > > >         select NLS
> > > >         default y if X86
> > > > --
> > > > 2.32.0
> > > >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
