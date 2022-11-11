Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520A0C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XNAJeeOaWtCAX3IoY0M1sCpkhHD1lZzv4lDWiLRL1IQ=; b=3CjK7du5lKu/eR
	tBqaqrlEgdYsTl6feqs/7YhYFtgif8euLu5MvEw5PYJZAseWFPLUyef3sfjPnc06OEaIK4uVUX+yS
	czUlsAXCJhrkrJx0p8IlH90yt+kw5xnMwV5LUwPFVJ0YxDVho+3+A8qt/UEu4por1uYQU2AH4qc45
	1w+gZO5GSUjwpZXREWaXEvXAUrGCtFElGp80JktUZL/wIQ0mHA2n+rcL38q5RiEqU8opWzYz1wNl9
	AMVusstEkaP+7jmSY7fyBbErDuJufdy6dZG1g4Acx8Ep3r0sEnI95mwIQjJVtawYoymV3e5ID2jlJ
	dDAYJoVao2NBbsZTyiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otRM4-00EzNc-GH; Fri, 11 Nov 2022 10:33:48 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otRLs-00EzKa-EG; Fri, 11 Nov 2022 10:33:38 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B412921DDE;
	Fri, 11 Nov 2022 10:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1668162811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSCJ2N1URwFcAUpc+EAtARpTG8kNt7RKSmUBsp1NCYw=;
	b=bLdNsCXNtfB4em+NWVRu94pn8V+2hW+GlWFIPC1e+mqpdLUX4+NZw2boA7dIcj+KXFMijo
	ElQHOh5b+oI62C+Gf04Ic/NPkPB6It+64tfv7GEbyRZXj1xv2j4709mHQWQimmeUPP6QGT
	S5Uru2jktIkaLhHPT/QowuxxROJ2LKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1668162811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSCJ2N1URwFcAUpc+EAtARpTG8kNt7RKSmUBsp1NCYw=;
	b=hDmNucyL+4Ou2xJNHSD+4YDZvmSpjLuW53GKwCYSZ9xGY1HAiRLmLYySmhext86MIfwxoe
	OSLB14XKM31ZRdBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 377B913357;
	Fri, 11 Nov 2022 10:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GTvODPskbmNOBwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Fri, 11 Nov 2022 10:33:31 +0000
Message-ID: <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz>
Date: Fri, 11 Nov 2022 11:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: Deprecating and removing SLOB
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rustam Kovhaev <rkovhaev@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Josh Triplett <josh@joshtriplett.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-olinux-omap@vger.kernel.orgmap"@vger.kernel.org,
 openrisc@lists.librecores.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor.Dooley@microchip.com, Damien Le Moal
 <damien.lemoal@opensource.wdc.com>, Paul Cercueil <paul@crapouillou.net>
References: <b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz>
 <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_023336_773919_435AB955 
X-CRM114-Status: GOOD (  29.71  )
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

On 11/8/22 22:44, Pasha Tatashin wrote:
> On Tue, Nov 8, 2022 at 10:55 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> Hi,
>>
>> as we all know, we currently have three slab allocators. As we discussed
>> at LPC [1], it is my hope that one of these allocators has a future, and
>> two of them do not.
>>
>> The unsurprising reasons include code maintenance burden, other features
>> compatible with only a subset of allocators (or more effort spent on the
>> features), blocking API improvements (more on that below), and my
>> inability to pronounce SLAB and SLUB in a properly distinguishable way,
>> without resorting to spelling out the letters.
>>
>> I think (but may be proven wrong) that SLOB is the easier target of the
>> two to be removed, so I'd like to focus on it first.
>>
>> I believe SLOB can be removed because:
>>
>> - AFAIK nobody really uses it? It strives for minimal memory footprint
>> by putting all objects together, which has its CPU performance costs
>> (locking, lack of percpu caching, searching for free space...). I'm not
>> aware of any "tiny linux" deployment that opts for this. For example,
>> OpenWRT seems to use SLUB and the devices these days have e.g. 128MB
>> RAM, not up to 16 MB anymore. I've heard anecdotes that the performance
>> SLOB impact is too much for those who tried. Googling for
>> "CONFIG_SLOB=y" yielded nothing useful.
> 
> I am all for removing SLOB.
> 
> There are some devices with configs where SLOB is enabled by default.
> Perhaps, the owners/maintainers of those devices/configs should be
> included into this thread:
> 
> tatashin@soleen:~/x/linux$ git grep SLOB=y
> arch/arm/configs/clps711x_defconfig:CONFIG_SLOB=y
> arch/arm/configs/collie_defconfig:CONFIG_SLOB=y
> arch/arm/configs/multi_v4t_defconfig:CONFIG_SLOB=y
> arch/arm/configs/omap1_defconfig:CONFIG_SLOB=y
> arch/arm/configs/pxa_defconfig:CONFIG_SLOB=y
> arch/arm/configs/tct_hammer_defconfig:CONFIG_SLOB=y
> arch/arm/configs/xcep_defconfig:CONFIG_SLOB=y
> arch/openrisc/configs/or1ksim_defconfig:CONFIG_SLOB=y
> arch/openrisc/configs/simple_smp_defconfig:CONFIG_SLOB=y
> arch/riscv/configs/nommu_k210_defconfig:CONFIG_SLOB=y
> arch/riscv/configs/nommu_k210_sdcard_defconfig:CONFIG_SLOB=y
> arch/riscv/configs/nommu_virt_defconfig:CONFIG_SLOB=y
> arch/sh/configs/rsk7201_defconfig:CONFIG_SLOB=y
> arch/sh/configs/rsk7203_defconfig:CONFIG_SLOB=y
> arch/sh/configs/se7206_defconfig:CONFIG_SLOB=y
> arch/sh/configs/shmin_defconfig:CONFIG_SLOB=y
> arch/sh/configs/shx3_defconfig:CONFIG_SLOB=y
> kernel/configs/tiny.config:CONFIG_SLOB=y

Turns out that since SLOB depends on EXPERT, many of those lack it so
running make defconfig ends up with SLUB anyway, unless I miss something.
Only a subset has both SLOB and EXPERT:

> git grep CONFIG_EXPERT `git grep -l "CONFIG_SLOB=y"`
arch/arm/configs/collie_defconfig:CONFIG_EXPERT=y
arch/arm/configs/omap1_defconfig:CONFIG_EXPERT=y
arch/arm/configs/tct_hammer_defconfig:CONFIG_EXPERT=y
arch/arm/configs/xcep_defconfig:CONFIG_EXPERT=y
arch/openrisc/configs/or1ksim_defconfig:CONFIG_EXPERT=y
arch/openrisc/configs/simple_smp_defconfig:CONFIG_EXPERT=y
arch/riscv/configs/nommu_virt_defconfig:CONFIG_EXPERT=y
arch/x86/configs/x86_64_defconfig:CONFIG_EXPERT=y

So how about the following for -next and 6.2? I did try depending on BROKEN
as suggested, but didn't find a way to override it by enabling CONFIG_BROKEN=y
without modifying a Kconfig file, so this seems more graceful to me?

----8<----
From 58028e06eee8a7fb8a11908b6941fae000660e4d Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Fri, 11 Nov 2022 11:04:55 +0100
Subject: [PATCH] mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED

As explained in [1], we would like to remove SLOB if possible.

- There are no known users that need its somewhat lower memory footprint
  so much that they cannot handle SLUB instead.

- It is an extra maintenance burden, and a number of features are
  incompatible with it.

- It blocks the API improvement of allowing kfree() on objects allocated
  via kmem_cache_alloc().

As the first step, rename the CONFIG_SLOB option in the slab allocator
configuration choice to CONFIG_SLOB_DEPRECATED. Add CONFIG_SLOB
depending on CONFIG_SLOB_DEPRECATED as an internal option to avoid code
churn. This will cause existing .config files and defconfigs with
CONFIG_SLOB=y to silently switch to the default (and recommended
replacement) SLUB, while still allowing SLOB to be configured by anyone
that notices and needs it. But those should contact the slab maintainers
and linux-mm@kvack.org as explained in the updated help. With no valid
objections, the plan is to update the existing defconfigs to SLUB and
remove SLOB in a few cycles.

[1] https://lore.kernel.org/all/b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz/

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/Kconfig | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 57e1d8c5b505..27c0d13314be 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -219,17 +219,28 @@ config SLUB
 	   and has enhanced diagnostics. SLUB is the default choice for
 	   a slab allocator.
 
-config SLOB
+config SLOB_DEPRECATED
 	depends on EXPERT
-	bool "SLOB (Simple Allocator)"
+	bool "SLOB (Simple Allocator - DEPRECATED)"
 	depends on !PREEMPT_RT
 	help
+	   Deprecated and scheduled for removal in a few cycles. SLUB
+	   recommended as replacement. If you need SLOB to stay, please
+	   contact linux-mm@kvack.org and people listed in the SLAB
+	   ALLOCATOR section of MAINTAINERS file, and state your use
+	   case.
+
 	   SLOB replaces the stock allocator with a drastically simpler
 	   allocator. SLOB is generally more space efficient but
 	   does not perform as well on large systems.
 
 endchoice
 
+config SLOB
+	bool
+	default y
+	depends on SLOB_DEPRECATED
+
 config SLAB_MERGE_DEFAULT
 	bool "Allow slab caches to be merged"
 	default y
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
