Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44698C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFi2bd20YpRN3mgLoC4lAG9aWbQ/DAtF2NX3SjbG/fE=; b=cIaPbBPSFWgaDh
	bkp1G9RcLcXbKTu8hKPS4xCm27Oyf0qFm/1wiP+wobPf6Ab2zxs747av1upzeAROfFHyPT9napiUZ
	BytHwk5NyDsnXwTZyHKgiXeOf+PGeOyO4W9nMtsvsTzGXrMsVxz7jsHVMQNG5/wGO+wUwgIFI9+y1
	l862fGOOGVLdMtRvMn8dkasAGVfdvwz7MCqEH/2JyyVVgTR00S8iBP4U4yahbAtKZN+UD6r2jtabv
	z4qvHgkHpSNsHxJsEmhxjuNKzp9d9U874o2yC4CVn0VVjjBN5My5pC5RKhraLQBWqYt6PUXn+Rde7
	e0gHmEw3cXPznc49Nf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMiZ-00F641-9L; Mon, 04 Apr 2022 13:26:03 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMfi-00F58L-I3
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 13:23:08 +0000
Received: by mail-qk1-f173.google.com with SMTP id v13so7563690qkv.3
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 06:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZellbTNVDmTMxAgtDVNk9zjzT/qb3sIv3YZKoTrbp+w=;
 b=lPciN2x6QZCqVh/Js7Pit806O7qw1tOBB5JTfC9WjnFJo9ZmdhRs1QMdqnMIwRgqVg
 sbR7tBSc7U4RynmhbCIGnD9JCKKB+mB9vRACShmlg3lwaSGJ/BhOB0TEas13coRI54le
 EHuWL02HO5scgBvmm3SUBWr0lXb+14IA9GczvczDUfp/etshG9GP6PzDGbAStcRgrdXF
 GacIYgoVBK2Xfx3C4RL+ZbalLAhPxtOFLFqha1P0pktsDHGzPuw0JRHjvhJ5h22Mp0Q2
 Pg2jSQEGQro9CUET+tkLV34EzwHYxVoU6kOsm2zLjn9g87WqNonCZiIRNn2frWwMTQou
 kVtA==
X-Gm-Message-State: AOAM531tHy4U5YxHw7TnZqS4NCSqjsDrLViV0/FLtX7sLQtgDA2rHOmS
 Xt1/lbkXp7LDrnSn0xI2qEsKaAsDlrINLw==
X-Google-Smtp-Source: ABdhPJxQe56DnugvjOHfgBSGaFo8T5pv/HxkMrg2PofRDviUP/Qo4sU04upBPfgVBLM6ZIDm++LhZg==
X-Received: by 2002:a37:e116:0:b0:67b:b26:a837 with SMTP id
 c22-20020a37e116000000b0067b0b26a837mr14141750qkm.87.1649078584530; 
 Mon, 04 Apr 2022 06:23:04 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 i18-20020ac85c12000000b002e1ce74f1a8sm8371087qti.27.2022.04.04.06.23.02
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 06:23:03 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id f23so17525469ybj.7
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 06:23:02 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id
 66-20020a250045000000b0063396e22179mr20945994yba.393.1649078582711; 
 Mon, 04 Apr 2022 06:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Apr 2022 15:22:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
Message-ID: <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rich Felker <dalias@libc.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_062306_673326_D23CA69B 
X-CRM114-Status: GOOD (  28.67  )
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

Hi Arnd,

On Mon, Apr 4, 2022 at 3:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Apr 3, 2022 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
> > On Tue, Mar 08, 2022 at 09:19:16AM +0100, Arnd Bergmann wrote:
> > > If there are no other objections, I'll just queue this up for 5.18 in
> > > the asm-generic
> > > tree along with the nds32 removal.
> >
> > So it is the last day of te merge window and arch/h8300 is till there.
> > And checking nw the removal has also not made it to linux-next.  Looks
> > like it is so stale that even the removal gets ignored :(
>
> I was really hoping that someone else would at least comment.

Doh, I hadn't seen this patch before ;-)
Nevertheless, I do not have access to H8/300 hardware.

> 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
> changes, but I think
>     Rich still cares about it and wants to add J32 support (with MMU)
> in the future

Yep, when the SH4 patents will have expired.
I believe that's planned for 2016 (Islamic calendar? ;-)

BTW, the unresponsiveness of the SH maintainers is also annoying.
Patches are sent to the list (sometimes multiple people are solving
the same recurring issue), but ignored.

Anyway, I do regular boot tests on SH4.

> 5. K210 was added in 2020. I assume you still want to keep it.

FTR, I do regular boot tests on K210.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
