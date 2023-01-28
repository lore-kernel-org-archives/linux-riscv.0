Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47CCC54EAA
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 02:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUKjPvNUXmAy/3pdQhk60+6n26XyqhOBpBvB+FFkX9U=; b=mZWt8rWdFOQzIu
	w1ns0VNklKrKwY+IcVfB0l1IrMPBO0ta4XIsUH2h5m5w4EFvODKdhNsxHVocOQoH6HOLG9orfpWS+
	OE0NzDoFh2RUOTztBibdSyF5uiusaFqdiZqxKA7L6ypKUto1IHtoQHnR0ouN5NmfzTVYlqMAf+8Ro
	r7pr4beZa8m1o2vCDlXTiL5ZrS8sBc3UQUJBDYM3XuZwbcprgaxW8tZXKupSfnhuaVhN8oTqYufGV
	JGNlaez6DR/r7dHigpgIl0MGbEQ8iA1yWYXziAMyzlfBXq1e3G0n1Pcl0HU+aQdduRgQFlAmKoGhU
	5Bfo09EDpnTsb/jEAWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLbFm-00H4h7-6f; Sat, 28 Jan 2023 02:47:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLbFj-00H4gi-58
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 02:47:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BCCF3B82221
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 02:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7EAC433AA
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 02:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674874054;
	bh=ERyDVuQcGxHlQvFe7UxhxT7d/oa1lfTJ1tWjBNFn0JY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NzFmIkIosaf0UZnSIFZKNB23huh7yfcsyAx80PE2FrhKN/Isz96H7FKG7IA7Ll8Ht
	 slcyYeDLNZl3MmhUtBdNTyx9Y/MHHNE+n4gT4Cx5J57B6BODbpTCYqsBt6R2J0Mpqk
	 GwRKzPiWH8vV5PR5DxuEwKwXfGDqkwDmnxU5dz8EBBwR2YBuH6R1J/fUQkBiteUWNd
	 sTRBIYTrqN3x8BYA+YgyWKAmu8PDAT1GXJFYhZSr+CU9QM1Tz2vJSx6nMNPm7XXzOk
	 vdeNp1DYd2ZIGq6jzEXsi+d9MkTNuHfApxtUPGR+CiXAqdmcVxSlPRS2sEBvCg+uZC
	 mQq/KgCmBC1nA==
Received: by mail-ej1-f48.google.com with SMTP id p26so7138685ejx.13
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 18:47:34 -0800 (PST)
X-Gm-Message-State: AFqh2kpcOJ5cjxenqOUc9PTto8ryTyx18i2qeqzeTlEVShsPuYbA7C9X
	dm5PoguTf8humH7YMVjVokWlyimEy/ymomKxG74=
X-Google-Smtp-Source: AMrXdXsVUvOSSWf32xpCd00GV+QlU0zCda4LZigTo1vZLg+W5LKZ0dp29lcwDELLEX4AwyCpS6j6neY6bNraOEZgy6E=
X-Received: by 2002:a17:906:6d97:b0:85f:f320:2cea with SMTP id
 h23-20020a1709066d9700b0085ff3202ceamr6167528ejt.89.1674874052984; Fri, 27
 Jan 2023 18:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20230127035306.1819561-1-guoren@kernel.org> <Y9RgBh9X6KM1/uvp@spud>
In-Reply-To: <Y9RgBh9X6KM1/uvp@spud>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 28 Jan 2023 10:47:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTdQOc1XFGx6UEZ6ABYTFkX6Ott53Z1ZDzeU9e4k=SRww@mail.gmail.com>
Message-ID: <CAJF2gTTdQOc1XFGx6UEZ6ABYTFkX6Ott53Z1ZDzeU9e4k=SRww@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
To: Conor Dooley <conor@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, conor.dooley@microchip.com, 
	apatel@ventanamicro.com, atishp@atishpatra.org, mark.rutland@arm.com, 
	bjorn@kernel.org, tongtiangen@huawei.com, ajones@ventanamicro.com, 
	andrew@sifive.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_184739_533054_9210349D 
X-CRM114-Status: GOOD (  26.17  )
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

On Sat, Jan 28, 2023 at 7:36 AM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Guo Ren,
>
> On Thu, Jan 26, 2023 at 10:53:06PM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > In commit 588a513d3425 ("arm64: Fix race condition on PG_dcache_clean
> > in __sync_icache_dcache()"), we found RISC-V has the same issue as the
> > previous arm64. The previous implementation didn't guarantee the correct
> > sequence of operations, which means flush_icache_all() hasn't been
> > called when the PG_dcache_clean was set. That would cause a risk of page
> > synchronization.
> >
> > Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> > Changelog:
> > V2:
> >  - Optimize commit log
>
> Probably would have benefited from providing the analysis that the arm64
> commit did, for riscv, rather than referring to theirs.
Maybe you are right, but they are almost the same for this patch. So I
didn't want to duplicate the commit log but gave out the original
instead.

> But that's not really important and the diff itself seems sound, so:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Thx.

>
> Thanks,
> Conor.
>
> >  - Rebase on riscv for-next (20230127)
> >
> > V1:
> > https://lore.kernel.org/linux-riscv/20221023133205.3493564-2-guoren@kernel.org/
> > ---
> >  arch/riscv/mm/cacheflush.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 3cc07ed45aeb..fcd6145fbead 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -90,8 +90,10 @@ void flush_icache_pte(pte_t pte)
> >       if (PageHuge(page))
> >               page = compound_head(page);
> >
> > -     if (!test_and_set_bit(PG_dcache_clean, &page->flags))
> > +     if (!test_bit(PG_dcache_clean, &page->flags)) {
> >               flush_icache_all();
> > +             set_bit(PG_dcache_clean, &page->flags);
> > +     }
> >  }
> >  #endif /* CONFIG_MMU */
> >
> > --
> > 2.36.1
> >



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
