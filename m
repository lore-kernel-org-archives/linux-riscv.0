Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC30CE7B1C
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvGnftJvzpsBerD//k+35wSpjBgmHuQuX64LgD7gDhY=; b=2PxrAd9cU8vOgd
	+doXV5sQNePlJb3PqQTcXm/1IzXrV0shmpcvlk7imKwwl6jh6Lvm5oafZ7a59452MaM9A5QBHu8ki
	N00gpyHEWD6dUvazraorF42SHY2QUPxgwub7uMFzm97aHvBq6K5e373dj3uyeXxYwi3ZwC4bZMijS
	gfeLSn6t3wgQiklei7y1HmkPe3/5TQqsmNbBZCWq+Wzr11mehrGbTG0SGcdrnWVAycPYN7R2WERnD
	nIELj/yDd6IHJRrGMm6RetEPZ9YkzOAaru4hAHfxfjntNJOnC0hRt/idl3hr3JcipZdUq6rb1IA0B
	WZBBUYXRAsVwRYuvxrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZih-0000000CULj-2mLH;
	Fri, 06 Sep 2024 14:13:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZhh-0000000CUES-2qIC;
	Fri, 06 Sep 2024 14:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75373A44FD0;
	Fri,  6 Sep 2024 14:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C074C4CEC4;
	Fri,  6 Sep 2024 14:12:46 +0000 (UTC)
Date: Fri, 6 Sep 2024 10:13:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Will Deacon <will@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner
 <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Clark Williams <williams@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, John
 Ogness <john.ogness@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH 2/3] arm64: Allow to enable PREEMPT_RT.
Message-ID: <20240906101351.0fef642b@gandalf.local.home>
In-Reply-To: <20240906113050.GB16124@willie-the-truck>
References: <20240906111841.562402-1-bigeasy@linutronix.de>
	<20240906111841.562402-3-bigeasy@linutronix.de>
	<20240906113050.GB16124@willie-the-truck>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_071249_811994_B7505EC6 
X-CRM114-Status: UNSURE (   7.88  )
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

On Fri, 6 Sep 2024 12:30:51 +0100
Will Deacon <will@kernel.org> wrote:

> Acked-by: Will Deacon <will@kernel.org>
> 
> "Let it rip!"

Woot! Woot!

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
