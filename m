Return-Path: <SRS0=T2Hi=MJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C478C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Sep 2018 00:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E58620657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Sep 2018 00:35:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9c85Pan";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWktOBfb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E58620657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDEZP04he3gztrH2jvk4N4NrCEUniEkiMgD1O4HXlG4=; b=e9c85PanBJ0eIY
	cJhrZzmFhaAydrKTKu+H7AAZK870U8L8uwJwTu5tp76woBDMlq4YdlWyyFK33usO15WLQX3l79ByS
	aUpc0EmAGfv1On+ey9XeUq4ZYiRCz/1XS8D20DhNx2KE/0oyeERoun/R1d4i3+ZamaTM+PHncy9ue
	wAsyRtZzBD/fVTsCx04iYHv0guPk4QegkXjDWemrpKRxbENwm6agtu69Yq39/rQbsrOT9RDT2axjQ
	TjeSQEWy611PykoAl0U54VtPs81u4Fnqrlg9MhKVzCGlvIdwQ7M1doWfP7qfeKmE77ToKeYK4oMDf
	jifYaE9Q19Pn3ItjkvZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5KHL-00062j-9R; Thu, 27 Sep 2018 00:35:39 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5KGx-0004lW-MW; Thu, 27 Sep 2018 00:35:17 +0000
Received: by mail-it1-x143.google.com with SMTP id o72-v6so9832248ita.1;
 Wed, 26 Sep 2018 17:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCL+Y3Elp9js0tskQ42GEDjYhI0l5SAZZjTRQ2rGzW4=;
 b=gWktOBfbdrBncdviL20J5F04FWoaz6YrOuZLdcCDBv1a1+de7firBMdo56D5siKbuP
 knUUB/mvtfUFAgKRLK6W3vSmF/mpPs+gnm6yp5S+r9Ha9FPHQr2nPuRnqXV2poXWKJJ3
 HIOfbb4fDeKHAeNv1BJcfuUtpb1jGZYjKdkWtTH9UaLxMDvX8nuhR5WKVgZkkOz9BpEd
 CI7OaIPDPdJciw65l552y88iAqeLkftXzSYBxY3FdNga0rrtQBxT8YIewUygbcNpeekX
 N1FJ36m7Pb9UOF1rdrmYpWB/Tlp8yZqialQsEs2ivoPFIrl6lxYgw/zD3yJUoC9cbydD
 y/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCL+Y3Elp9js0tskQ42GEDjYhI0l5SAZZjTRQ2rGzW4=;
 b=WAzcMNwIAhLlcpYGpWrYehFnHsFfIW/NkVMEjyLltGees9PPwyTqVDqPgjS3jqiCyO
 kvM2mmwQE2xjpmajH8MzeVw9ZPzsVr9DyRrgeUi/ZKOV8YgGmg95myOtXkDFIrvAGp/M
 bQCIV8y7Ru3OVQnu47mgZ+KrDwiGsC+xLPekG2/Vf0pXXK3GkcMdlVYlDc5szo+FPLwb
 aWm21FDGKCliFaYT15eK5YVvdMD1pCY/b/06oDppKSKwX+egPgmaQd4qtVE04liHsk3q
 rn+FqqJJ6uGmwvYHEJ4v9BVuXLt23m/vHOovTn6uuxp+FPfzEzsR3BaWvgBTbgjSCACP
 m5dw==
X-Gm-Message-State: ABuFfohOICcCWKc2RjLOGgU84bKOPPyW0IBvKzgPNxji8QMr5DI5peqH
 XvZ44Co5ygDnqrBx+9ML8JqMjCvW3V/bl6CFWSM=
X-Google-Smtp-Source: ACcGV60OAZQmP5vY8eqKtSx1NklVALWsgxgzNJor5OtZ8jnmAORXbLTb9Endu8EQp7BjsTC54YL6VZvdYwYvpa0EezA=
X-Received: by 2002:a02:7a12:: with SMTP id
 a18-v6mr7812760jac.42.1538008483880; 
 Wed, 26 Sep 2018 17:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-4-git-send-email-rppt@linux.vnet.ibm.com>
 <CAKgT0UdP=78RsWHMxFu4PD8a3AhA3eNcG68Z_9aGY0vhOKf7xA@mail.gmail.com>
 <20180926183152.GA4597@rapoport-lnx>
In-Reply-To: <20180926183152.GA4597@rapoport-lnx>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 26 Sep 2018 17:34:32 -0700
Message-ID:
 <CAKgT0UcC-GTtyPK9ynvj6r3YFqy8kE40iMJxzPowbNoXGf9iWg@mail.gmail.com>
Subject: Re: [PATCH 03/30] mm: remove CONFIG_HAVE_MEMBLOCK
To: rppt@linux.vnet.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_173515_762756_3D998853 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: linux-mips@linux-mips.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, palmer@sifive.com,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-mm <linux-mm@kvack.org>, dalias@libc.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 jonas@southpole.se, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 mpe@ellerman.id.au, jejb@parisc-linux.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, msalter@redhat.com,
 mattst88@gmail.com, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 nios2-dev@lists.rocketboards.org, Thomas Gleixner <tglx@linutronix.de>,
 gxt@pku.edu.cn, linux-arm-kernel@lists.infradead.org, chris@zankel.net,
 monstr@monstr.eu, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, fancer.lancer@gmail.com,
 rkuo@codeaurora.org, paul.burton@mips.com, vgupta@synopsys.com, richard@nod.at,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, lftan@altera.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180927003432.X8-DKD9OYMtynJ_ObiH8vENzgTz3fdbOCntnBa250sQ@z>

On Wed, Sep 26, 2018 at 11:32 AM Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
>
> On Wed, Sep 26, 2018 at 09:58:41AM -0700, Alexander Duyck wrote:
> > On Fri, Sep 14, 2018 at 5:11 AM Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> > >
> > > All architecures use memblock for early memory management. There is no need
> > > for the CONFIG_HAVE_MEMBLOCK configuration option.
> > >
> > > Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> >
> > <snip>
> >
> > > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > > index 5169205..4ae91fc 100644
> > > --- a/include/linux/memblock.h
> > > +++ b/include/linux/memblock.h
> > > @@ -2,7 +2,6 @@
> > >  #define _LINUX_MEMBLOCK_H
> > >  #ifdef __KERNEL__
> > >
> > > -#ifdef CONFIG_HAVE_MEMBLOCK
> > >  /*
> > >   * Logical memory blocks.
> > >   *
> > > @@ -460,7 +459,6 @@ static inline phys_addr_t memblock_alloc(phys_addr_t size, phys_addr_t align)
> > >  {
> > >         return 0;
> > >  }
> > > -#endif /* CONFIG_HAVE_MEMBLOCK */
> > >
> > >  #endif /* __KERNEL__ */
> >
> > There was an #else above this section and I believe it and the code
> > after it needs to be stripped as well.
>
> Right, I've already sent the fix [1] and it's in mmots.
>
> [1] https://lkml.org/lkml/2018/9/19/416
>

Are you sure? The patch you reference appears to be for
drivers/of/fdt.c, and the bit I pointed out here is in
include/linux/memblock.h.

- Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
