Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C691CD98CF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0cl1Oi21xmnzX6pXX9+mtWmB4s12GQct4MienUjgWo=; b=q1rkKDkjU8vy9M
	Gnvqvo4F1VK+QzZAymylPsAaMY7QM7UI5ETBS/8Nn4As/Qy8fGwdfzp1//aQ9uTZTHyGYFTGnqTWm
	vriob5jSUDhiTzSroTPqz7RWM7RnQay7kOeifqrXFybxO5AoF1yKQCujlMngPH4U3aItrT0epNRP3
	EnRHwUALHl6SRrzzFfbmyO8r5/tgWdhX7uVCWqrtEZQoRZWS2rO0yj6vfjqqdMbVEoclZPqRha/u/
	uSFAj09ZtKdkYMDYzAPPdKanhLgQUgHkHqbQFRin+bsPoaEXN7t6uroc9Wa6jEVrNk7kjcx/YE0WZ
	N5DJAiwSLZ2ox5BwMz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9lc-0000000Bcis-2Hll;
	Fri, 12 Jun 2026 21:50:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9lZ-0000000Bchi-1sqN
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 21:50:18 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781301014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wv0xct+57Ue2a/VO8M2fraJlUjgNe/Mx/nXgrjheBmQ=;
	b=jT2HqeJvTAChpz/vTwwMDaAb+ggh7oYZ5EKhVpho/5fy0mBzjS8Rkkn7jPjGvx/tlpQg0i
	YcbEDp0w/7v9eq7j2lUAWNTxoDzQraD2eQg5/UKP3f0nt1iMUY3mlOUNtiA6Tcu1l3Ds5F
	7xmfd6j2ltMW9+y52fCwPXDYY53CJaZHELQTTR7nNolIqIhfllwNI0G5GKckh03Ozwj5Mh
	0FXuVk0X0ym7diaGGUjFgaocYGko8x//F2R/p9lQp9sjiKdbCiMwNgAtN4jAtz9TiGWEFc
	3kj4aEJOGA1thtuJVJLjYMxU1CINgHAfzxTF3DCiQBGjwQgqvU2L/T//e8bi/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781301014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wv0xct+57Ue2a/VO8M2fraJlUjgNe/Mx/nXgrjheBmQ=;
	b=HdDhQKJoAnlmcqzFVDk+q+0QyNtSfNC8RKbcoizrfrpFTdlUjPFGIlhCVUDVzR3Fp5eNp8
	lqTP55cnl3R3/0BQ==
To: Mark Harris <mark.hsj@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mark Harris <mark.hsj@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: Avoid uninitialized read in
 hwprobe_get_cpus()
In-Reply-To: <20260612045502.70850-1-mark.hsj@gmail.com>
References: <20260612045502.70850-1-mark.hsj@gmail.com>
Date: Fri, 12 Jun 2026 23:50:13 +0200
Message-ID: <87qzmbe8dm.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_145017_761256_E56DAE3D 
X-CRM114-Status: UNSURE (   4.02  )
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

Mark Harris <mark.hsj@gmail.com> writes:
> When cpusetsize < cpumask_size(), hwprobe_get_cpus() did not fully
> initialize its copy of the cpu mask, which could cause non-deterministic
> results from the riscv_hwprobe syscall on a system with more than 8 CPUs
> when the supplied cpu mask is empty.  Address this by fully initializing
> the cpu mask.
>
> Signed-off-by: Mark Harris <mark.hsj@gmail.com>

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
