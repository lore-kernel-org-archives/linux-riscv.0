Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1CEC4727E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 07:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F0C7207EA
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 07:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8mFpCm5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="iir5vgHB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F0C7207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Y7sEF8SFzVq4TOZkOtRUmapvYgCoCAppUWbhXJ9Y+k=; b=f8mFpCm5H779cLak2SSRI+Ekm
	buMIrzw4gGTPBWxRJUudL/CqwDbV5/dlHrCnRPHQGfPjc3yK+Yk98Iz5sRK0X/wfAbqVT0BBDmVZ2
	9ZHgxqjEKYmsZT3au08Su5Lp45jlDlIsaBnO1y0YSNulUPrvkQrBeMVqx3vZ6bOviCDj2TAnxVn+8
	gyFyVFT4AA+AZXnAXQYpiZAgwmwLEoVvh28vOPf+H0B9KREI6tNHA6wdix68z4FlfUORAGqhCxtqy
	CEKyLGeZBBz7yyFnNWyn3HNsmJChLqjtHWLEF9R7aiT0jCIZEx+xigAhyvuOmj29H0uAxBmqhtL0m
	dH5bV2f4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ3ci-0002Vu-Et; Wed, 07 Oct 2020 07:12:28 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ3cf-0002VK-Rq
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 07:12:27 +0000
Received: by mail-io1-xd42.google.com with SMTP id m17so1324904ioo.1
 for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2020 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xi1LOdmOzzyOAIKt3+WaGpmoC5ZmXljmCt0LFHCFgaM=;
 b=iir5vgHBnKXs28pVgyqldJhxhdomtTqo+WB8iDs8gjJs65pBHUdQR6CGFP0a2xfojv
 j7O2CRbJhEZQ1I3PPMfeioiqpzYidrNmvusEDw15sfZ/qAy7qXUitFyYuvJLhwFbyPgo
 EeXqHyAJwOLntMCCVIELliL/YYEOHiwGYbCsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xi1LOdmOzzyOAIKt3+WaGpmoC5ZmXljmCt0LFHCFgaM=;
 b=Ger2gFTNupebqrJ/G3XIDyhNktTDRPaCk1cPRzi94pOr2Nh0gRbhCMAk45cnDgbMTo
 HwVH4XZ9fLrOE2N2P0NmP8hwcct59YpCw6Z161g6qQKP4Ef+htY+KybPA8N/aHatpZG+
 O3LRJMyqIoizj80c+WXXsjWd4qBPKaluDp4reRC66wBLTl8x88mlbt0uaNaslVkcdFb1
 UJYfam0NZRwalvPKuq6HmTXHkmyZCUM8tBf8RIUYsoXi0jsyoDcc34FoF8WnPBWTVN+O
 VivFg3MhQfoYOoffvZoIcw2enWm9zfKMPZT3ZC9dtwXg7hLuBTFrkyf0fBh0lqnwWnmq
 SlCA==
X-Gm-Message-State: AOAM533j0d+XS6v+9iElv/pkl3+kgKDPzhQHyDlEYCJ9qYdYlk3Zr/bG
 gkWjUqBk6TGQfnmglx0BCXn6osK3+QpenSSsLVDg
X-Google-Smtp-Source: ABdhPJz2TmwP3z4c7sr6ej/YTwPX+d9QyUpD3prBxDMpPWTVe9zH7d8FxWe+L5MdzSFijnn/zVngkOlGs0Ids0u4dKs=
X-Received: by 2002:a5d:84c6:: with SMTP id z6mr1345226ior.0.1602054743520;
 Wed, 07 Oct 2020 00:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <1602002973-92934-1-git-send-email-guoren@kernel.org>
 <mhng-405fa3f3-74ce-4a03-958e-d0a6c42de3f6@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-405fa3f3-74ce-4a03-958e-d0a6c42de3f6@palmerdabbelt-glaptop1>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Oct 2020 00:12:10 -0700
Message-ID: <CAOnJCU+H3NX8mTVcsy46JSi8GcihyY1uQ0KKfsMYwzQ+NcEkUA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup bootup failure with HARDENED_USERCOPY
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_031225_951311_D88E7E99 
X-CRM114-Status: GOOD (  32.87  )
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
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 6, 2020 at 9:12 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Tue, 06 Oct 2020 09:49:33 PDT (-0700), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > As Aurelien has reported:
> >
> > [    3.484586] AppArmor: AppArmor sha1 policy hashing enabled
> > [    4.749835] Freeing unused kernel memory: 492K
> > [    4.752017] Run /init as init process
> > [    4.753571] usercopy: Kernel memory overwrite attempt detected to kernel text (offset 507879, size 11)!
> > [    4.754838] ------------[ cut here ]------------
> > [    4.755651] kernel BUG at mm/usercopy.c:99!
> > [    4.756445] Kernel BUG [#1]
> > [    4.756815] Modules linked in:
> > [    4.757542] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.8.0-1-riscv64 #1 Debian 5.8.7-1
> > [    4.758372] epc: ffffffe0003b5120 ra : ffffffe0003b5120 sp : ffffffe07f783ca0
> > [    4.758960]  gp : ffffffe000cc7230 tp : ffffffe07f77cec0 t0 : ffffffe000cdafc0
> > [    4.759772]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffe07f783cf0
> > [    4.760534]  s1 : ffffffe00095d780 a0 : 000000000000005b a1 : 0000000000000020
> > [    4.761309]  a2 : 0000000000000005 a3 : 0000000000000000 a4 : ffffffe000c1f340
> > [    4.761848]  a5 : ffffffe000c1f340 a6 : 0000000000000000 a7 : 0000000000000087
> > [    4.762684]  s2 : ffffffe000941848 s3 : 000000000007bfe7 s4 : 000000000000000b
> > [    4.763500]  s5 : 0000000000000000 s6 : ffffffe00091cc00 s7 : fffffffffffff000
> > [    4.764376]  s8 : 0000003ffffff000 s9 : ffffffe0769f3200 s10: 000000000000000b
> > [    4.765208]  s11: ffffffe07d548c40 t3 : 0000000000000000 t4 : 000000000001dcd0
> > [    4.766059]  t5 : ffffffe000cc8510 t6 : ffffffe000cd64aa
> > [    4.766712] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
> > [    4.768308] ---[ end trace 1f8e733e834d4c3e ]---
> > [    4.769129] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> > [    4.770070] SMP: stopping secondary CPUs
> > [    4.771110] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> >
> > Above failure is relate to commit: a0fa4027dc911 (riscv: Fixup
>
> That commit isn't in Linus' tree (at least, as far as I see it).  I have
> 6184358da000 ("riscv: Fixup static_obj() fail"), so I'm going to fix that -- in
> fact, I'm going to essentially just replace most of this rationale with what I
> wrote up in my revert as this is all a bit too long for a commit message.
>
> I was kind of worried the initdata move was a bit too risky, but after reading
> the users of __init_{begin,end} I think it's safe.  Here's what I ended up with
> on fixes.
>
> Thanks!
>
> commit 84814460eef9af0fb56a4698341c9cb7996a6312 (HEAD -> fixes, riscv/fixes)
> gpg: Signature made Tue 06 Oct 2020 09:11:35 PM PDT
> gpg:                using RSA key 2B3C3747446843B24A943A7A2E1319F35FBB1889
> gpg:                issuer "palmer@dabbelt.com"
> gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
> gpg:                 aka "Palmer Dabbelt <palmerdabbelt@google.com>" [ultimate]
> Author: Guo Ren <guoren@linux.alibaba.com>
> Date:   Tue Oct 6 16:49:33 2020 +0000
>
>     riscv: Fixup bootup failure with HARDENED_USERCOPY
>
>     6184358da000 ("riscv: Fixup static_obj() fail") attempted to elide a lockdep
>     failure by rearranging our kernel image to place all initdata within [_stext,
>     _end], thus triggering lockdep to treat these as static objects.  These objects
>     are released and eventually reallocated, causing check_kernel_text_object() to
>     trigger a BUG().
>
>     This backs out the change to make [_stext, _end] all-encompassing, instead just
>     moving initdata.  This results in initdata being outside of [__init_begin,
>     __init_end], which means initdata can't be freed.
>

But we are not moving all initdata out of __init_begin/end. Should we
move all the _initdata section out of _init_begin ?
http://lists.infradead.org/pipermail/linux-riscv/2020-October/002400.html

>     Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
>     Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>     Reported-by: Aurelien Jarno <aurelien@aurel32.net>
>     Tested-by: Aurelien Jarno <aurelien@aurel32.net>
>     [Palmer: Clean up commit text]
>     Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> > static_obj() fail). When we expand static_obj include INIT_DATA,
> > we also include INIT_TEXT into usercopy check kernel text:
> >
> > /* Is this address range in the kernel text area? */
> > static inline void check_kernel_text_object(const unsigned long ptr,
> >                                             unsigned long n, bool to_user)
> > {
> >         unsigned long textlow = (unsigned long)_stext;
> >         unsigned long texthigh = (unsigned long)_etext;
> >         unsigned long textlow_linear, texthigh_linear;
> >
> >         if (overlaps(ptr, n, textlow, texthigh))
> >                 usercopy_abort("kernel text", NULL, to_user, ptr - textlow, n);
> >
> > When INIT_TEXT/DATA are freed, new allocation will reuse these
> > memory and overlaps check will be triggered.
> >
> > The patch met static_obj and check_kernel_text_object requirements.
> >
> > Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> > Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Atish Patra <atishp@atishpatra.org>
> > Cc: Andreas Schwab <schwab@linux-m68k.org>
> > ---
> >  arch/riscv/kernel/vmlinux.lds.S | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > index f3586e3..34d00d9 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -22,13 +22,11 @@ SECTIONS
> >       /* Beginning of code and text segment */
> >       . = LOAD_OFFSET;
> >       _start = .;
> > -     _stext = .;
> >       HEAD_TEXT_SECTION
> >       . = ALIGN(PAGE_SIZE);
> >
> >       __init_begin = .;
> >       INIT_TEXT_SECTION(PAGE_SIZE)
> > -     INIT_DATA_SECTION(16)
> >       . = ALIGN(8);
> >       __soc_early_init_table : {
> >               __soc_early_init_table_start = .;
> > @@ -55,6 +53,7 @@ SECTIONS
> >       . = ALIGN(SECTION_ALIGN);
> >       .text : {
> >               _text = .;
> > +             _stext = .;
> >               TEXT_TEXT
> >               SCHED_TEXT
> >               CPUIDLE_TEXT
> > @@ -67,6 +66,8 @@ SECTIONS
> >               _etext = .;
> >       }
> >
> > +     INIT_DATA_SECTION(16)
> > +
> >       /* Start of data section */
> >       _sdata = .;
> >       RO_DATA(SECTION_ALIGN)



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
