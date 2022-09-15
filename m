Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82EAECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3PUp1FsrOQ2YQKcUmX8XDR5C2Q2xylCbdvEuMa5lCu4=; b=NhP+rf/z3hMefo/bu9/zXPkBjg
	Xd7qtfkepJIvtb7GFW5HoOqIggCb5Q6aiF2n3onhRbIRNgRRsDBihGpIk3INQNbL0pijgxLAMuDfW
	602eKuWn7a0wo41FKIoR3OryE63qlqVRIIsweKKopMPZ7d/J66kBrXJ9AG4s3Vv0wRDYLe6x9TUvR
	b/wy5WlgSLAQncKpQdi1Ce4yEuy6Iy2hTZJhdrBOwPuMWI8S/dT2YHDpntnPjgBPSCUtLInKrEZwY
	mWV/ljjIHgGFkfGjN3vox3P3n3qbkHWabhS8UqVhB4bl4yeQbM7Qgq69BaKiMeo282Zp7kYPrLeE0
	PIB2nJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtuT-00Fhm1-2T; Thu, 15 Sep 2022 18:48:25 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtuQ-00Fhl2-VU
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:48:24 +0000
Received: by mail-pg1-x529.google.com with SMTP id i19so14856504pgi.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=nzN4TyiTu/X8WAurRhkbXC36H2L4MWW2PoQoLXhqLcE=;
        b=LZDW87FSIwPstY1qzL4UsH73KhoyRifwSXjD+rWJo8ryGkYwNJedTxWXbrRqpGmdWs
         3mL+jU2nvuEC2N2CpSSKqAKzIGAyXHRQc1xqr39T3sIxIC4wSy12/JYHHT9XwJ4zjBWk
         kiYqOdLDESYNv55bWp29QjiXG5a97teLGK+wRlvZc6BF3L6xWhSnAQescnqTChcPywvu
         Rm5uxKCXp5/giu+k3wm/uunVGS8yR23XEymAsBddd9mEcrbKbEch7xc7psMnRNmplqjx
         lbMLwwAIFHYTqdSqQS5OU6z8Iw72MBhK+dwpOYcoG+eDgHzq1MKTFjeu5lxONyR0ti5b
         C7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nzN4TyiTu/X8WAurRhkbXC36H2L4MWW2PoQoLXhqLcE=;
        b=b7pdUbaQRwZ26Rkfq/gRiVywFAyulciFYOLc8OuheK/GSKKoHzb9xpC7RaaaGvipQM
         LndeqvWuy4v5Gmfl/MiIFjO3hYy1O4pknCX/6LzGk5ZVOdOcSTmqB9y3EWWoR9RE96R4
         DHUTSpex6PvEM/uxkMBx9ajecm0nyg9yRIhqfnzfjWKfC8RGjPmMrgCTjumTfbYFMS5l
         EAJPMixd4LRK/OrrMr9Di5/goF7Nl0ry0Aq7XM3lRxGePewTg7DbebCxqccEumefWRYA
         LcSNLzB2hXOi+AlEDIFk4S+g3Mm+P/9xJSPNx1HxV1XDj2XfFcXBU/Zj1iiJpbjn4tZh
         40gQ==
X-Gm-Message-State: ACrzQf1mygl1AN6x8gHMGVCkepeF6/LKYY0LoFu5uDi/DK36JdXOOuRk
	cn9Jt3AenRQHbE7MKvY5/K+3yShs1XsKgJZGTGvIbg==
X-Google-Smtp-Source: AMsMyM4jTMgoRTPQkiYw9ISiXw/RY3S7O4HMvcs5dQsRmIdu4kuNsLOpiqd2iEHFJ+i17qJttCvbJQ==
X-Received: by 2002:a63:1304:0:b0:439:ac9b:34af with SMTP id i4-20020a631304000000b00439ac9b34afmr1062185pgl.464.1663267702450;
        Thu, 15 Sep 2022 11:48:22 -0700 (PDT)
Received: from localhost ([172.58.176.196])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090a598b00b001ef8ab65052sm1996135pji.11.2022.09.15.11.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:48:22 -0700 (PDT)
Date: Thu, 15 Sep 2022 11:48:22 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Sep 2022 11:47:59 PDT (-0700)
Subject: Re: [PATCH] riscv: fix a nasty sigreturn bug...
In-Reply-To: <YxJEiSq/CGaL6Gm9@ZenIV>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
         linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: viro@zeniv.linux.org.uk, ajones@ventanamicro.com
Message-ID: <mhng-d888fd65-86fc-4c2d-8a0f-801e9da62701@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_114823_036364_24E4FE0D 
X-CRM114-Status: GOOD (  16.90  )
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

> Ping?  Does anybody have objections?  AFAICS, the bug is still
> there...

Sorry, something's gone off the rails with email and this thread doesn't 
show up in my inbox (not even any of the replies).  I tried to patch 
together this reply manually so hopefully it works.

This is on fixes, thanks -- trying to debug this one would have been a 
nightmare.

> On Fri, Sep 24, 2021 at 01:55:27AM +0000, Al Viro wrote:
>> riscv has an equivalent of arm bug fixed by 653d48b22166; if signal
>> gets caught by an interrupt that hits when we have the right value
>> in a0 (-513), *and* another signal gets delivered upon sigreturn()
>> (e.g. included into the blocked mask for the first signal and posted
>> while the handler had been running), the syscall restart logics will
>> see regs->cause equal to EXC_SYSCALL (we are in a syscall, after all)
>> and a0 already restored to its original value (-513, which happens to
>> be -ERESTARTNOINTR) and assume that we need to apply the usual
>> syscall restart logics.
>>     
>> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
>> ---
>> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
>> index c2d5ecbe55264..f8fb85dc94b7a 100644
>> --- a/arch/riscv/kernel/signal.c
>> +++ b/arch/riscv/kernel/signal.c
>> @@ -121,6 +121,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
>>  	if (restore_altstack(&frame->uc.uc_stack))
>>  		goto badframe;
>>  
>> +	regs->cause = -1UL;
>> +
>>  	return regs->a0;
>>  
>>  badframe:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
