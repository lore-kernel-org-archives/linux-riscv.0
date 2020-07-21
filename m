Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E782C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 06:53:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C9020717
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 06:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AqKTwmUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C9020717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QhN9BMsZMQ6HvjvNtBXGqg70oSZHUll0K3eX5Wd7Snk=; b=AqKTwmUtIrEceSCag0EROjtQP
	iaXYIbVxG/IFoDXv+UtcaDkI0Fgtc+ll1/gVD8QHdT/5rbN7qc0UhpmIvqLiOaKFxHVl918nP21fD
	SNDErVdRneXRj5ZcVzUx3xHKz80vB5s1ciipmh+ahJtqT5cml9iO12iQVMQEoQYn+GRSZ4k1apOMS
	rbV3piZU8YtYutbec2lGWk3ABl56RkhyBApgM8frr1euFM9jgosIRPq1eXyqZOVKFvj8Sa8+uJshB
	dfhXudGHrVL0Ghte22QTAteEghVZV1HOO9IS27z9I4/P8kBjECwBWn8hhalpDEipOX7dlPLEzX4ys
	jULwZnHvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxm8w-0005Su-Du; Tue, 21 Jul 2020 06:52:50 +0000
Received: from mail-yb1-f196.google.com ([209.85.219.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxm8t-0005SD-IA
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 06:52:48 +0000
Received: by mail-yb1-f196.google.com with SMTP id c14so9551665ybj.0
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 23:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2oX2c45gXD89+TOpPTsbkrsdgAsnkvRsdX4GY6xWWaE=;
 b=iUd7/R2xveWClOw6JBM7AqclNGCHlAF7RlyanJo+xxkdFT6konnHYSiZuJfdKdDuol
 0Rx0iewt/FurjptmW8ErUH3cZtC2lQ/wGtDpij7gfswkdMjDWD0H/xR9H1WBT49tM+uk
 Wep6FWq5WoQT5oy1a7tcqUG5Q0qAtZBOMstSJTUZQHBqzymbqTqdiwzRSqO+QV+5uiDr
 CkL7R5IuNfYq0jts8xJkgBJkk7QRfUQB0YBuhC3SGCjMIIEMZeeOr60ub2rFj8I9/0Jv
 K8on2jq0wnh2k58k5euRvpAzy5zLonIGyktTTZr3nLt3xD8vBf6geVczAOd5zjBCUkgT
 t1hw==
X-Gm-Message-State: AOAM530nOHGIt6LWeRz/eb1T+tJV70LpB8YNcS7xw6uEfQJ06jO9Z/DJ
 ECAuOa+pdOtzmO+L8LGtzHMGK6bAjK161QDsj8M=
X-Google-Smtp-Source: ABdhPJz5Or1fZOKRFi+qwSdKPGxc8tke4gXRClp9E9Bc/nNz52u2RoDmwD/CeIAFAY2fx8+A0cc6ZyGNP9e1yWa040w=
X-Received: by 2002:a25:2d6f:: with SMTP id s47mr37532124ybe.1.1595314364717; 
 Mon, 20 Jul 2020 23:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <0d7d0c38-5b67-1793-47d7-b8a7714838ee@arm.com>
 <mhng-2f6b1241-9ab3-47a2-bc23-789d59a3fd8f@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-2f6b1241-9ab3-47a2-bc23-789d59a3fd8f@palmerdabbelt-glaptop1>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 21 Jul 2020 08:52:33 +0200
Message-ID: <CANBLGczm4+5=gMVYTNH_f4gcEggn4uPOOn13=-n82R6rFoJzhw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Select ARCH_HAS_DEBUG_VM_PGTABLE
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_025247_617774_03E83341 
X-CRM114-Status: GOOD (  23.71  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, maochenxi@eswin.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jul 2020 at 06:04, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 14 Jul 2020 20:20:54 PDT (-0700), anshuman.khandual@arm.com wrote:
> >
> >
> > On 07/15/2020 02:56 AM, Emil Renner Berthing wrote:
> >> This allows the pgtable tests to be built.
> >>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> ---
> >>
> >> The tests seem to succeed both in Qemu and on the HiFive Unleashed
> >>
> >> Both with and without the recent additions in
> >> https://lore.kernel.org/linux-riscv/1594610587-4172-1-git-send-email-anshuman.khandual@arm.com/
> >
> > That's great, thanks for testing.
>
> Actually, looking at this I'm not sure it actually helps us any.  This changes
> the behavior of two functions.  Pulling out the relevant sections, I see:
>
> unsigned int __sw_hweight32(unsigned int w)
> {
> #ifdef CONFIG_ARCH_HAS_FAST_MULTIPLIER
>         w -= (w >> 1) & 0x55555555;
>         w =  (w & 0x33333333) + ((w >> 2) & 0x33333333);
>         w =  (w + (w >> 4)) & 0x0f0f0f0f;
>         return (w * 0x01010101) >> 24;
> #else
>         unsigned int res = w - ((w >> 1) & 0x55555555);
>         res = (res & 0x33333333) + ((res >> 2) & 0x33333333);
>         res = (res + (res >> 4)) & 0x0F0F0F0F;
>         res = res + (res >> 8);
>         return (res + (res >> 16)) & 0x000000FF;
> #endif
> }
>
> and
>
> unsigned long memchr_inv(unsigned long value64)
> {
> #if defined(CONFIG_ARCH_HAS_FAST_MULTIPLIER) && BITS_PER_LONG == 64
>         value64 *= 0x0101010101010101ULL;
> #elif defined(CONFIG_ARCH_HAS_FAST_MULTIPLIER)
>         value64 *= 0x01010101;
>         value64 |= value64 << 32;
> #else
>         value64 |= value64 << 8;
>         value64 |= value64 << 16;
>         value64 |= value64 << 32;
> #endif
>         return value64;
> }
>
> GCC optimizer the multiplication out of the first one:
>
> __sw_hweight32:
>         li      a4,1431654400
>         srliw   a5,a0,1
>         addi    a4,a4,1365
>         and     a5,a5,a4
>         subw    a0,a0,a5
>         li      a5,858992640
>         srliw   a4,a0,2
>         addi    a5,a5,819
>         and     a0,a5,a0
>         and     a5,a5,a4
>         addw    a5,a0,a5
>         srliw   a0,a5,4
>         addw    a0,a0,a5
>         li      a5,252645376
>         addi    a5,a5,-241
>         and     a5,a5,a0
>         srliw   a0,a5,8
>         addw    a5,a0,a5
>         srliw   a0,a5,16
>         addw    a0,a0,a5
>         andi    a0,a0,0xff
>         ret
>
> __sw_hweight32:
>         li      a5,1431654400
>         srliw   a4,a0,1
>         addi    a5,a5,1365
>         and     a5,a5,a4
>         subw    a0,a0,a5
>         li      a5,858992640
>         srliw   a4,a0,2
>         addi    a5,a5,819
>         and     a0,a5,a0
>         and     a5,a5,a4
>         addw    a5,a0,a5
>         srliw   a0,a5,4
>         addw    a5,a0,a5
>         li      a0,252645376
>         addi    a0,a0,-241
>         and     a5,a0,a5
>         slliw   a0,a5,8
>         addw    a0,a0,a5
>         slliw   a5,a0,16
>         addw    a0,a0,a5
>         srliw   a0,a0,24
>         ret
>
> so that doesn't matter.  The second one is really a wash:
>
> memchr_inv:
>         ld      a5,.LC0
>         mul     a0,a0,a5
>         ret
> .rodata
> .LC0:
>         .dword  72340172838076673
>
> vs
>
> memchr_inv:
>         slli    a5,a0,8
>         or      a5,a5,a0
>         slli    a0,a5,16
>         or      a0,a0,a5
>         slli    a5,a0,32
>         or      a0,a5,a0
>         ret
>
> It's unlikely that load ends up relaxed, so it's going to be two instructions.
> That means we have 4 cycles to forward the load and multiply, for a cache hit.
> IIRC the multiplier on the existing hardware isn't that fast -- GCC lists it as
> imul as 10 cycles, but I remember it being more like 5 so that might just be an
> architecture-inaccurate tuning in the generic pipeline model.  This is out of
> the inner loop, so it's probably not all that important anyway.  The result
> isn't used for a while so on a bigger machine it's probably worth picking the
> smaller code path, but it seems like a very small thing to optimize for either
> way.
>
> I'm actually a bit surprised about this.  Do you have benchmarks that indicate
> ARCH_HAS_FAST_MULTIPLIER is actually faster?  Otherwise I guess I'm going to
> reject this, as it's really more
> ARCH_HAS_FAST_MULTIPLIER_AND_FAST_LARGE_CONSTANTS than just
> ARCH_HAS_FAST_MULTIPLIER.

Hi Palmer,

I think you meant this reply for
https://lore.kernel.org/linux-riscv/c5d82526-233a-15d5-90df-ca0c25a53639@eswin.com/T/#t

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
