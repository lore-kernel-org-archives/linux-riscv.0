Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF0C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 18:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXx3vHLgjb/5088pSNmd6JZyGrGEOcGvM5XeacDbQFg=; b=0UWdyWbsHAr1G3
	j7O4p1bpWj8+KFDCIJhBNpMpcoCSO6IwKX2Z2eoScoEQLIEIm9SBwXbt3V/wPHW2Icnur6v0ffJ+0
	YpiiMTlNBWONXy+FU3bj7KqlqmiGJDghEPJIl7QGUpXNAvkTsy+GpQ0EwDgBdnKi3c7qO0fxHQwEr
	JF3h3vXtHQF9JlMVEnUJiEuCXh3AJCpZLyBSyl+HShApdjq4u67NSo4/hDjIPih0ALAwN5hIER8nD
	H8FATjhyWYOewIKoQiSjJS9i5UIiKgQzqyQQvJp9vW6HaQnhCLGF5AgdFbYZEu9WCo2jD2NI8/OMy
	xO65FDso7Yg3kuBp70Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG8h-00000005WjP-0aio;
	Fri, 10 Jul 2026 18:39:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG8g-00000005WjB-0KOq
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 18:39:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7203542D73;
	Fri, 10 Jul 2026 18:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3161F000E9;
	Fri, 10 Jul 2026 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783708793;
	bh=i+UCOIKUOki66Cgh6NwbRxl6rCAzB/afRBsg3PmeFhk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=iWK6Ta8qJXgLpb4gP/Ljnl5yQdlDKv4s5VcOrZURoLygaVTCAn/l+CNt9SD2tXkTl
	 pkUSH5bRKfHCM+pIC4ZWDYqx/DlCYTXxeRpZgfBi+uq3588++GkbdOYYXL0xm8dN6M
	 5KieZC60gh6DUBk+ZdQUMafcW7+qBYIC8szSa1EmZheuHcvEAxEB/iiWRsBNi548Vv
	 P70VcMSrOhJU/bHDemjvL7sbzLQHN3LuUD5KA/5VX7bB+wkxXKPtaxWRg+HCORO1cK
	 ihEjigFiWnbxiNB3jpLiSUpatMvKJZagTGUBiRHsFRJPPeJSAJFSemYY13lgPGQwtm
	 Q9mxfzkHaMQxw==
Date: Fri, 10 Jul 2026 12:39:52 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, 
    Nam Cao <namcao@linutronix.de>
cc: Xiaofeng Yuan <xiaofengmian@163.com>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] riscv: probes: simulate c.jal instruction
In-Reply-To: <178358158037.977550.10342416507496007508.b4-review@b4>
Message-ID: <a30fa1d8-ad41-7d69-abe5-b52baef30dbf@kernel.org>
References: <20260701081033.49871-1-xiaofengmian@163.com> <20260701081033.49871-2-xiaofengmian@163.com> <178358158037.977550.10342416507496007508.b4-review@b4>
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

Hi Nam, Charlie,

On Thu, 9 Jul 2026, Charlie Jenkins wrote:

> Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thank you both for posting Reviewed-by:s and Tested-by:s for these 
patches.  One request: at the end of your Tested-by:s, it's very helpful 
for myself and others if we know what platform they were tested on, and 
whether the testing was simply boot testing, or whether the tests were 
direct functional tests of the code being patched.  So for example, 
something along the lines of the following would be really great:

Tested-by: J. Kernel Developer <email@address> # QEMU; kprobes

or 
 
Tested-by: J. Kernel Developer <email@address> # Litex VexRISCV; boot


Thanks again for reviewing and testing!

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
