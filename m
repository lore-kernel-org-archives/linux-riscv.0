Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8145C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 20:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8Kr7A2MGQH6rC4UFzm27Jk+HmldkrQgr8dLJwvkv+M=; b=IrFiW8S9oscKK5
	NWS5izb0cXRirowsEaBTXjgzpkARtLLzV+bArkP8WGLGI2ADwZ2fNaTQkTVQNgXv7iyfFLZAeDyOu
	0idSW8CSaB8LQ1MGrq7DQQLO/1TaIYIDppdPJUYQy8RApJ+hd1/yuPjm3e+kfBruSyQ1D+vJQ73gy
	abPvwxmrHOnoImbC+KtIF6jedPtFtfxQcmDkzS9VY1PVkJLIG0SEJz6QO6q6ikwIlmNjbtqmGFP7a
	Hq9PGUXhdUdI+cQBcGHaX2qDYAYIlRLLnKxASsY05ulNFAXr2tB00sFm+BpT2czkqETI+2btqajLx
	N86pn8oqIxs6BVYhBAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otavh-0012mc-Sr; Fri, 11 Nov 2022 20:47:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otavU-0012gA-Ha; Fri, 11 Nov 2022 20:47:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D0608B8260C;
	Fri, 11 Nov 2022 20:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16855C433D6;
	Fri, 11 Nov 2022 20:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668199616;
	bh=+aijmCyFee7qWFeNljZb8zYD5+XuzsnyGaxX9FEYxpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnwFL8wuWkoZyhSHDqs67j/LsmCKgpcpww1g7jCaWZ36JihNBOGBStyV6m2p2YLp+
	 m2905fbVL3d+YYvg5Yw6+fM2rewxOIR0BXA5PJNQb7wbR7rut9I32ZzXzgtbxINfcn
	 ywzelh60+IhLjCHgH9LQeBHlGFBz+Su/dtPQQ7KQ5eWGcMuTG6UyLYdWb1u1/m+WfT
	 AWnvj4oYpVtx2Yi88aEsVMDJHNkhw4lVBU9k1Di7od31GKlIx8ow4kj7mjLq5dO6Vi
	 ujvifadc6imBUFXqg2RbvXS48bE0aDe4bgAMQCOKMiv9+sqVG6Zl0x5Xv7jiRhT7w9
	 B9u+Kk/K+VpHw==
Date: Fri, 11 Nov 2022 20:46:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
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
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	openrisc@lists.librecores.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor.Dooley@microchip.com,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Paul Cercueil <paul@crapouillou.net>
Subject: Re: Deprecating and removing SLOB
Message-ID: <Y260tkNHc2vFITJ3@spud>
References: <b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz>
 <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
 <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_124700_896942_58141500 
X-CRM114-Status: GOOD (  30.38  )
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

On Fri, Nov 11, 2022 at 11:33:30AM +0100, Vlastimil Babka wrote:
> On 11/8/22 22:44, Pasha Tatashin wrote:
> > On Tue, Nov 8, 2022 at 10:55 AM Vlastimil Babka <vbabka@suse.cz> wrote:
> >>
> >> Hi,
> >>
> >> as we all know, we currently have three slab allocators. As we discussed
> >> at LPC [1], it is my hope that one of these allocators has a future, and
> >> two of them do not.
> >>
> >> The unsurprising reasons include code maintenance burden, other features
> >> compatible with only a subset of allocators (or more effort spent on the
> >> features), blocking API improvements (more on that below), and my
> >> inability to pronounce SLAB and SLUB in a properly distinguishable way,
> >> without resorting to spelling out the letters.
> >>
> >> I think (but may be proven wrong) that SLOB is the easier target of the
> >> two to be removed, so I'd like to focus on it first.
> >>
> >> I believe SLOB can be removed because:
> >>
> >> - AFAIK nobody really uses it? It strives for minimal memory footprint
> >> by putting all objects together, which has its CPU performance costs
> >> (locking, lack of percpu caching, searching for free space...). I'm not
> >> aware of any "tiny linux" deployment that opts for this. For example,
> >> OpenWRT seems to use SLUB and the devices these days have e.g. 128MB
> >> RAM, not up to 16 MB anymore. I've heard anecdotes that the performance
> >> SLOB impact is too much for those who tried. Googling for
> >> "CONFIG_SLOB=y" yielded nothing useful.
> > 
> > I am all for removing SLOB.
> > 
> > There are some devices with configs where SLOB is enabled by default.
> > Perhaps, the owners/maintainers of those devices/configs should be
> > included into this thread:
> > 
> > tatashin@soleen:~/x/linux$ git grep SLOB=y

> > arch/riscv/configs/nommu_k210_defconfig:CONFIG_SLOB=y
> > arch/riscv/configs/nommu_k210_sdcard_defconfig:CONFIG_SLOB=y
> > arch/riscv/configs/nommu_virt_defconfig:CONFIG_SLOB=y

> 
> Turns out that since SLOB depends on EXPERT, many of those lack it so
> running make defconfig ends up with SLUB anyway, unless I miss something.
> Only a subset has both SLOB and EXPERT:
> 
> > git grep CONFIG_EXPERT `git grep -l "CONFIG_SLOB=y"`

> arch/riscv/configs/nommu_virt_defconfig:CONFIG_EXPERT=y

I suppose there's not really a concern with the virt defconfig, but I
did check the output of `make nommu_k210_defconfig" and despite not
having expert it seems to end up CONFIG_SLOB=y in the generated .config.

I do have a board with a k210 so I checked with s/SLOB/SLUB and it still
boots etc, but I have no workloads or w/e to run on it.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
