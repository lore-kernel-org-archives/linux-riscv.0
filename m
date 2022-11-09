Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F58C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCRrBi10+WuOltv2k6dOMdErhghyPyD1Dh6WD21BLJw=; b=iPuOh65H8m1/4r
	qyr1zS81wJQO/3hJ9DWo7aUrW1f/jclZ5igOsD45tRTi8mLnNRBCDbHt8ol9if2xbUN2Ow5jxWkH4
	n5QVj/oCKx7M6+a0+DyccRtSPG+g0PgJKoHDSoN7RQ3Dg7skreHJaFj3cUW+uiibrwL3Rd+YPmRzv
	RmKdqT6pcx7ExgVTvYA5YlNZHSJOxeYy30LCIj8Yu2jV4RfY/RovC9E/G9NEaJOuZgnzSrlL/B5nm
	emwUeBxGb16QD5V0DihPrYqtYGWBdTNlQJASawq5ZpORMI0Q/h/7F+cZPZxzZnAFaK+r4hhAF6BOa
	QFfcRi4RaCgqoZmxeBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossRk-00HMyO-US; Wed, 09 Nov 2022 21:17:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossRY-00HMsA-Qv; Wed, 09 Nov 2022 21:17:10 +0000
Received: by mail-pj1-x102b.google.com with SMTP id l6so73107pjj.0;
        Wed, 09 Nov 2022 13:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6o0JaodUdCinHCuijBKMPPDh4qNhM3W4CwZTMs5pShU=;
        b=b7JdsqL98tFczElrzx45zPQRQqT+FLWQdW7GQ21VMf1VWbVkWvdPT7fPQVW9/YYGhj
         fsJmZVTrJHZqpF5nrGm5JKasB3diwCu2Hs5yNW2C9n/rEZiCH7R7PnAEwZ/MGa/qzyIG
         zfiOnumXidobU0/zuy474imLQWsj+TNcT1BwOR4wCZrc7nj9wEle1ahDUDnwTkt6UQJ1
         bZGNJ9fqbFCNFUTDQDZYUF5tjtiVt+POwV9J5xnlurRxP4GFYN8l+xbrN6OKbV0N8j6j
         kPz632gUkLxrLhg+OI3WB7b7hny2T7RaIKSOWnHn8CvNieatf9SjrSo7u+FU7dyzH4Jo
         RWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6o0JaodUdCinHCuijBKMPPDh4qNhM3W4CwZTMs5pShU=;
        b=7t/ga172Tu/Knv53EKMqcGlD1np0ibRjAhvC2mTXz3Oe/FVCVFc1Jb6kSn38ieu5YD
         xvhmhAGT+JXGTSzFbBl8BvmwpHwUw88cpoWoj/nCqsjBfkl2f3PUbJeVAsAA0zWt6ZUf
         l4KshmYrcU7WKNQIGgjDwOwyg3pG5TXBEegt2hPYavtIz7p6Mnou54UcnORJcwSJ2la9
         ozPR0KfDUIlOpxVDuNg4NVmYEQ7/bMirFrj5zfgejyq8N1YS/67QB6beoBsp/GBsKfx0
         l9EeJMgzFmWjSOt1GetnT5+32vS3s/nqH+sgbzQmPmEXrq+lAo2X23fO6zzIOtKAMHv4
         2wBQ==
X-Gm-Message-State: ACrzQf2fBtawOcz9vu834nBrDuo0amx53uodIG+7fIXW9P+vEQvlRAIn
	S/2Qm2BLeF5RnqqI13jClgJ22gAmRaMKV1ahXng=
X-Google-Smtp-Source: AMsMyM5vTjPHFhQ2vYKc1ap+Gnz9Xnoi5f6pFtOuhyEULsih6osIQH75MdocdJksgvBY7Bht8TwzxWn0ElldlUKBtUU=
X-Received: by 2002:a17:902:da82:b0:186:ee5a:47c7 with SMTP id
 j2-20020a170902da8200b00186ee5a47c7mr63072929plx.82.1668028625070; Wed, 09
 Nov 2022 13:17:05 -0800 (PST)
MIME-Version: 1.0
References: <b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz> <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
 <87187c52-ae48-130b-6479-ae1023915bc1@suse.cz> <20221109155008.GC307514@darkstar.musicnaut.iki.fi>
In-Reply-To: <20221109155008.GC307514@darkstar.musicnaut.iki.fi>
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Wed, 9 Nov 2022 22:16:53 +0100
Message-ID: <CAGfqbt50b9rFEjbFPCZoQnNyBN+CAgBf6bxwpbr4z=tL_A97MQ@mail.gmail.com>
Subject: Re: Deprecating and removing SLOB
To: Vlastimil Babka <vbabka@suse.cz>, Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Christoph Lameter <cl@linux.com>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Pekka Enberg <penberg@kernel.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Rustam Kovhaev <rkovhaev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Josh Triplett <josh@joshtriplett.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Alexander Shiyan <shc_work@mail.ru>, 
	Tony Lindgren <tony@atomide.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, openrisc@lists.librecores.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_131708_912847_012DCE03 
X-CRM114-Status: GOOD (  22.57  )
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

On Wednesday, 9 November 2022 16:50:08 CET Aaro Koskinen wrote:
> Hi,
>
> On Wed, Nov 09, 2022 at 10:00:25AM +0100, Vlastimil Babka wrote:
> > > On Tue, Nov 8, 2022 at 10:55 AM Vlastimil Babka <vbabka@suse.cz> wrote:
> > >> I believe SLOB can be removed because:
> > >>
> > >> - AFAIK nobody really uses it? It strives for minimal memory footprint
> > >> by putting all objects together, which has its CPU performance costs
> > >> (locking, lack of percpu caching, searching for free space...). I'm not
> > >> aware of any "tiny linux" deployment that opts for this. For example,
> > >> OpenWRT seems to use SLUB and the devices these days have e.g. 128MB
> > >> RAM, not up to 16 MB anymore. I've heard anecdotes that the performance
> > >> SLOB impact is too much for those who tried. Googling for
> > >> "CONFIG_SLOB=y" yielded nothing useful.
> > >
> > > I am all for removing SLOB.
> > >
> > > There are some devices with configs where SLOB is enabled by default.
> > > Perhaps, the owners/maintainers of those devices/configs should be
> > > included into this thread:
>
> [...]
>
> > > arch/arm/configs/omap1_defconfig:CONFIG_SLOB=y
>
> I have been using SLUB on my OMAP1 boards with 32 MB RAM, because of
> better debugging features and the memory footprint difference doesn't
> really matter for my use cases. Looking at history why SLOB was added
> there, it seems it came from 6cfce27c14aa ("omap1: Add omap1_defconfig")
> when separate boards configs were merged, and SX1 board happened to have
> SLOB in there. This board is nowadays only used in QEMU anyway.
>
> There are OMAP1 boards with only 16 MB, but support for those boards
> will be removed. So from OMAP1 side, I don't think there is any real
> need for SLOB anymore.

Moreover, I always had issues with availability of socket buffers during USB
device setup when trying to use SLOB on Amstrad Delta based on OMAP1510,
the least powerful OMAP1.  Then, +1 for SLOB removal.

Thanks,
Janusz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
