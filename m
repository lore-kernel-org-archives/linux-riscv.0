Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DF0C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1folr4awOa/U1aF4xNpvqeYkuWqJ70vNs8aB8yh+R0=; b=yiZhGUN1d1LJBD
	/faIMMpHnAf61zmxWrqrb1Cfxbs5utNW+7vjt15VcLpUGY8z6CDxMTFe5B+Tphk1aJYBX8QNhqStb
	NNW+Klco+hblzsjCQaty1flq8eocM4xdOtWrchVb1gL/MfpwnWH9fZ3Ml+JLUIxsCeN98eZojmlbp
	VkiFS+sGF2M75hvt8MpRxeq+9salzivqj7K5qz8LyDtkpO5KHnPPgalkZlI/PFl8i4jQxOL/hvHzD
	P8VHzlAqC7jPRgIUF7JzaM7jkjywXDfvIUOSV2wvxPjFqN0hGn/efQ0VT81gb7sB+guXXqJZLAaQp
	OTuo4meN5AgEq+WVvvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsL3-00304u-6n; Fri, 04 Nov 2022 08:46:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsKw-00303W-UX
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 08:46:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A3C0BB82B45
	for <linux-riscv@lists.infradead.org>; Fri,  4 Nov 2022 08:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512AFC43149
	for <linux-riscv@lists.infradead.org>; Fri,  4 Nov 2022 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667551558;
	bh=ByyutI2vBA3QhVIGyC66aA8zyhVYs5f2konmfwSQPnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bh2jFjjEHZPtABoc/F6qzcbKAtleQlQvRlhOGeRNTbYwEmG2rOHmRD6uBT0RttSI6
	 Z9TCeCXZO6vS83C3Q9D2Olc1eEnAKxDRkZoMHkR39LMa6guFz7U/KWfFbcDVqfPyM6
	 KwPlws3b7XQZqQgnrBYqXX1nCsqbkaez/9+CT5Yob30/oKWezytIV74nGKmtjkupYy
	 B2fZTcZsH432eIxxo6Iv87WgGcudXhW/fEUbRxucxmbHokk0NAYfpovZtCRIZQyCLL
	 AMwbBOh+OgvCyoBaIuVd9kUtzjNHQbWUQkRKJnU2rt4umhrfInZ1yWyYXIKvsv5ND3
	 w5rSaSRtGFjKg==
Received: by mail-oi1-f175.google.com with SMTP id g10so4504467oif.10
        for <linux-riscv@lists.infradead.org>; Fri, 04 Nov 2022 01:45:58 -0700 (PDT)
X-Gm-Message-State: ACrzQf3XWOcpT2hDaHMPJzvgQCmmwr6BCYkI1BHQWmk3ZUsA5O6pj3hV
	IqQEcxlxv942EIsTVXqnrLAjXct+rJy1dhH4IvM=
X-Google-Smtp-Source: AMsMyM5oVIVLfRHUS4DAGhvTfy6w5dJFbh2NmCaZ90J+g737bWB4KioXD6oOyWna6u1ncPNw8epNE52asaWlSMUdHHM=
X-Received: by 2002:a05:6808:f0e:b0:359:b055:32ea with SMTP id
 m14-20020a0568080f0e00b00359b05532eamr26767203oiw.112.1667551557278; Fri, 04
 Nov 2022 01:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-6-stillson@rivosinc.com> <1c74ac94-50db-ceb3-234d-f8f227de8f6e@linux.dev>
In-Reply-To: <1c74ac94-50db-ceb3-234d-f8f227de8f6e@linux.dev>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 4 Nov 2022 16:45:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS_2Kv94oCnr_hBgZD8ZK-_QuQ3ovQdjoXF1Pky2P5Ljg@mail.gmail.com>
Message-ID: <CAJF2gTS_2Kv94oCnr_hBgZD8ZK-_QuQ3ovQdjoXF1Pky2P5Ljg@mail.gmail.com>
Subject: Re: [PATCH v12 06/17] riscv: Reset vector register
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Chris Stillson <stillson@rivosinc.com>, Guo Ren <guoren@linux.alibaba.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Oleg Nesterov <oleg@redhat.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
	Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_014603_323422_1668D088 
X-CRM114-Status: GOOD (  28.34  )
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

On Fri, Nov 4, 2022 at 1:01 PM Vineet Gupta <vineet.gupta@linux.dev> wrote:
>
> On 9/21/22 14:43, Chris Stillson wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Reset vector registers at boot-time and disable vector instructions
> > execution for kernel mode.
>
> Perhaps bike-shedding, but "Reset" has a different connotation in
> kernel, this is clear registers IMO. And "Reset Vector ..." sounds
> totally different at first glance.
Agree, "Clear vector registers" is okay.

>
>
> > -      * Disable the FPU to detect illegal usage of floating point in kernel
> > -      * space.
> > +      * Disable the FPU/Vector to detect illegal usage of floating point
> > +      * or vector in kernel space.
> >        */
> > -     li t0, SR_SUM | SR_FS
> > +     li t0, SR_SUM | SR_FS | SR_VS
>
> Is VS writable in implementations not implementing V hardware.
>
> Priv spec seems to be confusing. It states
>
>     "The FS[1:0] and VS[1:0] WARL fields..."
>
> Above implies it can be written always but will read legal values only.
> But then this follows.
>
>         "If neither the v registers nor S-mode is implemented, then VS
>         is read-only zero. If S-mode is implemented but the v registers
>         are not, VS may optionally be read-only zero"
>
> What does optionally mean for software ?
The read-only zero bit is safe for writing 1, but the result is still
zero. So let's keep it for easier coding.

>
> >
> >       REG_L s0, TASK_TI_USER_SP(tp)
> >       csrrc s1, CSR_STATUS, t0
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index b865046e4dbb..2c81ca42ec4e 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -140,10 +140,10 @@ secondary_start_sbi:
> >       .option pop
> >
> >       /*
> > -      * Disable FPU to detect illegal usage of
> > -      * floating point in kernel space
> > +      * Disable FPU & VECTOR to detect illegal usage of
> > +      * floating point or vector in kernel space
> >        */
> > -     li t0, SR_FS
> > +     li t0, SR_FS | SR_VS
> >       csrc CSR_STATUS, t0
> >
> >       /* Set trap vector to spin forever to help debug */
> > @@ -234,10 +234,10 @@ pmp_done:
> >   .option pop
> >
> >       /*
> > -      * Disable FPU to detect illegal usage of
> > -      * floating point in kernel space
> > +      * Disable FPU & VECTOR to detect illegal usage of
> > +      * floating point or vector in kernel space
> >        */
> > -     li t0, SR_FS
> > +     li t0, SR_FS | SR_VS
> >       csrc CSR_STATUS, t0
>
> Third instance of duplicated SR_FS | SR_VS. Better to add a helper
> SR_FS_VS or some such macro.
Good point. But we could move it to another patch and define a new
SR_AXS for all.

#define SR_AXS         (SR_FS | SR_VS | SR_XS)

>
> >
> >   #ifdef CONFIG_RISCV_BOOT_SPINWAIT
> > @@ -431,6 +431,29 @@ ENTRY(reset_regs)
> >       csrw    fcsr, 0
> >       /* note that the caller must clear SR_FS */
> >   #endif /* CONFIG_FPU */
> > +
> > +#ifdef CONFIG_VECTOR
> > +     csrr    t0, CSR_MISA
> > +     li      t1, COMPAT_HWCAP_ISA_V
> > +     and     t0, t0, t1
> > +     beqz    t0, .Lreset_regs_done
> > +
> > +     /*
> > +      * Clear vector registers and reset vcsr
> > +      * VLMAX has a defined value, VLEN is a constant,
> > +      * and this form of vsetvli is defined to set vl to VLMAX.
> > +      */
> > +     li      t1, SR_VS
> > +     csrs    CSR_STATUS, t1
> > +     csrs    CSR_VCSR, x0
> > +     vsetvli t1, x0, e8, m8, ta, ma
> > +     vmv.v.i v0, 0
> > +     vmv.v.i v8, 0
> > +     vmv.v.i v16, 0
> > +     vmv.v.i v24, 0
> > +     /* note that the caller must clear SR_VS */
>
> Is that actually happening ?
Yes, It's the same as FPU, see head.S _start_kernel:

ENTRY(_start_kernel)
..
        /* Reset all registers except ra, a0, a1 */
        call reset_regs
...

>
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
