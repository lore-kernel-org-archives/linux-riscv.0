Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B4BC43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 05:47:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2173B206C9
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 05:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hKMC+kCN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q7W4PHte"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2173B206C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v8RhkrKwGI/c1S/+u7QgUkGlVvLyrbSE+2L4yAJVKgk=; b=hKMC+kCNcZa09fsCr5MQCrRRb
	9jxT2nXnftgPvw8Jhsed2P38f+CGhkMK/cE9zSS2UxFFxRf4E4Ci1/xMlJQ3CuIXa4srCJcZ/Nntf
	sD3Xmte7oF3zLqx4qdylYCnTxEnqG2BzPanMkmKjDeueqrmQQJfcLTS5CFJk4Ecv04COiyvdhfajc
	QTWVCGrnv16C7I07aTNvDjqK0nkUJF0Ic4BoHbyHAq3NP10jlpIKDsh8zCSffy00EGDto/at2OTQP
	UhSko+tW4mMqJ26gG9n9ixCHBuQDig1q+xpihOoSQCstGf2lbKELeTARLfxULneMXXHl7dYUD+oHS
	mGa/2QSlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI3np-00036E-Rn; Tue, 15 Sep 2020 05:46:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI3nn-00035z-NR
 for linux-riscv@merlin.infradead.org; Tue, 15 Sep 2020 05:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AY/+XPVk7UXR9kVTgsV8q9cUDbUSjHD3dVyzkl7atdI=; b=Q7W4PHteIYsFV382xUFPHgEpHx
 gmLCNiOuz+5JsH8pXdFWETLQWD35RnwX8CZ3ugeIwx08YeQCsHtxzr2eCEoWN2LQf0Q9wPW1wdhdh
 kB1YVq/AgOJfGbPZblZ6rgnbU4E4ni1vX1z1bQApKcU/knwWio29qvLoehJSNvQcSIdqO+G4nh9pF
 A4mj87EL88jmaD74HQ3DXUJDqK9J0/x6KX1XpagnJa878IOUhL/cQgkiBXonYrsjgF5sV+gfU1vWb
 pCMAMoIpz08h4TuhVB5hQ5atrvMlQ2cQcFO/PxEjjZ0A07Ut2Sui0VvFhE8+XYUey8ZT+JuKup/mr
 /kuPjGIQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kI3nm-0004Iq-0x; Tue, 15 Sep 2020 05:46:50 +0000
Date: Tue, 15 Sep 2020 06:46:49 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Message-ID: <20200915054649.GA16371@infradead.org>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914165628.445087-1-palmerdabbelt@google.com>
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Anup Patel <Anup.Patel@wdc.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I won't have time to set up the K210, but this fixes the timer issues
on older Qemu versions that don't implement the time CSR.  Although I
also need to revert the binfmt_flat patch to actually get to userspace.

Tested-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
