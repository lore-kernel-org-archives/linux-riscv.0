Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094B9C05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8K/4rgH3Hd5z4YuyQR9oZT5bG7YKE25bEiJplk3Jyc=; b=S7w+GsoNyf9UYM
	32tiCjt4B0xKyOUuAcTSFuJBTOrHSyC0xxeFxhZFnSEkl7g6QqKh8i4DUFV60GtU44+gW6T9Xc0cU
	jInquzzKjMEbXXDDJrx4EP7OXLnkjuhxyVyFyPw9GDVNKS/mgVUCd6IS/Ak533KXkTWIWR7TVbKvt
	fcHcushnpQuzds025LhC8cxcOJoI3BhoVyazaMUvLb7GZNOP8W5cvhlBj2rSS2qHCZley9axb8PGg
	fLhfTD+N2yGaB2O6GDCjWFYMr50Nf4jE59067NP5a1W/jfZvG4uMVpulHFuosCjoK555j/Q2AL+ui
	g7sUcjRuwrs7zMm2LibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0JE-008QmU-QT; Mon, 06 Feb 2023 12:09:20 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0JA-008Qi1-FJ
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 12:09:17 +0000
Received: by mail-qt1-f173.google.com with SMTP id g8so12386741qtq.13
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 04:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SQkBcRxxCrTEFDwcET99BwrKIGZJp4wu6h4t2bWjyk=;
        b=3Qdj/rz5SXn9NJMwMyGLwg5qFqjWzdq+4pnS/gu48qg2Fxlgsm3EgjpJu1YFAvkA7O
         IQKhXz0jlqfCF0YCYz57bHiucWYYftg/4VxYpwGo8ixifxgmx0LCn6i/X5IDyuGFX9lv
         43uuxKa7GaDWWNHqM/clLxXaoK3mK/E8QchltW9b1FRfu1IF6Tr8yPO5MWmb5HU70obi
         1rf7b3hwvLdgWIKCKoybN7Nsg2kvlPZoPKTTA1VQoe+koUtAy3Ob6xoxzNGfXmaI21dP
         D3du845HtjKbN2f74vNCz2HnEh7QBqqQcJW7JWjmtviO3STOhLN8Ti71jOGV9caPNLO3
         QIrg==
X-Gm-Message-State: AO0yUKXPUFUEqn84RaOTRFNzjZMvvEfBHWRfEfNktOKDmD+wvaHhlNsN
	e779ziykoSpQ9J0ZU1gqVaLYg3Ysx5YM7g==
X-Google-Smtp-Source: AK7set+qfYGMmUEO10CgmOMu64U6mxI5qocsPvJBeWbhD5JaFVaLsfw5ZcTPZUXo+rReeP3xpUbmTg==
X-Received: by 2002:a05:622a:11d3:b0:3b6:4249:bbca with SMTP id n19-20020a05622a11d300b003b64249bbcamr18761327qtk.55.1675685352691;
        Mon, 06 Feb 2023 04:09:12 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id m15-20020ac85b0f000000b003a591194221sm7250733qtw.7.2023.02.06.04.09.11
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:09:11 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-52a849206adso6680687b3.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 04:09:11 -0800 (PST)
X-Received: by 2002:a81:89c1:0:b0:52a:7537:98a6 with SMTP id
 z184-20020a8189c1000000b0052a753798a6mr259978ywf.384.1675685351335; Mon, 06
 Feb 2023 04:09:11 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV>
In-Reply-To: <Y9l0aBPUEpf1bci9@ZenIV>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Feb 2023 13:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWcNcn7R6MMeg51SUkmpZZ+HpdsMtiOE55EbQ1coc10AQ@mail.gmail.com>
Message-ID: <CAMuHMdWcNcn7R6MMeg51SUkmpZZ+HpdsMtiOE55EbQ1coc10AQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_040916_557576_0CC42D47 
X-CRM114-Status: GOOD (  18.01  )
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

On Tue, Jan 31, 2023 at 9:06 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> m68k equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
> If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
> end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
> to page tables.  In such case we must *not* return to the faulting insn -
> that would repeat the entire thing without making any progress; what we need
> instead is to treat that as failed (user) memory access.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
