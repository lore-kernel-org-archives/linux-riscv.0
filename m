Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49364C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pw518wtehJ3+0BMKXqimX9j0oMVFDd/PqPrXDE1BI14=; b=ElIVWl09jErYlQ
	iu9pFhbRMafUXHG87aAPD44SFFb5b7QHJb7OoF4Ek+rtgeXQynvY/AHJuf7aBJyI9TuKH8tpL6Egh
	hK2tlFGbFRCkDPLthU3RCDl+ExnxW1NoF3oViMeH6OtyusgALSrfAkQ+RmUHci1pgVWiPzr2ia9XQ
	ijtVyfs1/FsbUBlf21zxHhfNZnbCQZJfSVCWbAeLHksoOOnip3JEeyMHQ7B2tUvo+FxznGQa2PmTy
	fZ2f5qaYq7Dx4eUpyBYMLg1QBZWfGncH8z+bWoeVa/6+JCYOZ6FFPfQ5BEx2Yi07+ybkhA9vNyMDD
	Bf/GlnyuZO4n6uMlZ5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqh7-00000001kf8-2ZqF;
	Mon, 25 Mar 2024 20:13:21 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqh2-00000001kWd-2tvl
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:13:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D366240003;
	Mon, 25 Mar 2024 20:12:55 +0000 (UTC)
Message-ID: <5bf9b76a-8f1a-4a53-b550-f4f2ad775cd8@ghiti.fr>
Date: Mon, 25 Mar 2024 21:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
 David Laight <David.Laight@aculab.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Yangyu Chen <cyy@cyyself.name>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
 <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
 <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_131317_275163_002C31CE 
X-CRM114-Status: GOOD (  23.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi David, Mark,

On 25/03/2024 17:39, Mark Rutland wrote:
> On Mon, Mar 25, 2024 at 08:30:37AM +0100, Alexandre Ghiti wrote:
>> Hi David,
>>
>> On 24/03/2024 20:42, David Laight wrote:
>>> ...
>>>> The use of alternatives allows to return right away if the buffer is
>>>> beyond the usable user address space, and it's not just "slightly
>>>> faster" for some cases (a very large buffer with only a few bytes being
>>>> beyond the limit or someone could fault-in all the user pages and fail
>>>> very late...etc). access_ok() is here to guarantee that such situations
>>>> don't happen, so actually it makes more sense to use an alternative to
>>>> avoid that.
>>> Is it really worth doing ANY optimisations for the -EFAULT path?
>>> They really don't happen.
>>>
>>> The only fault path that matters is the one that has to page in
>>> data from somewhere.
>> Which is completely avoided with a strict definition of access_ok(). I see
>> access_ok() as an already existing optimization of fault paths by avoiding
>> them entirely when they are bound to happen.
> I think the point that David is making is that address+size pairs that'd fail
> access_ok() *should* be rare, and hence it's a better trade-off to occasionally
> handle faults for those if it makes the common case of successful access_ok()
> smaller or faster. For any well-behaved userspace applications, access_ok()
> should practically never fail, since userspace should be passing good
> address+size pairs as arguments to syscalls.
>
> Using a compile-time constant TASK_SIZE_MAX allows the compiler to generate
> much better code for access_ok(), and on arm64 we use a compile-time constant
> even when our page table depth can change at runtime (and when native/compat
> task sizes differ). The only abosolute boundary that needs to be maintained is
> that access_ok() fails for kernel addresses.


Hmm indeed I had completely misunderstood David's point, but actually 
not really since I disagreed with what he actually meant :)

But I had not realized access_ok() was so performance-sensitive and also 
missed the point that it was to protect the kernel more than making sure 
the userspace address is correct, so I guess we are good to go with 
Samuel's patch.

Thanks David and Mark,

Alex


>
> Mark.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
