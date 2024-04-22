Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FCAC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8d3tOnQFYmjEv5ljH0apidM39TBBJSR7gk6R0fXXqfw=; b=N5gpZ9aIrb0HsS
	gOprE5R7b+hut0bPE3wdVxJ5YNZbESb/iO26TzfLm4dTpMDQ05DM03h1/mncRA+VPLEvBx39oK/Vb
	T7EyjhdvBEaQuontECsdKAgM9A0k3hNhHX+TuZvppdb0C8w2gt5tsAegEMKx4+2BJHLhjFo6htQYz
	bNELTeEyjryqzel5BRfKuC7ctq2/4etYIOse3f6iVQpeNpKYi99nKh0XG1RKANu+5iJhri+IbZLdS
	gwG79wJCRZ7us/CcWIlCMz2PsrXFUzuZqVVzjw/wAEIN0Ncjg23AF4UOyIFvYIymnCZDycDrC0msp
	pQdNgGKaWYePSg0Hb9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryp9n-0000000CgHg-1x7S;
	Mon, 22 Apr 2024 08:36:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryp9h-0000000CgEk-3CYp
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 08:36:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-41a1d2a7b81so5375285e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713774964; x=1714379764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBzKYSZ8M382Gw3Mpbo+Hjy3YjNSp2OmuE1UXjfeuZA=;
        b=jhb6ScbDHE8FdoAuRQm2gP8gLN35bBKwYEdv2BTqC+EPKAvJ2ObOuwVhpFZFGG+qk1
         u9caStTqmJwzcFQZK+Hs02sI2AsjS8h2Lx0QkVleAsI9LAbd9al2kSguDXE+WXZ0EyGr
         HS0BlLirF5OUjwBXlY63r16T/ZThLBpg49avFTqoyvQFPT0D7jTvqd+aAazJzf0mWaIo
         VTkwmuKkHewYWuNEdShyXkBcFJk2XMd6vaMogqUuz7yN7loUcH4JNvJ+1kuj6Oyz27Bl
         4oY7C9Tv1BVMGKgl9zyK90K7S8fLhDmw1UvLus+Gcd1B5hhhJYR+vtkDrz6zBI1hWdbS
         cTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713774964; x=1714379764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBzKYSZ8M382Gw3Mpbo+Hjy3YjNSp2OmuE1UXjfeuZA=;
        b=Pi0ZvYNtFSBaKuSzLiH2MZ3B2JWF6bUGAAlaiC4uLABXzTMx7g5tOr65bPYB3Guudv
         MtXjl9/FdUCvFWAtSmGu4BFsvuf2p3bvnZZAdz9EcA09yvibLrLVAI5OI1SISB68brQu
         HS8WWDNaqLyl+dmdOEXfzI3jriX69/6hi3fON7Zeo7jM+dumU+ckD7xCHMXvQ6XhBdjG
         Yt6wye4pIDxkLfM6dWX5ViTLfNRlNwxZl8iPrwrmL1cgCizPsuCaRd4YqL+yFv/BRTGE
         2DwOSRG3Oc0d0pXKicaIB+UM8zh+ILUd8KfQYOdF4TXPWi2b8HonGA9xW4AujtQvzn0s
         7qng==
X-Gm-Message-State: AOJu0YzP9isl8SPerGDj9e3icg0pbAA/udp8Wa3war0w31G+Kd2JYPOo
	umXbBWzvegiQZlHglHiY6NAMeQmoY7fAFsV809E2/TRK5ibjMEF1x18k8QaMPxA=
X-Google-Smtp-Source: AGHT+IFhy5bPbMLwyziz6VsrU6byy5TIqllo/g3dOSSggWm8NTvoG2OcCFhhK56F2HASPigLSiOq6w==
X-Received: by 2002:a05:6000:b8c:b0:346:f830:db09 with SMTP id dl12-20020a0560000b8c00b00346f830db09mr6393629wrb.31.1713774963808;
        Mon, 22 Apr 2024 01:36:03 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x5-20020a5d6b45000000b003472489d26fsm11448472wrw.19.2024.04.22.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 01:36:03 -0700 (PDT)
Date: Mon, 22 Apr 2024 10:36:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org, 
	atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, christoph.muellner@vrull.eu, heiko@sntech.de, 
	charlie@rivosinc.com, David.Laight@aculab.com, luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 3/6] riscv: Add Zawrs support for spinlocks
Message-ID: <20240422-97341bd5e6f69d54eeaba632@orel>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-11-ajones@ventanamicro.com>
 <ZiWCP6f6zZ3dKXfN@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZiWCP6f6zZ3dKXfN@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_013605_825965_4F7145D2 
X-CRM114-Status: GOOD (  29.16  )
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

On Sun, Apr 21, 2024 at 11:16:47PM +0200, Andrea Parri wrote:
> On Fri, Apr 19, 2024 at 03:53:25PM +0200, Andrew Jones wrote:
> > From: Christoph M??llner <christoph.muellner@vrull.eu>
> > 
> > RISC-V code uses the generic ticket lock implementation, which calls
> > the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
> > Introduce a RISC-V specific implementation of smp_cond_load_relaxed()
> > which applies WRS.NTO of the Zawrs extension in order to reduce power
> > consumption while waiting and allows hypervisors to enable guests to
> > trap while waiting. smp_cond_load_acquire() doesn't need a RISC-V
> > specific implementation as the generic implementation is based on
> > smp_cond_load_relaxed() and smp_acquire__after_ctrl_dep() sufficiently
> > provides the acquire semantics.
> > 
> > This implementation is heavily based on Arm's approach which is the
> > approach Andrea Parri also suggested.
> > 
> > The Zawrs specification can be found here:
> > https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> > 
> > Signed-off-by: Christoph M??llner <christoph.muellner@vrull.eu>
> > Co-developed-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig                | 13 ++++++++
> >  arch/riscv/include/asm/barrier.h  | 45 ++++++++++++++++++---------
> >  arch/riscv/include/asm/cmpxchg.h  | 51 +++++++++++++++++++++++++++++++
> >  arch/riscv/include/asm/hwcap.h    |  1 +
> >  arch/riscv/include/asm/insn-def.h |  2 ++
> >  arch/riscv/kernel/cpufeature.c    |  1 +
> >  6 files changed, 98 insertions(+), 15 deletions(-)
> 
> Doesn't apply to riscv/for-next (due to, AFAIU,
> 
>   https://lore.kernel.org/all/171275883330.18495.10110341843571163280.git-patchwork-notify@kernel.org/ ).

I based it on -rc1. We recently discussed what we should base on, but
I couldn't recall the final decision, so I fell back to the old approach.
I can rebase on for-next or the latest rc if that's the new, improved
approach.

> 
> But other than that, this LGTM.  One nit below.
> 
> 
> > -#define __smp_store_release(p, v)					\
> > -do {									\
> > -	compiletime_assert_atomic_type(*p);				\
> > -	RISCV_FENCE(rw, w);						\
> > -	WRITE_ONCE(*p, v);						\
> > -} while (0)
> > -
> > -#define __smp_load_acquire(p)						\
> > -({									\
> > -	typeof(*p) ___p1 = READ_ONCE(*p);				\
> > -	compiletime_assert_atomic_type(*p);				\
> > -	RISCV_FENCE(r, rw);						\
> > -	___p1;								\
> > -})
> > -
> >  /*
> >   * This is a very specific barrier: it's currently only used in two places in
> >   * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
> > @@ -70,6 +56,35 @@ do {									\
> >   */
> >  #define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
> >  
> > +#define __smp_store_release(p, v)					\
> > +do {									\
> > +	compiletime_assert_atomic_type(*p);				\
> > +	RISCV_FENCE(rw, w);						\
> > +	WRITE_ONCE(*p, v);						\
> > +} while (0)
> > +
> > +#define __smp_load_acquire(p)						\
> > +({									\
> > +	typeof(*p) ___p1 = READ_ONCE(*p);				\
> > +	compiletime_assert_atomic_type(*p);				\
> > +	RISCV_FENCE(r, rw);						\
> > +	___p1;								\
> > +})
> 
> Unrelated/unmotivated changes.

The relation/motivation was to get the load/store macros in one part of
the file with the barrier macros in another. With this change we have

 __mb
 __rmb
 __wmb

 __smp_mb
 __smp_rmb
 __smp_wmb

 smp_mb__after_spinlock

 __smp_store_release
 __smp_load_acquire
 smp_cond_load_relaxed

Without the change, smp_mb__after_spinlock is either after all the
load/stores or in between them.

I didn't think the reorganization was worth its own patch, but I could
split it out (or just drop it).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
