Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE261C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 06:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4E8FHHLMmaxW/A5RBGXONdCLBuVobrMY0u4132/oJV8=; b=x0TU7S2h+T9+Ht
	kpz7HqatrPwbxs7OeCOuF/jrGWSztBKCvE3aqayeNAXtZI6j++HfjyOSrfIzoC2Udp7vpyznEiHn3
	KbL9QbVCGadvN9ZhUIcM01ioI0o+BWhgzwV0W9dQNXMYe2MD73V7rbIICUbS76b7Lrme4befH6ltX
	KrQAM6HKoeyo0zAruqOpq423HbffE70DXJVu+1oTDXQwiiiOMrG4mhS0509fFJ6WitVvhhuQGrxlD
	FtcEhvLjkHHYIh5SvHcRlKOyI1hf4FrKqpccYLu3KMT4Vk28yl8qjXiPiRlQSA9b5Vdy6Zw0LUPwG
	tXu9uMAbda1c5SJ04kKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWBf-0000000AzgX-3Na9;
	Tue, 14 Jul 2026 06:00:11 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWBc-0000000Azfl-0esR
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 06:00:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-381891a9525so4294432a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 23:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784008807; x=1784613607; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekTn3UMJic44VT5Ls673Az1lxgbjw95C1C5IWJSyBYM=;
        b=sJikCkDoywk04lTWzc1wwhirSaL/5EjKAMs+lVSw+tw6BllsNdI20x4oF6aQZ1jBDA
         YbvYuNABuU6+McEKW/Srj8yBuq6hQas8EryUuIW2Ts3L61ltq2iMFkPoPmBqFuZPtXBV
         dUppE3mBwnAZCmw+eX4DVoi+qYxc7oViSCkMYiKi4dXfptcn4hBC8/v/mcfp/iL5lPy9
         PdCFwoi/IBJWh39MKx9Y/4La9Agg2LoKS83CdbxspwCf8KoIHfNj5BTiL0lS22Kq/cEM
         jaghHRQCB1vnlGl245EwPUg9STSubuhWneYsAQocTkXfWVi2JV7PFsbsFIe64hqIkejc
         u3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008807; x=1784613607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekTn3UMJic44VT5Ls673Az1lxgbjw95C1C5IWJSyBYM=;
        b=Sxvs4yQmLYL7cq2YOJJ70gMlsf3Y0zBt7SlS+I1xX4LiEum+f1fO9EEwLvhRDOWk/v
         Z6qpNwyk0QiASBYpzkhtLQalLkUzGN5y/frj3oY39v+sjRFnAA0aDRiz2QKxitTix3gh
         BlJ4xbP/616oHc1RK6PX8qFfB8R8AO5bxIAIQn8tshN9WifRnBBuqQ8h3jfl8RMk0vYb
         /oNJB+boWq3I2Uiu8mm39ZkG6g31Inc40dW7rnWnmIJW/MWnRIUKfnA+G2lNQZK+uFvz
         iZ+PrdaAqWdawGPOaTodTcTzjcX7yNTb1DcZ9FzVA91Fj5E1dWkv3sFLwWI7ulf4jZCQ
         Zqeg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7fr0c1nTUgzQBqES6nxvc20z2lgjJo669AqgsRFDB0B6T3oGPlB9GAHiI2CUHjBeBRdFBL4vH7DmH+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRXn5fY0tYdZOPxH0kPZZa3KzQTfjJwCQBtwcoz0CZduSo23fd
	0DdedKrrG64/jYRkkAq6NqFp5rh5oZ/SJFfsLrACrT9QkncbgPWHHw4I
X-Gm-Gg: AfdE7cne/sdTxqpHkmUQesoIGI1d203PR4xVd4kZVy/nZn7mJlEFVXl26wRTh10kFT4
	OwcTaZDrjKbgAw9ziY7T33REBQrDQOjJ/Fli5ikspZe6eeFGyN1JLqbSwF/Rdjr+j2h605j5Nly
	ibsB71OkedWt8SmIr2vL3i3lDM0d8a9RYRhtm0lAXx3zzJpZ5CygnmzE6lcNj1AScfjF9+nw2GX
	0rFOoJVwSGSZ2Z9895lGzy7FBLYpo9cROwBFXoiZH94dryXOfOKr7Qx+kygBCWgIrWu98y+ONx3
	xzeocY7FOGJHIoFkngmZtmz2I0KHsktfVQaRcP7gldoZ/gxclP1cuv6YFRsXnDOPzlY/otu21KX
	sG++CfP9mhtPh/tmS8pOETtK0h1QftPXiCPzLranCnUJGP0OYIE4ycR6fYZc+y0qoWIsAniRq2F
	ACazQhP1921ecB+W6fcklXCsAGU91aGUJT
X-Received: by 2002:a05:6a21:8cc1:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3c3571d0438mr1375652637.38.1784008806472;
        Mon, 13 Jul 2026 23:00:06 -0700 (PDT)
Received: from blinky ([2601:647:4000:5070::76e1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm63657400c88.1.2026.07.13.23.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:00:05 -0700 (PDT)
Date: Mon, 13 Jul 2026 23:00:03 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v5 5/8] riscv/runtime-const: Introduce
 runtime_const_mask_32()
Message-ID: <alXQY4hgZYLmr8x7@blinky>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-6-kprateek.nayak@amd.com>
 <178366995930.1208691.2993932866462893112.b4-review@b4>
 <650c7050-2a77-4415-b597-3bb39ccfb1e8@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <650c7050-2a77-4415-b597-3bb39ccfb1e8@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_230008_803468_B72FE0EE 
X-CRM114-Status: GOOD (  38.16  )
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

On Fri, Jul 10, 2026 at 01:47:10PM +0530, K Prateek Nayak wrote:
> Hello Charlie,
> 
> On 7/10/2026 1:22 PM, Charlie Jenkins wrote:
> > [You don't often get email from thecharlesjenkins@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Tue, 30 Jun 2026 04:55:28 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> >> Futex hash computation requires a mask operation with read-only after
> >> init data that will be converted to a runtime constant in the subsequent
> >> commit.
> >>
> >> Introduce runtime_const_mask_32 to further optimize the mask operation
> >> in the futex hash computation hot path. Since all the current use-cases
> >> are of the form GENMASK(n, 0), with n > 0, following sequence:
> > 
> > I really appreciate you spending the time to do this, thank you!
> 
> My pleasure! And I really appreciate you taking time to review and test
> this series. Thanks a ton for that!
> 
> > 
> >>
> >>
> >> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> >> index 1ce02605d2e4..dbf96c937dbb 100644
> >> --- a/arch/riscv/include/asm/runtime-const.h
> >> +++ b/arch/riscv/include/asm/runtime-const.h
> >> @@ -262,6 +279,33 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
> >> [ ... skip 24 lines ... ]
> >> +     BUG_ON(!val || width > 31 || (GENMASK(width - 1, 0) != val));
> >> +
> >> +     __runtime_fixup_shift(where, 32 - width);
> >> +     __runtime_fixup_shift(where + 4, 32 - width);
> >> +}
> >> +
> > 
> > It would be "optimal" to use an andi when the mask is <=11 bits since
> > andi can fit an 11 bit mask. What you have is good enough but I'll leave
> > my stab at doing the andi patching here in case you want to apply it.
> > 
> > From 9e5527aaddd464783af795aacdb6d094e11cc31e Mon Sep 17 00:00:00 2001
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > Date: Thu, 9 Jul 2026 23:18:09 -0700
> > Subject: [PATCH] riscv: Optimize __runtime_fixup_mask for masks with <= 11
> >  bits
> 
> Peter seems to have merged the v5 series in his tree but If you could give
> your S-o-b, I can throw in a commit log, some testing along with a few
> cosmetic modifications, and send it for official review on top of
> queue:locking/core ;-)

I'm glad it got merged, I missed that! Here's my tag that I forgot to
add...

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

> 
> > 
> > ---
> >  arch/riscv/include/asm/insn.h          |  2 ++
> >  arch/riscv/include/asm/runtime-const.h | 29 ++++++++++++++++++++++++--
> >  2 files changed, 29 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> > index c3005573e8c9..0a34cd7305d0 100644
> > --- a/arch/riscv/include/asm/insn.h
> > +++ b/arch/riscv/include/asm/insn.h
> > @@ -141,6 +141,7 @@
> >  #define RVG_OPCODE_JALR                0x67
> >  #define RVG_OPCODE_JAL         0x6f
> >  #define RVG_OPCODE_SYSTEM      0x73
> > +#define RVG_OPCODE_ANDI                0x13
> >  #define RVG_SYSTEM_CSR_OFF     20
> >  #define RVG_SYSTEM_CSR_MASK    GENMASK(12, 0)
> > 
> > @@ -175,6 +176,7 @@
> >  #define RVG_FUNCT3_BGE         0x5
> >  #define RVG_FUNCT3_BLTU                0x6
> >  #define RVG_FUNCT3_BGEU                0x7
> > +#define RVG_FUNCT3_ANDI                0x7
> > 
> >  /* parts of funct3 code for C extension*/
> >  #define RVC_FUNCT3_C_BEQZ      0x6
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > index dbf96c937dbb..24a9b13081f7 100644
> > --- a/arch/riscv/include/asm/runtime-const.h
> > +++ b/arch/riscv/include/asm/runtime-const.h
> > @@ -9,6 +9,7 @@
> >  #include <asm/asm.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> > +#include <asm/insn.h>
> >  #include <asm/insn-def.h>
> >  #include <linux/memory.h>
> >  #include <asm/text-patching.h>
> > @@ -302,8 +303,32 @@ static inline void __runtime_fixup_mask(void *where, unsigned long val)
> >          */
> >         BUG_ON(!val || width > 31 || (GENMASK(width - 1, 0) != val));
> > 
> > -       __runtime_fixup_shift(where, 32 - width);
> > -       __runtime_fixup_shift(where + 4, 32 - width);
> > +       /*
> > +        * A riscv 'andi' instruction can fit an 11 bit immediate, so the mask
> > +        * can be directly applied. Otherwise fall back to SRLI + SLLI.
> > +        */
> > +       if (width < 11) {
> > +               __le16 *parcel = where;
> > +               u32 insn;
> > +               __le32 res, nop;
> > +
> > +               insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
> > +
> > +               /* Replace the slli/slliw with an andi */
> > +               insn &= 0x000fcf80;
> > +               insn |= val << 20 | RV_ENCODE_FUNCT3(ANDI) | RVG_OPCODE_ANDI;
> > +
> > +               res = cpu_to_le32(insn);
> > +               /* Replace the srli/srliw with a nop */
> > +               nop = cpu_to_le32(RISCV_INSN_NOP4);
> > +               mutex_lock(&text_mutex);
> > +               patch_text_nosync(where, &res, sizeof(insn));
> > +               patch_text_nosync(where + 4, &nop, sizeof(insn));
> > +               mutex_unlock(&text_mutex);
> > +       } else {
> > +               __runtime_fixup_shift(where, 32 - width);
> > +               __runtime_fixup_shift(where + 4, 32 - width);
> > +       }
> >  }
> > 
> >  static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
> > --
> > 2.54.0
> > 
> > 
> > I would prefer including this, but I am happy to approve this
> > regardless.
> 
> Ack! I'll keep it as an optimization on top to retain your attribution.
> 
> > 
> > Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> Thank you again!
> 
> -- 
> Thanks and Regards,
> Prateek
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
