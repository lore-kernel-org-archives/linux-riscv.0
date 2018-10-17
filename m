Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A214BC5ACCC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 02:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5226E214AB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 02:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q0Hyh8z0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="T2KUMLWQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5226E214AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=08dgifJAr1JiHzxli5tmbza0HU1Jyre2kk3TeXDA8TM=; b=q0H
	yh8z0OSyOy4NwaRb9NAZ4mDiF2KVZVrwGOcP8bQCCuK5CmLQDiLyGyr/akittObw1kKHvG/Rgc0V3
	pzg9//S7xt/cl4TVqT2GWIVwlWXcQTxb4TGccUPcV5PYXunEEIOKS2n0e0G62mHqXhSONnF9Dntxg
	NyCsFpXc0tWhEMu6ppUyVrpSsu27O38/NZVYHF3uxNmwd9snTtviu75QToQxuccM184xEy7aYs/44
	g+Wp+rWLMz/D88qfnkPunXyqiIblaV2r1eY1ZxzF5K9EKBM7nwBHW6XmgskyWjLqpEL/itMNthwyv
	0a7feCgGdeOLqaYOKHCWKEZJvNr08Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCb9k-0005B0-20; Wed, 17 Oct 2018 02:01:52 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCb9R-0004xk-85
 for linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 02:01:40 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id g201so19768499vsd.12
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 19:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=fy5LbgEwlOaFQCz54fh03/ph5TCJfudoP690gljtKfk=;
 b=T2KUMLWQe2qNHYlnd1hQrB2Xk6rr0kgEoM0hcU0IaGTXgpsryDlHuWmu0gvd1K6pXK
 rArMroU8o93HjoEP+Ou0/YBimdgIP65ctuWsr0cLB2KPjn7UcES0rTgMWZcpWRIvSW7Q
 OmKXaLW8BmBlILmc/HB5I8jhOP2pn6RY208xkCT7jZrnx+IF2g87cjh1K7s3GT4icNZW
 7rTjEuQsrSx9PctPBvWIRHt1m1CIUhj0O5e+ExT4wvHWtU2R5Pwfe3dx08fx2c5wR5eW
 m4RQmNxb5+ikPcqQKp+X9gurIajiTqsS7RRnKcNPC2a6jNpwE4fNxpIEiHxlUTky9pkS
 vG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fy5LbgEwlOaFQCz54fh03/ph5TCJfudoP690gljtKfk=;
 b=r12Jm0km4nnUnlIU9ltCeeiNkWIRjiBNzdriRqNKLx1SOMTZ0dtG3kr7IlCEG1s+Ec
 aTsADFIWW9i2H1xirODvejaNAeBzYQfNYtE2QiUlCDQ64BaJ9bw8D2iegecQWktiIGan
 qvEQP2ZVt2/hsewh2OIY8Oy5k6i8A03T/V4BiRxBeaEurEX1aQD7V/YR3stQMC1pOPWy
 i6V994vD4kMg8NOrCWa7CdY4SVXkYohJVX1WhGV3uzd0JjjDoVpVwm0gdRcu+wypVRi/
 ZjTgb9NXqvGJrSHqy7Ate/aaQ0NBe18yI8qeKmNtEJ1MhDe8ox3xxuFvHI9BmENDWKaz
 kKJw==
X-Gm-Message-State: ABuFfoieuel+J7zxcLDLHqeDbTPKOMYoHBF84gCAZsQOlAwlrJPo7RAA
 mtSpZwYEhIfv8zWkD5/+PIVgnmLjMtv3rBV25e9wgYcnEbY=
X-Google-Smtp-Source: ACcGV61jlGZrnKbuWvKjsfDk+Ivx2csePAxRrXJ5nGlOckIE0j81fdxhKClPdrteyptARb3wng8GibIQNWuzisty9CU=
X-Received: by 2002:a67:d00a:: with SMTP id r10mr9447941vsi.191.1539741681555; 
 Tue, 16 Oct 2018 19:01:21 -0700 (PDT)
MIME-Version: 1.0
From: Jim Wilson <jimw@sifive.com>
Date: Tue, 16 Oct 2018 19:01:10 -0700
Message-ID:
 <CAFyWVab2uSy4Br_V5++_iJ+KdbJonFfx2j8wg7FVQq-uGwsA1Q@mail.gmail.com>
Subject: next-nofpu build breakage
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_190133_431722_61C84663 
X-CRM114-Status: UNSURE (   2.75  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181017020110.Hp878x6IQunL3XFlqDkwyBGCeBAkAGMP1iw_Wei1AYA@z>

Building from Palmer's for-next branch gives an error for an invalid
-march option.  This bug came in via the next-nofpu branch.  In
arch/riscv/Makefile I had to change
riscv-march-$(CONFIG_FPU)               := fd
to
riscv-march-$(CONFIG_FPU)               := $(riscv-march-y)fd
to get past this problem.

Jim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
