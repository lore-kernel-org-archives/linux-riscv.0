Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CBFCD5BC8
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9xY+6OlkkwXcYewM+vnKGeYBTjb/VzcYIcwhNKb6vw=; b=3xLiJm+Q/tdS9X
	GmZhQxU6Ykjly4Q9KnidK6QfR0HUh/gV8KziGyp01+ct/IEURr3mwIa70RRkWiKaAZbLsXCsDrcEN
	JAzgSPvPGRxD0jr0jMA2aDFAIaG36Acfm4y4mDAVvs10xCeXvwqa9QmywgJovNN4ygiuYoVXxHaC+
	L2IfTjrnkeayyHB8AYrH6n/2PwLfRBzu34RCaNv6bEZT1dtpEPRiBWXwXk1nDRaRaZpnX6qYY47oZ
	gLl1KoalEvfiYm6SYuGE2U/zeTVk60Qxr+vs72wS904C7j6B8QtwyigNBoknkHWHpilhws7XYTmcw
	svcqd55SK5PoCtl49XdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmsP-00000001LXd-2pzk;
	Tue, 26 May 2026 08:11:01 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmsN-00000001LWt-0OKc
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 08:11:00 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso11639733e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 01:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779783057; x=1780387857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lTP6MMwy4pS6KbZKn87ULNoqoY47p/A1CVPh7q8jp4=;
        b=nuwfs4rifMoskWEIxJQ39nz8Wfe5TqbYXDbV2U4qoZyDRhxaHrRK9AJRylww9+uOpo
         s7uMaAp2r1NR2EYVupZYtTp2T7iVjzJyYOpcP7nmp5iJfm8o/B2re0lL+2ioNeWvUSEq
         i+Sp8cUm/Mmq2o6ESljLFW6/ifvyAY4o4ff/Qq5WrKLxLV2cghAE5DhBD66mv64KifMY
         L4woVVJulywd+WKeIfNFtveMAkcA6Zy+t1J7+vU0b4PvAA9txtmgUYVf7FF9wW1gM+2+
         ODMmo8RQl925cnScM39AxcfWuArsDrq+eTnI4A5Si1+g9btIpJKOM7PRI2Xo8/rxFjaD
         QZcw==
X-Forwarded-Encrypted: i=1; AFNElJ9f/XD7e4qsywjZNhTvAnZ8UAnQj6vUVuap2cbQN6NeJm7FYK5nwtn7+bMDLxA5hm3AB2hUeqsm1eaiug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5gpkYty18VqEyq5MF+3ShcDVgU677qCr4gwGg4IuAyKNzilU2
	yiKdNVHgKin4bBHOgwMXdNjP0k35SoruJcoLrNaKLtI1tMMzEiXNCboExrJPVb9v
X-Gm-Gg: Acq92OGnheMPR/BL+E7GnLVtPXANRyVX52p/G1AydNG3uFBYqH1xGhMSvhx6iDQvfks
	aTlAr2EZVBhwFa+U4eRtsJWRU06rTYfHGCRmpCw3EdYqoWZNqArCguFVoPKDufHsQRMK9BnFAyl
	EGPBU0xbVqtDfZR4VR8IfSFlYy7patBxblvsdpWypqhiC9wGQc3E4mnwAQoBE2BfnSbP7FWLOYz
	anzapB/VBypmAccGwuxAShgBGeiJF4UJztKstHhQ3eo07ajABQRpexrxOReH/AHo2F9UGWbUTqd
	IRddnNymbbd74NtmATkAipdChVgQDC+5V87AKCUBORxrm0ebVVFnjLQSHKxN4CR16GuLO4lv08O
	5sXGpa0zD5FJtxH3GJ1Pj1uxLTzKx8zBJL5RrJ3I07nXuh5Or0ydpEcREFZ4+DLNr6HjPNOtuXd
	7ud09lX5KH/k6/AfOSBq1lB0RCHD1W43wNt93hHuTiWNzUEguS3/Ok3RV6WqAv
X-Received: by 2002:a05:6122:916:b0:575:f155:8cd4 with SMTP id 71dfb90a1353d-58682f2c0c2mr3909163e0c.0.1779783057473;
        Tue, 26 May 2026 01:10:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-588c129cba5sm12934228e0c.14.2026.05.26.01.10.56
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 01:10:56 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-63201e0d6b8so8740751137.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 01:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9kuxtUm67kzoHd6rptTusaTHLC1ZuAd7iFLbEqHZgvs35OkP9a9Je3dhzBy5u77096PJDpXZjdC+d0mw==@lists.infradead.org
X-Received: by 2002:a05:6102:2a4c:b0:631:44d9:2ca9 with SMTP id
 ada2fe7eead31-673cbd0a917mr6568746137.13.1779783056566; Tue, 26 May 2026
 01:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260503040331.71875-1-julianbraha@gmail.com> <fd28add8-fa62-4655-a630-0293473fc758@kernel.org>
In-Reply-To: <fd28add8-fa62-4655-a630-0293473fc758@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 May 2026 10:10:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNBdYJfxdaUOEmuZUvDMGRxD-7uRRVhW7CZqK_UNpvgQ@mail.gmail.com>
X-Gm-Features: AVHnY4IxCBQRQwRrHoNhM4qpyFTjlN9TBUyPFpLI1x90SI005W0IVz0VySyc8-g
Message-ID: <CAMuHMdVNBdYJfxdaUOEmuZUvDMGRxD-7uRRVhW7CZqK_UNpvgQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: replace select with dependency for visible RELOCATABLE
To: Paul Walmsley <pjw@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Next <linux-next@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_011059_162461_7137061A 
X-CRM114-Status: GOOD (  20.13  )
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

Hi Paul,

On Sat, 23 May 2026 at 01:48, Paul Walmsley <pjw@kernel.org> wrote:
> On Sun, 3 May 2026, Julian Braha wrote:
> > RANDOMIZE_BASE currently selects RELOCATABLE even though RELOCATABLE
> > is visible to users. Some other architectures, like x86, use 'depends on'
> > for RELOCATABLE in their definition of RANDOMIZE_BASE, so let's do the same
> > here.
> >
> > This select-visible Kconfig misusage was detected by Kconfirm, a static
> > analysis tool for Kconfig.
> >
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
>
> Thanks, queued for v7.2.

This was applied twice to riscv/for-next, in commits 7bce18b7c0835686
and a74483879d1d4769 ("riscv: replace select with dependency for
visible RELOCATABLE").  Apparently, the second commit is empty.

I noticed because it broke my workflow: I use "git cherry -v
linux-next/master master" to check which of my patches were accepted
in linux-next.  Thanks to your empty commit, all my empty separator
commits are now flagged as present in linux-next...

Thanks for fixing! ;-)

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
