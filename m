Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B753CEE6456
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sBsQG9B/lzcFyq8O7OrD3VmNQ/bT+t4ffT7YRaQ+TA=; b=L/QYEKlD4QZNoC
	bI76seheVxCeJQc6OaIkaLGZ3OrUT5iSn2Hih4zLcXzjJF7EGq6FH0W3W/dvWq3dwypQIHLY0IR1c
	GUHNAcrv72jasP16nhcbkx0vg4AvtiZIz9d9bVxa6rlM7bUmf4QB5hH5fDQuLPltI9ob52w/BcKVw
	ol94xJH9y3g9/sSz9ZdNqricV4GzKjzizEe43bTsjmUuULtSK6ZwsMv3huHg1EJVhZkcpe3PzTojy
	tw6YcxwT1BMnLnb6K1VQQeiYYfQZUBiZa+f7DXhVG+n6/jWq+mz332yMd2N/+BB+X69qOXF6A5x3w
	DCHHCu2DP0Z4ZG+jbCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soe2w-0000000C8I2-1plN;
	Thu, 12 Sep 2024 07:15:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soe1o-0000000C82N-26wo;
	Thu, 12 Sep 2024 07:14:12 +0000
Date: Thu, 12 Sep 2024 09:14:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1726125245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SjU1eoFadyoK7K7SgDbZ2qGYnI+TpM13Yt6F4ubhqds=;
	b=cKy0UJ8xegmPpZzYKtRC+nAEUxVNWfAn+HCNCnbTbHrmuNkF8V5a8xbxQODKWpEk5d/38Q
	D/jypsSEd99y6SIVBD10pxNbKYA1MwTjcWkT9UygAk+dtavsILlUor5uysEvmJr9m+ydUM
	wq2SgMsADzIUghnY8Is2AbVxhso0/3f6E4+fYMa+ieEl7FyC3PwPHneHXphli/gYsTMvVW
	Ud2KqGOeygpg0Sehawso++4wougPKyUlYP5BNN0zn+7JPaORDeR424J0hTPpXBFdZjSL02
	/hHXUREdsDdhGABDRW3uab9N9SYjXyxFYCBIY+bmsmOUEYzB/79/7KFutWKIqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1726125245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SjU1eoFadyoK7K7SgDbZ2qGYnI+TpM13Yt6F4ubhqds=;
	b=VuO8woohehugrOAZS6ZtfomWw3Jj5sA25GDEv820Gl2RxE2kI9odY1bQoy9BLEItzHpzpG
	pAWJswQ69ItU4aAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mingcong Bai <jeffbai@aosc.io>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Clark Williams <williams@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/3] Allow to enable PREEMPT_RT.
Message-ID: <20240912071403.KMVCGTA2@linutronix.de>
References: <20240906111841.562402-1-bigeasy@linutronix.de>
 <f9070564-4672-4aee-8e63-c9ca9d985f4b@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9070564-4672-4aee-8e63-c9ca9d985f4b@aosc.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_001408_724032_498E93B1 
X-CRM114-Status: UNSURE (   9.46  )
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

On 2024-09-10 10:39:45 [+0800], Mingcong Bai wrote:
> Hi Sebastian,
Hi Mingcong,

> Congratulations, it's been a long time coming!
thank you.

> I'm wondering, for the architectures not included in the enablement this
> time, do we have a readiness checklist/guide for maintainers to refer to?

I don't think there is. The plain PREEMPT should work. Then need to
follow the checklist for forced-threaded interrupts. Generic code such
as GENERIC_ENTRY makes things easier but at least
HAVE_POSIX_CPU_TIMERS_TASK_WORK is needed with kvm enabled if my memory
serves me right. Everything else is part of generic code.

> Thanks in advance.
> Best Regards,
> Mingcong Bai

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
