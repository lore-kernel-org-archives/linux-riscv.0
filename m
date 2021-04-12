Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB83C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 00:14:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FD561025
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 00:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FD561025
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jiuyang.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sRm6HC2ehYuQcLZdOvE2XY6OHnh07QxlVeeqzqLO4X0=; b=E9+v1KCv9irirGxDpn4Bfmajy
	4vN5/OIYnE6upGNAtDnGM5vuZktc/Bi5hNWfw6jSzwtQP4Iet0mEy8vn2loW/oefxOi4WPmB3caAb
	snai7/u8uHFBZ8sgDwTA014JbgnKgRvxXHlCpmfDgJkZd66KZB8PdU8YNJbrowki9ybnRDlNchcyg
	4T+xdtzzNaBMRU1x71+0ousEAwzBR/YWHqftGmdyRJOX58oYzkEjJczRMWsxverDlfKBfOHwo5V+s
	yVziAB8t4Z9Lyv4aYPM6wft3gx5gvoLVKSYYFED5g6p1SPBvW9r3tfqkIUx6PfwXe3HXd1miikhqg
	MO07rCZxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVkD2-005KqP-67; Mon, 12 Apr 2021 00:13:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVkCz-005KqB-9N
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 00:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=lsO9wDeiKRkCueWk+Uo59AFUAIZUeyl1sLeiaU6tHFA=; b=vY/Tn7DLmmOzCXDcnz4W8DSOXw
 /R1guE9Qftk/2cR3K26Yyusc1f+B9/rcPO4StAgLC8ZxKLDqaVCqa5HJQQWKrn5sE5PxzCHHrdHEV
 AIMKyUSYRL8g/6RtwfZ8vgXj+iD5YE1HE74RvmVCb1RAvXaoEb/RH5xC9PT4ZOw7dqPxsEO1zGUpT
 wT0TXk5iG/q8xSPTRpgmvRuBtiZuC/KIeYGZ79uUauofsKs4iHiZCHr73uStP74SPwXznDNXjzNb5
 6mT8USrbmQtjjlUW8VWTOcgPOUdmEq3tKpzfJtH/s/1HA7Cme4PWpm1hKZVrKvgNMEp9LS1NRvXZ8
 +jnhor0g==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVkCw-005o0H-HS
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 00:13:39 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso7808603pji.3
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 17:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jiuyang-me.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lsO9wDeiKRkCueWk+Uo59AFUAIZUeyl1sLeiaU6tHFA=;
 b=K2tDKT4xzKymCVMPHvadEmcdm0a1x8aLaFoaG5MQe4e+Xn4naDTC8Nc4pWtKyrJr6I
 nsYRKKUxGh5KXWI2W/y/eSPFdEayyrUthlmURylu2FRDZwPiU0TJ11OVnEAWcxePPppS
 76FPVpEbVWhS83sfB07nICWhN79knF5+DCYzT55maZbR2g1FB0SW7HIkwM9ThR5fdjPr
 VmpoWZRS7BJA7ePSqyVKXSNLdbf8JNMpUnOGvDfdFuaSdTzkTGwE6/8ozdM3BXpPnelE
 qXmhnUL/ME5/HjtRgqFvztDLS8n1l/32covStYD23HhzzKI0s24igywkHmyA+78upGAS
 LcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lsO9wDeiKRkCueWk+Uo59AFUAIZUeyl1sLeiaU6tHFA=;
 b=dDxQ2kXJwbMAAlFI6FE+TbuR2P0tQoArGprJITPHJX72rXGee393GU1u/sX8XsVwTJ
 SNfHyDQi96x0JU+PFt8e4frDZHxWOHTGtfy3kdM/gbtLbv6OXeiBXFxCjr5CUPVr52Za
 Za2vfx9Rp6gUeDVqN2ME1uRPBy2toMQmDw2JVQndtkVk0gTcIjqeOILsRX2BGfA/Ilgk
 1rK1XtZeLNZ+iwFeN5JS5pRpMq7DALbdd/XoyW5BBJ3w5V7rds6c9bCgfiQM8FikCkOE
 gxf5dsjzO8DK/fpBMC+94IpLSobaiePKfCoapl33cSjunSd2uZuEJhWKGLme2w9sEa6N
 Udvw==
X-Gm-Message-State: AOAM532giXoxTHicaDwdXh4ZDXmviX9eBCmCYSiE8bqfGFgXDZKz5lAB
 1CHR4eLNGPLjJ5N4Axpni8pGRmTPi5g9wyro/Ke+tw==
X-Google-Smtp-Source: ABdhPJyIkZY1Ik8aSQCpIbtdPVUxw1S+J4AL0nTIcAjIJvi9oH/F9v5OD5U4iRqMNKfJYgnrQVlBHQ==
X-Received: by 2002:a17:90a:29a5:: with SMTP id
 h34mr22019900pjd.158.1618186417547; 
 Sun, 11 Apr 2021 17:13:37 -0700 (PDT)
Received: from nuc.localnet ([193.110.201.196])
 by smtp.gmail.com with ESMTPSA id n52sm8308138pfv.13.2021.04.11.17.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 17:13:37 -0700 (PDT)
From: Jiuyang Liu <liu@jiuyang.me>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: alex@ghiti.fr, waterman@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, geert@linux-m68k.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] implement flush_cache_vmap and flush_cache_vunmap for
 RISC-V
Date: Mon, 12 Apr 2021 00:13:32 +0000
Message-ID: <1846750.LAPMfGk2HC@nuc>
In-Reply-To: <mhng-92e28f5c-ced0-4a92-949f-0fd865c0bbf5@palmerdabbelt-glaptop>
References: <mhng-92e28f5c-ced0-4a92-949f-0fd865c0bbf5@palmerdabbelt-glaptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_171338_619249_137D7FD3 
X-CRM114-Status: GOOD (  27.47  )
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

On Sunday, April 11, 2021 9:41:07 PM UTC you wrote:
> On Sun, 28 Mar 2021 18:55:09 PDT (-0700), liu@jiuyang.me wrote:
> > This patch implements flush_cache_vmap and flush_cache_vunmap for
> > RISC-V, since these functions might modify PTE. Without this patch,
> > SFENCE.VMA won't be added to related codes, which might introduce a bug
> > in some out-of-order micro-architecture implementations.
> > 
> > Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
> > ---
> > 
> >  arch/riscv/include/asm/cacheflush.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/cacheflush.h
> > b/arch/riscv/include/asm/cacheflush.h index 23ff70350992..4adf25248c43
> > 100644
> > --- a/arch/riscv/include/asm/cacheflush.h
> > +++ b/arch/riscv/include/asm/cacheflush.h
> > @@ -8,6 +8,14 @@
> > 
> >  #include <linux/mm.h>
> > 
> > +/*
> > + * flush_cache_vmap and flush_cache_vunmap might modify PTE, needs
> > SFENCE.VMA. + * - flush_cache_vmap is invoked after map_kernel_range()
> > has installed the page table entries. + * - flush_cache_vunmap is invoked
> > before unmap_kernel_range() deletes the page table entries
> These should have line breaks.
Fixed in the newest patch, thanks for pointing out.
> 
> > + */
> > +#define flush_cache_vmap(start, end) flush_tlb_all()
> 
> We shouldn't need cache flushes for permission upgrades: the ISA allows
> the old mappings to be visible until a fence, but the theory is that
> window will be sort for reasonable architectures so the overhead of
> flushing the entire TLB will overwhelm the extra faults.  There are a
> handful of places where we preemptively flush, but those are generally
> because we can't handle the faults correctly.
Got it, I removed this. 
> If you have some benchmark that demonstrates a performance issue on real
> hardware here then I'm happy to talk about this further, but this
> assumption is all over arch/riscv so I'd prefer to keep things
> consistent for now.
We are using riscv-boom + FireSim setting up a benchmark environment, I can 
try it after setting this.
> > +#define flush_cache_vunmap(start, end) flush_tlb_all()
> 
> This one does seem necessary.
> 
> > +
> > 
> >  static inline void local_flush_icache_all(void)
> >  {
> >  
> >  	asm volatile ("fence.i" ::: "memory");





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
