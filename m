Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEA1F44869
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 13:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZxDCPRz902G1CytGxBbriIzYm6pESopPtye7wShwX8=; b=g3fZSenMClGtiN
	gmf1x7TkRwK40OqhkUIUuIdLsTEUMomNul1jF4J6Iuox/QWZyF1KvLcSxbTQJ3fi1UCmxuX1sorC3
	+29CyIKFmu92hTxeVvNP2PXQnoxuZkx7BWQEwto7bLk74TvqtCXt6lW0chYroYL5uvTq87rM5SR7N
	fYcgXv4r5se5X+yAmOXaqGp9PeJwqHMAST5A28Do8B/F6Ol9LCVVwJhcpUmrn5QKGEzFpdfFcXHgX
	cuLhUyW557Z+Drch3da5rzdkn4w8gqyp5ZKd6WYJ/Jcz7m4CKvdiwz72HL4MbPLOODgJhwZalKfYG
	8PU2p31K45gdeKzMvs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC5j-0000000CKU7-1wnC;
	Fri, 10 Apr 2026 13:40:11 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC5g-0000000CKTK-49v8
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 13:40:10 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-128e4d0cc48so9423216c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 06:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775828407; cv=none;
        d=google.com; s=arc-20240605;
        b=liSyOQFSu53h0zYxMWXl62oNJ3UIT7ZseN5GkyIZSkkevnUUB+yklpZ9Gb1xsw3v+j
         usulQL8ZcUkc6qXvRGcb57wnOb/9IrIMZ8Olv/ifMZs/k0vC+t+nkdzf0trDc2dorSiO
         9UJbedKzla3/XKCS3JhvZspGUpwNMJnkesbRi50AEE58T8rfqtWWdl76Qe7I3IP1dcdM
         tKIj6y14NyXBlM8s6Eej3AXDcw9pydzvw+d17mD2br969bRmpI/PP2iM5MXPEnYgR5NV
         BDIG958LCoyIlmFpeeknjkG4nqhIng9AJTbLxkhHxlaD/KEzi/uMaouF2xJ83xKToiUh
         /EiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        fh=JjFpr/8NuNvL3Kl1t6eVFZU2Jt01rFOJiPX5v8TU3Qk=;
        b=Nx2pa9feS4OuT3+LKROFFDs+MBzmeI12Mw3rC+0DsYyS2u3i7lxddrTo3sLeA/2bRm
         CGLU4YayYB7+n/JWFWdVJG5K0Ak6Ud7iJaoSZzpToooCWYvDBes7hC3IwPCsma3g38T4
         lv4DY12ittzsc6ztlDLXQ0kZhspINuZ7b2v4mnt1HCH4XFSLS4N99JNG5F1f1dm8Kp0x
         nNcyTRyUaKAErjCgHHZsCBsaJvUKZUHRWm8x3h9Lh47902SruwuGa/zgiOTduD6rfYTU
         WADtoOP3yZpZZEbXkaxr+ukbaM9x+jPrEMlGnl1sLn1YO4gww3QDifISjIsO4vAwkiLR
         e+Yg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775828407; x=1776433207; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=LQs46EfBKyQi8bjGZc/shWUpNuXhL01LJmtMpaqVSG56suvV4q+KJrg7qRuE5AR7UG
         2ys/oNN93wyjpCRaSIrjyvIMI7dCIVyGXhVM5pxkpvifXkp9F6I688F51y176v3rLLJv
         dn9SmUZWI/roG3YrOoQHq53/9otBw9DHsFj9x3FtwzxpK0+LjnazmO2LKHnFke7ZeO78
         N6HSR7RV1O8R4EpB34BpDO6ZOUDIBHkP0pxIEDNQdFQ+0M84oEva8D1WESVNTtZvdDQN
         PTvcaDriST+M1T1f64yv9TebkinyHY1zQ8k8MVSwX408DDDXzkz9ozD28zlDGfQB1wO+
         yY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828407; x=1776433207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=Rr/GwBF1vP0Kj/PFvyY4uzsMcIfq86lRmYRLmhol8D+ZsISqFMj1Hbf+8PH9jQTZ8Y
         ItWbDcysXAr6z8z7VXRCqQQktZHw0aALJ2OrHT31VUwebvHMviZ81koKWC0hlv8njFp4
         bMCl9dJTrcRk28DDicZ6K5BMhvmj4nCythwjyT2zr/UFUkGEjfDdfc/JOgOfXuoFYebH
         /FouEAJIoZDWBjaxch+6MnZIzjZaTNo7hCkcxNvWK7E3xQTe4StKkTLvNmRNfWV611NZ
         BSj5V8xQHq/HHEHozx4wzkiXNzafYUCVOw9CeOJzh8sXddyHXrRDPJVgx+ytw2ncfbtQ
         GarQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpWkInzj/i7oevWfHUXUEAIe62Xam+NynJnsGKapamjaJxzM9qsiXTXjLW+aauKZK3/tYGPHS3tr3GHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg2WUp1tW5fG/NeRVDkjthoFK6qfXfMp6V8vp5/U3ztNt4RLoC
	dgFSqfxCmOxGuKYrzmScKIw1DBwuyBrZvASaG2Mr2iJeOihYG9xb0Je0fPiDsqVDhH4E6BaOEk3
	m37cctmPVNchvxOLQsPKx/87i1Zw3kDyH+NudXtBT
X-Gm-Gg: AeBDieuhFx2sgIDrHVGWyXpD3omLWMZRhazxuhbhgldHz0MYZh3LeVLOEIsZMQ5IXTB
	+ZRkcd3LZGoc7tGjs31vd+HeGMmlLxwryXGkP1EskVva1PuCJL7F7xT2B9oMhDrSpeC3ezNjjya
	wsU78hR4CiSM4Mg+I7gbq2OUdXjCY1ox8UYFy/jAHdrlJqZ6Ie8i1Vmhz75sVjFEQNii2coXPzi
	OKKuotrro0+7Wd6/9X8ACRbOyNV43o7jL971jSbHYaPSVoESw52zjxfBhPbNxYT9qi6YPYbBgQd
	YDKZJi5qNszzcsn79swCfuHfdBbCmKKlCNu4KrtPsGqiI6bT
X-Received: by 2002:a05:7022:fa04:b0:12c:2ed4:62fa with SMTP id
 a92af1059eb24-12c34ef907emr1882312c88.32.1775828406651; Fri, 10 Apr 2026
 06:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.862164111@kernel.org>
In-Reply-To: <20260410120318.862164111@kernel.org>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Apr 2026 15:39:30 +0200
X-Gm-Features: AQROBzBE-9UxDQG5mMJLgipEeL_Y5pwE-Y_PUrJGxDBLilqBu51b8lLzxdip708
Message-ID: <CANpmjNO1vsO1LT6xijhz3nsjQa+_A=9omfgOSz=aGn293-LqTg@mail.gmail.com>
Subject: Re: [patch 19/38] kcsan: Replace get_cycles() usage
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev@googlegroups.com, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_064009_038467_43CE8A3D 
X-CRM114-Status: GOOD (  20.76  )
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

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
>
> KCSAN uses get_cycles() for two purposes:
>
>   1) Seeding the random state with get_cycles() is a historical leftover.
>
>   2) The microbenchmark uses get_cycles(), which provides an unit less
>      counter value and is not guaranteed to be functional on all
>      systems/platforms.
>
> Use random_get_entropy() for seeding the random state and ktime_get() which
> is universaly functional and provides at least a comprehensible unit.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: kasan-dev@googlegroups.com

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  kernel/kcsan/core.c    |    2 +-
>  kernel/kcsan/debugfs.c |    8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -798,7 +798,7 @@ void __init kcsan_init(void)
>         BUG_ON(!in_task());
>
>         for_each_possible_cpu(cpu)
> -               per_cpu(kcsan_rand_state, cpu) = (u32)get_cycles();
> +               per_cpu(kcsan_rand_state, cpu) = (u32)random_get_entropy();
>
>         /*
>          * We are in the init task, and no other tasks should be running;
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -58,7 +58,7 @@ static noinline void microbenchmark(unsi
>  {
>         const struct kcsan_ctx ctx_save = current->kcsan_ctx;
>         const bool was_enabled = READ_ONCE(kcsan_enabled);
> -       u64 cycles;
> +       ktime_t nsecs;
>
>         /* We may have been called from an atomic region; reset context. */
>         memset(&current->kcsan_ctx, 0, sizeof(current->kcsan_ctx));
> @@ -70,16 +70,16 @@ static noinline void microbenchmark(unsi
>
>         pr_info("%s begin | iters: %lu\n", __func__, iters);
>
> -       cycles = get_cycles();
> +       nsecs = ktime_get();
>         while (iters--) {
>                 unsigned long addr = iters & ((PAGE_SIZE << 8) - 1);
>                 int type = !(iters & 0x7f) ? KCSAN_ACCESS_ATOMIC :
>                                 (!(iters & 0xf) ? KCSAN_ACCESS_WRITE : 0);
>                 __kcsan_check_access((void *)addr, sizeof(long), type);
>         }
> -       cycles = get_cycles() - cycles;
> +       nsecs = ktime_get() - nsecs;
>
> -       pr_info("%s end   | cycles: %llu\n", __func__, cycles);
> +       pr_info("%s end   | nsecs: %llu\n", __func__, nsecs);
>
>         WRITE_ONCE(kcsan_enabled, was_enabled);
>         /* restore context */
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
