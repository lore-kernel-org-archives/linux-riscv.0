Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C472FA1FD3
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Content-ID:MIME-Version
	:In-reply-to:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wIxGC5/1uAw/eSRdj11D3zl19IeIUxCIxlrEPHYCGJQ=; b=Cg3SHG/H/G4gRh
	HQO45WJLAKYeu+ddkgqR1rpziqbfh2+8eUlu/uIW7L1/o2nMIXb51vU8PZKOxsXWc1A6Si6pFZSjO
	6/YYU/e5esf5EX9uheroNhtjgEr1weMo5X/EGRODGT9p4Dx2i4zh7hu5P9fAxE8S1I1e933zDXw+4
	hy2nkOTx9ZjsDcm4cEPwroVgviirJLXrfMBCU6OSKUQA0Mtcjpvxf1BqIU5S+e7ww6b7tVDJLnyWK
	QW5aYwzO6rPL0hgUuDAEtRsEyZXc8Zo3pjgdG5+XR8rUDuT68oi5E/avcXr3oM5PF1IzKJM9/OeUc
	0qq83KdmX4UqJzh0qm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaPN-0000000AW3p-328u;
	Wed, 22 Apr 2026 16:26:37 +0000
Received: from smtpauth.rollernet.us ([2607:fe70:0:3::d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaPL-0000000AW3A-30KQ
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 16:26:36 +0000
Received: from smtpauth.rollernet.us (localhost [127.0.0.1])
	by smtpauth.rollernet.us (Postfix) with ESMTP id A107D2801186
	for <linux-riscv@lists.infradead.org>; Wed, 22 Apr 2026 09:26:31 -0700 (PDT)
Received: from mailhub.fnord.greeley.co.us (mailhub.fnord.greeley.co.us [129.146.138.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtpauth.rollernet.us (Postfix) with ESMTPSA
	for <linux-riscv@lists.infradead.org>; Wed, 22 Apr 2026 09:26:29 -0700 (PDT)
Received: by mailhub.fnord.greeley.co.us (Postfix, from userid 10)
	id 654BF19; Wed, 22 Apr 2026 15:08:07 +0000 (UTC)
Authentication-Results: zarathud.internal.fnord.greeley.co.us; dmarc=fail (p=none dis=none) header.from=fnord.greeley.co.us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fnord.greeley.co.us;
	s=2024q2; t=1776870466;
	bh=FxHHjvqT4q6tQb+ec6phehnEvdVlk/9Eems8FcXzsdU=;
	h=From:To:cc:Subject:In-reply-to:Date:From;
	b=KCDobQN6T9yX51VLkPf7uF1VrdU11Ll2J1iDUuK/hO0vbFfIDflIi7pzojBD57+hb
	 7Zytarkzll51ePp3vTEdto+nx2HV9Qr2P/9/GMrFgdQMP35STRPN3R5ZDd4PzLeotr
	 R3PyZQ/LiWfLZXZfIiGpi/4pWX0AMt3l2I72d29O0xUw65vUUQWExqVsgyeiCVVctV
	 4Njpbueh+GBgrpqBq26ezV4S2JBbZ1odr+ol+YAbBsc7CtmhNqbLcCXmi1SQepRG4k
	 zh0NMLicqNolWY5LUevPTWYpP3cOLMxj1xm8kmXGnexohq0drDgXVNFUmsl4Y1u0/P
	 wZz+th8zMbd2A==
Received: from zarathud.internal.fnord.greeley.co.us (unknown [IPv6:2001:470:3924:1000:50c6:bdff:fea1:ac49])
	by zarathud.internal.fnord.greeley.co.us (Postfix) with ESMTP id 399923A9C;
	Wed, 22 Apr 2026 15:07:46 +0000 (UTC)
From: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
In-reply-to: Your message of "Wed, 22 Apr 2026 10:50:22 +0200."
             <30a50474-a2e4-4b0e-be8c-8050b0356db9@leemhuis.info>
MIME-Version: 1.0
Content-ID: <3383917.1776870446.1@zarathud.internal.fnord.greeley.co.us>
Date: Wed, 22 Apr 2026 15:07:44 +0000
Message-Id: <20260422150746.399923A9C@zarathud.internal.fnord.greeley.co.us>
X-Rollernet-Abuse: mailto:abuse@rollernet.us https://www.rollernet.us/policy
X-Rollernet-Submit: Submit ID 103103.69e8f6b5.93e2b.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_092635_768867_7CDA09C0 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: Bjorn Helgaas <helgaas@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 1127635@bugs.debian.org, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thorsten Leemhuis writes:
> Thx for forwarding the regression.  Nothing happened since then --
> or am I missing something?  If so: is that okay for everybody, or
> should we do anything about this?

I have not seen any discussion.  As the initial reporter, I can accept
that it is a very niche hardware platform and may well go unfixed
forever.  The machine in question has left my possession.  It may come
back in the future.  Or maybe not.  The next-generation newer ppc64
machine I have (an IBM 8205-E6C p740) does not exhibit this behavior.

> BTW, did anyone check if this happens with mainline (6.13/7.0) as
> well to rule out that this is something that only happenens in the
> stable series it was backported too?  If it's the latter I wonder if
> reverting it there might be a easy way to resolve this.

I didn't check mainline specifically, no.  All bisection was done
against the stable git repo.

Thanks!

- Aaron

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
