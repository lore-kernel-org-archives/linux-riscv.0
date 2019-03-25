Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC084C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 03:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78FE920828
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 03:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JxoYIEh+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="xGeJ7KCS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78FE920828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UYDrB0Nx0E/CNGhk5nj4SWrN/e3M1WbwXC6C2N8Ixw=; b=JxoYIEh+rB2Ycm
	xm9uFDml4nE77pMnrhmyxE1EYHx24sxIuw7enM+HSMmzopQZRv+DL4Z8qS+YpxSxhZbVtaGscC4gH
	dAKW5StbwbCxaSHyiavz/DUatXFZuh9X38UwD88Gg2ij0qPI+wRXwOz8TCZrDqa/Lm0G5ivDUVbK7
	e9qCjDlPeair30Q+DvOKFUvgi7n4bB0MB5wUN/Xj3T3F+2xG9gYshj8sDj3oYs/liLfnrc5OstegQ
	8ayaCm2oTexc++xDrVDxxa5fQxTzM5fiZ8TYpgFm9eFvcIV/4fgHuEl3nF4c0KTTqYXKRZFkGJRSW
	wpQNaMbHRUSR702WEnUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8GBJ-0007Vg-BK; Mon, 25 Mar 2019 03:21:49 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8GBF-0007Un-Cd
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 03:21:47 +0000
Received: by mail-wm1-x344.google.com with SMTP id a188so7387785wmf.3
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 20:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PZL5T3XpqPXxaGPXLVF+FDWkhfoO8E1V4Dhl71Xctkg=;
 b=xGeJ7KCSeWkFGa8Z4bFykhqJwVXmpeEsst/o+6N+0nBVzu6n+UE43qpjmrQusjaHcM
 LP0So7k7B4O2u+/WptUiR8w/V0eUJIPSN4VztX4Xeg+roJNlqun7DRVfHD8xqcoroK0/
 LxdWOYk4690SQWSvbqLhctlNFF5q8hobU2grqUMBs+ZoCF1bWZDvVFgRccCpYCaolmNX
 W5A7BxtcQ4E2CD9+/OYAbmhw9daMx/J0zrRgQBJ16kOse3Z9XRveBBGMWD+v5RMoyKMO
 gglROWde8p+mPuOL94xHN06epxIGD8G8t605unp370kFdwiOd+xxUiZsj8vA+jkNvv5f
 viuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PZL5T3XpqPXxaGPXLVF+FDWkhfoO8E1V4Dhl71Xctkg=;
 b=syGDC9TuXrpPwTN3hRfrSstniarF5UqzKRBCti49pj/q1dwjaq1s1Yx16sJHNJQJ9D
 Vcr4Dq6S2eDYoDlk7BIncaeBSk8TZxp47+miGQQNPfcvknMnycKSSGwLQcSqOti8jpkA
 UIUmrRVWp+0JCrB7dQUUxB6nVcOjSgkbcF/Xkdd9WVRarOXJmaXcD7Rhc/V7GGoTILT0
 WpTBVwNaUBawzqGvEZL9cB/cHFzpEMesyuIktn+RhIqyAKBCZbtZENN/JbWC2EBpYYVu
 S55awQoAzFlyygCcXV8xcZdr1e9DH0Cn2s8nXD6TvOt+lHhN+WvwuS2nWjRCb2jJ2i8T
 NTVw==
X-Gm-Message-State: APjAAAU4iJMmo1wgnnFooUgb4FwoAhEtOVfG9ax5Sl7mJdjIvl9kzL+M
 shWOywWJxMiCm312ZsojO5Nr/VF5QdVp3nvStV8jBg==
X-Google-Smtp-Source: APXvYqxZmxjPxGPAlpI+gi006nLnQg0EUNE3Gq1+wEfIbjNHiFg0o1ZW7lmOIPCiqHgMgE7htqIiF2XFHuCuV/Y5La8=
X-Received: by 2002:a1c:b455:: with SMTP id d82mr4241588wmf.153.1553484102425; 
 Sun, 24 Mar 2019 20:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190324110804.68555-1-anup.patel@wdc.com>
 <LO2P265MB08478847A45E7617FD906F8CD65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <LO2P265MB08478847A45E7617FD906F8CD65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 08:51:31 +0530
Message-ID: <CAAhSdy0+9rgJtxjhrYAEt1Tem79ixL7sSKUHp63Hf-5sb+31+Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_202145_431904_21FF0AFE 
X-CRM114-Status: GOOD (  11.10  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 12:44 AM Gary Guo <gary@garyguo.net> wrote:
>
>
>
> > -----Original Message-----
> > From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of Anup
> > Patel
> > Sent: Sunday, March 24, 2019 11:08
> > To: Palmer Dabbelt <palmer@sifive.com>; Albert Ou <aou@eecs.berkeley.edu>
> > Cc: Anup Patel <Anup.Patel@wdc.com>; linux-kernel@vger.kernel.org; Mike
> > Rapoport <rppt@linux.ibm.com>; Christoph Hellwig <hch@infradead.org>; Atish
> > Patra <Atish.Patra@wdc.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> > linux-riscv@lists.infradead.org; Christoph Hellwig <hch@lst.de>
> > Subject: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
> >
> > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> > index eb22ab49b3e0..7307609d405b 100644
> > --- a/arch/riscv/mm/Makefile
> > +++ b/arch/riscv/mm/Makefile
> > @@ -3,3 +3,5 @@ obj-y += fault.o
> >  obj-y += extable.o
> >  obj-y += ioremap.o
> >  obj-y += cacheflush.o
> > +
> > +CFLAGS_init.o := -mcmodel=medany
>
> I think you should also remove CFLAGS_setup.o from kernel/Makefile, as I think it was there solely for the correctness of setup_vm. As setup_vm is now in mm/init.o, the old CFLAGS probably isn't needed and should be removed in the same patch. Disclaimer: I haven't tested it.

Sure, I will remove it in v2 patch. Thanks for catching.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
