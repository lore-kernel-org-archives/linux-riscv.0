Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF7DC4727D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:44:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549312068D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iBX7Jgb1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DMlgHEhy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 549312068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j1PQNKIdILqKJD4LeYguJyFTo2vBK0x4dpqyYvQWg1A=; b=iBX7Jgb1z1HyUWOVNf12nlQgE
	0tBy/m0N1bzCbljF2s++lfuFaItoiloJLL1N/g/O27BJF1UWeE8dc/cMHUaAIPfM5R8+53t/c5RiZ
	FqJHDZsvysgj5TEpfqxoS/IN7WsfYNXXQUej3/rDvV/ri4KiiWndZwYqY65eMxWgsICSnvbkYYyu5
	sxUvR/3LXEjHzaD2pPiPtT52lsFwr92PGnn4FwuW3Zag8xyqYJTBwMNjhsHTUFPoTxd4uGJ4Qoxso
	DjO8mA2kxf+GK/obkKMxBLzBG9x5wLb5vv/HonRh/JDgS+OyAA+z3E26i8B7+xHOW/dN1VvMiIyny
	Fm8H79esg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPKE9-0003am-Tf; Mon, 05 Oct 2020 06:44:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPKE7-0003aQ-4x
 for linux-riscv@merlin.infradead.org; Mon, 05 Oct 2020 06:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iRWIFXu9IPejAwjRd+GboHZ88cTR/5W5Zq6fO1ic9O4=; b=DMlgHEhyHSc6X2C3Lr2WraccDZ
 VfjiaMKfrp78RiHwjwBRAVhsVRAqDVuV1XFlntQOgD6oYgEcRalr7AXh5g8OWyxIUfR767DD/y0cO
 ZkcAcBJXRxqqwROTBPc7UKTwtkXsh6BzsY1gBv1FNi0vFaU9Vvhs+wIpiFhp1M3iNgDZqVgUn02wg
 dxPkahaxT64ZWhRtCqCv7btUekJ3E2iQ+Y0MfhXh5UfzgqaEkGUGB4e0hflfAHA677Eigpr0xzkiK
 K5/BCZlQpRyopV/AyZNtNDUVXbep1LYr5ErS5oo6osLPGAIN2xXhZK1B+gchSNRb5Cq2o4bge/UVL
 51mnLo5w==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kPKE5-00020y-1l; Mon, 05 Oct 2020 06:44:01 +0000
Date: Mon, 5 Oct 2020 07:44:00 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Stephan Mueller <smueller@chronox.de>
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
Message-ID: <20201005064400.GA7462@infradead.org>
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201005061918.GB1856@infradead.org>
 <CAMj1kXFC=6G1pqFAcjASrKJfzguO3k9Rv-7NsmTaX8qNre5TGw@mail.gmail.com>
 <2588700.mWSkj6HvKX@tauon.chronox.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2588700.mWSkj6HvKX@tauon.chronox.de>
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
Cc: kernel test robot <lkp@intel.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[adding Thomas]

On Mon, Oct 05, 2020 at 08:40:25AM +0200, Stephan Mueller wrote:
> > If jitterentropy is a special case, we could put a alternate
> > non-'static inline' version of random_get_entropy() in the core
> > kernel, and only export it if JITTER_ENTROPY is built as a module in
> > the first place. But I'd prefer it if jitterentropy switches to an API
> > that is suitable for driver consumption.
> 
> Which API do you have in mind? In user space, I use 
> clock_gettime(CLOCK_REALTIME) which also considers the clock source.

We could probably add a kernel_clock_gettime which contains the
clock_gettime syscal implementation minus the put_timespec64.  Thomas,
is this something that fits your timekeeping vision?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
