Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B921C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 09:13:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C9E20857
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 09:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AmT4RWUv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="FJtet8aS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C9E20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOtt3ISf0HPBy/Nv5/1sldrYuWvGmj1I1HcTPj2Z7ho=; b=AmT4RWUv/tNmSh
	tbj1JDWFgYp9IUdwfEbD8cxlM3gbFG/qLvwA+g+MeqIwdA4cSNcYY+/wwpPcawAJyJFkPKsiLjvCk
	I3QNmPG8Atjmc2oWIBcWr9tUG+GiRR+y9Ig1+r3hvYaGbAQ95qhJ0JEwiw8VoTWBudAoG4Sp0+/61
	/RwarYq8qoneUf2l1T40ZwfVs9SqWjxailNM/d+4rnH4JhAVBQXHfbJRu/G7PGGcTTbZ8tCHBqowD
	2zMVrKBnyqz+0/bR23Yjnqa5zTwyJwSow3ocjv9ShoL8FrIc4PpeEeQtdjTEOXJxM8/M+9ieXr3+g
	1tFZYbiXyxbd6tvvafCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBFUM-0000S9-BL; Tue, 02 Apr 2019 09:13:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBFUI-0000RS-La
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 09:13:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id z6so1884590wmi.0
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q74t7NN5KCgRUd8vrDluJPXV/cl64LRr+PLNp1Onwko=;
 b=FJtet8aSMrHIxCPgrGZZq3a2FWDJYLRUBw2QNrr8i6+f0MmuAioeF2Op+BNf99UaTb
 7QOwLInIsx8OMX1BzxvbzntYQvZQNzV0rxuZaO1yPRpI3zt/Erwjpvdqboh5odwfOQtE
 VvUN3TATrfZ0lpSDU50XNIwowrMdAyvTZ6W5RCYNmJ5yWuEQrAKlOPJkhcr+MBIdHJkD
 NcTf4XjNPOWmmvoGTdsz4aN303dzLaPkTCXQ2JuT1spxC4AjYOMHMSk0ulBJBN5o2+Z/
 X3+m3cwAwxwEqiypSOQopIkwPZeWbX8F+bs3oCeXxCZyThi/gQAE9QHTDfKoHD/xMkaP
 TSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q74t7NN5KCgRUd8vrDluJPXV/cl64LRr+PLNp1Onwko=;
 b=IIGZm5ugKVK+Sd4u43Rns8gBUYMnj6T5QaDZcfSmdjwfBjhL9saKKZpDONg6SdMo2o
 kqEo6/xGxgLa1IU6OMqV/uMd+5gGtJLe1IABw8iI8KzuCf9x4Ixwyx4Flo01EohBCkZB
 HRVl+QC8GmZVr3MjPGIcgwgk4N/flxj6caXmVBjvfbZJhJ0AUd5b8UdYCpOe/kHWB53r
 uwkFupubP5LSsPDgRNJ704dOu2ZZtgS6PbDeCJZEkDmCp0C4N5u6Vs7I5uEfK1P+ERYl
 MmL0uXUABt/cjA57q6dUYwu4MLKoonEIE0XI2n/cge4/ppkcN5okDqs5vpiGwzWLOxOt
 9Akw==
X-Gm-Message-State: APjAAAXLvxqNMyGtZVKvRq8GwlDMgS9M4uXxgszmjoAjR8QoH339y/r5
 je4E7Ie00UrubyTv4/46ePrueOBXKLy6MKmLVuMyig==
X-Google-Smtp-Source: APXvYqwpDpGjzU5x4g8eAmSJoM3Gq2RV/LP/bFaBQGBrSk+DJzhJwL8qXLT/Vo+RFCKwOSGDdd2sVwspJuRU6k6J5ps=
X-Received: by 2002:a1c:81cc:: with SMTP id c195mr2897995wmd.61.1554196423236; 
 Tue, 02 Apr 2019 02:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190402055902.14017-1-anup.patel@wdc.com>
 <20190402083456.GA2153@rapoport-lnx>
In-Reply-To: <20190402083456.GA2153@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Apr 2019 14:43:31 +0530
Message-ID: <CAAhSdy2Umjz-=+qsEhpsDyF6bmZfL42=fQe7RffNeMX8P4AYaQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix Maximum Physical Memory 2GiB option for 64bit
 systems
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_021346_754854_1DC8A49F 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 2, 2019 at 2:05 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Tue, Apr 02, 2019 at 06:02:38AM +0000, Anup Patel wrote:
> > The Maximum Physical Memory 2GiB option for 64bit systems is currently
> > broken because kernel hangs at boot-time when this option is enabled
> > and the underlying system has more than 2GiB memory.
> >
> > This issue can be easily reproduced on SiFive Unleashed board where
> > we have 8GiB of memory.
> >
> > This patch fixes above issue by reserving unusable memory region in
> > setup_bootmem().
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/mm/init.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 5fd8c922e1c2..6b063f20a9d0 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -121,6 +121,14 @@ void __init setup_bootmem(void)
> >                        */
> >                       memblock_reserve(reg->base, vmlinux_end - reg->base);
> >                       mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
> > +
> > +                     /*
> > +                      * Reserve from the end of usable area to the end of
> > +                      * region
> > +                      */
> > +                     if ((reg->base + mem_size) < end)
> > +                             memblock_reserve(reg->base + mem_size,
> > +                                              end - reg->base - mem_size);
>
> The memory above MAXPHYSMEM should not be reserved. It should be either
> removed from memblock with memblock_remove or not added at the first place.

Sure, I will try memblock_remove() instead of memblock_reserve().

>
> Frankly, I fail to understand the logic behind setting PAGE_OFFSET to
> MAXPHYSMEM and then using PAGE_OFFSET as the limit for accessible physical
> memory. Still, as it is there, you can set MAX_MEMBLOCK_ADDR=PAGE_OFFSET in
> arch/riscv/include/page.h and then early_init_dt_add_memory_arch() will
> simply ignore the memory above PAGE_OFFSET.
>
> More sustainable fix for the long term, IMHO, would be to break
> PAGE_OFFSET and MAXPHYSMEM interdependency.

I agree with you. There is too much dependency on PAGE_OFFSET value.

Another thing that I had attempted in my setup_vm() patches, is to reduce
initial page tables memory consumption by making page table array size
independent of -PAGE_OFFSET.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
