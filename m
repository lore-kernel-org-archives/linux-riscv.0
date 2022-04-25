Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2883FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hA8MqQuXI88ivosz7lmhG5AiF05yh9RPLRn/z59W9YE=; b=G/q6SqV8eEUHD+
	Qlbg3hvcetpopH2nlMouBfRt94pvpi84CrWrTjOiWE1xUGd1UhvC3QZHNpj8WesoEqZZ14jm1Ojd8
	q9gvCc7eISQpdxufE37BxT3UTdX3CgPijbj5wBzgXfD44w4IIy6B8nyws9B8V1eo7Qo6VWpDIGl0d
	1tQic/ZpANO+we/9PMLkHpzFuLSIhrvs+OwOG1qXDj/tOb96+moA11P8WZ85b2sRoh3nAO5mNAQY9
	uk9rUgKJ8f+FRxgfqSnGzjFGXAd8tQ4XgCRicKNEzs+R+V24yJqe50ol1bqdaGTLSbLgQAOUCYqji
	zpz6N4q1ZM3iPMbC3xVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niyY3-009cKR-5U; Mon, 25 Apr 2022 13:14:39 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niyY0-009cJc-9X
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 13:14:37 +0000
Received: by mail-lf1-x12d.google.com with SMTP id y32so26109238lfa.6
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t0frPbcFivr/mUdiRu781o3Wa9Btm1C7EFtWPzSdw9g=;
 b=VRd7VbuT8nJJjq0/HdtUBnNE9nN/OzM26/5YnlSVWDEZYk4Y0e65UD+cIYpJCj+bCK
 z+1Kgg9b/vG4SnjxmKqyKjcnnGii53a4eFblsuDkmdBWP9lsTYK7tn/uGXrrQ2PbVyA0
 /HXWoj+0HtzRXTOH5jYKRKDgQ7TEg7yXaZdYEb8549qg5XaPYN9C6tJX7r/GM2ubg3bJ
 TjaRPwZYp+OO80JVwpQrEkUYyF3urhZ2aPR84Toe+u/ub2L/j+j2jbzNZX9TD6JGAiBs
 ScnFTU8jAhSOV1v5Tmz2mYiFje1SCu189CtwkRvKUOASNaAdppvILULuw6Ym0+KJxJVK
 K9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t0frPbcFivr/mUdiRu781o3Wa9Btm1C7EFtWPzSdw9g=;
 b=IzG2pyfrPKHhxzgMO+I9PY458Jy4EaXin6q4gApN9T6eyr78kbN0K+f/VydRcGTtZG
 3C4j18V2RdLzu5XWl/1THqSoN4+QlertCcvPjNvvETxqy6D7zTmhMK2p0xFc9sAsbHpA
 6fKUVefQTJcMPKmLdX3EYbM4LWjm1zi95PTH6mjJtws069CinyRHaZsmOBmbubITYOuy
 bosPguYyL5NkTqhiiFWfiIQHDs74VPAFmfzYQbUeaTGHoa253tJILUEzwxyhRQ8+tJPR
 rPiXn3JLwoUUPslh3wb9yLg54driaL+YjV5O3WMoeWJGw25gHkebdpmKT+u9btrQPt4/
 Q82w==
X-Gm-Message-State: AOAM53337gQal5CuFy/IWlXGLuXeWI0BNVtpqA94oS2kfUVXyjbAltIT
 5Zg5U4+GnKJCsyNXQUSMz8vM2paZ+JevF0E2E0hHkA==
X-Google-Smtp-Source: ABdhPJwRfqdhVx3yV5wt4b627Kq+COlg3963BXQh8eRoMVyvXuCRX36cyRQuyTqc0V/Rn/e9S/uCIWgYCRxuPxA/II0=
X-Received: by 2002:ac2:5f84:0:b0:471:fd0f:a6e7 with SMTP id
 r4-20020ac25f84000000b00471fd0fa6e7mr6792261lfe.41.1650892471699; Mon, 25 Apr
 2022 06:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220422211055.9278-1-palmer@rivosinc.com>
 <CAMuHMdV7d4XfStMiSmU3eZBb3mdHdsvqJZff358Rf3Cb-Kzx+Q@mail.gmail.com>
In-Reply-To: <CAMuHMdV7d4XfStMiSmU3eZBb3mdHdsvqJZff358Rf3Cb-Kzx+Q@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 25 Apr 2022 18:44:20 +0530
Message-ID: <CAK9=C2WTY8+-98XuxRYTaRe4aVJufaB5wr35KRoTKEttUM7JzQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow the used to downgrade to sv48 when HW
 supports sv57
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_061436_373983_6AD60E4B 
X-CRM114-Status: GOOD (  27.18  )
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

On Mon, Apr 25, 2022 at 6:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Palmer,.
>
> On Fri, Apr 22, 2022 at 11:42 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > Similar to the previous patch, this allows a dt-selected downgrade to
> > sv48 on systems that support sv57 in case users don't need the extra VA
> > bits and want to save memory or improve performance.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> > This is on top of the patches from Alex's set that I dropped.
>
> You mean "[PATCH v3 13/13] riscv: Allow user to downgrade to sv39
> when hw supports sv48 if !KASAN"?
> 20211206104657.433304-14-alexandre.ghiti@canonical.com
>
> For both: "DT describes hardware, not software policy"?

It is possible that HW is designed to support both Sv48 and Sv39 but
there is some errata due to which Sv48 does not work correctly ?

We should allow users to downgrade the MMU mode, due to
their own reasons. In fact, users can also disable an extension
by not showing it in the DT ISA string.

Regards,
Anup

>
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -740,6 +740,11 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
> >                         if (!mmu_type)
> >                                 continue;
> >
> > +                       if (!strcmp(mmu_type, "riscv,sv48")) {
> > +                               disable_pgtable_l5();
> > +                               return;
> > +                       }
> > +
> >                         if (!strcmp(mmu_type, "riscv,sv39")) {
> >                                 disable_pgtable_l5();
> >                                 disable_pgtable_l4();
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
