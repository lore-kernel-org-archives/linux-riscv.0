Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B11C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNtz7u1J2+/BjEsd+wxg7aDyn2IOY0RX/DzXkRvDsFg=; b=r4pPjuqkpnWR83
	p5PO1NNT04dTVoOgO5h8eW97Ab51fN9aSU6WU3bimEypYZKupsapIJtmRsaMpDWFyZGURMpip6La1
	qBCuQNPLEaJNMGdadUgO4aqt0z8fLUI5cVN/0CsUgbKDMtVDFeMzAcqIWICyYiatg6cWY+1tuRXyy
	6b0ZnvJzrtPf1yZ0VjhfNhFFMr2fjPSguHgK9sHbHzL6U49bx/XuqfUSUTHWtKVqhOw/ufVUvI9JT
	9huOx7v4BVwDTrrkipKr7RBohX0j4LQbtZDkiE6Z7CfU8QtnxmtXcCNsHi1vo7sqvUb27CFRy5o25
	JohApID+BzFmri6XXrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIsR-00BTT3-4J; Thu, 24 Nov 2022 20:31:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIsG-00BTPv-1O; Thu, 24 Nov 2022 20:31:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 40E4DB828DB;
	Thu, 24 Nov 2022 20:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB9BC433D6;
	Thu, 24 Nov 2022 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669321862;
	bh=VYogHO/QzC0Ie7JtQNRyLU+4odaED0lO+ZqrQ2anQ4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4JIUPPb4GNyqmaugd+1VesUVg/rY2YBuh9jPZSEa9LfSEQzH3zDygt0HPqdzet2M
	 Dp4c/55O2yCFMpzlwelwJsAnq/cWVHvGVHOAbVO908xeu84LN7567KgsRaE4IVVlI4
	 irQCMsnXsSJ21jNJaw6RWjzOUpRxJ6RKhWjRfpd9wRYv71gwQVQAvT0UvpbAXv+eDr
	 jBzcX+3BhUu0qt/DvQCSNER8QfDrEQGt+TJ9slcZjWNwkaVshc7is4iQ3Zq0vSzdZc
	 hcrepLOFcnDEx3g9ybGBdkV9QmYuTZxJxy7F+stexs8bO96+DDGYQXJXkj+qDrkXGn
	 djLsL9V97W7iw==
Date: Thu, 24 Nov 2022 22:30:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Pekka Enberg <penberg@kernel.org>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, patches@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>, Arnd Bergmann <arnd@arndb.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Conor Dooley <conor@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jonas Bonn <jonas@southpole.se>,
	Josh Triplett <josh@joshtriplett.org>,
	Kees Cook <keescook@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
	openrisc@lists.librecores.org, Rich Felker <dalias@libc.org>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Tony Lindgren <tony@atomide.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 00/12] Introduce CONFIG_SLUB_TINY and deprecate SLOB
Message-ID: <Y3/UccT+hJ/6/v4c@kernel.org>
References: <20221121171202.22080-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121171202.22080-1-vbabka@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_123108_420318_8B3EDDBA 
X-CRM114-Status: GOOD (  21.43  )
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

On Mon, Nov 21, 2022 at 06:11:50PM +0100, Vlastimil Babka wrote:
> Hi,
> 
> this continues the discussion from [1]. Reasons to remove SLOB are
> outlined there and no-one has objected so far. The last patch of this
> series therefore deprecates CONFIG_SLOB and updates all the defconfigs
> using CONFIG_SLOB=y in the tree.
> 
> There is a k210 board with 8MB RAM where switching to SLUB caused issues
> [2] and the lkp bot wasn't also happy about code bloat [3]. To address
> both, this series introduces CONFIG_SLUB_TINY to perform some rather
> low-hanging fruit modifications to SLUB to reduce its memory overhead.
> This seems to have been successful at least in the k210 case [4]. I
> consider this as an acceptable tradeoff for getting rid of SLOB.
> 
> The series is also available in git:
> https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/log/?h=slub-tiny-v1r2
> 
> [1] https://lore.kernel.org/all/b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz/
> [2] https://lore.kernel.org/all/a5bba3ca-da19-293c-c01b-a28291533466@opensource.wdc.com/
> [3] https://lore.kernel.org/all/Y25E9cJbhDAKi1vd@99bb1221be19/
> [4] https://lore.kernel.org/all/6a1883c4-4c3f-545a-90e8-2cd805bcf4ae@opensource.wdc.com/
> 
> Vlastimil Babka (12):
>   mm, slab: ignore hardened usercopy parameters when disabled
>   mm, slub: add CONFIG_SLUB_TINY
>   mm, slub: disable SYSFS support with CONFIG_SLUB_TINY
>   mm, slub: retain no free slabs on partial list with CONFIG_SLUB_TINY
>   mm, slub: lower the default slub_max_order with CONFIG_SLUB_TINY
>   mm, slub: don't create kmalloc-rcl caches with CONFIG_SLUB_TINY
>   mm, slab: ignore SLAB_RECLAIM_ACCOUNT with CONFIG_SLUB_TINY
>   mm, slub: refactor free debug processing
>   mm, slub: split out allocations from pre/post hooks
>   mm, slub: remove percpu slabs with CONFIG_SLUB_TINY
>   mm, slub: don't aggressively inline with CONFIG_SLUB_TINY
>   mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED
> 
>  arch/arm/configs/clps711x_defconfig           |   3 +-
>  arch/arm/configs/collie_defconfig             |   3 +-
>  arch/arm/configs/multi_v4t_defconfig          |   3 +-
>  arch/arm/configs/omap1_defconfig              |   3 +-
>  arch/arm/configs/pxa_defconfig                |   3 +-
>  arch/arm/configs/tct_hammer_defconfig         |   3 +-
>  arch/arm/configs/xcep_defconfig               |   3 +-
>  arch/openrisc/configs/or1ksim_defconfig       |   3 +-
>  arch/openrisc/configs/simple_smp_defconfig    |   3 +-
>  arch/riscv/configs/nommu_k210_defconfig       |   3 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   3 +-
>  arch/riscv/configs/nommu_virt_defconfig       |   3 +-
>  arch/sh/configs/rsk7201_defconfig             |   3 +-
>  arch/sh/configs/rsk7203_defconfig             |   3 +-
>  arch/sh/configs/se7206_defconfig              |   3 +-
>  arch/sh/configs/shmin_defconfig               |   3 +-
>  arch/sh/configs/shx3_defconfig                |   3 +-
>  include/linux/slab.h                          |   8 +
>  include/linux/slub_def.h                      |   6 +-
>  kernel/configs/tiny.config                    |   5 +-
>  mm/Kconfig                                    |  38 +-
>  mm/Kconfig.debug                              |   2 +-
>  mm/slab_common.c                              |  16 +-
>  mm/slub.c                                     | 415 ++++++++++++------
>  24 files changed, 377 insertions(+), 164 deletions(-)

For the series

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
