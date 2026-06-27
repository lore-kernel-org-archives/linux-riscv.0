Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C8CC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 13:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCKElFPkg/xMsPdoCZl+SJYvsHEa5SzXKgGZawGfJUQ=; b=C1uc0ggR8d0J5B
	Uc/YOfFxBig6hptKGJpRHiTckkJD2lLEeNVi21RcYZO2gV8m8n/RENe+1KcM/80Tnyh5KEA5ebV0Q
	LBQqKLi/VlZH+rjGo3PJMQRO3cUD51rhPx6oYhLRSRvGASjrbRtrzrqds9rly+9bsqSi99dOi/QgZ
	RQiG0GJ3JmtmA+KWhA5Qu6C22d+YldugkIIXAC5An1108YCOBRRwTGJFgGxUQibH9CPYaksxKTvWf
	fbjGEutE02/oRCXsKcWxVqrWN9ZJ3FFrBjfgn/yccnl9qYJ+tKaMd7kgnzF8a8BOekwaPApcrxaE8
	ZAnGhLeO7m5M9Xm2Z98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdT2G-0000000CVUq-2EE9;
	Sat, 27 Jun 2026 13:25:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdT2E-0000000CVUP-1y6d
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 13:25:27 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782566723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IGw8RqNfDM9NqAaWbuS71dfRUuFifWMEtwpDbyZCnkQ=;
	b=hntBExUOYyHjMB3Nx+uAH+fCePzx5E8XzTyEpFwVIQ+GWMnZ7+vdiXN5/BTzEWIxuyIyKR
	FjIGNNb8pu4svmGZ1s6gDZPeSLJBGE8bUuTiEKgz18b4S3Kch3eWOUoQxS9GyDb2WlVcXn
	D5Mg+uyT/rOjxTN+IzsK7FucFTUQFr9DUpQgvyEnSUs0Z3aCVWDL/gKxPg2yrcAi8/zw3E
	oGk/1UZFcw4Lc555Vyt6N3IHemxk2QpIZdUkyFIRnV/MnSQxdm5x98xHkcmL5PTGjxEzcL
	9rV3rfCEgL6iTcuYqRLOyp7F6iPcCqK7Mp0vFBppTwO7j6CwQK5XPndI9vTU3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782566723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IGw8RqNfDM9NqAaWbuS71dfRUuFifWMEtwpDbyZCnkQ=;
	b=jr0IMEETX08m/bcfNkK3/+Sudwoih5WPH/2wrAlq7bdS4Dq8oHWAj/ZxMe97J3SEk9bbRO
	VwbBgX3KzTjhTGDQ==
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: charlie@rivosinc.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: kprobes: Add test case for c.jal instruction
 simulation
In-Reply-To: <6A3FC8FF.1BF932.00001@m16.mail.163.com>
References: <6A3FC8FF.1BF932.00001@m16.mail.163.com>
Date: Sat, 27 Jun 2026 15:25:21 +0200
Message-ID: <87cxxcazem.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_062526_669218_232B51DE 
X-CRM114-Status: UNSURE (   9.24  )
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

Xiaofeng Yuan <xiaofengmian@163.com> writes:
> Thanks for the test case. Since c.jal is RV32-only, I haven't been able
> to run it on real hardware. I tried running the full kprobes KUNIT test
> suite under QEMU riscv32, but the test appears to hang before
> completing -- even without the c.jal test case included.

That is not supposed to happen.

> I suspect this may be a QEMU emulation speed issue or a pre-existing
> limitation of the test framework in an emulated environment.
>
> Did you run this test on real hardware or in QEMU? If QEMU, any tips
> on how to get it to complete?

I mostly run on QEMU, but I did run on real hardware a few times. I
never observed a problem.

If you want me to look into it, please share your qemu command and
kernel config file.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
