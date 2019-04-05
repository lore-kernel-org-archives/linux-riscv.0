Return-Path: <SRS0=YX5X=SH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC19C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 06:01:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AAEE206DD
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 06:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JqJn29hM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="wCbRnxyN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AAEE206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSxIVwcUZsZ4nrMmgUNA25Q2V2b2qV8vtWa6D32V4dE=; b=JqJn29hMd85eAb
	gNtbDjKotQZk+c46NNNhSn8KITYeOeWgSWu2KzjclwLlSKeVoScmFnLUEJwgHVt4695yKDAmoyG8X
	QpBb5kH2KmERO42b8eQrft2bXncE30lG4asyJC4Dzmp6lHLiCLsfgbWZ0GOq2z5GS9jo7FuMJ12yy
	ibdRkRJ720EUpLDHY91Y5S2yVGwjNnLvJoxZdDg3O/X9Fuc5Yo+RUgoYO9cXceCSyASYVGu2SmT4Z
	uoW83zecNzMI3cM+nUEUQwyuDKSKJwU5BcncVBcElT9giudy3S426HSpXmYaDxg0JLjoFBinIYG5d
	2QMszzdOyrfHyzIZI63w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCHup-0004k2-5R; Fri, 05 Apr 2019 06:01:27 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCHum-0004iz-4P
 for linux-riscv@lists.infradead.org; Fri, 05 Apr 2019 06:01:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id w10so6487452wrm.4
 for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2019 23:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8I8m7SSC/snr0cHsf2WBlkwE7bpgw/OQ5jKqCBoq9zo=;
 b=wCbRnxyNLYVi4sK6lQm7TJGYYG8lp5FUVtlVJG6aY097PpRMyg6nRbW3h2OU3mSmfe
 Z/2Dd8toqy/+d6M+wypyVE/QVDncGTa90b1UkJfwIrQdzuLnvUkdcYFDAnM9Pg4NDgvE
 xWwhtsVCZXpR94MvLQhD9J+Iuo02G1yg4J5zd+36PXDualUnZZy67CzbtmfaeQp5oJGz
 YyfQl89/SCjIQE2ijWgHUamQ5RrB53vkpNljo5f71agmlbc08SAaX7tnkF96x1DeIlag
 g//su1j0BxdcEU4uEkmNQ8DrN8Isruybr4p83MLzgLo7SeNQj6ALF8FDr7PEWHr+zgwz
 tCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8I8m7SSC/snr0cHsf2WBlkwE7bpgw/OQ5jKqCBoq9zo=;
 b=ZXVp86feEbRVxYoFJl0OVK5G/0fGpjjfHE/YY6eJqG05r7Ysvkc6byFxECzcE80+9T
 nCKc5kA0sjFDPydd7QCrUGqJyiiR0RyAgzC6uof4aOzqdbXAdTDNy/ZGiAecGk68fDb+
 Wlzlr3KFdbFA4wQbBnj3nCbvbkAmvCLZjDzblLfk/YLgMtKFuuw5o3tpFSEInsHET9YC
 vNAZoanNmgaoNLuW/ywnlj5P1IFF6C6pqQRrCostCjDbjlgMEWTnv+aVly3tSu1EiNRB
 8loVDvDUYUvW+hNRuLfzaUvF3ZjtQV7WrKQBhR7hTnfxsKJHe7Pp1eeuCSP4Jnr1wNfO
 wYmA==
X-Gm-Message-State: APjAAAXSNglQYguv+6PrNhWB1mFEL9VCno+p5De5sso9rw0XW5z8maJZ
 Hpb0KdBGNh65pmO4AtaMuEdA0Kf+ttiSXBRCVBXJDA==
X-Google-Smtp-Source: APXvYqwvVpi/LoncOYPYpBig+SQjHxP1DEaiXzYYe2cURFDrQOVHHYJ4xS0lDAEgDIJDOniOxhm435shCG4GgfH5Ksw=
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr6002760wrp.61.1554444081974;
 Thu, 04 Apr 2019 23:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190405054909.3238-1-anup.patel@wdc.com>
 <20190405055421.GA7087@infradead.org>
In-Reply-To: <20190405055421.GA7087@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Apr 2019 11:31:11 +0530
Message-ID: <CAAhSdy0k0gSipzne1=agZzTWa0URoq3OH7vefJsr2=SEMyJ1tg@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Fix Maximum Physical Memory 2GiB option for
 64bit systems
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_230124_222544_067CF24E 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 5, 2019 at 11:24 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Apr 05, 2019 at 05:49:34AM +0000, Anup Patel wrote:
> > The Maximum Physical Memory 2GiB option for 64bit systems is currently
> > broken because kernel hangs at boot-time when this option is enabled
> > and the underlying system has more than 2GiB memory.
> >
> > This issue can be easily reproduced on SiFive Unleashed board where
> > we have 8GiB of memory.
> >
> > This patch fixes above issue by removing unusable memory region in
> > setup_bootmem().
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> Btw, what is the rationale behind even offering the 2GiB option and
> the medlow model on 64-bit?  Do we reall have use cases where the
> slightly more effient generated code matters so much to keep up
> the support burden of this mostly unused and unusual configuration?

Yes, if we want to use medlow with 64bit then max physical memory
can be 2GiB. Otherwise, I don't any practical use of restricting max
physical memory to 2GiB on 64bit systems.

BTW, as-per latest revision of RISC-V priviledge spece the MMU SV32
mode will be able to access 34bit physical memory (i.e. 16GiB) so
max physical memory 2GiB will also be required for 32bit system for
medlow.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
