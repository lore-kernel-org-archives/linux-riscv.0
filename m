Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D8FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQi3WTi8B4tC5n0xnT/+WeASswGZMHzSZwE37Xhn2lc=; b=3U/jXNQ2Dp+Ad/
	px0Fmi0FXw1ZmWGLhnWUT4w2+843qRqHrOycMAAcIQ9lEXDGEEomcCskaoDpXdJzQtixwlmqv2MbG
	MmrozZFXE1QGJyUlzqgwigzeXwXZU9f6Ptm3mRm3QdD0MPxDL/XZTEMQmPCCZkGR3x/6c8QeWnWRW
	vAa0I/JDJ9tsVLVNcKB6LAEEI+n5yiXfTMAjVpXshiO3IPpBX6wgPM5+/T6yrsiWSFYXGKzQX5Tb3
	i5JMnzwJo9L3ZxcWvahyMNkq2RB/fjQ4f8PTwiku4IxpeI34kvXfGUEwcw5EWT8CMC3Jn7UsowpDW
	Avp7YjBKOGxlxdxRoquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2EGv-001QUM-VZ; Tue, 28 Dec 2021 15:20:18 +0000
Received: from mail-qv1-f49.google.com ([209.85.219.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2EGs-001QTS-Pc
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 15:20:16 +0000
Received: by mail-qv1-f49.google.com with SMTP id fo11so16681634qvb.4
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 07:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5fY3FmhAa22/bq1K7vSBws2+S2Pg0+cIwqXDwc5lfsw=;
 b=7Unr9iW7wlsyrZusbZ0pTa+U3f/7ciRyF/AXdqcFbQ18ND1dv7E9OqGXxEGc923RAw
 qxj5AJhhIApYKH413WjKUo5iPX3Qc2oPj6sFk7Wa21Z2sFwY8dXiHFFdHdhMDQLpRixa
 jUTDHOS9KOECOs+2Z8DRVvvSwPWFimHpRtJxjtOmE4XHUJOftFlUrjQGQX9nwdl6SMF7
 9it/tr1+3QNtJNGsTdlR3WczN07MSrnYqhro/xCZD9un5NPDm4gFxOESoVWN+X79+xeI
 acopXD3/KbVEpKfLsNQ4iPXGZNRJX3vN9TTg0aksBzCHteFylRo59nO6Lf9fkxw0OEyU
 GI7w==
X-Gm-Message-State: AOAM533mP+/XYOFoRcwqQGV01HNp2nq1Em5W4IkCUrIobvkml0MTJjWy
 QipVl1fDQbrnBXJBKYsJ9FvaR+babufjHgdcUUU=
X-Google-Smtp-Source: ABdhPJwvMDI1hVWuwpeJm0z85bOJLHXSFIeaxxqnKp8rrJOftEJ2aVNhZWqV1CODEWkrk/+iaCoh31AJInvbc7cE4Gs=
X-Received: by 2002:a05:6214:20a2:: with SMTP id
 2mr19277943qvd.52.1640704813291; 
 Tue, 28 Dec 2021 07:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-4-schnelle@linux.ibm.com>
 <CAJZ5v0iBJ8NtQautnWnp_pXMfLy_rxys8j4+ugSTbNBb=wzy6A@mail.gmail.com>
 <f9f698b44173c6906e49e17aa33a98e12da7f60b.camel@linux.ibm.com>
 <CAJZ5v0iG=wqVtJULiTFsffMWqihA0Rk+abMzmfTcH+J9d5G+YA@mail.gmail.com>
 <CAJZ5v0htSMwM5SgSAaS-UB3G=99DC8ytQ5P4BfjDhdAoQ7pFdg@mail.gmail.com>
 <d1daba9437783ffca746ab7329fe4fbdd04d247f.camel@linux.ibm.com>
In-Reply-To: <d1daba9437783ffca746ab7329fe4fbdd04d247f.camel@linux.ibm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 28 Dec 2021 16:20:02 +0100
Message-ID: <CAJZ5v0idJXf0dBctmCVxyp4rWsMp_MvnryibZa8hqvmjtKV5TQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211228_072014_869808_9376D603 
X-CRM114-Status: GOOD (  31.50  )
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

On Mon, Dec 27, 2021 at 6:43 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>
> On Mon, 2021-12-27 at 18:15 +0100, Rafael J. Wysocki wrote:
> > On Mon, Dec 27, 2021 at 6:12 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > On Mon, Dec 27, 2021 at 6:02 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > > > On Mon, 2021-12-27 at 17:47 +0100, Rafael J. Wysocki wrote:
> > > > > On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > > > > > In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> > > > > > not being declared. As ACPI always uses I/O port access
> > > > >
> > > > > The ARM64 people may not agree with this.
> > > >
> > > > Maybe my wording is bad. This is my rewording of what Arnd had in his
> > > > original mail: "The ACPI subsystem needs access to I/O ports, so that
> > > > also gets a dependency."(
> > > > https://lore.kernel.org/lkml/CAK8P3a0MNbx-iuzW_-=0ab6-TTZzwV-PT_6gAC1Gp5PgYyHcrA@mail.gmail.com/
> > > > ).
> > >
> > > And my point is that on ARM64 the ACPI subsystem does not need to
> > > access IO ports.
> > >
> > > It may not even need to access them on x86, but that depends on the
> > > platform firmware in use.
>
> Well at least it does compile code calling outb() in
> drivers/acpi/ec.c:acpi_ec_write_cmd().

That's the EC driver which is not used on arm64 AFAICS and that driver
itself can be made depend on HAS_IOPORT.

> Not sure if there is an
> alternative path at runtime if there is then we might want to instead
> use ifdefs to always use the non I/O port path if HAS_IOPORT is
> undefined.
>
> > >
> > > If arm64 is going to set HAS_IOPORT, then fine, but is it (and this
> > > applies to ia64 too)?
>
> Yes x86, arm64 and ia64 that is all arches that set ACH_SUPPORTS_ACPI
> all select HAS_IOPORT too. See patch 02 or the summary in the cover
> letter which notes that only s390, nds32, um, h8300, nios2, openrisc,
> hexagon, csky, and xtensa do not select it.

If that is the case, there should be no need to add the extra
dependency to CONFIG_ACPI.

> > >
> > > > > > we depend on HAS_IOPORT unconditionally.
> > > > > >
> > > > > > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > > > > > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > > > > > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> > > > > > ---
> > > > > >  drivers/acpi/Kconfig | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> > > > > > index cdbdf68bd98f..b57f15817ede 100644
> > > > > > --- a/drivers/acpi/Kconfig
> > > > > > +++ b/drivers/acpi/Kconfig
> > > > > > @@ -9,6 +9,7 @@ config ARCH_SUPPORTS_ACPI
> > > > > >  menuconfig ACPI
> > > > > >         bool "ACPI (Advanced Configuration and Power Interface) Support"
> > > > > >         depends on ARCH_SUPPORTS_ACPI
> >
> > Besides, I'm not sure why ARCH_SUPPORTS_ACPI cannot cover this new dependency.
>
> If you prefer to have the dependency there that should work too yes.

I would prefer that.

IMO, if ARCH_SUPPORTS_ACPI is set, all of the requisite dependencies
should be met.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
