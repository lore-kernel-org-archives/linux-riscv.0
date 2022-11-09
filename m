Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE91C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mHbtsYvRUj6VSHOZ6SEj+9do6eoFXLRVaful9fSqRQ=; b=KwbSuu4magW88u
	RkgSAkNRYXeIRYlUgSFsuY3SyAL+A0qhBypRgDxok60eiinVLVJm/OCpAdTXSSTL5XmfF54JY4nrQ
	/QWzf3gk9OWkUxTYUH7stwrKcBLa9uMa1rVVtmEP04nLMzIexabCWL5ndnaXREe5uu65stbACOdIf
	P57B6kVMNF4hYpWZ4vOoXHvph4keJP2lwesfKbWycak3Ku0VxuSMiH9MSbDVQViAZODGBYiAbCmTH
	G77kcIStKbqa7QQg7uTM794zrAeEowYJVtlNI8jbok2fLZ7TVOkI57ePJTxbSBYVkgAZSYrrNFoIv
	qn8t0ESpwxb3Tyny/6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osnLX-00Elgq-8I; Wed, 09 Nov 2022 15:50:35 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osnLM-00ElYB-DV; Wed, 09 Nov 2022 15:50:25 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-49-22-nat.elisa-mobile.fi [85.76.49.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 5065B20092;
	Wed,  9 Nov 2022 17:50:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1668009012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BHna4eOsJNa6jYXmw+tDBqgbBaWjKPKSATnmoXtvD6E=;
	b=jVqp7WR1xNj9cQVnjX26nQIa0sIJ7CIYmIKDCdmml8y0lg2hYRKNMhoCWhGvaG9xi20Q7Z
	vJCEKKIY2Ip2/zQw5wC3JuCMVFnqVCBlU2GjzIg3OvldqapenUvhOoRb4yvP6546HFOGHC
	R20IBBqDUumCQggds467xH3mhuzOB8k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1668009012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BHna4eOsJNa6jYXmw+tDBqgbBaWjKPKSATnmoXtvD6E=;
	b=iHrt/OPqY6xXFjullaYr2tdte4CnFKRPP/Qv9sI1/eV6eyFCRudApCF0y9xE9HyjG9CrJ/
	GXTjlex8eS4bD+EEoXcJDgSLHDg7OS1E9S1Aruo/b2DONAWedPhitDNQncR7xYDAL5BGok
	lacxDr15fvQajVKMJ2Fqdt7GnI9N1aE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1668009012; a=rsa-sha256; cv=none;
	b=UTFdz4Eys6UJMnuJ1tki0FsSrCtGO9PLelwNKipGe+wWFE3KzecrcbdWpKG/2765JqlV6k
	MaTTRfw1yV0mijWeIwe5jnXrgfu3LnOwBdunfs5BMitsHuvF9O1N1NAxEJhHt4R0cIG0H7
	6LLpguKVNzSAV4wkUxWys5Y35sSz8fU=
Date: Wed, 9 Nov 2022 17:50:08 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
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
Message-ID: <20221109155008.GC307514@darkstar.musicnaut.iki.fi>
References: <b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz>
 <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
 <87187c52-ae48-130b-6479-ae1023915bc1@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87187c52-ae48-130b-6479-ae1023915bc1@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_075024_645873_79905091 
X-CRM114-Status: GOOD (  17.65  )
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

Hi,

On Wed, Nov 09, 2022 at 10:00:25AM +0100, Vlastimil Babka wrote:
> > On Tue, Nov 8, 2022 at 10:55 AM Vlastimil Babka <vbabka@suse.cz> wrote:
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

[...]

> > arch/arm/configs/omap1_defconfig:CONFIG_SLOB=y

I have been using SLUB on my OMAP1 boards with 32 MB RAM, because of
better debugging features and the memory footprint difference doesn't
really matter for my use cases. Looking at history why SLOB was added
there, it seems it came from 6cfce27c14aa ("omap1: Add omap1_defconfig")
when separate boards configs were merged, and SX1 board happened to have
SLOB in there. This board is nowadays only used in QEMU anyway.

There are OMAP1 boards with only 16 MB, but support for those boards
will be removed. So from OMAP1 side, I don't think there is any real
need for SLOB anymore.

A.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
