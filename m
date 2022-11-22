Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCBBC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3f+No515qjvxcD4mQjwpMHHNOC0MZOQC14HLYlSi1Yk=; b=OP8t9MBNBOAglf
	TJGpi2WsEotSxYOH055IY0voLdHrjK3DkkrC+bxVqRIQ03BlxWDxQafVfpg8Y6Y/2C0SA6ZNmIGFz
	8hkbo6XYHd12q1TptWfV6hfx0Us/JHo69V2EiNDsDTmPSytScIXfZa1wvAuGGZfPwQITsAaTbrK6K
	CZgDy1vRSo5XuuqgCxyb2md3kdmeqX0LZEynMtH3JVlCpcIFUWNaskSYXUvkQRy/ygVuwyYUlA7Jl
	VJLjFQQoRqRTDurNH7f6fvYxxjoysS4nX/2qEMu/H9/199g3Hx9hdaPMl8bWvItdsNGobDH6CBuNk
	SwoX+gjUlIa/89cXm86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWcP-00Atn6-71; Tue, 22 Nov 2022 16:59:33 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWcB-00Athq-At; Tue, 22 Nov 2022 16:59:21 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 680F91F88C;
	Tue, 22 Nov 2022 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1669136357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2atguzqiYlL5qP0R2VMxm0xj35kHN6ayB8+sc0pLb4=;
	b=iSHuT3UDTOfAlVhdj1j/w/lt9XQcCb6v4pH6irJX8vQahCPufK81fX735lNzQn7lFEqNBE
	CMogiSE42gU1KvkT/wuN7K5yrbgTwrPz72mnS2v737CpJ9Je3WsHmZfsyG2hJk1mJ18OQ0
	AVrwZxFZAHFYTCDuLH97H5+aE+CXmbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1669136357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2atguzqiYlL5qP0R2VMxm0xj35kHN6ayB8+sc0pLb4=;
	b=wWepOSuEdxW0YhOQEJQvnU92jRitq2iAod+tE4DGnRgVKu8+BmKvhFTz1K9OVyneb3j0Mp
	gT5n5iO+cb1oXCBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0574313AA1;
	Tue, 22 Nov 2022 16:59:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Cr25AOX/fGMcSQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 22 Nov 2022 16:59:17 +0000
Message-ID: <ab663f18-429a-7d86-f128-6db73fc07b8a@suse.cz>
Date: Tue, 22 Nov 2022 17:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 00/12] Introduce CONFIG_SLUB_TINY and deprecate SLOB
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Christoph Lameter <cl@linux.com>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Pekka Enberg <penberg@kernel.org>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, patches@lists.linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Conor Dooley <conor@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jonas Bonn <jonas@southpole.se>,
 Josh Triplett <josh@joshtriplett.org>, Kees Cook <keescook@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Linux-OMAP
 <linux-omap@vger.kernel.org>, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, openrisc@lists.librecores.org,
 Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Tony Lindgren <tony@atomide.com>, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20221121171202.22080-1-vbabka@suse.cz>
 <bc2f3ca9-e49a-4ca1-8b63-cbc7773d23d5@app.fastmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <bc2f3ca9-e49a-4ca1-8b63-cbc7773d23d5@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_085919_554722_FAD81F2E 
X-CRM114-Status: GOOD (  27.78  )
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

On 11/22/22 17:33, Arnd Bergmann wrote:
> On Mon, Nov 21, 2022, at 18:11, Vlastimil Babka wrote:
>>
>> this continues the discussion from [1]. Reasons to remove SLOB are
>> outlined there and no-one has objected so far. The last patch of this
>> series therefore deprecates CONFIG_SLOB and updates all the defconfigs
>> using CONFIG_SLOB=y in the tree.
>>
>> There is a k210 board with 8MB RAM where switching to SLUB caused issues
>> [2] and the lkp bot wasn't also happy about code bloat [3]. To address
>> both, this series introduces CONFIG_SLUB_TINY to perform some rather
>> low-hanging fruit modifications to SLUB to reduce its memory overhead.
>> This seems to have been successful at least in the k210 case [4]. I
>> consider this as an acceptable tradeoff for getting rid of SLOB.
> 
> I agree that this is a great success for replacing SLOB on the
> smallest machines that have 32MB or less and have to run a
> a highly customized kernel, and this is probably enough to
> have a drop-in replacement without making any currently working
> system worse.
> 
> On the other hand, I have the feeling that we may want something
> a bit less aggressive than this for machines that are slightly
> less constrained, in particular when a single kernel needs to
> scale from 64MB to 512MB, which can happen e.g. on OpenWRT.
> I have seen a number of reports over the years that suggest
> that new kernels handle fragmentation and low memory worse than
> old ones, and it would be great to improve that again.

I see. That would need to study such reports and see if the problem there is
actually SLUB, or the page allocator or something else entirely.

> I can imagine those machines wanting to use sysfs in general
> but not for the slab caches, so having a separate knob to
> configure out the sysfs stuff could be useful without having
> to go all the way to SLUB_TINY.

Right, but AFAIK that wouldn't save much except some text size and kobjects,
so probably negligible for >32MB?

> For the options that trade off performance against lower
> fragmentation (MIN/MAX_PARTIAL, KMALLOC_RECLAIM, percpu
> slabs), I wonder if it's possible to have a boot time
> default based on the amount of RAM per CPU to have a better
> tuned system on most cases, rather than having to go
> to one extreme or the other at compile time.

Possible for some of these things, but for others that brings us back to the
question what are the actual observed issues. If it's low memory in absolute
number of pages, these can help, but if it's fragmentation (and the kind if
RAM sizes should have page grouping by mobility enabled), ditching e.g. the
KMALLOC_RECLAIM could make it worse. Unfortunately some of these tradeoffs
can be rather unpredictable.

Thanks,
Vlastimil

>     Arnd
> 
> https://openwrt.org/toh/views/toh_standard_all?datasrt=target&dataflt%5B0%5D=availability_%3DAvailable%202021


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
