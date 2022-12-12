Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BCDC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 12:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CD5fEM6DoXMAQusJIPTL/gsuwiVxB9LjwC3rEeMoEGI=; b=ZwdAkLdoAHUy70
	HpQFD2Attkc6kPfi0Ppya3r0vIH2TbCqhRAiHHSvSwfRZJen/pc/cY8w3OilGIoyi+UKcyttwQYJr
	dJsPSS9rJiS56I/1bTartl5bfSDsYYw+4YaFGAw2us3IgVlrTZvmE+wukx15M1fRH/jvinN8mNnbl
	Rb8D3RIpYNnkiPssRbRh7D4UBzFGSnHhQBImY9uyal/qVb3n2E6bJqsh4CIyJcfYhEShd/Cnth1In
	2lgG1Xz9iK3yigNFZBS0gOkiyw3a+LWcdL/1iOrVGFLaqY1K6/kkwwIJujhJqWuTys3bwyL/Xw6qJ
	/P/QRLzhjdj1EyGFIxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4iAQ-00FnDH-Ax; Mon, 12 Dec 2022 12:44:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4iAM-00Fn1g-M8
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 12:44:20 +0000
Received: by mail-ej1-x62a.google.com with SMTP id b2so27605299eja.7
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 04:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo5rX9zwsDVbZ9n3tMalIsDj/tL5wgSzcTcC9ofZ7K8=;
        b=WnSOWC5mjA7ATzz7aEbwDpZ/rF9tYAZzGvDmauZWdhdKc7uP2opptw4TWckLlGM5L3
         I5DfAzfD46dfIQTI+o9MxBG8laSKBmG3EmXLFaKRpN0uHbOnHQJp+ZiSkdKdvbMlZh/t
         MGTVu6gzD0y81Fq0xXZ2R7LlKAAuizu83xl0hV+KJyE9swU/IUhaCARBIqvqh29MeoQW
         f3rGxUJLR3uUsDbDKvkLZIWLhsHWE52Tt6a66Z9LLLXaWFuHzZGyaoftwbUH4b7oCYJz
         XlZ64UR9lr2jrm21XM7aId9aLn2Fv2u5ErXlFHW1tot+QS9jzW2WkZ9CxT6vWRmXWw/B
         M/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo5rX9zwsDVbZ9n3tMalIsDj/tL5wgSzcTcC9ofZ7K8=;
        b=lTUs4Sv9XkfhN0gW774pL/QYrd9X9FwJmHrKtF6YoFyIVxIQquphn3cP08I6MC1V/V
         s6sFsaxZN2cpuEiAseFmXb9GaPZptCCRDQagORm0uNNG/vDu/VNy125goEPptCYvr1rA
         dJ93N5w0mKhWfauiSlW77xG86u2Br40fr8c9rZp+2KKJm/C56T1iYRm4DdUHK+1b7bcw
         1BKTmxTBudtKZyGb9QIuwieYh2vPX/mZauEOjuoUi+IgHKK6gaZWEmbWniQBRrkO7DPb
         KCMTVadX63mwXVdFaCh2a+F1Is7WTH3PoPxGkl1Gl3UvmQrnuI01ZBpOYItPUYWNshNG
         Blcg==
X-Gm-Message-State: ANoB5plKM+1Uvkr+9W+ppejPZ8UeUCQnF95Rf/YGYMDVosV37Q0Wl0Ut
	St5GBo7+JXjAjdEA+NGb6+klFqGznNy38/az0XY=
X-Google-Smtp-Source: AA0mqf6q+G3V6C1NtaK+NhPf3i+fYm+Vz1dXxX8KLIoR5R+gSq7gOhoyCs/CKp3vxkg+/eJcZDHIs3GGoGCp79xA54s=
X-Received: by 2002:a17:906:5156:b0:7c0:efb6:8744 with SMTP id
 jr22-20020a170906515600b007c0efb68744mr16355200ejc.267.1670849056671; Mon, 12
 Dec 2022 04:44:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+V-a8tQD8gHA9Q2oBNYTAZTMwEik-gGVraEWP47FyFNE+E+9A@mail.gmail.com>
 <mhng-78fcd2c1-3309-4aed-9c2e-6023506de6aa@palmer-ri-x1c9a>
In-Reply-To: <mhng-78fcd2c1-3309-4aed-9c2e-6023506de6aa@palmer-ri-x1c9a>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Dec 2022 12:43:50 +0000
Message-ID: <CA+V-a8sf=JLBzHR1+Ou6sm7D+3s9ZO-_SBtO+XZacDOkedmAQg@mail.gmail.com>
Subject: Re: [QUERY]: Adding support for a platform
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Waterman <andrew@sifive.com>, jrtc27@jrtc27.com, binutils@sourceware.org, 
	linux-riscv@lists.infradead.org, Chris Paterson <Chris.Paterson2@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_044418_742862_8DA0F813 
X-CRM114-Status: GOOD (  27.54  )
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

Hi Palmer,

Sorry for the late reply.

On Tue, Nov 29, 2022 at 9:54 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 29 Nov 2022 13:40:53 PST (-0800), prabhakar.csengg@gmail.com wrote:
> > Hi Palmer,
> >
> > On Tue, Nov 29, 2022 at 8:57 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >>
> >> On Tue, 29 Nov 2022 12:21:31 PST (-0800), Andrew Waterman wrote:
> >> > On Tue, Nov 29, 2022 at 12:12 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >> >>
> >> >> On 29 Nov 2022, at 19:28, Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >> >> >
> >> >> > Hi Palmer,
> >> >> >
> >> >> > Oops I should have included linux-riscv to the CC list here (doing it now)
> >> >> >
> >> >> > On Tue, Nov 29, 2022 at 7:20 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> >> >>
> >> >> >> On Tue, 29 Nov 2022 11:16:29 PST (-0800), binutils@sourceware.org wrote:
> >> >> >>> Hi All,
> >> >> >>>
> >> >> >>> If this is not the right place to ask this question please let me know.
> >> >> >>>
> >> >> >>> So we have a RISCV platform (Renesas RZ/Five) for which we need to
> >> >> >>> adjust the TEXT_START_ADDR. So below are my queries:
> >> >> >>> * What is the procedure for upstreaming?
> >> >> >>> * Are patches accepted for individual platforms (for adjusting TEXT_START_ADDR)?
<snip>
> > Enabling the local memory (ILM/DLM) on the core is a specification
> > option and is enabled on RZ/Five SoC. I'm checking with Andes if this
> > can be forcefully disabled.
> > The only use case would be to speed up things for some slower block
> > (but said that its user application specific)
>
> If it's possible to disable this somehow that'd be great, but after
> writing up the "maybe we can context switch this" bit I think we could
> probably get away with some sort of compatibility mode here.
> Essentially: Don't allocate out of this region by default, but if
> userspace explicitly maps this region (as happens with static binaries)
> then allow it, but track those allocations and begin swapping it on
> context switches.
>
Do you think even with TEXT_START_ADDR change user space can map into LM?

> That might be a lot of work and would definitely be slow, but as long as
> other VAs can map to these PAs then I think we'd be pretty much safe --
> we'd lose read-only and execute-only permission tracking, but existing
> binaries would still run.  That would allow this TEXT_START_ADDR change
> to be just a performance thing, and we might want that as a tunable for
> distros anyway (for huge page alignment, for example).
>
Okay, I'll create a patch for the TEXT_START_ADDR change.

> A lot of that would depend on exactly how the hardware treats these
> special VAs, though.  Probably best if you just dig through the docs,
> see how this all works, and then propose some rough patches?

I checked with Andes and it looks like we cannot disable the local
memory by registers. As per Andes [0] (page 30) if the VA is Local
memory (LM) it straight aways treats it as PA and it never searches
through TLB (note there is a arrow missing in the diagram VA->PA if
LM)

[0] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
