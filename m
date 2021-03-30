Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41E0C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 07:03:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1237B61987
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 07:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1237B61987
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dpD0dlCAcK/uvpQOehPA+vPEvMhPfwTtyxRLW6UWHdY=; b=OF7cqBASmgnhpbW3YDLIwAIt2
	lgC4ISwcE4xGkst6IWx8afBU3AAUQWp3oCjMpZuTlq5jTcZDmnGcgS7c/bgeGHZbU4OlRj5j5gfe9
	zKbqgnJr/AIf0ISHZ8n56SNq2o6Ez3NTyU58m4sLSWuox12Bb7vM38b+eKqvxUsCpDQSPcRyl1VOO
	6vwvabxugGEu9LgpKAnr9d/JmeghqLsS5sJHi7KAe8/vD+tIrAPpCnHMU3fV/YjJS7VlFBuUAcd3i
	Qq4DijLLRIY3Lks6K/L2/I3aBKKiCVsh7xhVno3n8JD4sH7NOYTSjPYfJJ2O6XZfg4OiNZ9RJWvW/
	70bl9fNqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR8Oy-002spM-Fx; Tue, 30 Mar 2021 07:03:00 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR8Ou-002sp1-Bp
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 07:02:58 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C643820002;
 Tue, 30 Mar 2021 07:02:50 +0000 (UTC)
Subject: Re: [PATCH] implement flush_cache_vmap and flush_cache_vunmap for
 RISC-V
To: Jiuyang Liu <liu@jiuyang.me>
Cc: Andrew Waterman <waterman@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210329015510.44110-1-liu@jiuyang.me>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <9749165b-32d4-94a2-7c8a-e219fdf1b102@ghiti.fr>
Date: Tue, 30 Mar 2021 03:02:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210329015510.44110-1-liu@jiuyang.me>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_080256_622337_2720027D 
X-CRM114-Status: GOOD (  17.82  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jiuyang,

Le 3/28/21 =E0 9:55 PM, Jiuyang Liu a =E9crit=A0:
> This patch implements flush_cache_vmap and flush_cache_vunmap for
> RISC-V, since these functions might modify PTE. Without this patch,
> SFENCE.VMA won't be added to related codes, which might introduce a bug
> in some out-of-order micro-architecture implementations.
> =

> Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
> ---
>   arch/riscv/include/asm/cacheflush.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm=
/cacheflush.h
> index 23ff70350992..4adf25248c43 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -8,6 +8,14 @@
>   =

>   #include <linux/mm.h>
>   =

> +/*
> + * flush_cache_vmap and flush_cache_vunmap might modify PTE, needs SFENC=
E.VMA.

"might modify PTE" is not entirely true I think, this is what happens =

before using this function that might modify PTE, those functions ensure =

those modifications are made visible.

> + * - flush_cache_vmap is invoked after map_kernel_range() has installed =
the page table entries.
> + * - flush_cache_vunmap is invoked before unmap_kernel_range() deletes t=
he page table entries
> + */
> +#define flush_cache_vmap(start, end) flush_tlb_all()
> +#define flush_cache_vunmap(start, end) flush_tlb_all()
> +
>   static inline void local_flush_icache_all(void)
>   {
>   	asm volatile ("fence.i" ::: "memory");
> =


FWIW, you can add:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
