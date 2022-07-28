Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94566C04A68
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jul 2022 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suSKOLvM3DFIR5fcxGBiQA7r/BdZHfIMQmjprdZmcAY=; b=borpN9XrdWg6m7
	d+tpWtTEi737gboxbiFYMymC6rxAZNe0Wt2AsICz71Di30EjQxhWqn0xwHAogGWzeshHG8gPdwF1w
	vY0enHSksFp4z+Jf5pSqMcf4Hd8YLMU23R3ZzW0LP/CYSzuSpcNQZq5Z31SAeGFOhUPsPaunZDaf2
	GKe9nfqODeDV3Y3qdAk9oaQrIUSduLcZyzUBxCrb+2HCNX/ph2TAl1NTC1ZS1xBZZ7AWCS4EVZzK7
	BMCM16ZSHrOAlheY1XVaO7ymD4g2BD/1Zmz7lOFC0zhjdYkIOTrG9+MVSj66HdMLGsLSRIW4Ku/j0
	GUmFRmxuR9mlDEyMX9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyyl-005puT-PD; Thu, 28 Jul 2022 08:34:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyyi-005ps2-Qo
	for linux-riscv@lists.infradead.org; Thu, 28 Jul 2022 08:34:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 31BD9B82304
	for <linux-riscv@lists.infradead.org>; Thu, 28 Jul 2022 08:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E923EC433B5
	for <linux-riscv@lists.infradead.org>; Thu, 28 Jul 2022 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658997281;
	bh=/iqXB4sLqfkAmIly9U+AknKUxpbzNoD0MnbOOsfK7Ng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dbDz0HmiZxzz1gMO5yyblg78yjW4wEKVRxhxoghmSLP47EE3X3/Pijr/JP09X9co3
	 E2cQAD5PA8dltHdwXRJUTxtqJg7lfZJXCo8jrJbR7if7lrZ734rUv8YcRlnzEv5oeN
	 3ksz4Lo44MMa8zKyi1KKOk41nBUnfSEuJmCaRwX+lqDKAH71ULZPPbL0/p0FmNm98H
	 k9bUn9VW2Kh5M9W+M1ldnuMGmnT0lQwBeN7ktNRkPMsMVCkyQv2LnojvjmjkpQ0o9i
	 I2vvLRLujemKCjQr5aVY6xD9aWAzsa3as+oZ4WwmaJoZUX83qPlbS0XLnYbRGCCwLb
	 kDGgy1x7zcZsw==
Received: by mail-lf1-f47.google.com with SMTP id y11so1807776lfs.6
        for <linux-riscv@lists.infradead.org>; Thu, 28 Jul 2022 01:34:41 -0700 (PDT)
X-Gm-Message-State: AJIora8PyjJwUxbW2YePtVcZ/oMPZaDwd0L2LaVIFsf3QSmSfUY3Pd7y
	kpDrFExBqyZuyQMcVqRRNImReFNPvxZozKWOu/U=
X-Google-Smtp-Source: AGRyM1uXUEQAfs9KiWv7b6I8p+YLZZk8OQY2G+P3Cpr48Xxlen88hCbjTlhYSi9lr0dYrkzKEoSCAWeHCCrd9KwYuI4=
X-Received: by 2002:a05:6512:1516:b0:48a:3da4:3411 with SMTP id
 bq22-20020a056512151600b0048a3da43411mr9316179lfb.229.1658997279895; Thu, 28
 Jul 2022 01:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220724122517.1019187-8-guoren@kernel.org> <202207280822.VHS6qieH-lkp@intel.com>
 <CAJF2gTQRV+6CZVkvhtsY19zv6XVbyDeRY-SdLPhkF0akHqvBWA@mail.gmail.com> <CAK8P3a2X3R40S5F2fDzUz+ZoxJLEjO8iaGGk7zBDaiRwJ_oGLg@mail.gmail.com>
In-Reply-To: <CAK8P3a2X3R40S5F2fDzUz+ZoxJLEjO8iaGGk7zBDaiRwJ_oGLg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 28 Jul 2022 16:34:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQDASUaszVL64_D0GeCZ67svko7Grn2zmjmbSqgQoDzXQ@mail.gmail.com>
Message-ID: <CAJF2gTQDASUaszVL64_D0GeCZ67svko7Grn2zmjmbSqgQoDzXQ@mail.gmail.com>
Subject: Re: [PATCH V8 07/10] riscv: Add qspinlock support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Christoph Hellwig <hch@infradead.org>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Muellner <cmuellner@linux.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, 
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>, Niklas Schnelle <schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_013445_180705_C2BD5887 
X-CRM114-Status: GOOD (  27.54  )
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

On Thu, Jul 28, 2022 at 4:14 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jul 28, 2022 at 5:35 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Palmer,
> >
> > The warning is from a clang problem.
> >
> > drivers/net/wireguard/queueing.c:
> > static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct
> > sk_buff *skb)
> > {
> >         WRITE_ONCE(NEXT(skb), NULL);
> >         WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
> > }
> >
> > The queue->head is 64bit pointer size.
> >
> > #define __xchg_relaxed(ptr, new, size)                                  \
> > ({                                                                      \
> >         __typeof__(ptr) __ptr = (ptr);                                  \
> >         __typeof__(new) __new = (new);                                  \
> >         __typeof__(*(ptr)) __ret;                                       \
> >         switch (size) {                                                 \
> >         case 2: {                                                       \
> > ... Clang shouldn't give warning from here, because code won't enter the path.
> >                 break;                                                  \
> >         }                                                               \
> >         case 4:                                                         \
> > ...
> >                 break;                                                  \
> >         case 8:                                                         \
> > ... The case would enter this path.
> >                 break;                                                  \
> >         default:                                                        \
> >                 BUILD_BUG();                                            \
> >         }                                                               \
> >         __ret;                                                          \
> > })
>
> I assume it's this warning you are referring to?
>
> >> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
>            WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
>
> I don't consider this a bug in clang, it just performs the normal type checking
> before dead code elimination and complains about code that clearly violates
> the type rules.
>
> I would suggest you split out the 16-bit xchg() into a properly typed inline
> function and add type casts when calling it.
Okay, I would try that style.

> In fact, I would love to
> completely eliminate the 8-bit and 16-bit cases from the regular xchg()
> and cmpxchg() interface and require all callers to explicitly call the
> xchg16()/cmpxchg16() instead, as we require for cmpxchg64() on 32-bit
> architectures already. This is something to do for another time though.
>
> > >    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >            val = __raw_readb(PCI_IOBASE + addr);
> > >                              ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >            val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>
> Not your bug, but I see that CONFIG_MMU=n risc-v has the same bug that s390 has
> with missing I/O space support.  The correct workaround for this is to mark all
> drivers using PCI I/O space as 'depends on HAS_IO_PORT' or similar and then
> leaving out the definitions from the asm-generic header. Niklas Schnelle has
> spent a lot of time working on patches for this, but they are somewhat stuck
> in review. If RISC-V has the same problem, I hope we can get more people
> interested in it. I think OpenRISC and C-Sky have this as well, but I'm not
> sure if there is any plan to upstream clang support for those.
C-SKY hasn't any plan to support clang, as I know.

>
>         Arnd



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
