Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD4DC4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:25:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA18920665
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:25:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RcX6BYjn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThJc1Zmt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA18920665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oHtVsi/8jx5U8XQUIitdlieNuif/nZahSKGMNGM3k5k=; b=RcX6BYjnVoLkMH5AE3e3kmeHt
	ZPmJRNRc5NZ9zzr8+4XZ4XRndCJ0LRHMAhJ4DHgCBcPke8hfuoK0bQddddQJB+CSly6ueP+LcJQh0
	Y7G73uDBA8zk27kwQ7T8vxPq7hos2ZkDnY+sl8Xi1qaGh/4zlLgLl/0ygm+yKYUYjz+oEGZ4isPQE
	3vS7BzHNWxNrTdS0KOwTgM2AqbNjsPPADdUTlRMXx3GwjdNheuFwgT68Aaievst57rCQAFvWsSW/+
	dXMtXWp4dE6KeYOxlNcnxKQd+WVe+OgoT/hR/eCLvoPMUwwCozrg14okC+7tYOlMMrXv7Jead523x
	0ixfONjlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPJvk-0000qm-9b; Mon, 05 Oct 2020 06:25:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPJvg-0000pM-Ub
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 06:25:01 +0000
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A099120665
 for <linux-riscv@lists.infradead.org>; Mon,  5 Oct 2020 06:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601879097;
 bh=Yrr7GNWUAVWaaz1jIc/uXs8U/IEt8VrM/dIArGoeqEE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ThJc1ZmtFFTxYDdNdNd+qvSTOF09HxfMQO8wyxvIf3O/jNqXFBOknbeaXhDwLlWAs
 PrdZrskYzZZoD3C1yFpNziMtzwMXM8CWgS2UJsNIFlZq4Gs/IBNJnAl5IpT1GVcSz7
 FfpjLECmQYssfScz4NDLWjzumgZ8IcsQuQBSbbac=
Received: by mail-oo1-f48.google.com with SMTP id c4so1971613oou.6
 for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2020 23:24:57 -0700 (PDT)
X-Gm-Message-State: AOAM531vgkKZjS8+jUoH47AgLcYZzmHzz5qpp6+aSBR1FKNkPVSxuIAa
 cNwvi4Sr9toyFAHIt6m5Gc8jbeuMHwD+RoTF/2U=
X-Google-Smtp-Source: ABdhPJzwJdZHBBVYKQctaaNGjxR/8GlzP9k3E5YR5UECckChEgp4tsYN+VVHxlTisKvVtVRgs7r5+77Nd5DZOWBgB5I=
X-Received: by 2002:a4a:c3ca:: with SMTP id e10mr4325783ooq.41.1601879097030; 
 Sun, 04 Oct 2020 23:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201002064905.GA27115@infradead.org>
 <5692716.lOV4Wx5bFT@positron.chronox.de>
 <CAMj1kXEnOh4MBiVVgkhd4P81eRPCVi3+y6JcD58jL45-eh324A@mail.gmail.com>
 <20201005061918.GB1856@infradead.org>
In-Reply-To: <20201005061918.GB1856@infradead.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 5 Oct 2020 08:24:46 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFC=6G1pqFAcjASrKJfzguO3k9Rv-7NsmTaX8qNre5TGw@mail.gmail.com>
Message-ID: <CAMj1kXFC=6G1pqFAcjASrKJfzguO3k9Rv-7NsmTaX8qNre5TGw@mail.gmail.com>
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_022501_066271_C8DA6782 
X-CRM114-Status: GOOD (  20.66  )
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
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 at 08:19, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sun, Oct 04, 2020 at 11:16:10PM +0200, Ard Biesheuvel wrote:
> > On Sun, 4 Oct 2020 at 20:48, Stephan M??ller <smueller@chronox.de> wrote:
> > >
> > > The RISC-V architecture is about to implement the callback
> > > random_get_entropy with a function that is not exported to modules.
> >
> > Why is that? Wouldn't it be better to export the symbol instead?
>
> get_cycles is a low-level time keeping detail that really should not
> be exported, and at least for RISC-V this would be the only modular
> user.  Once that is sorted out I'll audit other common architectures
> to drop the export, as it isn't something that should be used in ramdom
> driver code.

Fair enough.

But this means we should fix the jitterentropy driver rather than
sidestepping the issue by only allowing it to be built in a way where
we don't happen to notice that the symbol in question is not meant for
general consumption.

If jitterentropy is a special case, we could put a alternate
non-'static inline' version of random_get_entropy() in the core
kernel, and only export it if JITTER_ENTROPY is built as a module in
the first place. But I'd prefer it if jitterentropy switches to an API
that is suitable for driver consumption.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
