Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABD3C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaeQvvUzgRO2k6C607EqjyhoTEMWZ2L3r6pV04lfcUM=; b=oCjdMhv/MWXGbz
	bVcrOToUtsrWxR4wC4bLDFzcYFxN9Y7HY9lS3iVu9AuEm5KvO4VrJsZfiouJMbjZAQWdPb+tJXnsE
	2r1QLOpTor43CZiHKr5r+XmgYf/YVhYemHHXYeOS8iGZGjxLZAdSkYIeaLmBWAFLbiuik7tKWvNeS
	JbJjV4xbPRKUUMFN6gYWNrbMx4BGSt9uv8PyBmBWpHLefVItgB4ydT28AKl0P3Jm8gS6jtPe0C2ty
	3YYcZmSMdqVIJffLvbev4llXfgTgLYxpXWmBR/ej0DI0pqpFJWBT3ArZIOg+seALQMfaf8M5qjwZA
	9gXIj09uuNdYsfKR7m6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsguX-000sgh-J9; Sun, 22 May 2022 08:26:01 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsguU-000sgE-CL
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 08:25:59 +0000
Received: by mail-yb1-xb29.google.com with SMTP id t26so20580286ybt.3
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xkM+uD3r9viwRU7tGlM2Sn45alNsog1Fx+hhBl/EE4Y=;
 b=fjLsb9d3elqeQla/TjFJ+1tiDe3EjJ0L/t2RkJVPbgR8yvp5ErUV1jklbtz0Zl7GO/
 SgkRL0m1GCXeBEV0eI5OhK3tmCU5arlj78zpuyG02mTti3rGzvpy38jROdOfrwkNrtey
 011y+RuRljIq5NAWVOhiloSIzl0qlRWrNi5Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xkM+uD3r9viwRU7tGlM2Sn45alNsog1Fx+hhBl/EE4Y=;
 b=UUgLYo8FEzDY8M329+naKvRjk7yF4Dfoi+deC1+1cN1+nz9lVgp8wzR+YBPFWwAKd8
 WiuEF8SZxnyEhr4zTTPEwJOVQYqiaBRqcPieU01WjuVbcIEKafeIN7j8ZS1A4cfaNc9d
 NNxlrMaeyYs9XNYSRren8GoHJO62ah+FSjigi3vFGSYosQt5Zi8jlz02hmOO8qtZ+q4h
 Ze2NVqencz2VLCMl2/QFSvD7tUd2lQjMg6W67SpGbzID+Rtf/QZjdSkOMasLcYPQYJbg
 04uihUAnhqd+5Y4GDhkgwm4D9jY12yYh5e7sEzpfM2YOexW7k9latxO9x9I5D1R+kgml
 ZYZA==
X-Gm-Message-State: AOAM533jZJahqqSt0AmW2kRiLlxnLl1OnXIorxSKJPudh6Bs2iShAaj3
 JwmkDgXK34HaSe/z8EdQjqsqUWbu0CmIWPrKdwig
X-Google-Smtp-Source: ABdhPJxhE4YeA0vnkhPbum40b2+7Qil546Fmy2y5B12wsFA+vfaZ8hqA/XAdXbROh916e03IbhyfhzAMmussBuPQr3o=
X-Received: by 2002:a25:c004:0:b0:64d:6c11:a018 with SMTP id
 c4-20020a25c004000000b0064d6c11a018mr15840772ybf.143.1653207957157; Sun, 22
 May 2022 01:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220414173037.1381927-1-niklas.cassel@wdc.com>
 <mhng-f33607d6-1b1f-4cd4-b90b-d25f16900881@palmer-ri-x1c9>
In-Reply-To: <mhng-f33607d6-1b1f-4cd4-b90b-d25f16900881@palmer-ri-x1c9>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 22 May 2022 01:25:46 -0700
Message-ID: <CAOnJCU+uU4x7uDutf=LXMZ2Txz=SPBJ+vXC7j1Kn048GjjPjbA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Don't output a bogus mmu-type on a no MMU kernel
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: niklas.cassel@wdc.com, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_012558_462190_0FAEDD1A 
X-CRM114-Status: GOOD (  28.01  )
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

On Sat, May 21, 2022 at 1:47 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 14 Apr 2022 10:30:36 PDT (-0700), niklas.cassel@wdc.com wrote:
> > Currently on a 64-bit kernel built without CONFIG_MMU, /proc/cpuinfo will
> > show the current MMU mode as sv57.
> >
> > While the device tree property "mmu-type" does have a value "riscv,none" to
> > describe a CPU without a MMU, since commit 73c7c8f68e72 ("riscv: Use
> > pgtable_l4_enabled to output mmu_type in cpuinfo"), we no longer rely on
> > device tree to output the MMU mode. (Not even for CONFIG_32BIT.)
> >
> > Therefore, instead of readding code to look at the "mmu-type" device tree
> > property, let's continue with the existing convention to use fixed values
> > for configurations where we don't determine the MMU mode at runtime.
> >
> > Add a new fixed value for !CONFIG_MMU in order to output the correct
> > MMU mode in cpuinfo.
>
> There's really two ideas as to what /proc/cpuinfo should be: do we show
> what the HW has, or what we userspace sees.  This sort of thing is a
> perfect example of that split.  We've been kind of vague about this in
> the past, but IMO putting what userspace sees in /proc/cpuinfo (and
> HWCAP, etc) is the right way to go.  That does hide a bit from userspace
> WRT what hardware it's running on, but it's more in line with the design
> of RISC-V (ie, a lot is hidden from userspace).
>

How about vendor id, arch id & implementation id ? Looking at the
/proc/cpuinfo output on arm64/x86,
it seems to print related information there.
---------------------------------------------------
/proc/cpuinfo output in x86
---------------------------------------------------
processor       : 31
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6246R CPU @ 3.40GHz
---------------------------------------------------
/proc/cpuinfo output in aarm64
---------------------------------------------------
ubuntu@ubuntu:~$ cat /proc/cpuinfo
processor       : 0
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x1
CPU part        : 0xd07
CPU revision    : 0
---------------------------------------------------


> I've put this on for-next.
>
> Thanks!
>
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index ccb617791e56..ecfb3e85ffb2 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -138,6 +138,7 @@ static void print_mmu(struct seq_file *f)
> >  {
> >       char sv_type[16];
> >
> > +#ifdef CONFIG_MMU
> >  #if defined(CONFIG_32BIT)
> >       strncpy(sv_type, "sv32", 5);
> >  #elif defined(CONFIG_64BIT)
> > @@ -148,6 +149,9 @@ static void print_mmu(struct seq_file *f)
> >       else
> >               strncpy(sv_type, "sv39", 5);
> >  #endif
> > +#else
> > +     strncpy(sv_type, "none", 5);
> > +#endif /* CONFIG_MMU */
> >       seq_printf(f, "mmu\t\t: %s\n", sv_type);
> >  }
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
