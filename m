Return-Path: <SRS0=qmG6=6Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C8DC47255
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 07:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6701020736
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 07:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="coarV6P0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6701020736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VS2fk1JcC03oZxkfqvBGknuVzDopGVbMhfQjjlcRALA=; b=coarV6P0lEPmRNGkDI0oNbCe5
	QF7iM7/6s4RFu2OjdSrHfNMAn3JNNqAt4esIVoKdXAM9fUf3vn1InDylxDAoWRkmvwRCyZo1B5Uo/
	yFGaWim6S52OsTinsv+hvxGEy4q3pEYqwabaumqagxeSuAzNu3U2sp9ynzqpnV9UXThpZWzfLTnCt
	tw0rXUT5maUCE0Jksokj5qgkS1zPNZB8XKZSS9Qq2EAUCbLpEpU4enCX5Rp5FleVPKXyY43qfFOO2
	IKjwG86CkPFBtb/FGhdfE0gfvILGO96Q91/rxesLxJ6uTAxZAQM+GIo7sFgc5ZM6VLcOIoTuIK1Es
	tql+UhpzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY33m-0006kZ-NZ; Mon, 11 May 2020 07:41:10 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY33c-0006bO-Rp; Mon, 11 May 2020 07:41:02 +0000
Received: by mail-ot1-f65.google.com with SMTP id t3so6790122otp.3;
 Mon, 11 May 2020 00:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VS2fk1JcC03oZxkfqvBGknuVzDopGVbMhfQjjlcRALA=;
 b=UnuL0WuYB2uQ5MzC45eowV2IC2w838XoHDmkt0nImwtM3HpPmIkXVsk+dE1RodYhME
 JC7iVs/r6phh1zpvsqa8B3W17mRhCn6J2mqIOcQ0N6DULwM8nt732TAyM1NBpT0p3tfK
 DwfrSGBTjv2r8XKIpk6nbB00Y9Rss1WbgYOkLsmoHiUUDUXGQ/5TWaL8qzBAlHHhJ+iD
 9RjCPXeNZUZYws0SavAlI8ckIF0acZEp/D5PWbHmKlkyZojoN6FVOWUSD9GuY7dxe2Jd
 /AGv5xc1EvMB0vQodS1Da/wB6m9vBfq2cqt/DMAugAQAPqqkWRDGsN/lh3jgSrmPX0PJ
 fr7A==
X-Gm-Message-State: AGi0PuYi5cPZHCeU/dvo4/NgjHWF1VRq1BmwzscUDMM4skViiTbzVL4J
 L2fyXrV60TNG4HOl0o18fPycnSJz4GIKfPFuEnU=
X-Google-Smtp-Source: APiQypLrnA3x0TQgcu4GbQXkWDUyTXgEK7R9Byl6mAxrtqxgZZGXhJd6czCyilOQXM5O9JA2CdYzbDyIV5/QIHKRb9A=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr10878643otl.107.1589182859874; 
 Mon, 11 May 2020 00:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-32-hch@lst.de>
In-Reply-To: <20200510075510.987823-32-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:40:39 +0200
Message-ID: <CAMuHMdU_OxNoKfO=i903kx0mgk0-i2h4u2ase3m9_dn6oFh_5g@mail.gmail.com>
Subject: Re: [PATCH 31/31] module: move the set_fs hack for flush_icache_range
 to m68k
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_004100_904871_43692003 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 10, 2020 at 9:57 AM Christoph Hellwig <hch@lst.de> wrote:
>
> flush_icache_range generally operates on kernel addresses, but for some
> reason m68k needed a set_fs override.  Move that into the m68k code
> insted of keeping it in the module loader.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

