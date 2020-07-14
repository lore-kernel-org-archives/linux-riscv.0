Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C7BC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:12:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CC72076C
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="us/ojBfF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgbqGoc3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3CC72076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kixZKJB2zkKrLITLb1x3ibiCQLrXvvnP4G18J4pH3WI=; b=us/ojBfFREgNwWZSBqQgl7Jt3
	vvWxU+UNH1Yng6Pv4wsyNstU2hYf98gUsKkIsiNKl7imy8mA+Do/ppEnQwFXgQntV956YLd0NyTul
	jPzClJm3ySF1y7xzfUumOX08hBDYFHKGkeox+RN9EYJc5EIwRLMe8sb+f/56hwylO8suDx6EQ2Wk9
	hn1/4UBIh/AfCAF735fDp9X8064V4oo7HRus0cXh4KmVipYnrvbj7XL+0pIzXwSuV6JXro7oFp9mb
	hoGLdwViglOTVNv06Q7KZtFLSF2b1iGucMmAOuDzO7VEZQHmEYF3kUsuboQRxMJAxniHGMFoP46t2
	bNiPmhhLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvMbk-0000dk-Os; Tue, 14 Jul 2020 15:12:36 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvMbh-0000ce-6U
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 15:12:34 +0000
Received: by mail-qk1-x741.google.com with SMTP id k18so15868162qke.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lPY0nKFKw8Xh+fQpn89J/uEUcRoylDvAgOjS6f+f+YA=;
 b=QgbqGoc3EpeCC0EJeM1hRblC8I4e2KKabqrfFBqfPiCekpfex6JB6ojBptjaeR5lYx
 7qcv0OgfQlF4wY8ZCtpvruDgEY4d4zNsTz4WEzqkqXG2HWP1505zVWJimhu2Cp23HF3c
 7+1jWAUXqLrnbBNGiZT7ZQ6UzQNf3Dyiuxx2AMkf533qpm9IQJFd+M01+dA6XnJlLc3v
 P5WkGOuGmeRlLoI41BFWPrTLZcvgquh0fNAyvC0Gyv0xyTnmqBYB/sGWt98KPAQ4TPyL
 jF3UxOaUkgf6BKCI0tktLfbln5SINT+SNL9fgV05p4d+E/kX6Ljccd0MHzn9v/T6pUxU
 II5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lPY0nKFKw8Xh+fQpn89J/uEUcRoylDvAgOjS6f+f+YA=;
 b=EcPKSEmmnic8RtiI43n/KovToR+MEbLMu0DFQFrjJgC8O+xskPDRcO3zW2kLj0N1jA
 0F83pAJAFq5Lzyqftij0+R8sjSx6q0UdpmrhWjh6Eun4THsNGPmLvZsY13r/Sgc4+vJx
 awCYyJclYlOXy4w7QbAyoopzaG2H35S3KLWQaLGxrKuwymtlFZ6D2lo3VM0orr2v/G1p
 dDmqiN1v6WHaOWgRj+KxgI5V+H3ZPVOL3Vc00LggxCZ8ons0S1jGQmaM/I0eg4pcfGdC
 JN2uQgEsRCQIwSKelIkRJByZbGPtKSvGaFfB4+VIRyAheuq4OProdMmDfbkBqyjaGuFt
 ddSQ==
X-Gm-Message-State: AOAM532P639uRNNHy3nZeny5AZqFSrCik/hQ7Spt8XuBj82HzsyFx2YX
 iduuRjLCZsMqvT34xCH+NPDz4fDPstzXb/6nnMA=
X-Google-Smtp-Source: ABdhPJzp5y71Cl5iC+1fgXXPFCvds9tatsYOKuM+mUZJNt5qRokpYb5gzBe8SFxB8DRBH0l7+0ZV2wEUCJJ8kaNUyfQ=
X-Received: by 2002:a37:4289:: with SMTP id p131mr4968739qka.28.1594739551071; 
 Tue, 14 Jul 2020 08:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200626223625.199813-1-peterx@redhat.com>
 <mhng-9a62674e-ca04-4e59-a03a-5e4924ef83ca@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-9a62674e-ca04-4e59-a03a-5e4924ef83ca@palmerdabbelt-glaptop1>
From: Pekka Enberg <penberg@gmail.com>
Date: Tue, 14 Jul 2020 18:12:14 +0300
Message-ID: <CAOJsxLHOMCtoty49+8u9+5EA2H76nE5-MAbyPSzP4gvYAfG+2A@mail.gmail.com>
Subject: Re: [PATCH 17/26] mm/riscv: Use general page fault accounting
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_111233_288863_47299FC6 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Sat, Jul 11, 2020 at 10:43 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> This still slightly changes the accounting numbers, but I don't think it does
> so in a way that's meaningful enough to care about.  SIGBUS is the only one
> that might happen frequently enough to notice, I doubt anyone cares about
> whether faults are accounted for during OOM.

What do you mean?

AFAICT, this patch _fixes_ the accounting to be correct on page fault
restarts. I sent a patch to fix this up some time ago, but of course
this generic solutions is better:

http://lists.infradead.org/pipermail/linux-riscv/2020-June/000775.html

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
