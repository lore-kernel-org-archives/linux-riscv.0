Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF09FC56205
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 17:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAlIYVooVRzJTqhY1PCWa5qOK/LcepnLhODl5PMfVbA=; b=VmBgoM7J44Attw
	AX9lri2qAqUfviZPwTsoQESqSxXEbZrUQUSYjAZkwsQQzG9+tzGstUuGvaxan9pUtbadvmo1apAXo
	yrHODoKYW1HrzONPDPjJUgFZCV/NYO7/vfH9sAeRLJ2AF4FmqEWqx9hIn+rjrGR9KCNAqfVtoFIAw
	9wLReXSnP+hdwgn1goOV5c482hqJnpQB/QVvzPpKGwDfZeT0aOB/86xSUJQm7d6XOBtxbRnFsE+s2
	D6uqk+PDiv064tbdiSapoMuwIp17yn5ITGrwAAuB0tFfGHzAzdB+AmGPSjlysYQc+yPForm5vw2Ze
	2mq6Jv7KdDhevVJI+eRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Gw-00000006PSL-2Nsg;
	Thu, 06 Aug 2026 17:52:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Gv-00000006PSF-3Oc8
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 17:52:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10E0560AB5;
	Thu,  6 Aug 2026 17:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109761F000E9;
	Thu,  6 Aug 2026 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038768;
	bh=amu0jMXpH/msysld31tqkZsT5du+PiFJPn/DYBO7gZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=n87K100vrR0/fb4HD2jydkBkg7Ou2tZfdMM+IOEW5jy211ESoPjvEmPAgyxBVzMx5
	 DWP/9e+URFvvRzJvjY9b88GyeMfDAs60De5lTrGVnVcCgOsfZgCVPHl0KM2le0aDYE
	 VXB2MemoKRQMw35Vo0oyTEMvhat2PankAAuL3Keck9O85xsrqjMFMSSqBOyPXL707A
	 ddGLPmgNjSX8MLO7fCCNWBs4D7DS2VuA4l2IkUF1IiY+UC4Eqmsof14XiaAI5A8AlH
	 qtUSAf23XHbYH2B99REt+iZd+4kwV2Q/Bh4sC8RHG+MPf5mIbEER3lev/cLTxNjRzt
	 oEqO3gpyZFGkg==
Date: Thu, 6 Aug 2026 11:52:47 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Milan Tripkovic <milant2002@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <kees@kernel.org>, 
    Alexandre Ghiti <alex@ghiti.fr>, Andy Shevchenko <andy@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-hardening@vger.kernel.org, 
    Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>, 
    Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: Re: [PATCH 2/2] lib/string_kunit: extend benchmarks and unit test
 to memchr()
In-Reply-To: <20260520155532.1139471-3-milant2002@gmail.com>
Message-ID: <81c7c1b0-2906-96f6-6f7e-c859a7578c8c@kernel.org>
References: <20260520155532.1139471-1-milant2002@gmail.com> <20260520155532.1139471-3-milant2002@gmail.com>
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

Hi,

On Wed, 20 May 2026, Milan Tripkovic wrote:

> From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
> 
> Extend the string benchmarking suite to include memchr().
> Extend the string unit test to include memchr()
> 
> Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

This one either needs an ack from the appropriate maintainers of 
lib/tests/string_kunit.c, or should be posted separately so those 
maintainers can take it upstream.

thanks

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
