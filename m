Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E64C433E4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 11:54:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE9F520739
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 11:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rSnfn2ia";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY8rGe6E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE9F520739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NkTVxkdhZ0tbrMbQmwBwneXvKDTKrwoCtYBI8ul2dWM=; b=rSnfn2iaokrXsMghRF1FZUj73
	w3rUY9zNo92LJIgy8lHpfWCDW+q6BS86B8unQ6d7IkHUsjLFNIWHCBjjETVHuBifFyQPIehKA4DeS
	iWWbbgYPgWHg8BjEajLT3lFbxspe8i0S/yfPGJEBd0tjLCoH/oF5xqtyW/iox1rKhLHtW+sSBCOFt
	PcEwLO3cbXoueJZ212/jCgmbpLXXBTo3pfOdb+5oLGheGuydffnh5foWDYQKe5oc04X28pt9TvKrj
	LbTvM++46EmVVczGmpOgMEE3SfjmZABPZsnI+Mdjst5kTxYCrpfLGJJFQV/8WhsP6blRG/aDgFE17
	n/0eE0BBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw2Sw-0005tu-Po; Thu, 16 Jul 2020 11:54:18 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw2St-0005tF-Fl
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 11:54:16 +0000
Received: by mail-yb1-xb44.google.com with SMTP id x9so2716950ybd.4
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NaJ0JMrTJYBmtKLAQldY6IvzjG2m4qpjYZEkAKQSgqM=;
 b=HY8rGe6E/1bvzRaeOAhIQFlnYDdoki/hEKRbJXCmnrCTUA88xVwaUpEHEROkmqQKa1
 81B5KORwMDCEWKpqppcfOlgKgxoHDOKND7nsS3p09iy3d01hkA81/TYlPqd6iFLA8Xks
 fwXasf6a2WUuqmsUYhdQwcb+3MBFDu7Sj97TQbsn3APMlTkNKhChBkaNP1itx7QufR07
 YEFNVz9aJtlzPNDxnnsajGnBzL9xhvSNoKnWiRMNAHYu615fcIRxmgrK9rivSr4zcMFe
 +tbAsf94e/cEjm0b8eu+oCD7UdwVGDqh4txY59emU6ZZLlt1V325qVQnJBFbFZKt70GK
 YGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NaJ0JMrTJYBmtKLAQldY6IvzjG2m4qpjYZEkAKQSgqM=;
 b=gD4jbd/UIFeQh2Faof3cJQTp+0hF2oauU7oy71EtlZvpBBTCz5DjNtLRPA2FoL9vMF
 OlxtVs+DIfMC2xy+V3AYJLhSdJFY15UfRKyCaNPXFhP1A28slwrFLUnJG/NcQR52Qgwz
 V3HciWa+RRnlkY8J8P3vZH62sgN/mml673nh7hEM6uyOoNZ63aDFUN9TvdqDJCugHQsP
 bU1Hxxz7aHpBxh52JzBVklmzFLXlrcVr5ezWqtCbe2mtXdmoxIlIpGf6za+0qcI2z435
 bKb/YpN54GakX7eF2ESWZnjFiwxaTJnRwgA+3QmYd2G03Kzk87hf8SPCb7mCuOCGg6+m
 FntA==
X-Gm-Message-State: AOAM531MiDWWHN4Jn+jxUke6uRr3pgMLgueHZq3Xd9MSLSs1Q0lsunY9
 g4Izavd5evz+1hlyrD9L40XJ6344Ceqk0Dknpjw=
X-Google-Smtp-Source: ABdhPJxPLyNS9fybE1aGkB//ZprwoWXRMw2Vz2zlOMnoscqvTRR6LdUXVLw5wQcx8l5jsrf4TiWG2oRkzFT2PWF6pyU=
X-Received: by 2002:a25:2d6f:: with SMTP id s47mr5449999ybe.1.1594900452811;
 Thu, 16 Jul 2020 04:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200716112816.7356-1-will@kernel.org>
In-Reply-To: <20200716112816.7356-1-will@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Thu, 16 Jul 2020 13:54:01 +0200
Message-ID: <CANBLGcxme3=+G3tsd_4ckMFPfaECZ1HzsnKy=LybEhyje_9Wdw@mail.gmail.com>
Subject: Re: [PATCH] asm-generic/mmiowb: Allow mmiowb_set_pending() when
 preemptible()
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_075415_569499_196A86C2 
X-CRM114-Status: GOOD (  27.86  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 16 Jul 2020 at 13:28, Will Deacon <will@kernel.org> wrote:
>
> Although mmiowb() is concerned only with serialising MMIO writes occuring
> in contexts where a spinlock is held, the call to mmiowb_set_pending()
> from the MMIO write accessors can occur in preemptible contexts, such
> as during driver probe() functions where ordering between CPUs is not
> usually a concern, assuming that the task migration path provides the
> necessary ordering guarantees.
>
> Unfortunately, the default implementation of mmiowb_set_pending() is not
> preempt-safe, as it makes use of a a per-cpu variable to track its
> internal state. This has been reported to generate the following splat
> on riscv:
>
>  | BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
>  | caller is regmap_mmio_write32le+0x1c/0x46
>  | CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-hfu+ #1
>  | Call Trace:
>  |  walk_stackframe+0x0/0x7a
>  |  dump_stack+0x6e/0x88
>  |  regmap_mmio_write32le+0x18/0x46
>  |  check_preemption_disabled+0xa4/0xaa
>  |  regmap_mmio_write32le+0x18/0x46
>  |  regmap_mmio_write+0x26/0x44
>  |  regmap_write+0x28/0x48
>  |  sifive_gpio_probe+0xc0/0x1da
>
> Although it's possible to fix the driver in this case, other splats have
> been seen from other drivers, including the infamous 8250 UART, and so
> it's better to address this problem in the mmiowb core itself.
>
> Fix mmiowb_set_pending() by using the raw_cpu_ptr() to get at the mmiowb
> state and then only updating the 'mmiowb_pending' field if we are not
> preemptible (i.e. we have a non-zero nesting count).
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Palmer Dabbelt <palmer@dabbelt.com>

Nice. This fixes the problems I saw both in Qemu and on the HiFive Unleashed.

Btw. I was the one who originally stumbled upon this problem and send
the mail to linux-riscv that Palmer CC'ed you on, so I think this
ought to be
Reported-by: Emil Renner Berthing <kernel@esmil.dk>

In any case you can add
Tested-by: Emil Renner Berthing <kernel@esmil.dk>

> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>
> I can queue this in the arm64 tree as a fix, as I already have some other
> fixes targetting -rc6.
>
>  include/asm-generic/mmiowb.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> index 9439ff037b2d..5698fca3bf56 100644
> --- a/include/asm-generic/mmiowb.h
> +++ b/include/asm-generic/mmiowb.h
> @@ -27,7 +27,7 @@
>  #include <asm/smp.h>
>
>  DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
> -#define __mmiowb_state()       this_cpu_ptr(&__mmiowb_state)
> +#define __mmiowb_state()       raw_cpu_ptr(&__mmiowb_state)
>  #else
>  #define __mmiowb_state()       arch_mmiowb_state()
>  #endif /* arch_mmiowb_state */
> @@ -35,7 +35,9 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
>  static inline void mmiowb_set_pending(void)
>  {
>         struct mmiowb_state *ms = __mmiowb_state();
> -       ms->mmiowb_pending = ms->nesting_count;
> +
> +       if (likely(ms->nesting_count))
> +               ms->mmiowb_pending = ms->nesting_count;
>  }
>
>  static inline void mmiowb_spin_lock(void)
> --
> 2.27.0.389.gc38d7665816-goog
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
