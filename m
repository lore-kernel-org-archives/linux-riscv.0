Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA74CF34C4E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shRf2p1lwHbm3ENJyZzxG9tyrUEIoyFYOYtg1ZB6Hd8=; b=T7Dd9FPRHP3yLT
	Ji3kKUfj0kJOZiz0fx5rWzSOpgiWgMXKhw5nU0vaFqckMNQRZpmzyazvjOQxjF8zLNdbmSrDQ4z3n
	Gng9leW+cNI+7j8jivVEmTJgQTGk/5pqOdbDYYhbSyf81wbiDwoIzkSIIb5ljN0a7gqZmHa6NsDT1
	f0ULNOGmVBf1yV67SXVb3GlCHbDu/EJEe4Td2WA30xlFVKmIJZSNbQuvfidUH2Z2eNeZL0tawTaNP
	g6gkDiRiaMGNtKvtV5GWG6/PCxdVjdJKtmSRoVFDJ00jrNR4rUtz45w7FfS428FGA2v7D+CVNhtf0
	KIoRoJuDhpVDCM3x5LiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHcF-0000000Fm1z-26OD;
	Mon, 13 Apr 2026 13:46:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHcD-0000000Fm1G-0nwT;
	Mon, 13 Apr 2026 13:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0E7F60180;
	Mon, 13 Apr 2026 13:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1BFC2BCAF;
	Mon, 13 Apr 2026 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776087971;
	bh=oJltz7AJrAszH5NkylMptNLavhPpBeWeTGj56+4UuNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W1c4yYbXInfelp0eUQAv9gO8+XT0Sbrv81Gm0Adb5EvlP79aa60vW1qyaRs6863hq
	 ywlFwnEXs2N+Csj1t8AT44QeeKBJG/F49Idi2q4rc2RmYot0SX7HMiTlvtWvn/yDH+
	 7trrgahjvxasFZ1G1mSZHuMwpN/FLXdUKO5A3DE4xduSAFmVqypbzmuyI1rt6S5Skg
	 mnVOocE28OqrI3sV0A1xJA4AMsFJUmV+SiC9+WzESG+evlqCHSH4Q/iOf94U+BkWPk
	 AcZh4PrKZrOg/knioNZ+bkeabHdk27YLf4Gl2MWAVIr2/8lUMYASANuBHtyTuYAsV9
	 CyYJUfeUbdazw==
Message-ID: <ed8cf7e9-4271-48ab-a410-d7c0e2832020@kernel.org>
Date: Mon, 13 Apr 2026 15:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 14/38] slub: Use prandom instead of get_cycles()
Content-Language: en-US
To: hu.shengming@zte.com.cn, harry@kernel.org
Cc: tglx@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 arnd@arndb.de, x86@kernel.org, baolu.lu@linux.intel.com,
 iommu@lists.linux.dev, m.grzeschik@pengutronix.de, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, dwmw2@infradead.org, bernie@plugable.com,
 linux-fbdev@vger.kernel.org, tytso@mit.edu, linux-ext4@vger.kernel.org,
 akpm@linux-foundation.org, urezki@gmail.com, elver@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com, ryabinin.a.a@gmail.com,
 t.sailer@alumni.ethz.ch, linux-hams@vger.kernel.org, Jason@zx2c4.com,
 richard.henderson@linaro.org, linux-alpha@vger.kernel.org,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, chenhuacai@kernel.org, loongarch@lists.linux.dev,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, dinguyen@kernel.org,
 jonas@southpole.se, linux-openrisc@vger.kernel.org, deller@gmx.de,
 linux-parisc@vger.kernel.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, pjw@kernel.org,
 linux-riscv@lists.infradead.org, hca@linux.ibm.com,
 linux-s390@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org,
 hao.li@linux.dev, cl@gentwo.org, rientjes@google.com,
 roman.gushchin@linux.dev
References: <20260413210252672ZfdcegJLJtyvlYdFAUBlr@zte.com.cn>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260413210252672ZfdcegJLJtyvlYdFAUBlr@zte.com.cn>
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

On 4/13/26 15:02, hu.shengming@zte.com.cn wrote:
> Harry wrote:
>> [Resending after fixing broken email headers]
>> 
>> On Fri, Apr 10, 2026 at 02:19:37PM +0200, Thomas Gleixner wrote:
>> > The decision whether to scan remote nodes is based on a 'random' number
>> > retrieved via get_cycles(). get_cycles() is about to be removed.
>> > 
>> > There is already prandom state in the code, so use that instead.
>> > 
>> > Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>> > Cc: Vlastimil Babka <vbabka@kernel.org>
>> > Cc: linux-mm@kvack.org
>> > ---
>> 
>> Acked-by: Harry Yoo (Oracle) <harry@kernel.org>
>> 
>> Is this for this merge window?

I'd say it's not intended for 7.1 as it's not in -next and v1 was posted
just before the merge window.

>> This may conflict with upcoming changes on freelist shuffling [1]
>> (not queued for slab/for-next yet though), but it should be easy to
>> resolve.

Indeed, it's a simple conflict.

> 
> Hi Harry,
> 
> Would you like me to wait for this patch to land linux-next and then
> rebase and send v6 on top?

Just send it now based same as previously so we can finish the reviews, and
we'll deal with it after rc1.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
