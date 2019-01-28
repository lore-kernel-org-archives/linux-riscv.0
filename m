Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBE7C282C8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 19:55:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6BA2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 19:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EJuxXBpd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA6BA2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ErHDqAIgVGOJmNCWfZHR0isxLj172wl5IIpydOqSVk=; b=EJuxXBpdJNeWlo
	nRLsxk3krLqfIQ9L/Y77LPgX+G5VfYk3hljjdCr0S5+vTmsNHpX2mttGye0pf+7a177KfxGlVrg1U
	t6rivmtKNueRziMvH5/AhFzXREyyR1sFXgSpaOWh+U5D/qJS59tfi3h4DuHDDYKycXDF90xwOaSBb
	td9DdR00TzCi7fxmrjzFwKU5zK27nyeEVJE4jeznlfb+bC2euhzHXzZQ6G9seQkHPoqFQMziD28o1
	pJfMg1H18Y6S1J5Y5c/FAs3CHOmCzzMyKokDDMVngPNUjns1RgtCJ1kcapJzldJsUFn0AzXL2Agfw
	40nXRB4yOMLzzx4w3jiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goD0V-0001eG-8z; Mon, 28 Jan 2019 19:55:47 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goD0S-0001de-Gp
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 19:55:46 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4098AC4C;
 Mon, 28 Jan 2019 19:55:42 +0000 (UTC)
Subject: Re: [sw-dev] SBI extension proposal v2
To: ron minnich <rminnich@gmail.com>
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
From: Alexander Graf <agraf@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=agraf@suse.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <aadef824-7c76-5784-0ec8-de4344158c15@suse.de>
Date: Mon, 28 Jan 2019 20:55:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_115544_853733_92679050 
X-CRM114-Status: GOOD (  16.28  )
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
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, "zong@andestech.com" <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Ron,

On 28.01.19 20:40, ron minnich wrote:
> Those of us working on the linuxboot and heads projects for the last
> few years have reached a few conclusions in this area. The big one --
> vendors can not get firmware right, period. The set of bugs we've hit

Agreed.

> in the x86 world alone in the last two years is just amazing, given
> that the UEFI community has had 20 years to get this stuff right and
> still don't seem to be able to do it. What's more amazing is how
> trivial they are. Do you want to disable UEFI mechanisms for detecting
> ROM image corruption? It's easy on many systems. Corrupt the ROM
> image. Achievement. as well as the ROM, unlocked. I'm not making this
> up; it's several CVEs at this point.
> 
> We've learned that blindly  trusting firmware is always a bad idea.

Agreed.

> Assuming that it should have higher privilege, and trust, than the
> kernel is, similarly, a bad idea. In general, kernel code is far
> superior in quality to firmware, and is certainly better tested. Why
> is firmware higher privilege, when it's not as well written or
> trustworthy? That makes no sense. It's the assumption RISCV is making.

I agree to the first part, not the second.

You're mixing up 2 things (which is a pretty common fallacy I've come
across people who worked too much with x86 firmware): Design and
implementation.

I agree that we should hold firmware to the same standards as the OS. I
agree that I would not consider something more trustworthy that is
developed behind closed doors at a random vendor's site and every bug
fix costs a few $1000.

The conclusion that runtime firmware is a bad idea IMHO is wrong though.
By separating an OS from extremely hardware dependent details, you allow
for abstraction. You allow an OS to run on newer hardware for example.
It's a bit like how an OS can magically make NV-DIMMs available to user
space from 20 years ago. Firmware with runtime code can potentially make
today's OSs run on hardware from next year.

Now, if the firmware development model is so broken but at the same time
such firmware gives us the ability to abstract interfaces better, what
is the solution?

You obviously need to apply the same standards as you do for the OS to
firmware. It's why open firmware is so important. If you can't fix
issues yourself (or better yet, have a community around it), chances are
good that it will be broken.

But putting everything into Linux instead really is not the answer. The
only thing it does is break forward compatibility and bloat code size.


Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
