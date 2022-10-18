Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8365EC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alfaVJopKeg0vxR+uw9SH1ZHag3FIEgVPXYd/GdSmWo=; b=hgEB+03wvOd/3b
	Jw322H7eLfQE2edxbexeIpi6nUfi59S5HgnbSnjQuR6xW+sBygWCBWSSQG8XbIjzoTgmccvsnX3Il
	SiVECmBRzMFFhchiCqeZOrua20fW2Y2Tq8DroMA4ZRS7CetP2cmTij5LBkovvBlXV0BhePNnhIQgR
	eI4eOkL7JJ7UgnYQfDss7DcBuCM0PuK4+wG+5xVPZy3PAlfyFPSgXjbfvzGzOzOFnoYdOm4JRSmLd
	J4P6jCtPqvKdEY/U0j+iIZKHV1Xun38oMwK6vX6vsTBGOYeUbVVfQtVqMxkpLx2/x0mPPvYKCRHRt
	CA0AHvUdaxPfEbzbuSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okljx-006bhV-Tb; Tue, 18 Oct 2022 12:30:37 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okljm-006bd2-F2; Tue, 18 Oct 2022 12:30:28 +0000
Received: by mail-qt1-f180.google.com with SMTP id cr19so6219428qtb.0;
        Tue, 18 Oct 2022 05:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LA5Rw3StwiOqL+QwzJgo3njgEZhTbHuX12wcOa2B5Os=;
        b=OXdJXhgf9ee9nNo3rD11GtU3zrBS/sy6VKr/ICIw/8GCVGwMrlBn8HVH9Kprx+hqz5
         EHov9ajqn2eRZAYeHXuI0zYwsL4zBHvYd89lPANAaOKV9xBiyUGfQ/OSx+6ENXRGs2/Z
         JMQBRyGRkfYzBaoed5yN2uQdhJWcEhsYO0txokCpR8rT9Xy82oOPTcjM7RVCp/tyGL6q
         s/+roRiu9lq0pUD/ATQG0uOBYHO1fVvdvwSelity0WIsF5n+NUggUX3wf87RjFF+0k+b
         ShsrSRgbsUslhI7MFcamah+izSQxqlhO1Y7BuqeWPb+Y/zkbvNbtfa1BAu11BLjI3rwO
         prSA==
X-Gm-Message-State: ACrzQf2x3GTrnsG9Jq82MLKwe8miDxAc6tSlyAitRZyxvjy/93/I0OkI
	cfwXHcRg/dv/Oep04voCugpoFST4cqjF1w==
X-Google-Smtp-Source: AMsMyM71er8FWRytTLPrh/OjwMqQywiGIIFnkZDnBUYccigXLQ0YDyH710tgvf8Ax0JmRFOOoRbKCQ==
X-Received: by 2002:a05:622a:1705:b0:39c:ca5f:5d53 with SMTP id h5-20020a05622a170500b0039cca5f5d53mr1826766qtk.67.1666096223345;
        Tue, 18 Oct 2022 05:30:23 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id c25-20020ac81119000000b003996aa171b9sm1786325qtj.97.2022.10.18.05.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 05:30:23 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-35711e5a5ceso135170207b3.13;
        Tue, 18 Oct 2022 05:30:22 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:357:2422:13b4 with SMTP id
 135-20020a81098d000000b00357242213b4mr2107285ywj.316.1666096222450; Tue, 18
 Oct 2022 05:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221017145157.1866351-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg> <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 14:30:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
Message-ID: <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.1-rc1
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-kernel@vger.kernel.org, 
	D Scott Phillips <scott@os.amperecomputing.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-um@lists.infradead.org, 
	linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_053026_521716_6C2E2827 
X-CRM114-Status: GOOD (  16.05  )
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

Hi Maciej,

On Tue, Oct 18, 2022 at 12:39 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Mon, 17 Oct 2022, Geert Uytterhoeven wrote:
> > .> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9abf2313adc1ca1b6180c508c25f22f9395cc780/ (all 149 configs)

> > >  + {standard input}: Error: branch to a symbol in another ISA mode: 1339 =>
> > > 2616, 2621
> >
> > mips-gcc11/micro32r2_defconfig
> > mips-gcc11/micro32r2el_defconfig
>
>  Where can these configs be obtained from?

By following the links in the URL above you removed while replying? ;-)

http://kisskb.ellerman.id.au/kisskb/buildresult/14818296/
http://kisskb.ellerman.id.au/kisskb/buildresult/14818298/

Thanks!

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
