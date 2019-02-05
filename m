Return-Path: <SRS0=rZMy=QM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E30C282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 22:30:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B00A62077B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 22:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alWYOcZL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B00A62077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+fYCaCl3XIU9vT3PSflu2oQ/XSs1LxyO6O0BRsNiPA=; b=alWYOcZLZtflR5
	xGRGhDKJh4Yyoc/EKIrXy2m/LAiM2DmUV0X6+bCVTV0wHxZXaZTqRa6mo4FJnIAIOa9AQ5F2n96OP
	gwsnUlc/diLWdAbYxXnODxiY7bWy7gFTUodE6dEHQut6YLPhGwZIegirXDKjdg/d9m2r/+LXAzPjR
	0YuZVw/4bsaMOge/vXk8rTqU38/Qp21unV9N4UUG+6Dad6DyMgB5FtH6PkMZH2+8D5vqz0aqZj5eu
	Uss/KImP+e+ebTux4rQuagXKAVypeYANz7aSsjQ6aTg8ixso9Gar+3VB4pKSI+VWC+1wT7papYZoF
	zhOIFe/DrSkoR0zs05KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr9EZ-0001td-UW; Tue, 05 Feb 2019 22:30:27 +0000
Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr9EW-0001sc-Rw
 for linux-riscv@lists.infradead.org; Tue, 05 Feb 2019 22:30:26 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x15MTaGb031578;
 Tue, 5 Feb 2019 16:29:37 -0600
Message-ID: <22450f8b5b18421e486985725b1a58167662fd2d.camel@kernel.crashing.org>
Subject: Re: [sw-dev] SBI extension proposal v2
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: ron minnich <rminnich@gmail.com>, Alexander Graf <agraf@suse.de>
Date: Wed, 06 Feb 2019 09:29:36 +1100
In-Reply-To: <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_143025_121312_4F7B82ED 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, "zong@andestech.com" <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2019-01-28 at 11:40 -0800, ron minnich wrote:

   .../...

 (snip a very well written description of issues I fully agree with)

> I understand the motivation to fit a new architecture into old
> firmware clothes. It's just that the clothes are motheaten and out of
> style and never looked good when new. We're going to need to have an
> escape hatch for organizations looking for newer, better ways of doing
> things.
> 
> One possible way out at some point might be to define an SBI interface
> and operating mode that is responsive to concerns about firmware
> security, and avoiding the mistakes of the past. This does mean that
> there will not be "one SBI", which in turn means different kernel
> configurations, but I don't see much option. The concept of a "single
> SBI" was always going to be hard, and I expect at this point it will
> never happen.

IMHO, something like SBI has value when seen from the perspective of
providing a thin abstraction enabling existing OS binaries to run on
newer/different systems *as a fallback*. This should be done with the
clear intent and guidance that ultimately, the OS is meant to grow
native handling for those cases and platforms.

Cheers,
Ben.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
