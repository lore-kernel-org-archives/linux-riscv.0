Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F6DC44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvQ35RCQIuH9c179PP+I5Juijul2xpM40rk3nHbes5U=; b=chjFQeBu/Av3sU
	MzNrxj3gzpVdGUXCHc58KvhpVUpXmgnxjm4Fm0OR0Z4IH71Q02Ul8mWLpliB6iv/wUVhk0aIQpW5t
	2C+9Q8lwJuXZj21j6HWC6UM+bjquft8doSxnwL/9C+Ny2tsc65Fj48zPr7Tw8xi245AX9kV7IoCUI
	vL86dL96o5thpoBiP3hHy6oHOqNhv4dV4NAqbZHF9wZ6oa9gnN6TuLIukFo+P/KsEYo55cdJ6Uurc
	1PzgJnQ6edJAR8LghYUQwkOr4Ukp9G+UWx3tdyfNq8NDfipYq7eqkIiuFU4Q2d/oUeXYKaWX3FeJN
	kO3VztGUCh/ttput4EtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3Ba-0000000FXQ5-0ePV;
	Wed, 15 Jul 2026 17:14:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3BY-0000000FXPt-3D13
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 17:14:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31F1942339;
	Wed, 15 Jul 2026 17:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893651F000E9;
	Wed, 15 Jul 2026 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784135656;
	bh=LjIDABZ6RiKEOS2gR8+fPbzT/X3YyGFaiYkNIhS7z08=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=KroKzY6VqTaMhVGLj2QsmUUKpuLKdIgREmw0xhKvmXlQwUIUHA10BWYoHVnzE9AgW
	 FKUaRZ/LdV0o0XUBR8pnjuF1eZPwUDBken+o1d5hE9YGnDOq8Z5ksOgjrUV69u0PVr
	 Wm/NB//EwYd7TrErlzVA/xw2z+GB6prxcRo3xLHSD2FTVXeQ4zb8UUqCniv3t1trvF
	 Af9m9LeJ27C3Ib/VpBYIoHyYUZqby5GzdxRYOee3m2Kmpj1oxFTZZCCtF5DVsuKlTc
	 ewku6n94AHnkKrIEmW3nrnOWSfAqz2YhB8Jvb6qNUfBybWVOJfH32rlBZRv4yYcwzG
	 W06ZKXGw5zakg==
Date: Wed, 15 Jul 2026 11:14:14 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nam Cao <namcao@linutronix.de>, Michael Ellerman <mpe@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: hwprobe: Avoid uninitialized read in
 hwprobe_get_cpus()
In-Reply-To: <20260714003056.73707-1-mark.hsj@gmail.com>
Message-ID: <35b94b17-2a2f-ae20-1156-e06c8de297cc@kernel.org>
References: <20260714003056.73707-1-mark.hsj@gmail.com>
MIME-Version: 1.0
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

On Mon, 13 Jul 2026, Mark Harris wrote:

> When cpusetsize < cpumask_size(), hwprobe_get_cpus() did not fully
> initialize its copy of the cpu mask, which could cause non-deterministic
> results from the riscv_hwprobe syscall on a system with more than 8 CPUs
> when the supplied cpu mask is empty.  Address this by fully initializing
> the cpu mask.
> 
> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
> Signed-off-by: Mark Harris <mark.hsj@gmail.com>
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> Reviewed-by: Michael Ellerman <mpe@kernel.org>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
