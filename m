Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265F1D13589
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 21:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bv+mgHYkuq8F8qFM62Xm2TUMDe6u+FZp56cGVHx2oMI=; b=4I1NW/6ETUQCX2
	eFrJeLcZ8n6n6kpPg6azL9/XnsR3yc6U+eoyOVa/CSKBefLeFobeH/6Z3VkxySI0miR4xDpGCKRME
	BYdM6kFNI0MSHpCHbAmMPrMsHm6K6XGCOnnLDR8Iqhh9R3p087TB5J2wIfK1fQBnUwjVyUaY7J3hi
	DnnSR/vRx+8JZVRGxhv+hbU7ujLanYcU5sq1iKiang7Kym4d2v2HXPvY64FN036CRVk7DSEqQ1Fg7
	VgcUdGN1CIcZnnm8cWVq3MDPp4wbkzka9c9yOjONcDTH2I/gtj+BCk7inEcDZlVinYnCD3oO7zv8m
	5/zp1pcb4mInlRdKoxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5BBF-00000008yIs-1aoJ;
	Sun, 27 Oct 2024 21:52:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5BBA-00000008yI4-3tos
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 21:52:11 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730065924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uy5LdYJketu0MffohoUl/Go4tqbAl9Nu0e0r5sC/9hg=;
	b=L7lJUOUDWecGzoSMUFeYyRVbMItKoikZPqkTFPPwfUFUmPYHkwCDaV6QZwRfeffPKSUds0
	EjQDESlPiLzYy01g6Lv9a1rX4eCjqASSNrLv4RLDqAt99nLECf/PFUyPfeVmI7EwknfoMf
	72jFv8ZWuqVzGFwgozvK7A1OT1b2D35AHmZty9QTbvcaz4Fla2037hXftQTiG2gdGp9vHe
	RvLXSGiLk8naQYc2oOygwjeVufCXVGvj40tfsxVxIPGnRjgHngT9Hx7HvrztZgyVJwA7DN
	rwCnJHyG/jTtUyEA7nsL8JOIHsTk6Yk9dq5FURfOdulGPOF5spLZxIfKpJpqAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730065924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uy5LdYJketu0MffohoUl/Go4tqbAl9Nu0e0r5sC/9hg=;
	b=UiFmSj6er+DDxtENWNJee2WvTT3oCW0HfJTNQKwWe0Bdj83ReRUBo4a5qWThGF9Gj62GHd
	5lmFOrjMukqig9CA==
To: Celeste Liu <coelacanthushex@gmail.com>, =?utf-8?B?QmrDtnJuIFTDtnBl?=
 =?utf-8?B?bA==?= <bjorn@kernel.org>,
 Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
In-Reply-To: <2b1a96b1-dbc5-40ed-b1b6-2c82d3df9eb2@gmail.com>
References: <87ldya4nv0.ffs@tglx>
 <3dc10d89-6c0c-4654-95ed-dd6f19efbad4@gmail.com> <87a5ep4k0n.ffs@tglx>
 <2b1a96b1-dbc5-40ed-b1b6-2c82d3df9eb2@gmail.com>
Date: Sun, 27 Oct 2024 22:52:03 +0100
Message-ID: <877c9t43jw.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_145209_222175_35B32A89 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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

On Mon, Oct 28 2024 at 01:01, Celeste Liu wrote:
> On 2024-10-27 23:56, Thomas Gleixner wrote:
>> Equivalently you need to be able to modify orig_a0 for changing arg0,
>> no?
>
> Ok. 
>
> Greg, could you accept a backport a new API parameter for 
> PTRACE_GETREGSET/PTRACE_SETREGSET to 4.19 LTS branch?

Fix the problem properly and put a proper Fixes tag on it and worry
about the backport later.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
