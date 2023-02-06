Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF915C05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wxtcWN6GIQfyZBEZNfBNjUXRr2KYcvPeHrfTKMlC0Y=; b=up3xonG9K7MPZk
	/MBCorKKV5N0I31fJe4CAIB+32FpK4rZ697s2z5PGGWTl50nwDZK2C4aH+wXEi/qH/JxFLqqRt7Df
	C7zGAqMk1RgeNt174Gu9hrCVx1A7paRvsXeT8EAF18KL32TlJRG7kKJgH/aHFgGwWMwJ9r5+czXbO
	epOQsgDEHgPzwg6Vac92f8l2daI2e+WKABFLedTp4PxstBRm03htd78U93jTwggK5+i5ykRWIRkzM
	SVL6W8s3eaB9/jjOg4nROLIjhA96mq/OpDbkQCn49Uxmm+Z9P803ocjTt8nHSVm4+y4sROUyshQGw
	/AVXRZDoqy/TjvlEA8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0J9-008Qj8-NX; Mon, 06 Feb 2023 12:09:15 +0000
Received: from mail-qt1-f174.google.com ([209.85.160.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0IL-008QCU-U6
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 12:08:27 +0000
Received: by mail-qt1-f174.google.com with SMTP id f10so12439047qtv.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 04:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02Ztaz85YCyWse0OOUudyylXWESo7R0bW8bc2JlaDZc=;
        b=uVEM3oszTg7j6MIoMk8g8EZYU/+WUHGPyWobtWatRewK9AMPG9P6aiNwhS4w0DGFcd
         +HonKrIkxTbduMu+LKxLW8Mv+3cgGgT06DaUKjmkbYeBirbnGiLY6yMc+P+p1jp2Of/M
         8rhp0FEelmzEnQv8ExdnOCarnfplVD5v4mqLvMGqPSFoiDt01nscuHrbuxE5uReOVCgL
         FZyDdOuBpT/g/JQV0Zm5RHrgfTMAfsHqWuhYtHj8AjKNtvJQPJflOF4MUDoBKZ67BRey
         IBMltz5CR3+1492yJUF5Voj3UwPO0E20LTitVPN00KaqA9ZjOtQGP/h8bDyOUScEStmW
         xk+g==
X-Gm-Message-State: AO0yUKWN55ViEhhBnWukn/lFkaYbkuGKFmPuk3jZlkXs/XkoKZP5wnMv
	4MfdgahUvY2Hu4XWon5qs7esY/ZyAXHilQ==
X-Google-Smtp-Source: AK7set+rv2jBRanGsypIUQhynuLyDfVNNb97SiveNY6RSwl/ubZyBj2c6aIZ2KKMA8FjCIbptxl/CA==
X-Received: by 2002:ac8:5dcd:0:b0:3b8:5057:3776 with SMTP id e13-20020ac85dcd000000b003b850573776mr36225654qtx.13.1675685302503;
        Mon, 06 Feb 2023 04:08:22 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 63-20020a370a42000000b00719d9f823c4sm7205785qkk.34.2023.02.06.04.08.21
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:08:21 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 74so13873558ybl.12
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 04:08:21 -0800 (PST)
X-Received: by 2002:a25:e912:0:b0:8a0:2a4:a96c with SMTP id
 n18-20020a25e912000000b008a002a4a96cmr214639ybd.380.1675685301223; Mon, 06
 Feb 2023 04:08:21 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9pD+TMP+/SyfeJm@FVFF77S0Q05N>
In-Reply-To: <Y9pD+TMP+/SyfeJm@FVFF77S0Q05N>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Feb 2023 13:08:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtU=2Uq2QDu+eiBLve=uwJ4byU_1K2dKuUTH8wDUHoaw@mail.gmail.com>
Message-ID: <CAMuHMdWtU=2Uq2QDu+eiBLve=uwJ4byU_1K2dKuUTH8wDUHoaw@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To: Mark Rutland <mark.rutland@arm.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_040826_000005_D3247AA5 
X-CRM114-Status: GOOD (  24.82  )
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

Hi Mark,

On Wed, Feb 1, 2023 at 11:52 AM Mark Rutland <mark.rutland@arm.com> wrote:
> On Tue, Jan 31, 2023 at 08:02:51PM +0000, Al Viro wrote:
> > On x86 it had been noticed and fixed back in 2014, in 26178ec11ef3 "x86:
> > mm: consolidate VM_FAULT_RETRY handling".  Some of the other architectures
> > had it dealt with later - e.g. arm in 2017, the fix is 746a272e44141
> > "ARM: 8692/1: mm: abort uaccess retries upon fatal signal"; xtensa -
> > in 2021, the fix is 7b9acbb6aad4f "xtensa: fix uaccess-related livelock
> > in do_page_fault", etc.
> >
> > However, it never had been done on a bunch of architectures - the
> > current mainline still has that bug on alpha, hexagon, itanic, m68k,
> > microblaze, nios2, openrisc, parisc, riscv and sparc (both sparc32 and
> > sparc64).  Fixes are trivial, but I've no way to test them for most
> > of those architectures.
>
> FWIW, when I fixed arm and arm64 back in 2017, I did report the issue here with
> a test case (and again in 2021, with maintainers all explciitly Cc'd):
>
>   https://lore.kernel.org/lkml/20170822102527.GA14671@leverpostej/
>   https://lore.kernel.org/linux-arch/20210121123140.GD48431@C02TD0UTHF1T.local/
>
> ... so if anyone has access to those architectures, that test might be useful
> for verifying the fix.

Thanks a lot! This showed the problem on m68k, and confirmed Al's fix.

I'll give it a try on a few more systems later...

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
