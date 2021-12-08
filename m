Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A41C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Dec 2021 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7EZkHX2M+MS6eG9pfTM8xcaUsclVJhcjM/Q0wt5RXQ=; b=H9Ek+Q0GtVnDPH
	0PbtlkrwTt0qHrGno7HaEXzl59IYQPFWpQTefsrTkwXykBr0pqt9WwVZNhCoaVlD08uuChL+qeMoc
	xFzQgkrEDaJ73bwU+PR0v2wMnxLWQAsMWr2L12j1wOV4z7LnTJevYaTW7fofOt53xOcDvXwY5x+5j
	noBVXMOM2TDWXzGJ0rV8jnTjJBmY56p1tfiQnZ5pyIvktFE3CNhZ0PGNiNl1TVZVwmeO2kjP5e1sf
	DZUE16fclehDq8ZFHsRYRvRMgsZ7Woghql8P9UtDTjZgrJCIDK8csQ3l7iiJEvBEWIRD3bNWwWCib
	1LRKmrNhoqOxIR1lT1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mutA1-00Bsml-A8; Wed, 08 Dec 2021 09:22:49 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mut9y-00Bskr-Kb
 for linux-riscv@lists.infradead.org; Wed, 08 Dec 2021 09:22:48 +0000
Received: by mail-lj1-x234.google.com with SMTP id u22so2846643lju.7
 for <linux-riscv@lists.infradead.org>; Wed, 08 Dec 2021 01:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2tSCHCqfSK4pEQWNDYT3sY9fxle9rvZ4/DzOIeyubM=;
 b=ngH69gtt+KeOf6V7oXzPHyryzf0BV6LzodeqY8KXBnAakFu1+BKYZvqZNM7GN1ibLr
 /YyGgMmPoGQuUKZ+GxyTa2YD91fRUC+AKQ5WtiaqAubVPKKFi8lI6/9+jCPXx0I6Ygny
 7i+aZqW2EgeyuRRzaJgaIX00ziMi9BHg4c6k937I8mRkUFSAK39xIImY78xbxahZVMbb
 EA9QzubZKV4b4u7LSBDqqM3FGKW5EI7/y8Yq38znW7lYQ/ELgh4mQZfh1AF19hBR8dvA
 vSoHn7g2wY+nrBMV0X4S476APQ01GbU9LZLz+3BQw1L6yRZcgLMDoqILoNe2t9tk6v5X
 Bi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2tSCHCqfSK4pEQWNDYT3sY9fxle9rvZ4/DzOIeyubM=;
 b=fh/AZbLYVwQgEWmxaH0ct8ENhV+x8zbcY6xl2Tpfda2qKTKETqPDj64ViHbeYVgBg/
 c+FddulxVrPrdnAmWCy847uSoFUrm+bSG9vwlb+/EyO6kqYFeLF/XMWBC2KCqNE6QpzQ
 FijyVLh85MPDqJJOGGcrg82R3iYm58Opw9bBtAjjcD9AfOUzeyOdS9Odbon+Ieqisctk
 dfq5CgdpCSWgm6HS9/LMPUFSSprmCAq0QodXGDG0a2PyNw4bI5gj3UQFxG2AVtMeta8T
 519xBpv7p2zql2hK6wQMVJij80JSO/qoK42yT/bO7XJVTpVnddbUm+FxLR5psI8zM3Yg
 VvyA==
X-Gm-Message-State: AOAM533//k+3aKDr7efRys0x/tv07a84APQupHydwXPz1TVvdOOfNpug
 xw7FTACvNYvxqEgtOnNzf/DIc22wljA3OJITmefEfJbsrfM=
X-Google-Smtp-Source: ABdhPJyBc//wB/JpYHeEC2IZ5cZZrH09/mGfMorl76XoRyb7O48UNZ3bKFR2OlH0yvV5HRH3AhgFOBjdHgsL3vzA3nE=
X-Received: by 2002:a2e:b6c5:: with SMTP id m5mr1878864ljo.220.1638955364580; 
 Wed, 08 Dec 2021 01:22:44 -0800 (PST)
MIME-Version: 1.0
References: <d2e681e5ea31c62529b619a3777570b4792e0684.1638928796.git.zong.li@sifive.com>
 <87pmq7qyzt.fsf@igel.home>
In-Reply-To: <87pmq7qyzt.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 8 Dec 2021 17:22:29 +0800
Message-ID: <CANXhq0rR1KRunK1iCH==23wJXuyZm2kMLzKCTd3aJpfazh+rOA@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: sifive: Fix W=1 kernel build warning
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 lee.jones@linaro.org, linux-clk <linux-clk@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_012246_746003_16D437C7 
X-CRM114-Status: GOOD (  10.89  )
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

On Wed, Dec 8, 2021 at 4:31 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Dez 08 2021, Zong Li wrote:
>
> > diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> > index c220677dc010..c8271efa7bdc 100644
> > --- a/drivers/clk/sifive/fu540-prci.h
> > +++ b/drivers/clk/sifive/fu540-prci.h
> > @@ -13,4 +13,9 @@
> >
> >  extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
> >
> > +static const struct prci_clk_desc prci_clk_fu540 = {
> > +     .clks = __prci_init_clocks_fu540,
> > +     .num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> > +};
> > +
>
> A header should only declare things, not define them.
>

oh yes, let me move them to fu540/fu740-prci.c respectively, thanks.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
