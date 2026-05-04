Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1899FFF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PoxhWsRDi9aRXBzTz5suHLAlBfHDxCaPhVJ9ehRghIU=; b=kHDn17LYMmVIPHtKqW6GL7HFVD
	dF/SIkErKpVl+AjOTo+6er5xHZa+mAiDhkjF/aCMQH6kNxEamBvZc2Y+v3HBYzDxnoyUfhx8Taacr
	WNchFyeTIHShfcfIE9XRw6SCmGrm/yBpAbNvz7wjlFb8xgLXSNsQ11UlAlwS5Q3r5KOcTK4E7SV8p
	/PjVy1WA9jvnZWL+I9R6jeEhakIEaDLtDQB17WKDsmdY1BwGHZi89zMMTk4rPrOPKfeBkAvAlwGIE
	hURY5nBWMECPlJ8g77MIzeg7h9ypJPfJ5VVaeZ02CeOwJRRW5KDQbwvguDt/zd6bxuv5DbPNRAKGO
	rd8A2eIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwxU-0000000DpHA-1jtK;
	Mon, 04 May 2026 17:19:52 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwxR-0000000DpGY-3oeW
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 17:19:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 332E21400147;
	Mon,  4 May 2026 13:19:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 13:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777915188;
	 x=1778001588; bh=WGiGQOyaGwv7FZl7+rlUdXd7BeeldqbKfQtj/iAX1Jk=; b=
	HLg1jwQvS7ZqlJFtylk993phBsLKxPz1nfazf6HxZeaWoWl/6knObNVwP2eHZJ40
	EVfvcYQTzYsoKDJ/p88ljBbm7QgQdUOotOOh8jFnGmwTZ0ef6BA+P+7sDTOIAsli
	S+TfshxGfBYO1Bzw0Rbsvh8ZsvgYwNhWGkyfGsuJCQteQiZealS4+2tYNY6Hibwv
	+F7qZ0wjYeIeeDZY75zVqlgrt5D9QSlNxj5u7hQx8kAL5qzh0KXwQvHIouGz0KiA
	1Wty3n+RBqCtH7whK2b2GJB+Xzx06v8P4xNBo9Nfp5umtQFUPcSjq+SGmKAqn/af
	SJAq62TWugmGb3Y35H8TUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777915188; x=
	1778001588; bh=WGiGQOyaGwv7FZl7+rlUdXd7BeeldqbKfQtj/iAX1Jk=; b=U
	Dtc9tn6Jt4JrSgcx2thtneOxZKhtGBS7DLH+qF+Ons3aXAJzunC6LTZkYPS3Cg9Y
	t2VqqdEgb+8zUgQENZL3mwdzYQ4cZDMu5Zr04CJ+oSCdjEW9/VZScV1BLpEps58z
	lleLsjqjrKscIzFCWRMOg2w85AhaUlBXiYjHWudNrQ8HyPqJ6Ht3419uPKronioz
	GP5yQYqme8aAItTqYlz5qjmunTWoESF4Ix+6g7zlczXIKT9ZZeDRWXLWOWhEuDjn
	jX2sBuFVh+jxAYt5ML7Lcu0GzdLK8AMLHi1gJw0vjPnMirk5BzznumjCI66Lfs+L
	w1bi66cb5PAaMhb4hnLug==
X-ME-Sender: <xms:MdX4afa1pBs5uEG_t3f12Z-gE9HTxgmzMUZycLEed8FWRbVzrWLicQ>
    <xme:MdX4aZNR866_s47xDdRjNjZVK1LgNhJm-z3o2QH-xJ7qzzUn8VAxXdnR0MfZwB7fi
    pkRJeLANLJJBDdvCQumEy3VqJNiQQ3S9QCadfgAOfSwfj8SsxLpz2OV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelleegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepug
    grvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrohhusegvvggtshdr
    sggvrhhkvghlvgihrdgvughupdhrtghpthhtohepshgufhesfhhomhhitghhvghvrdhmvg
    dprhgtphhtthhopegrlhgvgiesghhhihhtihdrfhhrpdhrtghpthhtohepjhhohhhnrdhf
    rghsthgrsggvnhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohephihurhihrdhnohhroh
    hvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhm
X-ME-Proxy: <xmx:MdX4afzHdMEtgThUZaAWI6SFPmBNRmeC1NRAxO4cXWsioEaIeremRA>
    <xmx:MdX4aXINmE_2brig3dXmo6YXPUC02VALRoMOVz6BP2wKMlZyJoF9WQ>
    <xmx:MdX4aWoswhdJLUXWit56efNJntJjmZMcBrEvsiFN9rA5dPuiAecUCQ>
    <xmx:MdX4aVvc_FbpGTK9ef68zBUtvGYiu-uzO1xgMmjMDNfjpVvSmayyEg>
    <xmx:NNX4adZkAFqLSMqD_KSGzTMioWXpn0lYpHN-tV27TAbnGDgwhv0TrZv8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D122270006A; Mon,  4 May 2026 13:19:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AduvTQsiZ6dJ
Date: Mon, 04 May 2026 19:18:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yury Norov" <ynorov@nvidia.com>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Yury Norov" <yury.norov@gmail.com>,
 "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>,
 "Ruan Jinjie" <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org,
 "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <9d45acd1-667b-4acf-9e2e-bcd79630d726@app.fastmail.com>
In-Reply-To: <afjNaToyptiMogV4@yury>
References: <20260430211351.658193-1-ynorov@nvidia.com>
 <20260430211351.658193-2-ynorov@nvidia.com>
 <ec4ed7f5-b1c8-49e4-b83d-e29c5414b9de@app.fastmail.com>
 <afjNaToyptiMogV4@yury>
Subject: Re: [PATCH 1/6] lib: include crc32.h conditionally on CONFIG_CRC32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_101950_415064_405561AB 
X-CRM114-Status: GOOD (  28.71  )
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

On Mon, May 4, 2026, at 18:46, Yury Norov wrote:
> On Mon, May 04, 2026 at 10:03:10AM +0200, Arnd Bergmann wrote:
>> On Thu, Apr 30, 2026, at 23:13, Yury Norov wrote:
>> I'm not following that description. Why is it an error to declare
>> a funtion that is not implemented? Isn't that how optional interfaces
>> tend to work in general?
>
> Never heard about such a thing like "optional interface". And git grep
> tends to second that...

I meant any library interface that can be turned on or off
 
>> > The only header requiring the crc32 and bitreverse prototypes is
>> > include/linux/etherdevice.h. Thus, protect inclusion of corresponding
>> > headers in the etherdevice with CONFIG_CRC32, together with the only
>> > function depending on it.
>> ...
>> >  #include <linux/if_ether.h>
>> >  #include <linux/netdevice.h>
>> >  #include <linux/random.h>
>> > +#ifdef CONFIG_CRC32
>> >  #include <linux/crc32.h>
>> > +#endif
>> >  #include <linux/unaligned.h>
>> >  #include <asm/bitsperlong.h>
>> 
>> Don't add #ifdef blocks around headers. If the header cannot
>> be included without side-effects, change the linux/crc32.h
>> file instead of its users.
>
> linux/acpi.h does that like many othes. What exactly is wrong with
> protecting headers inclusion?

There is no "protecting" here, you just add complexity to the
build when headers are sometimes included indirectly and but
other times are not, depending on kernel configuration.

It's unlikely to cause problems for the crc32.h header, but
the acpi example definitely risks running into circular
inclusions when you end up with some other header that depending
on configuration ends up including linux/acpi.h while also
bring included indirectly from that one.

>> It looks like the problem is the check for CONFIG_GENERIC_BITREVERSE
>> in include/asm-generic/bitops/__bitrev.h, which ends up
>> hinding the generic___bitrev32() helper without need.
>> 
>> Simply removing the #ifdef there should avoid the build failure.
>
> OK, it seems like this is what I don't understand.
>
> We've got an optional feature, like CRC32, which is enabled by
> CONFIG_CRC32. The most conservative way is to declare everything
> CRC32-related in the corresponding header, and then protect the header
> with IS_ENABLED(CONFIG_CRC32).
>
> I understand that from practical perspective, we can declare some simple
> macros, like header size, unprotected. But what we've got now is a sort
> of mess: all CRC32-related functions are declared unprotected, and
> generic headers are good to use them. Compiler is happy while those
> functions are actually unused. Next, CRC32 depends on BITREVERSE, which
> is again unprotected, and it may optionally have an arch implementation.
>
> So if arch bitrev() is implemented, you can use part of bitreverse and
> crc32 APIs despite that they are explicitly disabled - just because they
> are implemented as macros in unprotected headers. And you cannot use some
> others - because they are implemented differently, as a real functions.

I think you trying to solve a non-problem here. It is extremely rare
for any kernel to be built without crc32 or bitrev. Even in randconfig
builds, both are usually selected by some driver. The behavior
we've always had here is that in the rare one randconfig in 10000
that hits the one driver missing 'select BITREVERSE', we get a link
failure with an obvious fix. If you add the extra #ifdef, it gets
a little more likely to actually run into the bug, and it shows
up a little earlier as a compile failure instead of a link failure,
but otherwise, nothing changes.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
