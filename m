Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A355C04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 20:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aE0x83eYdj8GgIWrKVjX8EFpsBcMR/2jsybzDtv/TBE=; b=DnGrlQYbK1E3ja
	f+QNxZ7Dd6fDBAP9Ceh4hWY77VFqnelBZxH1K4ypRXhTzeDYRIqVpslHiDooavgjDhtfWCd1Heo01
	Ti6MsKCWTuf5MYpYnpBZWpw67Zr/CnTNzFiBWyjgfn8ouK6KdxplId0QzG/5TSgKSnOfKAXNYN7gj
	jt/1DZu5J5La78oj/nbziEaqIgxIuJiJZ+z5Woa3TvVhTsbf23Ltuihr8eCAKKCUqDCrgEr2LkjQP
	Xe3p5pO43mgvmcjwOr4Q5oB29uN/oyTVaLqbw/c0mXjL34jIEFgSf+lzqNsC39WT20ViuQ6x6GWIL
	Vuqxi2hqprUEfm8mX4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5tdW-00000008gtR-4141;
	Sat, 11 May 2024 20:48:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5tdT-00000008gsp-37CO
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 20:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715460481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aytntv1qSTgscf/fVVlEX6NWoKqZCFoCqwsJ0PcuQPc=;
	b=i9ooiIymIi7s1cQGSvFc+t/ivxG1t9t2gRyXDlsNwh61trTK10F2Xb4eIQ0Ck0P+jP+UbX
	Dv+l7pdYpoqoDOYram8GFJhMyZiuflldwz0rZMgA615MLkraA5lILbG84b/9zH7bD0dFmp
	L6KQ3Oyn7gnS3Hrcwn5XH2ml0IZt/90=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-bpOQojeDPMuUFYI6oV2KZg-1; Sat, 11 May 2024 16:45:08 -0400
X-MC-Unique: bpOQojeDPMuUFYI6oV2KZg-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1ec896dae3cso34022875ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 11 May 2024 13:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715460307; x=1716065107;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aytntv1qSTgscf/fVVlEX6NWoKqZCFoCqwsJ0PcuQPc=;
        b=bjNocOtMDmuxNx5mXld2sfMIqv7km1NRJpD1p9OyhJpJ3s8sX9hcoxJYerQPhdSdHY
         bI2PN2+PIV8y6USMg67Jqk4Lonh31gfwA+KM4Tp0FcAKMQykX+dxjY15JCQOKKNQXbW5
         YIjiT7TY/rp98MS093nDuEnwfX33TSm8e18MajSiyS9RG0LhULj7aCBohx7Ln5UlmQdj
         2xeYiNYMzypxEjY3ujgnb9UUSRZlwJDEozwiKv3m7mgLuDOITTyPfzYu4c0crPq4NPQ4
         /CWxZnCW1o9ZZovfgcB8Kp2Z5GxSGVs6DwrhCii71KQMIL7UnGfxsmN+ugG/MNOwgLQR
         9JKA==
X-Forwarded-Encrypted: i=1; AJvYcCXrHEOOvD64kZWMnlBvbYZA81ZcwdhaUOG7/MiEec2uMaikDAwYfG1kqwG+V1aARi51Vqz4op/kEuPuJMWZqct2rUOVe4eQpcDp3VAMsews
X-Gm-Message-State: AOJu0Yy88pTXCSEWn6tZtrs6hirz1vUNzHn1Lyu6RBytzy4zh6Fv4ibm
	omk0PyaAJ2b3Cwf+eAxMM9UTGxjlPOmsP1K+yVcWK9I4QR//yeMMJXjzTUa8FT0N7zyLaD2Wwdx
	HfCA/tbtuIogvBmvPb2FdMysvr7ws92exEZetEiPg+KQmXryJsAmae1r9apmz0qv8fQ==
X-Received: by 2002:a17:903:11c3:b0:1e1:a54:1fe8 with SMTP id d9443c01a7336-1ef4404fbf7mr74832665ad.53.1715460307048;
        Sat, 11 May 2024 13:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHd5kExNw6uk9rCQMxKchlCbKxofARlkPukmoGeSmHapRj2YEf/B/7sssUzviPfVwRSzUk8w==
X-Received: by 2002:a17:903:11c3:b0:1e1:a54:1fe8 with SMTP id d9443c01a7336-1ef4404fbf7mr74832535ad.53.1715460306663;
        Sat, 11 May 2024 13:45:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a800:a9e8:e01f:c640:3398:ffe5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c2555casm52362025ad.284.2024.05.11.13.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 13:45:05 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	andi.shyti@linux.intel.com,
	andrzej.hajda@intel.com,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: Re: [PATCH RFC cmpxchg 8/8] riscv: Emulate one-byte and two-byte cmpxchg
Date: Sat, 11 May 2024 17:44:46 -0300
Message-ID: <Zj_YvmjROzW6NAog@LeoBras>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <9a84b94c-34ff-4c3a-ab2b-2741a5755db9@paulmck-laptop>
References: <20240401213950.3910531-8-paulmck@kernel.org> <mhng-d6a8a972-5054-4c48-a903-5a53a31da9ad@palmer-ri-x1c9a> <Zj8VJZmQC7hRzDdz@gmail.com> <9a84b94c-34ff-4c3a-ab2b-2741a5755db9@paulmck-laptop>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_134803_871286_632A2264 
X-CRM114-Status: GOOD (  39.86  )
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

On Sat, May 11, 2024 at 07:54:34AM -0700, Paul E. McKenney wrote:
> On Sat, May 11, 2024 at 02:50:13AM -0400, Guo Ren wrote:
> > On Thu, Apr 04, 2024 at 07:15:40AM -0700, Palmer Dabbelt wrote:
> > > On Mon, 01 Apr 2024 14:39:50 PDT (-0700), paulmck@kernel.org wrote:
> > > > Use the new cmpxchg_emu_u8() and cmpxchg_emu_u16() to emulate one-byte
> > > > and two-byte cmpxchg() on riscv.
> > > > 
> > > > [ paulmck: Apply kernel test robot feedback. ]
> > > 
> > > I'm not entirely following the thread, but sounds like there's going to be
> > > generic kernel users of this now?  Before we'd said "no" to the byte/half
> > > atomic emulation routines beacuse they weren't used, but if it's a generic
> > > thing then I'm find adding them.
> > > 
> > > There's a patch set over here
> > > <https://lore.kernel.org/all/20240103163203.72768-2-leobras@redhat.com/>
> > > that implements these more directly using LR/SC.  I was sort of on the fence
> > > about just taking it even with no direct users right now, as the byte/half
> > > atomic extension is working its way through the spec process so we'll have
> > > them for real soon.  I stopped right there for the last merge window,
> > > though, as I figured it was too late to be messing with the atomics...
> > > 
> > > So
> > > 
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > F.Y.I Leonardo Bras <leobras@redhat.com>

Hi Guo Ren, thanks for bringing it to my attention.

I am quite excited about the inclusion of my patchset on riscv/cmpxchg, and 
I hope it can be useful both to your qspinlock implementation and on Paul's 
RCU improvement.

> 
> I am carrying this in -rcu, but only for testing purposes, not for
> inclusion into mainline.  Not that I know of anyone testing -rcu on
> RISC-V, but still, I wouldn't want to do anything do discourage such
> testing.
> 
> The reason that this patch is no longer intended for inclusion is that it
> has been obsoleted by a patch that provides native support for one-byte
> and two-byte cmpxchg() operations.  Which is even better!  ;-)
> 
> 							Thanx, Paul

Thanks Paul!
Months ago I have reworked cmpxchg and added those 1-byte and 2-byte 
{cmp,}xchg asm implementations using lr/sc, as they would be useful to Guo 
Ren's qspinlock, and I am thankful that you provided another use case, 
because it provides more proof of it's usefulness.

Thanks!
Leo

> 
> > > if you guys want to take some sort of tree-wide change to make the byte/half
> > > stuff be required everywhere.  We'll eventually end up with arch routines
> > > for the extension, so at that point we might as well also have the more
> > > direct LR/SC flavors.
> > > 
> > > If you want I can go review/merge that RISC-V patch set and then it'll have
> > > time to bake for a shared tag you can pick up for all this stuff?  No rush
> > > on my end, just LMK.
> > > 
> > > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > Cc: <linux-riscv@lists.infradead.org>
> > > > ---
> > > >  arch/riscv/Kconfig               |  1 +
> > > >  arch/riscv/include/asm/cmpxchg.h | 25 +++++++++++++++++++++++++
> > > >  2 files changed, 26 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index be09c8836d56b..4eaf40d0a52ec 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -44,6 +44,7 @@ config RISCV
> > > >  	select ARCH_HAS_UBSAN
> > > >  	select ARCH_HAS_VDSO_DATA
> > > >  	select ARCH_KEEP_MEMBLOCK if ACPI
> > > > +	select ARCH_NEED_CMPXCHG_1_2_EMU
> > > >  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
> > > >  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> > > >  	select ARCH_STACKWALK
> > > > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > > > index 2fee65cc84432..a5b377481785c 100644
> > > > --- a/arch/riscv/include/asm/cmpxchg.h
> > > > +++ b/arch/riscv/include/asm/cmpxchg.h
> > > > @@ -9,6 +9,7 @@
> > > >  #include <linux/bug.h>
> > > > 
> > > >  #include <asm/fence.h>
> > > > +#include <linux/cmpxchg-emu.h>
> > > > 
> > > >  #define __xchg_relaxed(ptr, new, size)					\
> > > >  ({									\
> > > > @@ -170,6 +171,12 @@
> > > >  	__typeof__(*(ptr)) __ret;					\
> > > >  	register unsigned int __rc;					\
> > > >  	switch (size) {							\
> > > > +	case 1:								\
> > > > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > > > +		break;							\
> > > > +	case 2:								\
> > > > +		break;							\
> > > > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > > >  	case 4:								\
> > > >  		__asm__ __volatile__ (					\
> > > >  			"0:	lr.w %0, %2\n"				\
> > > > @@ -214,6 +221,12 @@
> > > >  	__typeof__(*(ptr)) __ret;					\
> > > >  	register unsigned int __rc;					\
> > > >  	switch (size) {							\
> > > > +	case 1:								\
> > > > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > > > +		break;							\
> > > > +	case 2:								\
> > > > +		break;							\
> > > > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > > >  	case 4:								\
> > > >  		__asm__ __volatile__ (					\
> > > >  			"0:	lr.w %0, %2\n"				\
> > > > @@ -260,6 +273,12 @@
> > > >  	__typeof__(*(ptr)) __ret;					\
> > > >  	register unsigned int __rc;					\
> > > >  	switch (size) {							\
> > > > +	case 1:								\
> > > > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > > > +		break;							\
> > > > +	case 2:								\
> > > > +		break;							\
> > > > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > > >  	case 4:								\
> > > >  		__asm__ __volatile__ (					\
> > > >  			RISCV_RELEASE_BARRIER				\
> > > > @@ -306,6 +325,12 @@
> > > >  	__typeof__(*(ptr)) __ret;					\
> > > >  	register unsigned int __rc;					\
> > > >  	switch (size) {							\
> > > > +	case 1:								\
> > > > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > > > +		break;							\
> > > > +	case 2:								\
> > > > +		break;							\
> > > > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > > >  	case 4:								\
> > > >  		__asm__ __volatile__ (					\
> > > >  			"0:	lr.w %0, %2\n"				\
> > > 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
