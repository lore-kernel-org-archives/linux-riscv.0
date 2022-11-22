Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CC4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EF9bR95tXD/BTqfq5MJvGl8OyY0ZuAHbzfKz5OiybZE=; b=rAo+4sh73tTeki
	LT7mXHqVyc7+5BEJU5MtgJnBfGFy/R1CUQS70TU4nPM2PVpiq9i91ZL+ZrVpZSlyuOqwauj8sqqsc
	VESVuH0VSZ6gpNuRcslZXH3U4W6+JVdiSII/uzK2kUIURR3z52SqpIYWv3u0mKiECnYCmeY6aLKZG
	czNU3ImIs7aH3+2NR4pDNGipDkCYFTzTbUFbFleFbK3ylIthBSaWm7TmdddW0OePaDzafp6QVvMmw
	fqhykJ/mYaUzqfW/0jyoo7zH+hF3sl4Gki6I0k6cEgyau0us6Rwe4hLUWCFE9mU9KFbNdOiLBl7bB
	jZ90Y6NTJbKTVSXFZvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWsh-00B0Ax-Mr; Tue, 22 Nov 2022 17:16:23 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWsW-00B06z-Aq; Tue, 22 Nov 2022 17:16:14 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 412F65C01AC;
	Tue, 22 Nov 2022 12:16:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 22 Nov 2022 12:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669137367; x=1669223767; bh=AWib7uk/pX
	ojLTP6WLnsRKQNx+DKIkZTOrXloBCRaME=; b=lySZ7U8uKnWn00jTXtr9CAy5eX
	nv56f5UzD8Tk1XQ/zM5Lhx6iJpKUBacT8Jhv8GyD2PflS6Y7GxJQc0fIKYqg5Oes
	CFa1i/Ts0YaZ3w+29HTSOtSLJVf8UyxvgO7Elc+4A1sD1p/Xc15Cgj/ipv+7sC75
	6w/wVc+YoF9EFV6ZnauvYJWW3dZBEdWUU3Bunbq5pUvgvqvufeUJEzM47bRam58J
	c3BOM4tOLUQkAGfA/RhyWi1+/qHvJbvC8bLwEEGaDCDs9qV6wxZFKoq3UYhXxQKt
	Wh8d/wv3tWb9gfqRvidRS+ZMd1z1j9zWUlznP4LRf6uszZiJKJUYJDZHHY8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669137367; x=1669223767; bh=AWib7uk/pXojLTP6WLnsRKQNx+DK
	IkZTOrXloBCRaME=; b=WsG7hmw+LKirM0tmH9Kzn5cWIv1cpT8+lNht2XAQJ9s3
	4ZLi37KXbwyfZUymR+BePagoJCdji1Vzcj0n80TQIde9wB6INMz6g6O95orGjmgQ
	D4kmajLzD+hdqXIR6sGDItFx17483bKqA/prajubW26vU7eE2HfQ48F4RU3AbTOn
	BflQWRTk2zMsv9br6one4vxpVJ+2Kq+zgKTclR29Zf4FJW/LONRJf+GU2SCd5pYG
	J4BngUHmANTkgBSU86Eb3htMc55hA4qxKx5rSTTKWS1MsK5pY95N8jw9lUbptr/n
	4Z8nSzdK1pAXa5mMpKlxS3WdFwiL2He3irWZfBm6bA==
X-ME-Sender: <xms:0wN9Y7qPWw2exYVs5wfHuy9rYZCZQuHgMhVEQFannzbjtddQn3BQ4g>
    <xme:0wN9Y1pqiwYlVCjjKrkgcm3wu_Akhjhp7R2xmRAGsKVts_mSuo6Fr9nHjS2-N14PA
    LmVoU5uRDXDxBzCiFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:0wN9Y4N8QRmdxsSzxLfB-wzAErGuIyYmXrIV7YRp5MuOsZXSFqmatg>
    <xmx:0wN9Y-4hZz5AMF7CfedaolyttL0YesCLDNyMIosGKiGFB-DvxEr6EQ>
    <xmx:0wN9Y64KESJLM4L1wu3Xny3rpN-0y311CrDXA6fAwwRQHLgNIP87NQ>
    <xmx:1wN9Y2EvqHiCPXzlZoDK1Y6SAsHx1IrtLMuRFmYZSqKK8S6eDS_6EQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 30CBAB60086; Tue, 22 Nov 2022 12:16:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <501fbee3-cd3d-461c-9c79-0a5f2d1382b6@app.fastmail.com>
In-Reply-To: <ab663f18-429a-7d86-f128-6db73fc07b8a@suse.cz>
References: <20221121171202.22080-1-vbabka@suse.cz>
 <bc2f3ca9-e49a-4ca1-8b63-cbc7773d23d5@app.fastmail.com>
 <ab663f18-429a-7d86-f128-6db73fc07b8a@suse.cz>
Date: Tue, 22 Nov 2022 18:15:39 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vlastimil Babka" <vbabka@suse.cz>, "Christoph Lameter" <cl@linux.com>,
 "David Rientjes" <rientjes@google.com>,
 "Joonsoo Kim" <iamjoonsoo.kim@lge.com>, "Pekka Enberg" <penberg@kernel.org>
Cc: "Hyeonggon Yoo" <42.hyeyoo@gmail.com>,
 "Roman Gushchin" <roman.gushchin@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Matthew Wilcox" <willy@infradead.org>, patches@lists.linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Conor Dooley" <conor@kernel.org>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Jonas Bonn" <jonas@southpole.se>,
 "Josh Triplett" <josh@joshtriplett.org>,
 "Kees Cook" <keescook@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, openrisc@lists.librecores.org,
 "Rich Felker" <dalias@libc.org>, "Russell King" <linux@armlinux.org.uk>,
 "Stafford Horne" <shorne@gmail.com>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Tony Lindgren" <tony@atomide.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 00/12] Introduce CONFIG_SLUB_TINY and deprecate SLOB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_091612_702141_389C5FF4 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, Nov 22, 2022, at 17:59, Vlastimil Babka wrote:
> On 11/22/22 17:33, Arnd Bergmann wrote:
>> On Mon, Nov 21, 2022, at 18:11, Vlastimil Babka wrote:
>> I can imagine those machines wanting to use sysfs in general
>> but not for the slab caches, so having a separate knob to
>> configure out the sysfs stuff could be useful without having
>> to go all the way to SLUB_TINY.
>
> Right, but AFAIK that wouldn't save much except some text size and kobjects,
> so probably negligible for >32MB?

Makes sense, I assume you have a better idea of how much this
could save. I'm not at all worried about the .text size, but
my initial guess was that the metadata for sysfs would be
noticeable.

>> For the options that trade off performance against lower
>> fragmentation (MIN/MAX_PARTIAL, KMALLOC_RECLAIM, percpu
>> slabs), I wonder if it's possible to have a boot time
>> default based on the amount of RAM per CPU to have a better
>> tuned system on most cases, rather than having to go
>> to one extreme or the other at compile time.
>
> Possible for some of these things, but for others that brings us back to the
> question what are the actual observed issues. If it's low memory in absolute
> number of pages, these can help, but if it's fragmentation (and the kind if
> RAM sizes should have page grouping by mobility enabled), ditching e.g. the
> KMALLOC_RECLAIM could make it worse. Unfortunately some of these tradeoffs
> can be rather unpredictable.

Are there any obvious wins on memory uage? I would guess that it
would be safe to e.g. ditch percpu slabs when running with less
128MB per CPU, and the MIN/MAX_PARTIAL values could easily
be a function of the number of pages in total or per cpu,
whichever makes most sense. As a side-effect, those could also
grow slightly larger on huge systems by scaling them with
log2(totalpages).

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
