Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4354BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxP1deVTaohagKLDXGblsuHl6nbSOl69rt7qPPBojBY=; b=BpwMEsItFGtjja
	NwHld+0I71GAXlUf9ernEXIaQCYdrPGe3gHr9UM10rXROx10QLqzb5C05k6ahH/WNOYwUQKunqiGr
	e4GSwmWvQPpip1nErfxRQa2U0FJEiLufYZiiH9Z5mZLv/8cNPG+nH5BBhT5S+/qhmW8R5L2pAJPli
	tVuTZEv8TmmWsE9JXlrBkLhuV7JSGZTSvgrdR2kV0h4ISt58WivuC0J2hXLfYSUGvKSfK0vkUvWT5
	6+Y8dqLso4VQks9V+7Hid+yy3IN3PBwGkr/jyIMjVlzDznE1wrcwU1le+f4Gv4Q1KqGx6x4KHTjKF
	tZz51NsrM1Yu+9LUSMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n29u1-000iqO-FA; Tue, 28 Dec 2021 10:40:21 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n29ty-000ipJ-Uh
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 10:40:20 +0000
Received: by mail-ua1-f46.google.com with SMTP id i5so16284254uaq.10
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGprts+IMCcw2LRbyJoC20xYqdPz6LzpMb8Wjv374xM=;
 b=vXzpnnVNcvwy+hyX50y8oLoT/DxL1NiyMzqaWhxgONG7wh5AFDodLVMLVSSQtJJ1SF
 1cujyJfsC8Vuwac9vePWddsb7UDQ65JainA+DkNzpMNwDvEozO7xQVAueW546HI6AsUl
 A5pk+UXn14KceH2h4Q+jJSmefZSeDezskt0rh4lNWt0qIPGbvXHUrxYjetPPrQqR49E/
 xXpkOJqMkKg6Jdf43dJxl7iz/cCrO8bX2dzH5mwij0iVe/jstluGusuMb7V5YBB6bQDl
 bOfnsqyrTLZWI4quKj44gDgtWz7fNbbAThjqcfka1K2sjd4weoP1aduKoUn2oQY01MnD
 KT/w==
X-Gm-Message-State: AOAM531W2k7CNxiJykn32ie68n39ySn7OUqnL3UC+w/ShYpkyAfgEepP
 nCxu4OqgX3OMNn9MK6f18q/ddhlb9ykYrA==
X-Google-Smtp-Source: ABdhPJygT6snpbbyboUBtoetQJ2whVebj+Hs/76TP1+224uqKl0RT56g6hO6ih7v8CDTTS1mrm5diA==
X-Received: by 2002:a67:f613:: with SMTP id k19mr5116865vso.31.1640688017191; 
 Tue, 28 Dec 2021 02:40:17 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id 46sm2138279uav.10.2021.12.28.02.40.16
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:40:16 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id r15so31365990uao.3
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:40:16 -0800 (PST)
X-Received: by 2002:a67:2e09:: with SMTP id u9mr5382186vsu.77.1640688015917;
 Tue, 28 Dec 2021 02:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-25-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-25-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 11:40:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQuOO7WzzO1mB-buEj1h8h0e6Cn7CAbFbaH9Uyvcc=wQ@mail.gmail.com>
Message-ID: <CAMuHMdVQuOO7WzzO1mB-buEj1h8h0e6Cn7CAbFbaH9Uyvcc=wQ@mail.gmail.com>
Subject: Re: [RFC 24/32] scsi: Kconfig: add HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-csky@vger.kernel.org, scsi <linux-scsi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_024019_011843_A5502511 
X-CRM114-Status: GOOD (  19.52  )
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

Hi Niklas,

On Mon, Dec 27, 2021 at 5:53 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch!

> --- a/drivers/scsi/Kconfig
> +++ b/drivers/scsi/Kconfig
> @@ -793,6 +793,7 @@ config SCSI_INIA100
>  config SCSI_PPA
>         tristate "IOMEGA parallel port (ppa - older drives)"
>         depends on SCSI && PARPORT_PC
> +       depends on HAS_IOPORT

This is not needed, [04/32] already added that dependency to
PARPORT_PC.

>         help
>           This driver supports older versions of IOMEGA's parallel port ZIP
>           drive (a 100 MB removable media device).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
