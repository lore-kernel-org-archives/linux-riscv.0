Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FAAC3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdxSlhnYcp1a0PJ5xIZeX9XPYyngoPyh7oTZeGQUQAI=; b=g2ntOmeB0YtGRj
	nasdfMCAnH6y4uEGGgIbOcMJsaeE9LXmxiwlwe06xS0cKgILATO/Ch2b5y50GWVVL5WlnDpWvvmlK
	R3cmCyrQ16uq3uzJwR7bhbmqcdXrqWp/Pm/NmX2609PCQns8LvQ7s+znhYn6seR8pC+vClKhMNHz2
	Sa+hpE0Qn2mw345nT5fhtOyiZso4R8KqO/YA0Fx9P0wmWRhTr5gmkM9Oo4+ZM7veB8q4sfAN1Z1aG
	6FaZfw3blJK9gYSv526lom73xl/xAf3JFs4u/g81Xrz2qV8FHo3xCR4KwE3y30dW4yq02sQBaKtMJ
	ZeKa+HKClWil36N0alpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWBhK-0000000BxVA-3sma;
	Tue, 23 Jul 2024 09:20:42 +0000
Received: from fhigh2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWBh5-0000000BxQs-0t9M
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 09:20:28 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3003E11403D9;
	Tue, 23 Jul 2024 05:20:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Tue, 23 Jul 2024 05:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721726424; x=1721812824; bh=ArmI+9Lypv
	7lSLaM/gWraMfVqXyWVTNaY8nXPJ+yvQs=; b=bfnYSJt7H65pMucbCKSqznKS/g
	EH+F0X3uPMZfBtQubm8v0+prSRqJk01VAZh1T0LYNmIQgnTmrujtPPWOQQaiFUpf
	/SYi/0si/Yimqf/vocOGjvRCn/9MdgaHOfFHpNnUqtPKQJ296v8qfx7dPhFWQn78
	CflLrFbn/kkVspbp1AsbGVvOevy0ynO1hRWSlkboakQXiFFztIuzLDFOyOWCv4ow
	asZn6NpebyP+qBgOqhrqrloO+qyTMcWriBFe35nJRFc5frqdjGpC4XoOv4Y2NqIa
	3kOE4JC1CttaOozE5I62OmAcIhZ8u1AQSy4uWHGcOofjrV+5iNIzfttd+4hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721726424; x=1721812824; bh=ArmI+9Lypv7lSLaM/gWraMfVqXyW
	VTNaY8nXPJ+yvQs=; b=qX4ozGjusmbvB6RqfS4z19sayaVJZUyxKAocUuT8YldT
	KCJwcMJwy0DZgAcMb5BKR2gHZpTmFhAKRWMQziFmuCYOnan22NNX7SYR//h8qBe6
	BvHW4gEWxuafOrF8bzh6VFZP2KwUEJXj1jJHGgVl3YHRCEhwvDYxuiqnfn6FZhn6
	2nJnCKKA7EnmZ1lxne+nTW3KOTiMXLG9b/OogYSk/AYRUJ1KmJTlVdmsSY4lKy7H
	z9wDZ0EeHVhOpVXM39qH6b7HzW+UX4okqPLetL0dUkVnxhQU2hU5enXY/68J49Nc
	bY3BZ8y4vWYcIHiT9nSwAXVbRw1nY0WmvZgdDbCcmA==
X-ME-Sender: <xms:13WfZj8RLMZyk3rqeWcBdfG73QVT9flQM0FdFPumqaGndEppR5FsvA>
    <xme:13WfZvsNTMjhVCEXo5C5GRzTZ-R0K5mKQkEI-aBs5EMLGL7b6MlojbhFE9W7nQYGI
    xSX0RJmXnhrCQo0BLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheelgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:13WfZhDOtSGdMuumGD0XtFjxcDTVR15dHdD1xDvvvH9_FWLM_4h4QA>
    <xmx:13WfZveILs29-MahbjiGs2sTnaJWjlpdw_za--vV__0uvr5FZuHXVg>
    <xmx:13WfZoP_1d0ckgyUKsdsR9X5a_KaKuU5bAlET-jH1iEGNJLTmg1i5w>
    <xmx:13WfZhkZWF8X4VuDQUJyia6l-oa6f9I5rkhI9OZQoReGVK6bvOHwLw>
    <xmx:2HWfZknYfOhTG-umzxe5DRUF4xuu8lQ2D_on14Jw45aXKJGZMvbeFhCs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 66F27B6008D; Tue, 23 Jul 2024 05:20:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-582-g5a02f8850-fm-20240719.002-g5a02f885
MIME-Version: 1.0
Message-Id: <4896ca15-ca23-4723-92e8-c824ee6a8923@app.fastmail.com>
In-Reply-To: <20240722094226.21602-26-ysionneau@kalrayinc.com>
References: <20240722094226.21602-1-ysionneau@kalrayinc.com>
 <20240722094226.21602-26-ysionneau@kalrayinc.com>
Date: Tue, 23 Jul 2024 09:20:03 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yann Sionneau" <ysionneau@kalrayinc.com>, linux-kernel@vger.kernel.org,
 "Christian Brauner" <brauner@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Jonathan Borne" <jborne@kalrayinc.com>,
 "Julian Vetter" <jvetter@kalrayinc.com>,
 "Clement Leger" <clement@clement-leger.fr>,
 "Guillaume Thouvenin" <thouveng@gmail.com>,
 "Julien Villette" <julien.villette@gmail.com>,
 "Marius Gligor" <mgligor@kalrayinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v3 25/37] kvx: Add system call support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_022027_460507_0B1027E9 
X-CRM114-Status: GOOD (  27.48  )
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

On Mon, Jul 22, 2024, at 09:41, ysionneau@kalrayinc.com wrote:

> +/**
> + * access_ok: - Checks if a user space pointer is valid
> + * @addr: User space pointer to start of block to check
> + * @size: Size of block to check
> + *
> + * Context: User context only.  This function may sleep.
> + *
> + * Checks if a pointer to a block of memory in user space is valid.
> + *
> + * Returns true (nonzero) if the memory block may be valid, false 
> (zero)
> + * if it is definitely invalid.
> + *
> + * Note that, depending on architecture, this function probably just
> + * checks that the pointer is in the user space range - after calling
> + * this function, memory access functions may still return -EFAULT.
> + */
> +#define access_ok(addr, size) ({					\
> +	__chk_user_ptr(addr);						\
> +	likely(__access_ok((addr), (size)));				\
> +})
> +
> +#include <asm-generic/access_ok.h>

You should not need a custom access_ok() function here, juse use
the asm-generic version directly.

> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + */
> +
> +#define __ARCH_WANT_SYS_CLONE

I previously commented that you should remove
__ARCH_WANT_NEW_STAT to match what we did for loongarch.

After long discussion, we now put that back though, so you
should probably do the same here. The way you do this is now
different with the move to the common syscall.tbl format,
and I think in the case of NEW_STAT this will change again
since we now should't even need that conditional any more.

> +
> +#define __ARCH_WANT_SYS_CLONE3

__ARCH_WANT_SYS_CLONE3 is now mandatory, and you can drop the
select in 6.11.

> +/* Additional KVX specific syscalls */
> +#define __NR_cachectl (__NR_arch_specific_syscall)
> +__SYSCALL(__NR_cachectl, sys_cachectl)

This one should now go into scripts/syscall.tbl instead.

> +SYSCALL_DEFINE4(cachectl, unsigned long, addr, unsigned long, len,
> +		unsigned long, cache, unsigned long, flags)
> +{
> +	bool wb = !!(flags & CACHECTL_FLAG_OP_WB);
> +	bool inval = !!(flags & CACHECTL_FLAG_OP_INVAL);
> +
> +	if (len == 0)
> +		return 0;
> +
> +	/* Check for overflow */
> +	if (addr + len < addr)
> +		return -EFAULT;
> +
> +	if (cache != CACHECTL_CACHE_DCACHE)
> +		return -EINVAL;
> +
> +	if ((flags & CACHECTL_FLAG_OP_MASK) == 0)
> +		return -EINVAL;
> +
> +	if (flags & CACHECTL_FLAG_ADDR_PHYS) {
> +		if (!IS_ENABLED(CONFIG_CACHECTL_UNSAFE_PHYS_OPERATIONS))
> +			return -EINVAL;
> +
> +		if (!capable(CAP_SYS_ADMIN))
> +			return -EPERM;
> +
> +		dcache_wb_inval_phys_range(addr, len, wb, inval);
> +		return 0;
> +	}
> +
> +	return dcache_wb_inval_virt_range(addr, len, wb, inval);
> +}

This syscall is different from apparently all other architectures
that have a cache management call, in two ways:

- The CONFIG_CACHECTL_UNSAFE_PHYS_OPERATIONS flag and the operation
  behind it seems like a badly defined interface, I assume this is
  a performance hack for a particular device driver, but it should
  not really be done at the system call level. Ideally I think this
  should be redesigned so it's never needed. If you do need it for
  something, please make that a separate patch with a long explanation
  about how it's used.

- The other architectures tend to use sys_cacheflush() with
  more or less standardized calling conventions. Could you
  use the callong conventions from arch/{csky,parisc} instead?

> +#include <linux/syscalls.h>
> +
> +#include <asm/syscalls.h>
> +
> +#undef __SYSCALL
> +#define __SYSCALL(nr, call)[nr] = (call),
> +
> +void *sys_call_table[__NR_syscalls] = {
> +	[0 ... __NR_syscalls - 1] = sys_ni_syscall,
> +#include <asm/unistd.h>
> +};

This file will have to change in 6.11 as I replaced the
uapi/asm-generic/unistd.h file with a generated version
taking scripts/syscall.tbl as its input. Please copy the
code from arch/loongarch.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
