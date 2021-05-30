Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1712C47089
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 05:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C6761108
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 05:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45C6761108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUMN55KwMenTmFAf65B7NZf0hVoxrnwDTW63lHqtxjY=; b=cuwaknI3nbLDGX
	PlK2Nbfps1Gn/m5adbnw7JsD6J86w6xyqu8S+k/yZBzi+hYTw/Yr5+3Kui73jjB8CS3lKk2CRTmCK
	MNVk/7DRsfqzL7x3LAPJwiVkjSXUyH+1+ZfuEYwJKfVq9FmG/YYevtu7GdXrAvFsGnVgjjdT/Xaod
	QiirUek4EDoxzIG4UbnxqETwrKKHwU8C32cgUD0RO4XfCJzMBbCU+30SJ15/6LPXeA2jFqmRYSPQd
	mQVUtr8HcXVT6vh+s/7rLVmBqd8WtTq3RYhGQfxI3GBvPRVjUg0re89kF+CFgZEOEqKA7iYsaHEju
	RY3cnFJYk1iE5k86zxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnE5Q-0093Fa-Va; Sun, 30 May 2021 05:34:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnE5N-0093FF-MD
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 05:34:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5913060249
 for <linux-riscv@lists.infradead.org>; Sun, 30 May 2021 05:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622352845;
 bh=FLn/9f8WMsIdmFnvrDv3Mglo+h1LSWEE4NFwYI9qejQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tu01rQTeK9Bh/v4eCo7w+Ip4ogwfvKVV8jD3yJSlSdusQjNnog2wrv9NoNWhfl7A5
 iF4kO2WVxan3vNWMmI3CNm3SGZDE+SKF81ZbAN2OKSneoYp2iYykoI1wK9577fzZAQ
 B3zp7YbEkujEn7vC0oZd6z2NLpDb4Mefa5D5aF/2GmKggt7oItNCMZ21JF2qwVdecM
 ZgiLMxDXXAINrydlVUZhboc92qKALqnlaNd42I/FfhwssZBv8Ppf7DqLat+9cRKu/M
 +tW7wifOivCSaShs2EuwlIIJui4Xm22K0nBxI0KKFrw7YclJGEMliQmZEh1+wV1w7S
 kkG5lBDKJ2F/A==
Received: by mail-lf1-f45.google.com with SMTP id a5so11821690lfm.0
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 22:34:05 -0700 (PDT)
X-Gm-Message-State: AOAM533adDpHsvlY/jAiHshPx51rNPs5FYm2DMnaPL4xFAUOGdFRh5eF
 Egzj0C1+rRUEYUWqYTjxrk37JasJLmeSlrtXsLQ=
X-Google-Smtp-Source: ABdhPJzXI4xVh66JGKFo7gHrm+ykGxENf72ornewHIx5uJq5t/cO3XwEwN5wOJP9Q3jcnMFdCSb8EzCc+wHXCIIJTuo=
X-Received: by 2002:a05:6512:36c5:: with SMTP id
 e5mr10864663lfs.41.1622352843723; 
 Sat, 29 May 2021 22:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <1622008161-41451-2-git-send-email-guoren@kernel.org>
 <mhng-60806045-5ac7-4057-b596-a4d9cb79b7be@palmerdabbelt-glaptop>
In-Reply-To: <mhng-60806045-5ac7-4057-b596-a4d9cb79b7be@palmerdabbelt-glaptop>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 May 2021 13:33:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSPQmWLon40GafUjEjeMfu3ZPsPREzE+4W5+0uWjj=F_A@mail.gmail.com>
Message-ID: <CAJF2gTSPQmWLon40GafUjEjeMfu3ZPsPREzE+4W5+0uWjj=F_A@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_223405_791177_55168B31 
X-CRM114-Status: GOOD (  22.12  )
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

On Sun, May 30, 2021 at 7:42 AM <palmerdabbelt@google.com> wrote:
>
> On Tue, 25 May 2021 22:49:20 PDT (-0700), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Kernel virtual address translation should avoid to use ASIDs or it'll
> > cause more TLB-miss and TLB-refill. Because the current ASID in satp
> > belongs to the current process, but the target kernel va TLB entry's
> > ASID still belongs to the previous process.
>
> Sorry, I still can't quite figure out what this is trying to say.  I
> went ahead and re-wrote the commit text to
>
>     riscv: Use global mappings for kernel pages
>
>     We map kernel pages into all addresses spages, so they can be marked as
>     global.  This allows hardware to avoid flushing the kernel mappings when
>     moving between address spaces.
Okay

>
> LMK if I'm misunderstanding something here, it's on for-next.
>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 9469f46..346a3c6 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -134,7 +134,8 @@
> >                               | _PAGE_WRITE \
> >                               | _PAGE_PRESENT \
> >                               | _PAGE_ACCESSED \
> > -                             | _PAGE_DIRTY)
> > +                             | _PAGE_DIRTY \
> > +                             | _PAGE_GLOBAL)
> >
> >  #define PAGE_KERNEL          __pgprot(_PAGE_KERNEL)
> >  #define PAGE_KERNEL_READ     __pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
