Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9243ACDE001
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXSvEPvzDgf65l9QN+zHXrqO/ZtX/ffcXKv6/cdEfgs=; b=OL+ytWKHJ/7w3W
	pLq2pw/YOFnc2eJ9ii05NcnnreztYC1s4ze+3rfHP51X+U3S2DonOjo6Dm2FMYvk00bHcKK2fPC4t
	8gHEcy8/MeYWE8wVtI0oqsHTx+VKOK7Kdxl5pwFUQPnL7dC7Pu3u7tDgp6PzqF8dJC68L1liEtUkD
	Wf/2xHWDWhByPcgJ/hiQfVHotmX13sGKAXWmGo1fyfz+KQBR39f14RGK1fgdjjawW4/8saqcmrE1O
	8VuTc+OIxIBvrRLXDSjqBbqYcUxacNqcgOJi6ickjgwfvQl/uHJOHpspXy0yWX6RuZY8UgN0gTR8F
	FT59wJWr5iyDkbIwGVlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoDs-00000009dy4-2STK;
	Thu, 25 Jun 2026 17:50:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoDr-00000009dxm-1yf1
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 17:50:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E40EE40529;
	Thu, 25 Jun 2026 17:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B6D1F000E9;
	Thu, 25 Jun 2026 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782409842;
	bh=ogvPRLayn8DE5SVrc2dTDIbJN5Y0rcwk+c0Mk5BtyfA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=HX1vnsIgoJ7kYRaLL6ztz+9L5WVI3wZV+QE4CyqwpqmUlA9eHcoZ5a9Ut+6VD9s1e
	 p+CJNHaYvLew6rhulPgnlN05N2A1LgYgQpPcCNYzZAR7Zej0NjAy7ZVF02FqZ/ymUn
	 d0AT74dZuWe3OTB8iLAD/ZtF11RC+H/AUQxaEdTt57dlI9vXPsALBoiDPwLreINGXN
	 ig/Stt8KRw0uarlut0tcagwInwZsKlps6XcOEBvae1zu5U48PplNXA35biaeqGaZjK
	 PMvqUBSnQ6vrfXu7/601NAhDfmapwvZAuMIc5n90svZ6j7ZwQZPxGNzzFdyqDj4qAY
	 544jrsqHR+EPw==
Date: Thu, 25 Jun 2026 11:50:41 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: linux-raid@vger.kernel.org, Song Liu <song@kernel.org>, 
    Yu Kuai <yukuai@fygo.io>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] raid6: fix riscv symbol undeclared warnigns
In-Reply-To: <20260622135207.480540-1-ben.dooks@codethink.co.uk>
Message-ID: <e15b7b96-33f7-73f8-f5e7-47bcdf271894@kernel.org>
References: <20260622135207.480540-1-ben.dooks@codethink.co.uk>
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

On Mon, 22 Jun 2026, Ben Dooks wrote:

> The riscv rvv.c file is missing the include of pq_arch.h
> which defines all the exported functions. Include this
> to remove the following sparse warnings:
> 
> lib/raid/raid6/riscv/rvv.c:1225:1: warning: symbol 'raid6_rvvx1' was not declared. Should it be static?
> lib/raid/raid6/riscv/rvv.c:1226:1: warning: symbol 'raid6_rvvx2' was not declared. Should it be static?
> lib/raid/raid6/riscv/rvv.c:1227:1: warning: symbol 'raid6_rvvx4' was not declared. Should it be static?
> lib/raid/raid6/riscv/rvv.c:1228:1: warning: symbol 'raid6_rvvx8' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Thanks, queued for v7.2-rc.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
