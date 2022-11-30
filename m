Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15701C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 02:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1gi7Jg2ubJXD0xetPu4F33V278XecRvW59Z2DFDtoo=; b=QU379izyMiuxr/
	SvlS2OsoCEikzkxm/NENxytIBmm6Z71VET62SkGhwtqfUu7O+73PDWKcGzRn+Nrlsemz6JhT2BKEw
	X8Cj4JvnzPdtHEaZ08+lzPCM0oPqm9AxctlyKihZFw6dCgJAy+GoKtqH7UimrqpvFIHqsiXvDPmXY
	Q5Cbw+5fuwASkjN6xtWV5Ya6bP3zUC1qlDwOteoJjn+P1dTVE8a1Eug+9+cHJWRLPuJrgOeA4SVKY
	IqBBuFCWp0ETX01x2ZL3hecic+9yee4ssb1hjFUtMkN+fSWwj9Mf93mXmAVUX3XOn8xeoMdFhao6V
	pXxFbOdUQmSRRH0+h3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DHk-00CLs1-9z; Wed, 30 Nov 2022 02:57:20 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DHh-00CLpn-85
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 02:57:18 +0000
Received: by mail-ot1-x32c.google.com with SMTP id t19-20020a9d7753000000b0066d77a3d474so10402668otl.10
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 18:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yqRh6zFYfdvcwjVTC7gbxOs3fLzw2E3nIla7lM5ElzY=;
        b=inGuix8UwubRSyaLlm7ASL/4E2+avb2XsMoo27gGrOexgnR0Ee/diox6DrhUByiZTE
         iBP8PVzt3u7S6vmCZfIJYo1ObtAKapo1PVLuP4FgWmy1gEHltDhZc0f8VkN5PS3fnCt7
         u7JDzod7SsNbuDjPRSLyGeJZVKbcCokqYuIOh1P2aC40DubZAFM11PewnxTMu+Wjz6xr
         zj+lzF8ldRnFchCYpFfA9DVmviI08ttIChBOA6Qtz2Av+G4DFnmf+PiI59c1uYIamv/+
         90Mtbasdv3CsfyAqtzWCfVh1emh1wPoFZ2JCUTIqXqUQcFXzaTXgmq5NGJpwrm7VAMw+
         40ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqRh6zFYfdvcwjVTC7gbxOs3fLzw2E3nIla7lM5ElzY=;
        b=PP7qhYrlit5B13lOL1OxomEnCWCdwkCVF/GqOX/wGILvXfiAX7GpBMLxkZPyLjmZo0
         hJJWIAo30jG2Xq49G8dDpYvsg2k2wBRg/Je1iccn8khEEdIu7TqT7QTejlxmnleJQPnE
         gVK7cgg0yWGR3G/Wb3lXwKyV5tCBj7i7fGRwTS7EXTTOd1ixUwHIyZ8my8vIb6rg0pia
         OXb8NtJX0UH3rY9APzA+biHKHQO0dVWnBVDe32iF+PuUWR+igLEmbc0O8QeJ4DEhmxD2
         qTn4zPsskx41FdlPf/InZX3wfvXxRl3F4v+MHye8+IIjMQAF3gtDq2pa8Au0okNaPTNo
         LAMw==
X-Gm-Message-State: ANoB5pnGJKvffRMuDySi7Dzj7cW4clnhQW+IMGC+WdqHtLboc9dFWeks
	zrnizwKZbxEkthQhzCxH2+JAxTzhL0hj6GPHhjJy4cY5
X-Google-Smtp-Source: AA0mqf7SyGB2YZO1KCxAp/1+577LPkjcSeAjdac5fv8pZSEhRgwI9D6ztKN2yMNUB3avU6+cECiz+rDOEKnFdHusuxo=
X-Received: by 2002:a9d:6a44:0:b0:66c:fb5b:1d67 with SMTP id
 h4-20020a9d6a44000000b0066cfb5b1d67mr30211208otn.111.1669777034528; Tue, 29
 Nov 2022 18:57:14 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1srMj5aH4_+iwbFuu+AEgyyz85y+UPEszUGeQ7U=u19R3Q@mail.gmail.com>
 <mhng-0a99c7e2-7e15-4a5f-a5fa-1e4c844a5ecd@palmer-ri-x1c9a>
In-Reply-To: <mhng-0a99c7e2-7e15-4a5f-a5fa-1e4c844a5ecd@palmer-ri-x1c9a>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2022 18:56:48 -0800
Message-ID: <CAMKF1sryF=inn0B=n=cZi7ZmRcWh3cAtR4uq9DYJfVpD_zOpVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Align the shadow stack
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: jszhang@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_185717_332597_93EFC0B9 
X-CRM114-Status: GOOD (  20.26  )
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

On Tue, Nov 29, 2022 at 6:50 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> On Tue, 29 Nov 2022 18:47:55 PST (-0800), Khem Raj wrote:
> > Hi Palmer
> >
> > On Tue, Nov 29, 2022 at 6:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> >>
> >> The standard RISC-V ABIs all require 16-byte stack alignment.  We're
> >> only calling that one function on the shadow stack so I doubt it'd
> >> result in a real issue, but might as well keep this lined up.
> >
> > Is 16-byte alignment required on rv32 as well ?
>
> For the standard ABIs that's the case, it's so the Q extension can spill
> without aligning the stack.  There's also at least a proposed embedded
> ABI that has just XLEN (32-bit on rv32) alignment, as the bigger stack
> alignment has an impact on some use cases.

Thanks, so in this case 16byte will be valid for both rv64/rv32 here.

>
> >> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >> ---
> >>  arch/riscv/kernel/traps.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> >> index be54ccea8c47..acdfcacd7e57 100644
> >> --- a/arch/riscv/kernel/traps.c
> >> +++ b/arch/riscv/kernel/traps.c
> >> @@ -206,7 +206,7 @@ static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
> >>   * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
> >>   * to get per-cpu overflow stack(get_overflow_stack).
> >>   */
> >> -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
> >> +long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
> >>  asmlinkage unsigned long get_overflow_stack(void)
> >>  {
> >>         return (unsigned long)this_cpu_ptr(overflow_stack) +
> >> --
> >> 2.38.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
