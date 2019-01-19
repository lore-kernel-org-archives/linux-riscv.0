Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F69FC61CE4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 10:45:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD622086A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 10:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pN4TjPnm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="b5QJJpHO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD622086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2Aylc5jcPbtOqAhFZPDpWMNMKrFioG4fNJe3qaLMc0=; b=pN4TjPnmGKyHPA
	+mo2mio6kORIIU3oFrYQ/1DMlxtZNclf+6faBA79YUtzNtNbRO8MAFnko5BuU9eUin29LI0unhLaJ
	53a1T8yAK3/Q1CKpnXOynDfsjuTq0oFnyr07VWhK0QVvtEPCWF700PWa9g5nkR6y94l8WHJ2NIr2B
	oP47Xn1E58/SLwWkUAbCgFwJlLy6mHRZFaX7XznOtQ8o+YZdtk8oV4vvSCtE8MtzBWlfxDt5sYZRo
	ppWdwkosm0AMXjRhLI8PFO81AwPQTlZ+Do5PRnzlkOPR60vhZ8aSGB6xgReA6iDBttB1sTJaSziLM
	R0FeP2VsFdbXCNfXt+dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gko7d-0002Db-6U; Sat, 19 Jan 2019 10:45:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gko7a-0001rU-2x
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 10:45:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id y185so2692448wmd.1
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jan 2019 02:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X16utiK3fu3/GY0eUWcDWtc3d7tcknqv+WUU1uN/1tM=;
 b=b5QJJpHO4/3+5TYJj8Rx6qnnl4Kc24RiqlqHC5w7N9V6JSo6Tfo56XrHVI2QbT4XqP
 IQl/nf5bvHjAmRbiMdbqZH8Y+a3GtsMKObz++LKJqoQ6UDIl8C6iBXkDXWd7QftlsvWf
 KTqTKfAX4HnS2znLI1giEPSOJM6F1g/6kIsG0K+qPK+8QjV99Vi7OuSMYIzvDaM/aD5J
 k0a9IyDlV//hJM2RozjYkNK/XObIcBVWkhjpbKkQezmwYmxe27AQcIzBLzK98KtwV5zM
 95mM1X+8pxxov4frGR9iQHQhYXzI+NSOYWxHMVhrSFbLf0mxU9NxDwzqm0T13WcdPzph
 I6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X16utiK3fu3/GY0eUWcDWtc3d7tcknqv+WUU1uN/1tM=;
 b=fwMjzIavV1HF9j0j20HXhoGDWdZYqMqTY9Ssd5MDgY3MX7WEd2jh2lKurj5vyMdz9t
 MKIhRCf1R4vFw7Mk+TJ9kQzZU6aoTCkJzO6xEDaAmdM2iQxzbe1Vj46bDQxbO3C/jSMy
 tRcf/8VgX6XbNuXa4qA7e//WFqFVyKNHk9GRciBihmrta6QLx4r7al6z0ednAZnpmVv9
 euKsbeGD5TJrzUDPOwnWI9zUI1qewv66HJsHuBHKI2GB1x/I6958pP0qVSLD3R1ev8Me
 k14qdEevgyXxZIKixtD2J+sIGTQkWYyPmm3azxyZf/pFj2M3my81MjA4FLwikoQ5Zyon
 nSwA==
X-Gm-Message-State: AJcUukeV/wKPXCxjn2j8f15fyk4DUtXlef8/uIVPMFiQUTa3Xdwq4TUN
 06TbAN1jG7k37ATrbgmpWf71vXmPRw4JhBgA7fIHXQ==
X-Google-Smtp-Source: ALg8bN5fNbQeavCren1sHwZXnLM9KFTyZ/WsnntoJ8fFqRXqsaczAKaBxkkHEp9o1IOP+e4W/5qiddQOYJZEi6qbNrs=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr18409123wme.16.1547894699912; 
 Sat, 19 Jan 2019 02:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20190107161047.10516-1-anup@brainfault.org>
 <20190107161047.10516-6-anup@brainfault.org>
 <20190115134746.GF13216@infradead.org>
In-Reply-To: <20190115134746.GF13216@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 16:14:48 +0530
Message-ID: <CAAhSdy3skp+8qJcVhen7GN4EuF0aQoAyQtxoV2ZOv54vW9Fsew@mail.gmail.com>
Subject: Re: [PATCH 5/5] RISC-V: Implement compile-time fixed mappings
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_024502_173573_B9115A8D 
X-CRM114-Status: GOOD (  20.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 7:17 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Jan 07, 2019 at 09:40:47PM +0530, Anup Patel wrote:
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > This patch implements compile-time virtual to physical
> > mappings. These compile-time fixed mappings can be used
> > by earlycon, ACPI, and early ioremap for creating fixed
> > mappings when FIX_EARLYCON_MEM=y.
> >
> > To start with, we have enabled compile-time fixed
> > mappings for earlycon.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/Kconfig              |  3 ++
> >  arch/riscv/include/asm/fixmap.h | 52 +++++++++++++++++++++++++++++++++
> >  arch/riscv/mm/init.c            | 32 ++++++++++++++++++++
> >  3 files changed, 87 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/fixmap.h
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e0d7d61779a6..66094aba9a59 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -86,6 +86,9 @@ config GENERIC_CSUM
> >  config GENERIC_HWEIGHT
> >       def_bool y
> >
> > +config FIX_EARLYCON_MEM
> > +     def_bool y
> > +
>
> Can you please throw in a prep patch to move FIX_EARLYCON_MEM to
> drivers/tty/serial/Kconfig and only select it from the architectures
> that use it?
>
> > + * fixmap.h: compile-time virtual memory allocation
>
> No need to mention the header name.
>
> > + */
> > +
> > +#ifndef _ASM_RISCV_FIXMAP_H
> > +#define _ASM_RISCV_FIXMAP_H
> > +
> > +#ifndef __ASSEMBLY__
>
> As far as I can tell we never include this header from assembly files,
> so this ifdef should not be needed.

Okay, will drop #ifndef

>
> > +/*
> > + * Here we define all the compile-time 'special' virtual
> > + * addresses. The point is to have a constant address at
> > + * compile time, but to set the physical address only
> > + * in the boot process.
> > + *
> > + * These 'compile-time allocated' memory buffers are
> > + * page-sized. Use set_fixmap(idx,phys) to associate
> > + * physical memory with fixmap indices.
> > + */
>
> Please use up the available 80 chars per line for comments.

Sure, will do.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
