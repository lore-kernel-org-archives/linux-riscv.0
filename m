Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4ABCCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ik5jFvV69fs4izGYCvjxC56zQO3650qSmOLGBZm673o=; b=ncX39BMdOyAt95
	Z9gnT0XpwXlHqMVA2CISf8wEYr8wDtvNJBjZTYqv9JhJrfNLQbPut3+u2TxAE9d99YtWTGLev5dBb
	sUKsi3rvW6Wu6ZK5jv0RiVHXKSoZtoXGarS0ypR/oqSX7yrlLMKvXWwF3fXsyPY20gX0yKKD3ctTj
	Nj3bQGCJbQfI21DLbtAu/o7d7/CQk4o6LU4RryXO/JoqWnoRAVZDj3eR8Dz39DtCZnKx1PiTiunOR
	KZM9Xwc7JDPgT78XEKOB4mxwVME91Gf/0a4+NWeCO5JTGRM53/9okzFAusYdcNTMxKgnXYiyFZaBV
	d+PHevEkC0v2dD2aF9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kW0-00000007veE-1dre;
	Fri, 17 Oct 2025 13:29:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kVx-00000007vdt-45i0
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 13:29:03 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760707740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCb6l5ObniXxTIJOJBll3JU9Fu/sYJFKIcRGtHY6frc=;
	b=p7FlZSQcAvWYom6XD4RC1BVusPQNBd77BuXglxpg+DCDbQRSihlZad8s8KkFq8GzZ5iZIe
	2HrVaHGAht83q1/fXEHKj72H9MFP1752bzcQKbS3B/bO6sZlyWs8G+h895amFBLurzAry5
	0QxOLP6shaQDSAdcons0opzYr3pnqDtXzimvuHl5c5f3b9wAj0eg8TArIxrwc4vnbIw8YH
	1nwqaBQyHsT92OTeqb0azRGz05XF3UNvI9Rqzjeu7rrGY1rDd8y0/ZhnVQPjTGLHkHJi8N
	7PX/F07JCYIFyWiBOOYu2u8+piT2Iw6UkCct//Ed9ip/LG5WMAokADy2EDPvEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760707740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCb6l5ObniXxTIJOJBll3JU9Fu/sYJFKIcRGtHY6frc=;
	b=0oOt3xZiIZOnwlVFS3EqsCKSMb5+HZD9ZLIItx6umf2eU145EyuqLUWvc0JOH6XIQPhxLJ
	5ZcJL149p74D26DA==
To: Charles Mirabile <cmirabil@redhat.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, cmirabil@redhat.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, dramforever@live.com,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, lzampier@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, samuel.holland@sifive.com,
 zhangxincheng@ultrarisc.com
Subject: Re: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
In-Reply-To: <20251016195902.338629-1-cmirabil@redhat.com>
References: <87h5vy20o9.ffs@tglx> <20251016195902.338629-1-cmirabil@redhat.com>
Date: Fri, 17 Oct 2025 15:28:59 +0200
Message-ID: <87plalzmg4.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_062902_175441_2DC2E620 
X-CRM114-Status: GOOD (  10.12  )
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

On Thu, Oct 16 2025 at 15:58, Charles Mirabile wrote:
> On Thu, Oct 16, 2025 at 07:53:26PM +0200, Thomas Gleixner wrote:
> What do you think about the attached patch (it should be not corrupt :^)
> I think I adressed your concerns, and I ran it through clang-format too.
>
> I folded everything into one diff for ease of review, but when we send it
> officially there will be a separate patch for the caching refactor.

Looks about right and it's a net win for everyone due to the suspend
path cleanup.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
