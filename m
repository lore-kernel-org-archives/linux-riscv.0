Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DAEC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 17:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfeQWPEso+xJTBbbvm3hlNHknkS6VElBOCCI6Ec0D4U=; b=GSjru4Se0Qo7l2
	ZokHkMFIdLbBP4KMx9mumO6HXHln6j399e7l9HlC6wmTsEp1zfAyHhvZmXm+1/3Wfl7TlHJtqmDH0
	yEPOGRF4IqR98Tv5T9K2vn/TUjushO13BQEoR9gbMLIgLBVZ24vNsTiWJv+hECF4IYLh9TtiFulyn
	+VY/6rEem1RjETVVJrKx6eAD4v2rZMpqdp7jhVUT6MxkRpQ9wBQ3+aRnoR8VNuC6cOpvTaTl62St+
	7UUeQz1BipLNqjwVBWOhTFi5PpYq6Ox31mY7be52yY5Nwveez6k0CwiG3yKlta6b9Vi27bE3ZDjgk
	9GIBhVpjvQi7jZ9B4Ogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osp9D-00FjDc-L6; Wed, 09 Nov 2022 17:45:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osp8w-00Fj5G-4Q; Wed, 09 Nov 2022 17:45:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 16072B81F4B;
	Wed,  9 Nov 2022 17:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B079DC433C1;
	Wed,  9 Nov 2022 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668015938;
	bh=i7sn7z8xD6SHJEq5dmKr3bGFRNb5IIYU4SUzL9diu3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ARGpruzLN9OuV1JYvbeHm52w2t6ttIgcwOERaZqjZsnd7VJWeUE/iSfoj625HTPs9
	 LjIQy4r4/9BKNBA6nWXBmpYOA6SsvVWKXtma/QrTzMUEYdJHxRYVSM9ZzUmQDzL5gE
	 yDkr6hT/XY5diiSADUVNUIFYs+FYy1RrzAoBCPu9+EF7pWX009Q1jSYcQpTH5/jXIz
	 UvI5GVfMJsao2fdud1mdLsEBszy13PadoZxvIu7tt2f03u7RvYE5qrnsmDSaX9P9Yh
	 hM2ic17YHSLgzomL7XWQE7iOvMfjj1ER/bTY5pZSY9MusLUUoQPuUHwDBgI3X4tiuz
	 SLCO2K4jannvg==
Date: Wed, 9 Nov 2022 19:45:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Christoph Lameter <cl@linux.com>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Pekka Enberg <penberg@kernel.org>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Rustam Kovhaev <rkovhaev@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Alexander Shiyan <shc_work@mail.ru>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	openrisc@lists.librecores.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: Re: Deprecating and removing SLOB
Message-ID: <Y2vnLyprF79EQHNz@kernel.org>
References: <b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz>
 <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
 <87187c52-ae48-130b-6479-ae1023915bc1@suse.cz>
 <20221109155008.GC307514@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221109155008.GC307514@darkstar.musicnaut.iki.fi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_094542_493614_121AA760 
X-CRM114-Status: GOOD (  22.94  )
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

On Wed, Nov 09, 2022 at 05:50:08PM +0200, Aaro Koskinen wrote:
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

Looks like the same happened with arch/arm/configs/pxa_defconfig. XCEP
board had SLOB in its defconfig and when common pxa_defconfig was created
it apparently used it.
Looks like the board has 64M of RAM, so dropping CONFIG_SLOB=y from
arch/arm/configs/pxa_defconfig and arch/arm/configs/xcep_defconfig seems
very reasonable.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
