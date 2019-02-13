Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF04AC0044B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2171207E0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q05ZR12y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2171207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2zn4HoVgg9k10QPxYRjeae8NnEOj3EVPGpetxLuHqc=; b=q05ZR12yTYenha
	iFGbTHqADjaF0KN8r/jvBTZgzQgvuiW4b+iQDT/71Vq6h8CzyFfgEtBvV/M8Pg3FsTp0ovvHAo/at
	0rW5hmMpMnsdFUxhuStNWF+U4UxSwEcZwrUgmO+86aAyIu2Im2ZDS9sPzvI5ApQZcsSFTt6MuznvU
	VNdrUcSIw6gaDFyG3OvcMOVDqWH+mBeyY7dADPmDHxThSXYdIOdWfE0X6J0vjWiOB9zS1DlaDqAw+
	UyRQ00potG/6l59ougJEDWCRqp+tpeVUBXWtT59GwNEF1Oi7iQnGld0mzvYa143QkjUfxQQtLxeCd
	maq56HVksKVuJufCGAqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu1dG-0004PY-L8; Wed, 13 Feb 2019 20:59:50 +0000
Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu1dD-0004P0-OC
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 20:59:49 +0000
Received: by mail-qt1-f195.google.com with SMTP id o6so4352486qtk.6
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 12:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ng61dfKvZf21WQ4BUQ+6Qiu9cjO+4ESaMC3MYTHsLkE=;
 b=Q1oopN25iFnbdg6+a+t9IGpl4cxQehElEoXKeicFc33QFInd8Hw5/9buI1DOFlIeU9
 qI6hkfS+FjxDDxiw/Hcb77CkEgG/Gm7LmSSeZWlW3p/ExvH6QdB3fTA6/nEAjVpw6E4Q
 IRbHpt2Yw2EAix1jqE7pT6Za/QNxFxV5w6l4vnkXAMayezYqNQIUdjp4w9kky8A1IJef
 lJp2iGHyxxfKS2FywOVepnz8+GDUzEiMMXCHaRIyDcfMQuFj4wXzb/nqlN2gvaW1efFy
 RdZkM1zZ4dT0RQgbZv0IbQ2HO5u4p2EyI4l3MOY3/Fi7H6oOReOsLek80SHx0/5DDhuU
 BQRg==
X-Gm-Message-State: AHQUAuauYo6ShDrQ17pxycm0zhmaBOkVbyNFMxhZqlONISCZk1rC9opO
 IYpWRY9ICbeFXRyB46ND1/IlxGDkglFFl17wLtc=
X-Google-Smtp-Source: AHgI3IZTDIsbRkP6r1QUuY1BW6zHTWCPLmkpKUfQIt20OksmEJr861s8cpVm6GM9oo1eD7aBZLrWzIbdHTx+urBMzj8=
X-Received: by 2002:ac8:2c34:: with SMTP id d49mr123414qta.152.1550091586587; 
 Wed, 13 Feb 2019 12:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20190211174544.4302-1-will.deacon@arm.com>
 <20190211174544.4302-2-will.deacon@arm.com>
 <CAK8P3a1gmJTt+jdTbdSYZ0z43qodxf+co757K1-Hq1mj4fCqQA@mail.gmail.com>
 <20190213174608.GA29100@fuggles.cambridge.arm.com>
In-Reply-To: <20190213174608.GA29100@fuggles.cambridge.arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Feb 2019 21:59:28 +0100
Message-ID: <CAK8P3a1-CA_d+tRRKh50+7-PU14AV=9S1JUSF4d-VUxZ+DcW4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] asm-generic/io: Pass result on inX() accessor to
 __io_par()
To: Will Deacon <will.deacon@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_125947_790568_1A0E0CE1 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 andrew.murray@arm.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 6:46 PM Will Deacon <will.deacon@arm.com> wrote:

> On Tue, Feb 12, 2019 at 12:55:17PM +0100, Arnd Bergmann wrote:
>
> > For all I can see, this should not conflict with the usage of the
> > same macros on RISC-V, though it does make add a significant
> > difference, so I'd like to see an Ack from the RISC-V folks as
> > well (added to Cc), or possibly a change to arch/riscv/include/asm/io.h
> > to do a corresponding change.
>
> There's already a comment in that header which says that the accesses are
> ordered wrt timer reads, so I don't think anything needs to change there.
> For consistency with the macro arguments, I could augment their __io_par to
> take the read value as an unused argument, if that's what you mean?

Yes, that's what I meant, I should have been clearer there.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
