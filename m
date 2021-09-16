Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD82C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 01:33:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 937B261164
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 01:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 937B261164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3WR530Qych1RIN/vXL4+wvtnKXh1Kk/zdKXvK+eltI=; b=S8HPgaOZl8CnCu
	IsmPOxm/onIc3C1iOikGZhSWfYwhHGj364f6M3UEecHGvG6OTOlR/CGdRT+/QUTflNyYbW0BEh64S
	UsY6QXNb6pymCZLwX6UBZhwjeTi0VegHVyZzqlnhXyajlQl57/ziLKZWHwpzBuG3RrzOaHgC54ROk
	iyFqRlRwfxalW1XkN0dHugo9HVA+eGeBWS1w+5SpDpMilKkAT7zpksfI/d9YM+dEMGFUIXWNghoMY
	ZGdJvtg85IBnOErPEGcZhP3fFuX+HaV5WAEbBB9XjIiP2j2kCS43othhuLq/tH1Ok+wR9cBxrBUmU
	iMBiHMtePVYkP0LLBuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQgGm-00AApD-TO; Thu, 16 Sep 2021 01:32:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQgGk-00AAoZ-R8
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 01:32:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C6C061164
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 01:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631755974;
 bh=EZUqyiFqMWPQYu1agznmvJd23FYTdk+UAyU6XzSvcJw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EgNNAmpzu9i7yJm0cZHK36sBCBZmvB09twTwUwQ/F9YXaOLPfuUeXS62cDBa+vTaN
 iHJzAZVobHIGgOVNKKjGBJry1flwMlWSbKge7odewf+YAchywON8xk5IdzEgMQ2RUo
 k2AI66SXpdYKntCmTc5FI5IrYkU83p8Ubc0A/3AFEd5kVGXHiLPWhWAg7ImrVIyFUs
 ft3CoKW6COBxDLTvOSj8ZmjjmQfzJ7P7axkkTmUBjC6v3gIwfkpyfkbw1y2FIaApU9
 HHQoK45m9AlDkpDZrLhM59i8clNz5bQl16hMIGG2iaIqi+Mx1N8M+BWNJGSWQQf7K+
 tfFVNgYdqKOtA==
Received: by mail-lf1-f43.google.com with SMTP id x27so11895947lfu.5
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 18:32:54 -0700 (PDT)
X-Gm-Message-State: AOAM530vs5hLvYS/abz66ZMdqqcCii+4rcngoy/XP/5mJmZgdrqs9XWP
 X61UqIqoZmRXe/XX/b8nUsiAf0hTDzfmC1xCk4w=
X-Google-Smtp-Source: ABdhPJwLMtZmUEAMGSs3H9QZxFOEyu1LsKdSwSHV7UNOnFJABj6XzJsbEwUWd0CdAT/tmiokofKp1xCGyzxN/9m0Azk=
X-Received: by 2002:a05:651c:b0b:: with SMTP id
 b11mr2599411ljr.72.1631755972643; 
 Wed, 15 Sep 2021 18:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-5-guoren@kernel.org>
 <20210915075007.GD20024@lst.de>
In-Reply-To: <20210915075007.GD20024@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 16 Sep 2021 09:32:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSgbmff7aTjwTD+rhQroWeaXfjepGeEAmooBV6d4u70kg@mail.gmail.com>
Message-ID: <CAJF2gTSgbmff7aTjwTD+rhQroWeaXfjepGeEAmooBV6d4u70kg@mail.gmail.com>
Subject: Re: [RFC PATCH V4 4/6] RISC-V: Implement arch_sync_dma* functions
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_183254_939715_6739B854 
X-CRM114-Status: GOOD (  11.78  )
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

On Wed, Sep 15, 2021 at 3:50 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, Sep 11, 2021 at 05:21:37PM +0800, guoren@kernel.org wrote:
> > +static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +     if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> > +             dma_cache_sync->cache_invalidate(paddr, size);
> > +     else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> > +             dma_cache_sync->cache_clean(paddr, size);
> > +     else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> > +             dma_cache_sync->cache_flush(paddr, size);
> > +}
>
> Despite various snipplets this is a still pretty much the broken previous
> versions.  These need to use the CMO instructions directly which are
> about to go into review, and then your SBI can trap on those can call
> whatever non-standard mess you're using.
I think you mean put an ALTERNATIVE slot in the prologue of __dma_sync?

#define ALT_DMA_SYNC()                                           \
asm(ALTERNATIVE(".rept 64\n nop\n .endr\n", "<vendor code>",
XXX_VENDOR_ID,        \
                ERRATA_XXX, CONFIG_ERRATA_XXX)  \
                : : : "memory")

static void __dma_sync(phys_addr_t paddr, size_t size, enum
dma_data_direction dir)
{
        ALT_DMA_SYNC();

        /* future cmo codes */
}




-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
