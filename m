Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1B2C433E6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 18:33:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F4C23B1A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 18:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F4C23B1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b7tXqaxvid1KERp0IqGwDBLHgmM+RMv2Bpbx938Qm/s=; b=jqBV66mspffcyEiaX1jIZcyGu
	pSdr45jTU7g6r4lOMuBGb+Ti0sOpIKBCnI8W04UOuBd8jyCVv2Zbieys1ud/V4PcXZbmmh0xCc/5/
	kwzhPx2LOv2l3KTfkLUy/IZNAch6XWp8P0w88cUdkZja0zsOLpeSKEYEVQHhdLSMeQwKcfPoCpKZz
	UiygC5c3+2IURmMQ40CrReoAInc6pYADGJNHY1lhzPPBcwUo6Uim5+VAclM4gyiMZNqXmo+aCg4aC
	oVAI5PkJ6p5Q2qsdaBgDifek2Y3dqLURk3i8QDgKYSyMP1P3LBWjAzRML1WOm+pqY9GkWotAZmMQM
	8JCSuKxsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l07Qr-0003r7-F7; Thu, 14 Jan 2021 18:33:17 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l07Qo-0003qk-K8
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 18:33:15 +0000
Received: by mail-io1-xd34.google.com with SMTP id u26so13180853iof.3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 10:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EpxBdx9jZ4gaoHzEH4M+jBIaxXM+BhIPyc9ky3KCS6o=;
 b=V4wj5Oc56UgnE2BbRdn3FvtNA61kZC/Q/b0oIttX6nQPNjZVFPUneu+7au70rNmPRH
 RPlY+uYxJxWrO3hT/w9H6mhLaTdPhmGL9cWT97mV+HVefJpBrGQrAR07Fg5Xd4AjsC5g
 QqIeKdsT5dcYLCehHuvRDPfNV9gRQwtc/fBxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpxBdx9jZ4gaoHzEH4M+jBIaxXM+BhIPyc9ky3KCS6o=;
 b=CaXv+1kliS+1QfKXz6Bccg0gJguTmVcbYfvD+OVP9rZFI/oSE+I8Iu7bxKsQ5v4tyB
 JUw1djWcKfhfOm0atspdXzbrGfBVIheWg5LSPCAdSuJSiRnqd15wccX9NyT888t/YT+Y
 /sd3/rZR6HWKsUae+tnfl+69yvB7wZyfqSMEawlJOzbp/wCDNzapJRSWRlFsJwhJW9sU
 kVOSqj3EecQhRPczfjSNL5C/O5MtTttalDAcwRDGoLNAMGD1U1fdFjlrOcU+pwTO+Dnt
 gomeeoX3mTVLHj/utAWr8sb1dsv0XxUCMNV0kmB5noWPRWze5BpD2q0VuziAd2h5b4Gi
 h7sg==
X-Gm-Message-State: AOAM532VY9f0P0jmGS0/exfvLcUaspe2LgZJ1wN556Xp3/RmZmtI60cM
 qI8uLlx9OwHH2kNX4+ZDV37TbYhmJ74GntbKx6WX
X-Google-Smtp-Source: ABdhPJzZpwCw+Xdqndp0caPskWocj1SFY7nvD8xb8MXxAlTFcWEDEuswl4lapPjjbYsU4P4plg7idsNMUMY4nFl3wt4=
X-Received: by 2002:a02:b011:: with SMTP id p17mr7502137jah.114.1610649192495; 
 Thu, 14 Jan 2021 10:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-4-atish.patra@wdc.com>
 <mhng-1400a3dd-651b-4a78-bb2d-1f10580add75@palmerdabbelt-glaptop>
In-Reply-To: <mhng-1400a3dd-651b-4a78-bb2d-1f10580add75@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 14 Jan 2021 10:33:01 -0800
Message-ID: <CAOnJCU+mCPwbeOQpmHmu3ar_17otmgftiKHLL+Z4_nExpj0=cA@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_133314_817047_E99D72B2 
X-CRM114-Status: GOOD (  22.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/include/asm/cache.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> > index 9b58b104559e..c9c669ea2fe6 100644
> > --- a/arch/riscv/include/asm/cache.h
> > +++ b/arch/riscv/include/asm/cache.h
> > @@ -7,7 +7,11 @@
> >  #ifndef _ASM_RISCV_CACHE_H
> >  #define _ASM_RISCV_CACHE_H
> >
> > +#ifdef CONFIG_64BIT
> >  #define L1_CACHE_SHIFT               6
> > +#else
> > +#define L1_CACHE_SHIFT               5
> > +#endif
> >
> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
>
> Should we not instead just
>
> #define SMP_CACHE_BYTES L1_CACHE_BYTES
>
> like a handful of architectures do?
>

The generic code already defines it that way in include/linux/cache.h

> The cache size is sort of fake here, as we don't have any non-coherent
> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
> cache lines in RISC-V implementations as software may assume that for
> performance reasons.  Not really a strong reason, but I'd prefer to just make
> these match.
>

If it is documented somewhere in the kernel, we should update that. I
think SMP_CACHE_BYTES being 64
actually degrades the performance as there will be a fragmented memory
blocks with 32 bit bytes gap wherever
SMP_CACHE_BYTES is used as an alignment requirement.

In addition to that, Geert Uytterhoeven mentioned some panic on vex32
without this patch.
I didn't see anything in Qemu though.


> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
