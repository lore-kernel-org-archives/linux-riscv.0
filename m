Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C6EC636D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 16:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Y0I/3Ei8612A1t5CDrqxn6F055QJ4kcsd2St3Gp7mg=; b=TaenCeQqY/o8LD
	ESOQCiOsITAEY5nK4ta5nqiiWIhFilQ0twudlS+keQlhw3bi7CJAJpH6IEW7eoyTmKv5XvcJ+dDPm
	ETSwEubv5+got9Wyc73evZ5nYXzVlt3ovl/xb9WGphYceigHuUAwiE3SBJ01oKuD3+B3CywDi4UWZ
	kuJ6hkoC1fDZyznW0uPmtcu0i3B/ArobfP2yNKhNuJ5D2qN3bcONiS3MUTqD/E37mq4LnSclTe6Nr
	InHcv2nqthXVfwmrkSKhn7v9tVcMtJJht29snC82QmD/HbYJ/AMzm5QLlel7V7I2qQvrKci3cdVe/
	zPClLjx4XrRtuPiJyK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPQZe-00CmeT-NX; Tue, 07 Feb 2023 16:12:02 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPQZb-00CmdG-NZ
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 16:12:01 +0000
Received: by mail-qt1-f177.google.com with SMTP id cr22so17216363qtb.10
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 08:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKpFmPELNxMbbdNEgrdFiGaCVQckx4xSvoILv5TiVp4=;
        b=lGfAzUkMKkQLn86EFBSF6aKl9q/hrLONtzjI4yXQgj6VS+BTPHEZTC/iGuShNqAn1I
         kmMEv8N2ynTH1m4cCgisYXRrI/E2i7QlC/5UBhlCRap5dPKukVL92NHqmGRdftrbrK3R
         5+f8L5ofuRTrppd+Az6/sZ92VZ7ZI8J7gKt1iCbU0PUG23YZkKN/wOo/1uJSsWHBmE5p
         dJfWdMb0gKCjpvWp/biPIjY+Fm0HrAygHyH/jjASexufFV7238PFFiODUAfQDilfG1IX
         Ejd5D21t3CK8hw/Xr4EdQMyLZDfFPprQHLi2uXuUieM1l7m4grVUjAo/zR2mLgrh0EJa
         l/4g==
X-Gm-Message-State: AO0yUKXzIcxAgYytPIn2p1o6yj3qErBbrYNS1xjHRdT/Evr+Nw8x7T3X
	4K1OGQGIHa6U5Qy4ii4XoSASWE7Sn6Cfyw==
X-Google-Smtp-Source: AK7set/uXnFPiDwMORq+Sh4nhHBFcJ+knBAwrNC1u17M6VmAnj+Fbz8eZ+HlV7Nq9tGmpGdIeDMSUQ==
X-Received: by 2002:ac8:574a:0:b0:3b8:8756:6de0 with SMTP id 10-20020ac8574a000000b003b887566de0mr6290620qtx.48.1675786314299;
        Tue, 07 Feb 2023 08:11:54 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id u31-20020a05622a199f00b003b0b903720esm9722080qtc.13.2023.02.07.08.11.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 08:11:53 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5249a65045aso169746587b3.13
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 08:11:53 -0800 (PST)
X-Received: by 2002:a0d:f444:0:b0:526:78ad:bb15 with SMTP id
 d65-20020a0df444000000b0052678adbb15mr382260ywf.47.1675786312866; Tue, 07 Feb
 2023 08:11:52 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l02DvS6CYThTEG@ZenIV>
In-Reply-To: <Y9l02DvS6CYThTEG@ZenIV>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2023 17:11:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQusKr_W4dnQzVSWbav7vooCHbiyOQHbnraJCL16bsDQ@mail.gmail.com>
Message-ID: <CAMuHMdVQusKr_W4dnQzVSWbav7vooCHbiyOQHbnraJCL16bsDQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] riscv: fix livelock in uaccess
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_081159_802214_17F669BD 
X-CRM114-Status: GOOD (  18.79  )
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

On Tue, Jan 31, 2023 at 9:07 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> riscv equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
> If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
> end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
> to page tables.  In such case we must *not* return to the faulting insn -
> that would repeat the entire thing without making any progress; what we need
> instead is to treat that as failed (user) memory access.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
