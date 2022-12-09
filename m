Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B693C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vqYnouI4jUI+dfXdJDOXKR3AoXP+VUamG+w+U93R60=; b=QdBhOqA0or9UuF
	4hnc7dQvAdlWcwZoZb785ZfjXKVdDcgrBTr3H2MsCXBF9iaAwlLo+4lhk6xXC1BVw475cUh2Xtk2e
	a0CjAYhKwYxDimX0IGnGVC9NzE1dtu+C+DOGEP4kpeG9hPglXddRUrrYEjkfRUtWna9wjxezsvZvC
	gfGpxmyUAucAB/XyoanUOwNlYWdzZnsou5YhQEYppZ82ZyDS89S8UMO/Ia4VNelJod1uzoSZZou6S
	1rpGXfTjQyNULltCDj4R4+o4KDTETzQZzaHoJqKtMc9i3so/SZK4XrPZgsxWkJHEBBAv68HG08kLI
	lCVQL85U4jZIeBzRAxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Y22-0059hK-Lb; Fri, 09 Dec 2022 07:42:54 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Y1z-0059e2-Re
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 07:42:53 +0000
Received: by mail-qt1-x832.google.com with SMTP id h16so3035125qtu.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 23:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C1GC/cJO5zzAOHNRIMAagJHreotjKQ2Un7XFMERnzfE=;
        b=gOCHT5Etda4QLkHWX7Gjnv+C2BBpiyal4jCf52pco5z8mIh0bMwe6tUX66aQ0z9KO8
         u/tz2bgDepaLKF/W7LZcBZ3mmFuFBKtfLjDjNm4FafxAPsRaqUOgqGVnAxiM39CK370N
         7kGq2VUOhBINaNbBaTlyVNSjapKy+njl9oagt1N1tOOeSj7W53locWd5bDaPrGBpLg56
         aQbQHkOVUcNaFbED7sD18onN6QpC2RP7owkwcMT0ryjedvFG3CZIzkL93TAhM5gaw3Hu
         7e/cdoQ5qjkbernpk5VfFesMiZg/+H+OhtABXONr7loFTwKApSxRfwUEke1rJkSHefPQ
         Vofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1GC/cJO5zzAOHNRIMAagJHreotjKQ2Un7XFMERnzfE=;
        b=DyyCviHD9do5h8Lpa0LBAWnUdWc17Tcl2HYcXDEG+eAwl/s/nUoiNHTYRG+jPlOXZ8
         qabNw7JUryUtTNoAQaInHMiagg67Hr9wgVfuJ+8LEDzTqOwsM/x8hraayU3lqj7x1wXe
         o3ALOERdG96+1KyWhJAR/KOuf023QLZRqadpgj7ysXsK9CINfIjcjdpODk+DUOLCQKDz
         yyegogFa9f/mbvp3PXztJaBHnJiqCbyPw1FSAa3JynSxclR62K8Bk16CqLpC/fkUHjh9
         Hqpd/xt5ILkdMVUnIU8ZE/YAIvNPO26jLjEW999pfppOT4do7QUGnfa1xkdvFzsgXXkm
         Q3FQ==
X-Gm-Message-State: ANoB5pljXGUN+dnN4Rs1zeGVWHQeKZU4NWz+2mxBHKkrG1VOjEeIKKQ0
	koeGHD8/LCTu9ZAc4MIJhbtai13KoL7OeH58mCWQ04YKqiDRSD7j1WmjpLkJHcx2aTAjj9gQ2EW
	4PcCIyhPuIFJFWqmZHfUcGzKS4rRwSY+n86H/MLLi/dkN+tDMA2JQPdbiszv1iuvm0AMhhNd2PL
	0/SYFCZQ==
X-Google-Smtp-Source: AA0mqf4xBVAYZ7VuAspHvPLvsOKfLd1RwVJNhoSaagdR9NtgGI+Zd65cJ9UUV8EDFmOa5/yxOGUGBQ==
X-Received: by 2002:a05:622a:2506:b0:3a5:2bfc:f0ed with SMTP id cm6-20020a05622a250600b003a52bfcf0edmr6283845qtb.15.1670571768715;
        Thu, 08 Dec 2022 23:42:48 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id bl1-20020a05620a1a8100b006faa2c0100bsm569092qkb.110.2022.12.08.23.42.45
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 23:42:46 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3c090251d59so42395247b3.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 23:42:45 -0800 (PST)
X-Received: by 2002:a81:57ce:0:b0:365:2229:a799 with SMTP id
 l197-20020a8157ce000000b003652229a799mr11362064ywb.262.1670571765571; Thu, 08
 Dec 2022 23:42:45 -0800 (PST)
MIME-Version: 1.0
References: <b1dae947-d52a-d28e-5ddc-c1ad6d29828c@rivosinc.com> <mhng-84ad9495-ef4b-4343-89ee-dfe45ab69ff7@palmer-ri-x1c9>
In-Reply-To: <mhng-84ad9495-ef4b-4343-89ee-dfe45ab69ff7@palmer-ri-x1c9>
From: Andrew Waterman <andrew@sifive.com>
Date: Thu, 8 Dec 2022 21:42:34 -1000
X-Gmail-Original-Message-ID: <CA++6G0D8RdjgvzQf-gMdakcF-Jj_PMjP=MBtAbSC0Qcu_WrTTQ@mail.gmail.com>
Message-ID: <CA++6G0D8RdjgvzQf-gMdakcF-Jj_PMjP=MBtAbSC0Qcu_WrTTQ@mail.gmail.com>
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Vineet Gupta <vineetg@rivosinc.com>, stillson@rivosinc.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org, atishp@atishpatra.org, 
	guoren@kernel.org, Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, andy.chiu@sifive.com, 
	Darius Rad <darius@bluespec.com>, arnd@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bjorn@kernel.org, fweimer@redhat.com, 
	libc-alpha@sourceware.org, christoph.muellner@vrull.eu, 
	Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_234251_956430_ECD5FAFA 
X-CRM114-Status: GOOD (  46.70  )
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

Requiring application programmers (i.e. those who write main()) to
make a prctl() call is obviously completely unacceptable, because
application programmers don't know whether the V extension is being
used.  Auto-vectorization and libc-function implementations will use
the V extension without any application-programmer knowledge or
intervention.  And obviously we don't want to preclude that.

This suggests that ld.so, early-stage libc, or possibly both will need
to make this prctl() call, perhaps by parsing the ELF headers of the
binary and each library to determine if the V extension is used.

Personally, I'm agnostic to whether we put this onus on the kernel or
on user-space--I just want to make sure we're all on the same page
that it needs to be hidden behind libc/ld.so/etc.  The onus can't be
on the application programmer.

On Thu, Dec 8, 2022 at 8:27 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 08 Dec 2022 21:16:06 PST (-0800), Vineet Gupta wrote:
> > Hi Darius, Andrew, Palmer
> >
> > On 9/21/22 14:43, Chris Stillson wrote:
> >> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> >>
> >> @@ -134,7 +135,6 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
> >>                      if (WARN_ON(!vstate->datap))
> >>                              return;
> >>              }
> >> -            regs->status |= SR_VS_INITIAL;
> >>
> >
> > Perhaps not obvious from the patch, but this is a major user experience
> > change: As in V unit would be turned off for a new task and we will rely
> > on a userspace prctl (also introduced in this patch) to enable V.
>
> IMO that's the only viable option: enabling V adds more user-visible
> state, which is a uABI break.  I haven't really had time to poke through
> all the versions here, but I'd have the call look something like
>
>     prctl(RISCV_ENABLE_V, min_vlenb, max_vlenb, flags);
>
> where
>
> * min_vlenb is the smallest VLENB that userspace can support.  There's
>   alreday an LLVM argument for this, I haven't dug into the generated
>   code but I assume it'll blow up on smaller VLENB systems somehow.
> * max_vlenb is the largest VLENB that userspace can support.
> * flags is just a placeholder for now, with 0 meaning "V as defined by
>   1.0 for all threads in this proces".  That should give us an out if
>   something more complicated happens in the future.
>
> That way VLA code can call `prctl(RISCV_ENABLE_V, 128, 8192, 0)` as it
> supports any V 1.0 implementation, while code with other constraints can
> avoid having V turned on in an unsupported configuration.

VLA code needs to read the vlenb CSR; it can't assume 8192 (or any
other small number) is a safe upper bound.

>
> I think we can start out with no flags, but there's a few I could see
> being useful already:
>
> * Cross process/thread enabling.  I think a reasonable default is
>   "enable V for all current and future threads in this process", but one
>   could imagine flags for "just this thread" vs "all current threads", a
>   default for new threads, and a default for child processes.  I don't
>   think it matters so much what we pick as a default, just that it's
>   written down.
> * Setting the VLENB bounds vs updating them.  I'm thinking for shared
>   libraries, where they'd only want to enable V in the shared library if
>   it's already in a supported configuration.  I'm not sure what the
>   right rules are here, but again it's best to write that down.
> * Some way to disable V.  Maybe we just say `prctl(RISCV_ENABLE_V, 0, 0,
>   ...)` disables V, or maybe it's a flag?  Again, it should just be
>   written down.
> * What exactly we're enabling -- is it the V extension, or just the V
>   registers?
>
> There's a bunch of subtly here, though, so I think we'd at least want
> glibc and gdb support posted before committing to any uABI.  It's
> probably also worth looking at what the Arm folks did for SVE: I gave it
> a quick glance and it seems like there's a lot of similarities with what
> I'm suggesting here, but again a lot of this is pretty subtle stuff so
> it's hard to tell just at a glance.
>
> > I know some of you had different opinion on this in the past [1], so
> > this is to make sure everyone's on same page.
> > And if we agree this is the way to go, how exactly will this be done in
> > userspace.
> >
> > glibc dynamic loader will invoke the prctl() ? How will it decide
> > whether to do this (or not) - will it be unconditional or will it use
> > the hwcap - does latter plumbing exist already ? If so is it AT_HWCAP /
> > HWCAP2.
>
> That part I haven't sorted out yet, and I don't think it's sufficient to
> just say "userspace should enable what it can support" because of how
> pervasive V instructions are going to be.
>
> I don't think we need HWCAP, as userspace will need to call the prctl()
> anyway to turn on V and thus can just use the success/failure of that to
> sort things out.
>
> Maybe it's sufficient to rely on some sort of sticky prctl() (or sysctl
> type thing, the differences there would be pretty subtle) and just not
> worry about it, but having some way of encoding this in the ELF seems
> nice.  That said, we've had a bunch of trouble sorting out the ISA
> encoding in ELFs so maybe it's just not worth bothering?
>
> > Also for static linked executables, where will the prctl be called from ?
>
> I guess that's pretty far in the weeds, but we could at least hook CRT
> to insert the relevant code.  We'd really need to sort out how we're
> going to encode the V support in binaries, though.
>
> > [1] https://sourceware.org/pipermail/libc-alpha/2021-November/132883.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
