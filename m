Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA08C2B9F7
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 23:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B08B61420
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 23:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B08B61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfWiYzwO8Xz7VPBY4humprbHxP/lXECOUyVSWl7jEIc=; b=EI08iSY5tYjCYM
	ibdONOFz0NkVPL5bK6QLd0l8GVJ2ZcEr5yVPzroBAGRxZ0bH3Q7nD3FKVAPUYHNaE4dda+x2Om2g0
	R6YPixGhITyLDMawOZOpzJRO6+k71IZWSYz7oJnrQc0n81avBxQICPh5eDgGovLjwLsgXw+08QsUt
	SfItODNHFKZsbgFf4hprc3sEZXFkWpOrEEsiSZN7fTsvNiIvEWOdTUwKNXqILlH2PI90XBN6fJwd7
	/GZNYRQ/1tx6iB9VzCtWmdViHajt/p1HKZkDqZ+C+SmEkBBu0atwTGHfQa384W4JKJhmI7G19RAj5
	OW6Ux23iXw/30sSz/r7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llKEw-002OV9-O0; Mon, 24 May 2021 23:44:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll9H1-000t6X-O7
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 12:01:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55CD5613D6
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621857691;
 bh=veNGvYxcLl+vDYUz1SMH3CGwccZ8IWRdI0wIqqjpXHk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nD8gwroafsuYGdv9NfLO0Co93IMx/me0F4AAZKDIR4kw849gUWF0ueVG7PLAVzHEq
 zul3q6dM9dUQ93Urx1vFQceK7M3j6tH6+N6bMr98eBb6rMOndl+c7Dh5hf88g4yblk
 Q5d5dTF1w8GnDEklR70EJBmKE80ZA49d2FyeYOOZnUgJP/MgVzoJqSp6l++emo3Ftd
 9urpVUBIYqyaSzEQ/+/5T0kOmIi9Iou86kq+VsyhNwQUtA+/dXmVzzDRg00f623Ypk
 tTvCTu/v3jHt7kYXvnz1aukazjAxtGZKYMA0znBQasdoA5LvhqXEAyQ46zx9ASMX16
 8hVMtlTLi1iDw==
Received: by mail-lf1-f44.google.com with SMTP id b26so24249919lfq.4
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 05:01:31 -0700 (PDT)
X-Gm-Message-State: AOAM53175b2GyczUeEFlkLPPI8Dw3qe50foXq+tB6PkZNMX5hc8bzTWx
 P7n/4x3cAqIiWUQ1hW2/DyBrMzCGphSvgAX0eFE=
X-Google-Smtp-Source: ABdhPJx/oJ+jz4mGUBNUVDukdZUBydqmcR8FyJX8ZFV9ulMABT6jX8AjToYzvFvtvNgaeYZh3zITll0SsnnwsObfXs4=
X-Received: by 2002:a05:6512:36c5:: with SMTP id
 e5mr10330380lfs.41.1621857689496; 
 Mon, 24 May 2021 05:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
 <CAAhSdy1QsyddHG3u=+Sv3mrVmtB15pr-hvg7+UT1evmNSwyY1g@mail.gmail.com>
In-Reply-To: <CAAhSdy1QsyddHG3u=+Sv3mrVmtB15pr-hvg7+UT1evmNSwyY1g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 May 2021 20:01:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTzEko6Qdt80gDJP6yFaomYa5SqA+onfbm_khnRFV0L-w@mail.gmail.com>
Message-ID: <CAJF2gTTzEko6Qdt80gDJP6yFaomYa5SqA+onfbm_khnRFV0L-w@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_050131_828773_4754527D 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, May 24, 2021 at 6:42 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, May 24, 2021 at 12:22 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Kernel virtual address translation should avoid care asid or it'll
> > cause more TLB-miss and TLB-refill. Because the current asid in satp
> > belongs to the current process, but the target kernel va TLB entry's
> > asid still belongs to the previous process.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 78f2323..017da15 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -135,6 +135,7 @@
> >                                 | _PAGE_PRESENT \
> >                                 | _PAGE_ACCESSED \
> >                                 | _PAGE_DIRTY \
> > +                               | _PAGE_GLOBAL \
> >                                 | _PAGE_CACHE)
>
> It seems this patch is not based on the upstream kernel. The
> _PAGE_CACHE seems to be from your other patch series.
>
> Please rebase these patches on the latest upstream kernel without
> dependency on any other patch series.
Yes, it based on DMA_COHERENT. I'll rebase in PATCH V2, thx.

>
> Regards,
> Anup
>
> >
> >  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> > --
> > 2.7.4
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
