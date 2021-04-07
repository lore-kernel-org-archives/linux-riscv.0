Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B6BC433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 09:48:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51069610F9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 09:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51069610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+0MlWH78qBNex/5mSjOhkeDUkS0vuTOs/4pnjE7MRzA=; b=PTpqDNlhl/lnVBK4Enul/uMbt
	7kU8aW4XE/Zyq8sgYVO55slomnE1jCC1axiFc0a5Aj7cxWrriOXVtFFIb/XBpWQ79Xf6VBNBiMBMF
	VuoszzT+a0ZndlmK9fRkRncLmswNbMEgDS4nyC7eyWcVKNgc0wbZYo8OSvmHu+IKt9X59Wi3WxHmg
	26HiFvA6N+nS5F4Yyf8Fa9yvw+rF1OhBNwyeG2XfneKzq6+eFQbWIxyJ86j1EvOGaYVq9zyQJm2P8
	qmqFw/St0porR26sWMY6m/WziUfLgIxTd+jMTccy3JpVsgjlElp3RRp4i2bcvvjRnYp1R8wcROV7R
	XolK/iG9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU4nC-004eFC-Lg; Wed, 07 Apr 2021 09:48:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU4n9-004eEr-1N
 for linux-riscv@desiato.infradead.org; Wed, 07 Apr 2021 09:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+qSokmLjMhdEnOSkSopblq5MKalEi8UUYD3QbqGxqos=; b=eC2rQ34nM7cRrzDAhzzhEN3wPe
 kTzKVXiPYsQriyTitj8XaOZiOMYSs2CmPna+vSZrzx2X+AyYzDfGkh6XwDeUaP/R2Sdhw0fUQHZoE
 xcIkVZ9BgwAGrHrQdPx1JVxc28uo8a4iZ5LllVP7TnFFfJ9CG+a4lOMAZ0xT4W5AUDITT4PKOzipn
 iYX5eNIGnsNYC8ByBciAnWPp9g9vDQf8R7DSJ/g+l6EF+CP1ntsJaOLY4qb8I0kMJDUqs+viQJKqd
 up6N4jP4nowpqWEIhSTtf6tIwQksMPnvi+P/KtQNQPk3PhCqoIF2gV1qmvrv5jzGvLRrNMJHVDhzZ
 FeCH/O7Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lU4ms-00EGP6-RS; Wed, 07 Apr 2021 09:47:54 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 44BCF300119;
 Wed,  7 Apr 2021 11:47:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 27BB724403DB8; Wed,  7 Apr 2021 11:47:49 +0200 (CEST)
Date: Wed, 7 Apr 2021 11:47:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stafford Horne <shorne@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, guoren@kernel.org,
 linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Anup Patel <anup@brainfault.org>, sparclinux@vger.kernel.org,
 Waiman Long <longman@redhat.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>
Subject: Re: [OpenRISC] [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YG1/xRgWlLHD4j/8@hirez.programming.kicks-ass.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
 <YGyRrBjomDCPOBUd@boqun-archlinux>
 <20210406235208.GG3288043@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406235208.GG3288043@lianli.shorne-pla.net>
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

On Wed, Apr 07, 2021 at 08:52:08AM +0900, Stafford Horne wrote:
> Why doesn't RISC-V add the xchg16 emulation code similar to OpenRISC?  For
> OpenRISC we added xchg16 and xchg8 emulation code to enable qspinlocks.  So
> one thought is with CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32=y, can we remove our
> xchg16/xchg8 emulation code?

CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32 is guaranteed crap.

All the architectures that have wanted it are RISC style LL/SC archs,
and for them a cmpxchg loop is a daft thing to do, since it reduces the
chance of it behaving sanely.

Why would we provide something that's known to be suboptimal? If an
architecture chooses to not care about determinism and or fwd progress,
then that's their choice. But not one, I feel, we should encourage.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
