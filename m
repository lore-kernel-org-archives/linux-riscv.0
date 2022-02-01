Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07978C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 07:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYcG/4pxIg0JbiUp8X7+UXqeE1C+Eeqn4B43wqy32kg=; b=gXW11l9aGybnZd
	qo2AK63ncryeR2yjn9mFPxyE0satOpSR02moLVaaxJehV3+HT5tZ7//Uv1MmRe9ufcNKV8/RkJ/c8
	IAGukW8548PidauBz+bW8cbAaqIm+vAfZ+ZbdrG+TdeBFdqgJHKfuRKRTiaI3d284bxQTzKAfPy60
	RifCzgEHE5PuHBIuHBUaGjEmch3Roe9fiB8udW+1LBMpE94mQQANh/381mKDIqYNukG2PzizlU08C
	jtb8GhFBCdvuLltgiNkrfmznv0srM01MKUbde+UwdsuNXjN6hbw7ggdHJqUmfBeco6l92jHIL8a8m
	nD3f6sZruf/z27nNU4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEnr0-00BPC8-4e; Tue, 01 Feb 2022 07:45:30 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEnqX-00BP2X-K4; Tue, 01 Feb 2022 07:45:03 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6C0AE68AA6; Tue,  1 Feb 2022 08:44:57 +0100 (CET)
Date: Tue, 1 Feb 2022 08:44:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
 Drew Fustini <drew@beagleboard.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
Message-ID: <20220201074457.GC29119@lst.de>
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_234501_868538_FF803C59 
X-CRM114-Status: GOOD (  17.53  )
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

On Mon, Jan 31, 2022 at 09:50:58PM +0800, Guo Ren wrote:
> On Mon, Jan 31, 2022 at 8:26 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > Given that most rv64 implementations can't run in rv32 mode, what is the
> > failure mode if someone tries it with the compat mode enabled?
> A static linked simple hello_world could still run on a non-compat
> support hardware. But most rv32 apps would meet different userspace
> segment faults.
> 
> Current code would let the machine try the rv32 apps without detecting
> whether hw support or not.

Hmm, we probably want some kind of check for not even offer running
rv32 binaries.  I guess trying to write UXL some time during early
boot and catching the resulting exception would be the way to go?

> 
> 
> -- 
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
