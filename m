Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0B9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB47610CB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AB47610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6lmPvBI0Urzem5NjhvcBXHOQRsYY6GK0IVEehv2d78=; b=32cDmKtkciZU9D
	lBUY4mq245nzRi/SIhof1ZQWI+2BX/Jvhkh0lHKIEC24uRvvkKOPBfEKiQ4AN081hauXur+v3+Xr2
	7S6riWvAQWzgoQQuknFVzkNTtdHI7sBZ7DAK8HMV+TIfzGrey06+mRHOoy659DpAPLiq5CbDG92v8
	cZ83b4DxjIAGfK2me3a2BvRQl7uijVylPQTjRgJqzpvgWD/K/4R1GXnL1wgFPUtSRHWezTC2uL6NH
	/nalX82Oe5+Q/52exCA8WvDxpEg1APW3dcA9/tgSmdh8aJ6w6htclf3TeeqsBHfwNoLbE+PfOmthM
	DiX4R2cdRrKH3BVkQ++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXt1-007cNj-R7; Thu, 21 Oct 2021 13:13:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXt0-007cNW-6I
 for linux-riscv@bombadil.infradead.org; Thu, 21 Oct 2021 13:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HNvxY7dt5Sl/mo/s/qX7jMIlXw5UUksffXn2espR6TA=; b=ot9yZM0c4vWM2S08QkPzXKtePc
 m9Df6vBDdpewpZQNWe7W2BLlVuKUpeyr83DE3+LMZigeRen8VGHuzBEhSM9Uz5fa2lLClX7UmS2pI
 QTBY7RmC7g4qyvhDtSI3n7laYfHAB5WViNm7LG04cQU78X2vC9n9wgnJ1GnC8qNjnSYddd0pKodeZ
 6rqYMxtiMIZV/JVni1gkFMekRFjS6kB416Y0WtchtL3czfqYXfS4K2///2+Z5DpT+RtSfn1jGw3W/
 AQ43PTsj5JgD7BhsnOwfUyVeQpcxcyCvbRBnB4jGu/YcIxLl3jLG6FXKmuKXA7IEYLha7dhz1k6W7
 VZvrqRuw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXsw-00BKlY-Hk; Thu, 21 Oct 2021 13:13:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D297D30082D;
 Thu, 21 Oct 2021 15:13:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 960742BD29975; Thu, 21 Oct 2021 15:13:29 +0200 (CEST)
Date: Thu, 21 Oct 2021 15:13:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YXFneUzcD+DsSkaC@hirez.programming.kicks-ass.net>
References: <20210919165331.224664-1-guoren@kernel.org>
 <CAJF2gTQu3qa2biCdYHTgfcJCBdAE=03zMs53XbiU4a8svMQmcA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQu3qa2biCdYHTgfcJCBdAE=03zMs53XbiU4a8svMQmcA@mail.gmail.com>
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

On Sat, Sep 25, 2021 at 10:47:14PM +0800, Guo Ren wrote:
> ping Peter, would you continue your generic ticket-lock work? Then
> riscv could directly use it.

Just posted an update on that, please see here:

  https://lkml.kernel.org/r/YXFli3mzMishRpEq@hirez.programming.kicks-ass.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
