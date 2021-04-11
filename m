Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33ECC433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:41:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B4C1610C8
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B4C1610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=2PjgPB15k2wuHYsSS6BBDr4LKIjyfhQG0EiYypDv6Og=; b=GUo6xhiL5lxRf2FsO567ARMKN
	fv2HS/Xbsb4cqfQ+DInS1cC1lUPnT/RqE6jVKRzofsP5wqeYCMY/Rt1yFqvseSRuCDKA/JRg2Amja
	1Q37eYqHXwTWrWCX7A481b5O4NrBN/L4y35BUz80mUp5jsVmR0yfhkIqca5OXCaFnmsVWSragShvb
	m9NN7eKCOfqfAPppTsRJjqkT75/Lbo9+tWx/HurN68BgFBXs5Thhk16nQSQwMO83e9bOwh8Ahn+1Z
	ZJjHRhWXe7/Pm0WNwIimvbutHpZAuQufI0DvHGEA8cgvL6q49i9+SBif66ElXvlqePOL6vrShZihN
	cToIzFcLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVhpb-0059kl-R7; Sun, 11 Apr 2021 21:41:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhpP-0059jC-74
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 21:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=+fiWyB9PhZA7feIGTFUmyxbY9Jp7+5HLpxk5Rc5dRkU=; b=J2UchGpmhgHY6dI8HLTNqihJgb
 oiGMGFzaP1B7bxkOack0BSxN3FR+JLKy9creKa47zkLI2cNstY45+X/XuTfLx3i5rGw+ZXHeNFcZx
 czLVk9m7PNGtZCrxYCI+jLO1ctWJdwtYmCXFRU4QKv6VpRiUFk4c1egtZ/1kU++WC7O1jtEALnmgO
 eM5JWsoC5507KwYGkf4V+WE+t8jAUaFDyb68jU0/V1kWUEF0ihzrZqwANKStpPyOCirrrf4bhMsmq
 33UXXFpmxJIsRkNPfK3HNGyUv+/ErUqUscQ9nnVmvhj6Iu6H3nizDU3U3MrhsKguPtqQu49n2HS/n
 RWf60qoA==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhpM-005ktC-Gw
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 21:41:09 +0000
Received: by mail-pg1-x533.google.com with SMTP id t22so7874808pgu.0
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+fiWyB9PhZA7feIGTFUmyxbY9Jp7+5HLpxk5Rc5dRkU=;
 b=Dlc6xfKWjgDIFi8sgGz/DQzY3fGMErdoWktMMh2I7bKW3HOC++m9k0hKMf1TpHKENW
 3dT+5Xwy8YYs9vRD8qiBjSTAvNwC7fF6aMLSFr7vq1ygd/ZvhKbUGtHm+Y/Ns3biyx3a
 roUGSfKjF/hmk77vyhAOs++JApJtogogA6TdoiNrUXcafNT3KnVCOtc/BZJPY+H1B3aq
 ggNjA+QUya21b1PUEwecWpFw5K0As+ixltg6UopS+azSDbGsVzGHV602DQVEOxJGphgc
 iG+Aj0vglgDYCO53mbd0njbjoLg7StSovqJSKFFDYM/4pUqHlXgIxs502CEB0e9ZZqgq
 EG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+fiWyB9PhZA7feIGTFUmyxbY9Jp7+5HLpxk5Rc5dRkU=;
 b=oTSLLDw0ANT3X4kPsskHuH/6soD1FC17NljWb3S3IDaZ6QAG/iJSZyegSAZbqZeT+c
 JGJk1xtQX2vx77PQdXZFGxPhsdjZyI84i5QotomtQ1WD6u8GXw36UwcpQWXSfZF7Rn3l
 oEoujLWJAfuojO15XczQ4wP+XtzDxA+mQNwUCGVQTIg36YfB0N3A7HGzPSh0q0ZHyrMn
 nrTZIwsFEGR8omoFoNCeykrAKxpfTpw8otqF5H7JhohtgYLzQ1BAf7Xu5RZCtFyJHkWd
 azhVSgWA+D4nxZfnOKudWidyIPsQHYykWeqglLrRGgyXjqCCKoIwCvWCpBi2AQLtCixw
 /wsQ==
X-Gm-Message-State: AOAM531oueQAmXgjR/aKCRNfmwqgRBvHH+Tf/EnK48sKGThRCYK9VDZJ
 F5+4qaCJFThjuhAvo9QzjSViag==
X-Google-Smtp-Source: ABdhPJz+f0azA3WHUJPvxLvvsVHFC2p159IkByFsI6fDdDCKC6kai/pYaObykVjFOqOqGAHJoTg8lA==
X-Received: by 2002:a65:5282:: with SMTP id y2mr24123536pgp.293.1618177267560; 
 Sun, 11 Apr 2021 14:41:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 92sm8635526pjz.7.2021.04.11.14.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 14:41:07 -0700 (PDT)
Date: Sun, 11 Apr 2021 14:41:07 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 14:40:50 PDT (-0700)
Subject: Re: [PATCH] implement flush_cache_vmap and flush_cache_vunmap for
 RISC-V
In-Reply-To: <20210329015510.44110-1-liu@jiuyang.me>
CC: alex@ghiti.fr, liu@jiuyang.me, waterman@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, geert@linux-m68k.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liu@jiuyang.me
Message-ID: <mhng-92e28f5c-ced0-4a92-949f-0fd865c0bbf5@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_144108_631342_1C849F47 
X-CRM114-Status: GOOD (  20.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 28 Mar 2021 18:55:09 PDT (-0700), liu@jiuyang.me wrote:
> This patch implements flush_cache_vmap and flush_cache_vunmap for
> RISC-V, since these functions might modify PTE. Without this patch,
> SFENCE.VMA won't be added to related codes, which might introduce a bug
> in some out-of-order micro-architecture implementations.
>
> Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
> ---
>  arch/riscv/include/asm/cacheflush.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 23ff70350992..4adf25248c43 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -8,6 +8,14 @@
>
>  #include <linux/mm.h>
>
> +/*
> + * flush_cache_vmap and flush_cache_vunmap might modify PTE, needs SFENCE.VMA.
> + * - flush_cache_vmap is invoked after map_kernel_range() has installed the page table entries.
> + * - flush_cache_vunmap is invoked before unmap_kernel_range() deletes the page table entries

These should have line breaks.

> + */
> +#define flush_cache_vmap(start, end) flush_tlb_all()

We shouldn't need cache flushes for permission upgrades: the ISA allows 
the old mappings to be visible until a fence, but the theory is that 
window will be sort for reasonable architectures so the overhead of 
flushing the entire TLB will overwhelm the extra faults.  There are a 
handful of places where we preemptively flush, but those are generally 
because we can't handle the faults correctly.

If you have some benchmark that demonstrates a performance issue on real 
hardware here then I'm happy to talk about this further, but this 
assumption is all over arch/riscv so I'd prefer to keep things 
consistent for now.

> +#define flush_cache_vunmap(start, end) flush_tlb_all()

This one does seem necessary.

> +
>  static inline void local_flush_icache_all(void)
>  {
>  	asm volatile ("fence.i" ::: "memory");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
