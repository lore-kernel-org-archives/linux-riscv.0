Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F95C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 09:01:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02FF3206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 09:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YL8GaNye";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="IAITPDK3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02FF3206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7v1mItn++hEaFhmAbTaVx1b0POUEI5N1rNv9Hnnj08k=; b=YL8GaNyenhDLpo
	jrzImAy0/49luw3vMBxF9ngQwZ4FXfO6EketNwkSkCr/iQeFcL13t/qoOZZhB80BZhZGKpddp6p6X
	98ONvWkGRd5LVcT45qB3ZmNXbkrV1iWWQo2vM5iA+ntn93Spd9vK9txSJn5fofJNvkJJLP+9DXur1
	t6SD73BpjhIJuVLlCED3NtsXXeDGTPIozcFNYG6D5c+gCHzNOfLJBj/WpyKuh0KKkgXXO9AQf5Vdo
	a0lkZF5EFcm4NPTU8MhLjNGCclGBAQWc40x1Gee4mYET7cqZj71zhAgSmlq2sebeoTb+DWn0SB9Pi
	5I/U81gZr54wC94Q/Jaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE96g-00006P-IL; Wed, 10 Apr 2019 09:01:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE96d-00005j-EH
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 09:01:21 +0000
Received: by mail-wm1-x344.google.com with SMTP id q16so1721560wmj.3
 for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2019 02:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ofF5rDdz1tQYALppqVnk8bLzFBexwzpixvklyeU4tU=;
 b=IAITPDK3Q6j7FQXAUfZlxYTRyqMqrwtGr7eJlQHwwIQuD2Q9yRVuK9kgfhWJ3tj/Yf
 fCldoIi1Ky9GT2G+4ai7os/j39mJPNE64PhOVuxnXsIlaNj52r641LsrfWxgVtChFx6S
 RbXUiEF2EIWvcYwZZVGO1p4QITuYKzNRl670WmXQmkEnfmcWOQekacUzGHnyUkwoPWb6
 vP4f2y4AwFYbOy3rue+XjJ8EeM/kvzJ7K0T9A0fJZCx6uxdjowjwYeSo0DKO7eb2MaVC
 sjTx5MW9xq4QcA4p2z+0WPwOlgv7rdK31qqjZ9WK/nDFGK2VEbsH52Z8UeLNzYnXxeAS
 nN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ofF5rDdz1tQYALppqVnk8bLzFBexwzpixvklyeU4tU=;
 b=o7VssBXodmOiTZ+TuSHrz38rBOZLD3Ml/fjMYnw1pyyk9qgC03WOwIM32exJfsJu+G
 LLiYpXinken7FQJK0EPz926zl7LiuCbnJQWv4h0Py0y5fYRZWX8JejPDP22TGdJgEsKQ
 4of9Ph7uMnRzsLqP8Xe+B2yiJgrFdUv9um5gTxH4tL3H0E0ZzbvEHO3UieGH+EVhshIE
 cGRlv/nZ/UlcWfO3ESpdV+0Fo9XMw5ZCyvuEZjioAWlek1njliRukK5g0nR9QbQ2yOIW
 fH0CIhvUNWuYv79Y9CuxCNrzzZB0n9vR49umxXWmJ6c6Oe+R6hJBAQ7Dh/kZ4lqE5GxS
 iWzQ==
X-Gm-Message-State: APjAAAXd0HlPCQ/FtOycMfZ1B3GY+pZVYiEcamRlO57c0bxLzSRbzn/b
 tm+NksdMPnYjEo+x9moIT3xWJ3AV1fzXLYQi5EO0fQ==
X-Google-Smtp-Source: APXvYqykCcWEt7R5wY89uGI7ysbghBdf2Ue5QPC0oSsBClwBCt6WXet0lOu2jmSgwGOuKUSUCNo8zN3qAsxxCgjqbvE=
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr1813591wmf.97.1554886876337;
 Wed, 10 Apr 2019 02:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553647082.git.gary@garyguo.net>
 <20190410070446.GA18678@infradead.org>
In-Reply-To: <20190410070446.GA18678@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Apr 2019 14:31:04 +0530
Message-ID: <CAAhSdy36Ukh-rCZPnyQh9y8iUi730wBuY_qGO+ctK1_L=sCU1g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] TLB/I$ flush cleanups and improvements
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_020119_535592_8DAC2342 
X-CRM114-Status: GOOD (  12.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, opensbi@lists.infradead.org,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2019 at 12:34 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Mar 27, 2019 at 12:41:11AM +0000, Gary Guo wrote:
> > From: Gary Guo <gary@garyguo.net>
> >
> > This is the v4 of the general TLB/I$ flush improvement series.
> > I still have tlbi_method=ipi being the default as opposed to what
> > Atish suggests, as:
> > * There are still usage of BBL in the wild
> > * OpenSBI's support isn't made into stable yet.
> > * OpenSBI's support on the dev branch has some racing issues yet to resolve.
>
> Can you clarify the races?  I know Anup had some FIFO-order commits
> in opensbi about a week ago, did they address you concerns?
>
> Anup, do you have performance numbers for the old opensbi vs your
> implementation of the optimized TLB flushing vs this patch?

Atish had posted performance numbers on his GitHub PR at:
https://github.com/riscv/opensbi/pull/111

These performance numbers are as follows.....

Benchmark used: A microbenchmark that mmap a ramdisk (1G) and
multiple threads access 50MB of memory randomly.

https://github.com/westerndigitalcorporation/hmmap/blob/master/userspace/hmmap_uspace_common.c

The result is averaged over 25 iterations for 8 threads on HiFive
Unleashed board. In both cases around ~1M remote tlb flushes are triggered.

                                 IPI               SBI            Gain
Average Write Time             2.53183        2.43263           +4.34%
Average Read Time             1.32198         1.24643           +6.09%
Total Time                    97.7589         92.859            +5.01%


I believe he has more optimizations in-pipeline for OpenSBI
so we might see even better numbers.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
