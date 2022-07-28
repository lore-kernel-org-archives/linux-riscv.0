Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AB1C04A68
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jul 2022 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wEzbMSOy9qq5t+0nxXPPLEMhbvSvfpjOiY6LP9jcig=; b=WZ8CvlMdMkGjg9
	grWJFQiY8jCmJiTO0uxYHPnqw8Nwp6m+6RWBffc4kq4NdlvXAvEdht92Rt+ufH/fDpJhCZpR7m1tb
	SjuuI91Z96/tq0NnQWbLfEpPyL/xYAwLRIebxWFkDSvEsDeA0MQWjZ++xxqsK0MEBbGykh8YFbRz6
	44VMEu3I1sMdmdi/HvDaIrDOIRDYDOw6kzQh4CNkh08h26eRFOAl3yO9OgMSZrtgeztv0n9QB88fM
	g6CHNTEv+z7Z0ss+z4mzLweVjMcgbeZD7G4IUnF5lQdWfvLTppwcmPROeMxga3ntFh/espi+aiGOW
	22A3EKzRJ1kDLedYq8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyfL-005gVG-PO; Thu, 28 Jul 2022 08:14:43 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyfI-005gRk-DE
	for linux-riscv@lists.infradead.org; Thu, 28 Jul 2022 08:14:42 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MA7Om-1o9sB90uU6-00BZnI for <linux-riscv@lists.infradead.org>; Thu, 28
 Jul 2022 10:14:33 +0200
Received: by mail-ej1-f43.google.com with SMTP id ez10so1800380ejc.13
        for <linux-riscv@lists.infradead.org>; Thu, 28 Jul 2022 01:14:28 -0700 (PDT)
X-Gm-Message-State: AJIora/Bs4xH5S6lK3xH7jXYZDNSO6lHufCXJfQPezXv/sPYhlNXaFVp
	x6emhUPIKA2+Xble6e2r7Qd2Zw994+05YAq4WwQ=
X-Google-Smtp-Source: AGRyM1uZnW6rr1bCPNxIQUdrp0kM6xPGCPcbhZeXfyDuLh9ISG16R0mxcxin51/wlw+v1h4OcmNKLuYUaimGsuAUJj0=
X-Received: by 2002:a17:907:75d3:b0:72b:48de:e540 with SMTP id
 jl19-20020a17090775d300b0072b48dee540mr21044634ejc.547.1658996068658; Thu, 28
 Jul 2022 01:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220724122517.1019187-8-guoren@kernel.org> <202207280822.VHS6qieH-lkp@intel.com>
 <CAJF2gTQRV+6CZVkvhtsY19zv6XVbyDeRY-SdLPhkF0akHqvBWA@mail.gmail.com>
In-Reply-To: <CAJF2gTQRV+6CZVkvhtsY19zv6XVbyDeRY-SdLPhkF0akHqvBWA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Jul 2022 10:14:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2X3R40S5F2fDzUz+ZoxJLEjO8iaGGk7zBDaiRwJ_oGLg@mail.gmail.com>
Message-ID: <CAK8P3a2X3R40S5F2fDzUz+ZoxJLEjO8iaGGk7zBDaiRwJ_oGLg@mail.gmail.com>
Subject: Re: [PATCH V8 07/10] riscv: Add qspinlock support
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Muellner <cmuellner@linux.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, 
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>, Niklas Schnelle <schnelle@linux.ibm.com>
X-Provags-ID: V03:K1:7lNKLThPXKfgtZzCcV9fVQeLHSUEG7raIz1cNrwJ1HaJl2lAZS0
 TiVlOmYyOPZnql/ngzlbRza+HreXkpWo3/hLuRetK0AD8u6BNkixJUwwUkVgP6Itu0u7NkQ
 uZdbe8lcv6deJhD8xVPwEa1n8s4B7ThokpKPr/+G+rSXljZngAkscnGHeLfb8HXVbhAE7DY
 xpgiDrIbLF9BBuXJ3BJnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m9S+vPv6q7E=:e8BpMSFBbpQCyKPp1EORmW
 Seg0CrhDBHGGMwD9DC/nHkufm6AQEtKtL/ZraAIcvsdPlaSlRqqCQs2ZNObpyioCVzYHrETHn
 jCcZBXF9MrA0m95/iL9yHWBHahDWJdzUYTPC3XdH/9Y1eoHCTvF2s5uzfp0Y1moZ+QiWh5rHk
 N+IgdDseiD6LpaFzBfgyvutDDc1WU0Fq+1QsSJzEF+1420hWbRBs9N/xbMQrAU+zj0BcxKl9a
 PbuUQhdyAkxOYELyYIvpGZux2P3wD91MLJiXMOcyHSdAAF16hggRyU8DiEa8DlmxxFsoOYykR
 1QNp1iMvKlIZ+km33/+E8gpGrbRWO0iJJqRYCRCzU9atRrAO0BJ56hWlY+yT17nEK5WCjVT2b
 UmJa7FX3Qg8PQbbRSXH2kt8fXUMgEMaps3sv7BCtWtdUXjXCJOSJVh2168f8H+SONiBAr6FRS
 xBX7H8VgdMYqwNgsezFWfDXnUb5e36bl8KyifHAJODn6HTlgXB4XCU5XQKK0UCO3t9q7DHQmG
 LbWoOLD9HVR0SZj/fbMXS1DZfxA+cx8VJMU4grUso1+WQx4u/SDvmwuGKBypYLT1kroKz53au
 zZt0LN6ra+exHA4C7hJQNMrUaMPae6tKOX8LszcgrcnNyxBoaeij5IINojlYLBLN39y11M2DW
 Xa/JPJd8Fr51cwuukvaUgtaxfgt+GgLB5L/j7a+QlIVMNwt6niEJ9IHMARNWU6IYA8EJEN1RH
 Zoda0pDngVUeVbpf4k4e8fd35LGxaRP/ClZKiA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_011440_779846_F0C9422F 
X-CRM114-Status: GOOD (  19.20  )
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

On Thu, Jul 28, 2022 at 5:35 AM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Palmer,
>
> The warning is from a clang problem.
>
> drivers/net/wireguard/queueing.c:
> static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct
> sk_buff *skb)
> {
>         WRITE_ONCE(NEXT(skb), NULL);
>         WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
> }
>
> The queue->head is 64bit pointer size.
>
> #define __xchg_relaxed(ptr, new, size)                                  \
> ({                                                                      \
>         __typeof__(ptr) __ptr = (ptr);                                  \
>         __typeof__(new) __new = (new);                                  \
>         __typeof__(*(ptr)) __ret;                                       \
>         switch (size) {                                                 \
>         case 2: {                                                       \
> ... Clang shouldn't give warning from here, because code won't enter the path.
>                 break;                                                  \
>         }                                                               \
>         case 4:                                                         \
> ...
>                 break;                                                  \
>         case 8:                                                         \
> ... The case would enter this path.
>                 break;                                                  \
>         default:                                                        \
>                 BUILD_BUG();                                            \
>         }                                                               \
>         __ret;                                                          \
> })

I assume it's this warning you are referring to?

>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);

I don't consider this a bug in clang, it just performs the normal type checking
before dead code elimination and complains about code that clearly violates
the type rules.

I would suggest you split out the 16-bit xchg() into a properly typed inline
function and add type casts when calling it. In fact, I would love to
completely eliminate the 8-bit and 16-bit cases from the regular xchg()
and cmpxchg() interface and require all callers to explicitly call the
xchg16()/cmpxchg16() instead, as we require for cmpxchg64() on 32-bit
architectures already. This is something to do for another time though.

> >    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >            val = __raw_readb(PCI_IOBASE + addr);
> >                              ~~~~~~~~~~ ^
> >    include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >            val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));

Not your bug, but I see that CONFIG_MMU=n risc-v has the same bug that s390 has
with missing I/O space support.  The correct workaround for this is to mark all
drivers using PCI I/O space as 'depends on HAS_IO_PORT' or similar and then
leaving out the definitions from the asm-generic header. Niklas Schnelle has
spent a lot of time working on patches for this, but they are somewhat stuck
in review. If RISC-V has the same problem, I hope we can get more people
interested in it. I think OpenRISC and C-Sky have this as well, but I'm not
sure if there is any plan to upstream clang support for those.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
