Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635EFC6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCaGu8z30z1C3k69LQd50a3kuZPGGEdlY27KO9FfKQ8=; b=B8ljZqRpKhIFPt
	WoULq2G54SYMjjJ3pM3lOgbKlBPG/MyZGDnXYlx7KDdBr53A01Utwp2fuXGqzT9cTYbNJUEUAyssE
	Y4zq3V+ZL5OoTnmPYEF7MNcFS41JMN56yYA2voRzSfOKVgLww9P/BG2RTssLcG7hEp8xYFPGjz/W6
	XaKCrDslHHj444z2dFMzZW0wsqrjiSHmrPWNBN5TNi7LczUMq67SE6RXU525xHiBwb8QHIWUP1DBG
	mTmSAEEtvtiX8F+3XyMRoJYlltR4HzHGxqa0JFsniODKibsPV4oZarEn1ID9C7/05nDQnZATshrpz
	BAl+CK5j21IEoBgNc9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsdx-00EFcK-5K; Thu, 15 Sep 2022 17:27:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsdu-00EFVG-5S
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 17:27:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o70-20020a17090a0a4c00b00202f898fa86so8631353pjo.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 10:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2byv70u9LxFyqg2KEOTjIwO2wrYAaSWdRlHkqPRd+W0=;
        b=L8REomJAnSSsKQQzOccREDQKI9QUe7j4kqYbUwlEK63BVvueOkP7HwF3Tg7LnN/LFo
         /EJAwjeIXrHCEfKGogFKKN0yGLPkwTBQnm9MmJGlA1fR1a2sOP3pwqi5j7AEZxerVynj
         n2GoZqNPHjwjRRmK9irk4vWQt+me36EeVoTpY5suYkVKLl8qjhzWR2VmAvcgYG+GHw2V
         dTgyxZGRdRtKxHDMny3JQhLtWvT/1gfQJzuTQqC6Kmpkwg53qGC5Oa9+HxCA29o9lDIq
         hJsZbmL5odvBBr+4xDP0KjoZ8KCmRsCUtVhF7lRUBWk1Nq0L0KpnW5dRkVide/uMppBb
         HYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2byv70u9LxFyqg2KEOTjIwO2wrYAaSWdRlHkqPRd+W0=;
        b=CXkL3/SFUdJ1AnJ4fWN0rBVh17hUvg1j2KbrCocH2mb0ELpLF9anh3GF5zdDpnOVHN
         leyQI0O5cEbJlu1ZufCwi3h2amOu34m93qKNj5cT1WUJyZqcA71qg0LBhkLy5zb3fRlZ
         cnXwJyIy1IUUm6orlLl6i4X28cnNnl+dNG638m+hl279BgeMNYmR1Fan/108P8e6dA29
         mBpsNfM6q8p9jcwDZdQEHub9IkEv/a5KmSseCY5iz2t4+J6tUNOofKkkzlvAYDKuAFL7
         8r2CCOeJGB4VnYvEcWh8qHzsI39dn+o2DunApTLl/6Vbb5K3rcSSaiwwp0ktxTZxNx7q
         hqeQ==
X-Gm-Message-State: ACrzQf1KGyZJmo6Rae8BQVbHD8jeAlHXq8YjQsedkZyhKpT4lOYDk9u/
	J9tOEhoXD4BQ7wEBTdS9IfgTI5Rkn17xtm7EppW1TQ==
X-Google-Smtp-Source: AMsMyM6NIYvHuwjX471io4e8+lQbWL/2ToJ7/PZZC2/QexT0xHLfXzLeG5FwGJ2J+L4EXsdAsFPIUSfE6VQunsm8W0Y=
X-Received: by 2002:a17:902:bb97:b0:175:6721:2c34 with SMTP id
 m23-20020a170902bb9700b0017567212c34mr621209pls.146.1663262832597; Thu, 15
 Sep 2022 10:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220909212731.1373355-1-abrestic@rivosinc.com>
 <20220909212731.1373355-2-abrestic@rivosinc.com> <d46d6340-b985-49b2-babb-0082f1759c7b@microchip.com>
In-Reply-To: <d46d6340-b985-49b2-babb-0082f1759c7b@microchip.com>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Thu, 15 Sep 2022 13:27:01 -0400
Message-ID: <CALE4mHrBC-ni3HunRzxRzM8QJDHb=FuJquccum6OcnB4jZ6KbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: Allow PROT_WRITE-only mmap()
To: Conor.Dooley@microchip.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Celeste Liu <coelacanthus@outlook.com>, dram <dramforever@live.com>, 
	Ruizhe Pan <c141028@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Kumar Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_102714_236783_A317514F 
X-CRM114-Status: GOOD (  28.76  )
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

On Thu, Sep 15, 2022 at 12:56 PM <Conor.Dooley@microchip.com> wrote:
>
> On 09/09/2022 22:27, Andrew Bresticker wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
> > invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
> > PROT_READ with the justification that a write-only PTE is considered a
> > reserved PTE permission bit pattern in the privileged spec. This check
> > is unnecessary since we let VM_WRITE imply VM_READ on RISC-V, and it is
> > inconsistent with other architectures that don't support write-only PTEs,
> > creating a potential software portability issue. Just remove the check
> > altogether and let PROT_WRITE imply PROT_READ as is the case on other
> > architectures.
> >
> > Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
> > disallowed prior to the aforementioned commit; PROT_READ is implied in
> > such mappings as well.
> >
> > Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
>
> For the naive members of the audience such as myself, this patch
> came after a non-fixes patch in the series. What is the dependence
> of this patch on the other one (if any)?

This patch is dependent on the first. Happy to re-spin with a "Fixes"
tag on the first patch (or maybe Palmer can add when applying).

-Andrew

> Thanks,
> Conor.
>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> > ---
> > v1 -> v2: Update access_error() to account for write-implies-read
> > v2 -> v3: Separate into two commits
> > ---
> >  arch/riscv/kernel/sys_riscv.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > index 571556bb9261..5d3f2fbeb33c 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
> >         if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
> >                 return -EINVAL;
> >
> > -       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> > -               return -EINVAL;
> > -
> >         return ksys_mmap_pgoff(addr, len, prot, flags, fd,
> >                                offset >> (PAGE_SHIFT - page_shift_offset));
> >  }
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
