Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46D9D6910B
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 13:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCMjwdwuXQB2EifiZl77qVn942Y8gSJKgvxmpBFkpuw=; b=vcWRL6bCJUnP+R
	mOUaRkQu/PWafWW6+91xBpGDfmCrvx/9pquSir1jlYMBaOKrKBaMQ4zoeBJ+2RZXrN+um1DH6pFoh
	3asNTovlqRyJhYAJ465/6TOhq/6LqwZtgRZrm8dVyUzcKfTHlH40YbbWctnCLWmwDStKBNRFDwV8A
	HPdM/YiEUd79I6fIyzSRgZScDt22QY0N2MULxq/qxpkQM4i19heIHsQWhktmOon8uAwGpg1uIQr67
	uH4fKajpXzc3YBle6dSKpZptR8a3+TLKgX9cwXv/qSu52Dxsxi5y+Zq6vlfxjMRhRYhuimV6fsVbk
	muGl1a6RyZjDNlpyMZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGemB-0000000FevK-0maX;
	Thu, 28 Nov 2024 13:41:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGem8-0000000FeuZ-38qB
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 13:41:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C7E45C5D56;
	Thu, 28 Nov 2024 13:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8904EC4CECE;
	Thu, 28 Nov 2024 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732801303;
	bh=p96AQe+Xhw1n5/5NkrMy2qekMOxS7j8JyihhPQtfJds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvrYHMs4qo/a/2no2Ds566OX/5t2baRXUWJogUEV887ngBAs+rlQot/G6epNCmBRZ
	 8IT6Gm9OXnzmLGX8wybDoGBF9KCv2iyK6TPMXif0Ym4pX9+7tH8ipiRLk8wmPe4g3a
	 jK+Lsw5j7U24lYR9xpesgz83wniRhqJWQ5COnuMKH9DFzm2PzA17NhDcN33D0Ike1u
	 md+yON0gmvGLXcVlO9dBlJv6AzOIoKiHW472KbAdzzr5ovAw+gPdJwETy0pxcNzCpl
	 8DMszSx7wT1I6/xJr/yBpD4D/Knt03/Km6j+/RojFv3YlBRTxeTD/FpukGdX0K6K6Z
	 7+soo81/ammLg==
Date: Thu, 28 Nov 2024 13:41:36 +0000
From: Will Deacon <will@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
Message-ID: <20241128134135.GA3460@willie-the-truck>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
 <20241103145153.105097-14-alexghiti@rivosinc.com>
 <20241128-whoever-wildfire-2a3110c5fd46@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241128-whoever-wildfire-2a3110c5fd46@wendy>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_054144_827249_3EB6C063 
X-CRM114-Status: GOOD (  17.74  )
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

On Thu, Nov 28, 2024 at 12:56:55PM +0000, Conor Dooley wrote:
> On Sun, Nov 03, 2024 at 03:51:53PM +0100, Alexandre Ghiti wrote:
> > In order to produce a generic kernel, a user can select
> > CONFIG_COMBO_SPINLOCKS which will fallback at runtime to the ticket
> > spinlock implementation if Zabha or Ziccrse are not present.
> > 
> > Note that we can't use alternatives here because the discovery of
> > extensions is done too late and we need to start with the qspinlock
> > implementation because the ticket spinlock implementation would pollute
> > the spinlock value, so let's use static keys.
> > 
> > This is largely based on Guo's work and Leonardo reviews at [1].
> > 
> > Link: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren@kernel.org/ [1]
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> This patch (now commit ab83647fadae2 ("riscv: Add qspinlock support"))
> breaks boot on polarfire soc. It dies before outputting anything to the
> console. My .config has:
> 
> # CONFIG_RISCV_TICKET_SPINLOCKS is not set
> # CONFIG_RISCV_QUEUED_SPINLOCKS is not set
> CONFIG_RISCV_COMBO_SPINLOCKS=y

I pointed out some of the fragility during review:

https://lore.kernel.org/all/20241111164259.GA20042@willie-the-truck/

so I'm kinda surprised it got merged tbh :/

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
