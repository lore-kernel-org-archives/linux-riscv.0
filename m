Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995A0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATJ4PJdJGJlieUPbI9/MlUlHiu08e9ivFKuvyHsGQQw=; b=N+FAQlvtWBpTt5
	XYZIOCjOktiPNB7NBxxqWXM+Ty1mnKtwopU6tAcRqElBgGe4sp6QOWodQkG58oWGzHMtD90KohDzL
	21ddA6IX2GVO/329WrDiEKdWMIofh0sWJzmYj8kg7Um+rXJmneAxYNMWpdCf9t4c4CfJjrqBIkB6P
	2gHpvHbRbl5EDxHm9ffYyqgManExBCxP4itt4Zw1dlNHc04QUWzqbdstkvUzHGl+XV2C3sQXnoyLJ
	fmm3w2VMmOJUTt+sRTWHQ1ug0Poq8WPayqv2c3UFyccmHtkS8Lq+ad7EjUu/qY/qpbDgjwqbkpcrx
	22t9NJVlP1H6XNtNbaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IHg-00E6UX-MP; Thu, 23 Jun 2022 08:33:52 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IHd-00E6SZ-O9
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 08:33:51 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MOzfO-1oIgPE22gu-00PL3Z for <linux-riscv@lists.infradead.org>; Thu, 23
 Jun 2022 10:33:44 +0200
Received: by mail-yb1-f176.google.com with SMTP id r3so34594577ybr.6
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 01:33:44 -0700 (PDT)
X-Gm-Message-State: AJIora8B7ycqVGlfpqbUsy3Kz3BtLu+4Zbts2cIcFX2KxyxxOCcogL2E
	G9TH9HdaVOmwi/epQY/MwuSx467tRoYhNT4uN5o=
X-Google-Smtp-Source: AGRyM1vpjNUL/cDQCAr6IDE7zemhTcO8DLjRIsD3hMydd57CzdT1bmHPuTtCl+as80/GyaFbtaHiOikuetXsjsJdvX4=
X-Received: by 2002:a25:d792:0:b0:669:2e6e:208e with SMTP id
 o140-20020a25d792000000b006692e6e208emr8179490ybg.452.1655973223374; Thu, 23
 Jun 2022 01:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220621144920.2945595-1-guoren@kernel.org> <20220621144920.2945595-2-guoren@kernel.org>
In-Reply-To: <20220621144920.2945595-2-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jun 2022 10:33:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2rnz9mQqhN6-e0CGUUv9rntRELFdxt_weiD7FxH7fkfQ@mail.gmail.com>
Message-ID: <CAK8P3a2rnz9mQqhN6-e0CGUUv9rntRELFdxt_weiD7FxH7fkfQ@mail.gmail.com>
Subject: Re: [PATCH V6 1/2] asm-generic: spinlock: Move qspinlock &
 ticket-lock into generic spinlock.h
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, Rui Wang <r@hev.cc>, 
	Stafford Horne <shorne@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:7JoU4jONnUBSc5pFFK/MhvCRgDeYEW7r6D+XfasVai4bJBJhwFi
 H0X41lzoFkWbttJWajXdhMF84epmIuKkH18+BZ3xGyh9k+iTDH6fCgpW0Esh4njC5Yt/TX0
 OJhOyCRtqH5k4VzxL/PWnXuV1b/ufv8/n4JPE1pVc3EWTP75KzsgWl1Z+ey/bAj1HoQbqLi
 A1V6c9b3atIwMj9mDkICQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yqjSSLBKIJA=:pLVFf7mLdwl3ag/p/YHU5d
 DEIGKoDa3nNdvcl0VoXqut8Q+ysTeAeV8HSZXUUM9NkQG6GNfDoX7t4B3UM5RkSk47yjSquhJ
 r1rtGmplC8fsqYELC2GbuxAAhVrf1BnvNbSTC66+VCwnrihiJfBrJBU+ZGHvucQvd1VC7JmYW
 mEvjIJuqNTfPvL22THXpmp0hB5mf/hjUgMdq6lLMQhpJ4l7ccdGvTcwqGHwS2K7ENnBgmGTMp
 tS7kZ2FF0BdOQhty/4Mdq+5Z+1Rh/1Axc5EQcLWEuqQdNIJvpyWBau5KFX+gNI6FkEGb5vEa8
 U6KzMnXFnIBVENlWS9Q4+AFmIvZ/X948kHsX23L1uh2U03DLx+A+0nca61xh/GAzt8VT3dyht
 b2+4GzoGmA03OEhSEH8OJ/XDyf54qW6q06B4HsF4Fj7rIgwAxOfHj1XUKsPe6MQaAXd6NJHf/
 iLzd6pJJVRZSfGY6XiagHeNjWAVKPnxkPEcg5+OcR5nJy8E4u1QiUTr/1ZpWYc/Qr2NNQKMHK
 4PB/mxvzGUnYYJvQpscYHbbtEAM2wATBSAXzGYmBK6HXi+QOcXbaOLm2l7SogF6Z/x3Sp13ES
 2LAXhG4SPYwN+4Xr1NYdRvGcVmPLh7qKtQIHR05v2x97TEolTmwPp+JPggE+3dUz62S7dmMty
 c1R0MkfzzeRObCX+1BbGj+9zd96+xlUW89bb8snkz74W1HeD0fIDaFopuwqKkWSol3Jlf1xep
 JkFlIGnoDgJJAvwDOEfrxhZYfU38jDUrFnW8Su7RVd9Fxj+GxfqMEArZ94FUCODcHOxXiQkxk
 XheIxTVJuBXVLBeWwu7hbxxPXGJyYjCB5kwZGfqMnjIZHHY4MA7QKB9sf2EaxFU45mcn4O7Nh
 w/9Tsq2MITzC1Q2FQsKg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_013350_128827_FA0B5618 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue, Jun 21, 2022 at 4:49 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Separate ticket-lock into tspinlock.h and let generic spinlock support
> qspinlock or ticket-lock selected by CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> config.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/asm-generic/spinlock.h        | 90 ++------------------------
>  include/asm-generic/spinlock_types.h  | 14 ++--
>  include/asm-generic/tspinlock.h       | 92 +++++++++++++++++++++++++++
>  include/asm-generic/tspinlock_types.h | 17 +++++

Unless someone has a very good argument for the "tspinlock" name, I would
prefer naming the new file ticket_spinlock.h. While the 'qspinlock' name has
an established meaning already, this is not the case for 'tspinlock', and
the longer name would be less confusing in my opinion.

> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +#include <asm/qspinlock.h>
>  #include <asm/qrwlock.h>
> +#else
> +#include <asm-generic/tspinlock.h>
> +#endif

As Huacai Chen suggested in the other thread, the asm/qrwlock.h include should
be outside of the #ifdef here.

> diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
> index 8962bb730945..9875c1d058b3 100644
> --- a/include/asm-generic/spinlock_types.h
> +++ b/include/asm-generic/spinlock_types.h
> @@ -3,15 +3,11 @@
>  #ifndef __ASM_GENERIC_SPINLOCK_TYPES_H
>  #define __ASM_GENERIC_SPINLOCK_TYPES_H
>
> -#include <linux/types.h>
> -typedef atomic_t arch_spinlock_t;
> -
> -/*
> - * qrwlock_types depends on arch_spinlock_t, so we must typedef that before the
> - * include.
> - */
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +#include <asm-generic/qspinlock_types.h>
>  #include <asm/qrwlock_types.h>
> -
> -#define __ARCH_SPIN_LOCK_UNLOCKED      ATOMIC_INIT(0)
> +#else
> +#include <asm-generic/tspinlock_types.h>
> +#endif

I don't think this file warrants the extra indirection, since both
versions have only a
few lines. Just put it all into one file, and change the files that include
asm-generic/qspinlock_types.h to use asm-generic/spinlock_types.h instead.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
