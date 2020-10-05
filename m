Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94D5C46466
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:19:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3603207EA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oyFyRqtw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rfUpjTHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3603207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PP+VlwBTJ5vLGWTs3C27SqKqoL2bwp4PeEv7tYwvEgI=; b=oyFyRqtwPynCPqWM2LcxGLDXX
	XvCbr1wDrVq0eoXfxaQZYdwrYhpkO+HpKydbqNRdFxpzJOWajoya/KvZhVTcFlHTU9vS4Y9J5D8q9
	A2BMvx+Z4WyBMpkiYQ0neAtJmejXeB37BoxmYa7ZVMBlf/gBYkq6YRSzvSUWhCEv2WK+63fnjv1J+
	Gba1vHexqLeW0+ZTIYQDYs50IFRdpAIgjhY35Bvk9Ev1zmTkJW6BE4DE1onEcwZJxCXcuzYp2nVTT
	Q04FTVDxoJlFbuyisKKe7nfclwh0GxklgzerIOzhvbA30ftDrw00VMeQ51mVUokTn+aAEmor4OxQa
	VW82Fjdcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPJqF-0008Rl-9b; Mon, 05 Oct 2020 06:19:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPJqD-0008RT-V1
 for linux-riscv@merlin.infradead.org; Mon, 05 Oct 2020 06:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jGLMgatw8+YPeZ8gLExrPIHr/pPSgzJ2R4w/NAyNuAQ=; b=rfUpjTHvULZcKWcUmjU3yIa0C0
 UywruIXCF3IxGM+3Remk7eb4rOvPqJhbo8qPSVY5hYoUOT6YlbtvnV8QPM6uIK0dpHia6mcjKxqe0
 SnjVnL3FChJeffK69Pj1Ccl2YmE1eZThAvMvJPY4fsKiHSF0KhDpbOrLhVzNqDMeyILvoQZF67mPy
 zlXm26GavxK/1S1tPViAMQCmRB0dEICTOOTGyyb9zy5XgbbbOHQLJDrk391roHsf7xYBjLw/qOkW9
 xZ6qTheN13371BAIuMUx7mUvXXLpb0rUU6zx9Jbw3nlwn/u0C8MrU7YGCAQRkMj3AKuC/W4TyyMVw
 zgXQPpTA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kPJqA-0000j1-K8; Mon, 05 Oct 2020 06:19:18 +0000
Date: Mon, 5 Oct 2020 07:19:18 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
Message-ID: <20201005061918.GB1856@infradead.org>
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201002064905.GA27115@infradead.org>
 <5692716.lOV4Wx5bFT@positron.chronox.de>
 <CAMj1kXEnOh4MBiVVgkhd4P81eRPCVi3+y6JcD58jL45-eh324A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEnOh4MBiVVgkhd4P81eRPCVi3+y6JcD58jL45-eh324A@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kernel test robot <lkp@intel.com>, Stephan M??ller <smueller@chronox.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Oct 04, 2020 at 11:16:10PM +0200, Ard Biesheuvel wrote:
> On Sun, 4 Oct 2020 at 20:48, Stephan M??ller <smueller@chronox.de> wrote:
> >
> > The RISC-V architecture is about to implement the callback
> > random_get_entropy with a function that is not exported to modules.
> 
> Why is that? Wouldn't it be better to export the symbol instead?

get_cycles is a low-level time keeping detail that really should not
be exported, and at least for RISC-V this would be the only modular
user.  Once that is sorted out I'll audit other common architectures
to drop the export, as it isn't something that should be used in ramdom
driver code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
